#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
private _emptyHM = createHashMap;
params [["_taskHM", _emptyHM, [_emptyHM]]];

//validation
if (_taskHM isEqualTo _emptyHM) exitWith { Error_1("Invalid parameters passed: %1", _this) };
if (!canSuspend) exitWith { Error_1("Tasks needs to run in scheduled environment") };

_taskHM set ["taskID", call FUNC(genTaskUID)];

//load task
private _taskData = missionNameSpace getVariable getText ((_taskHM get "cfg") / "func");
if (isNil "_taskData") exitWith { Error_1("Function does not exist: %1", _taskData) };
_taskHM call _taskData;

//run task
_taskHM call FUNC(updateTaskState);
if !("constructor" in _taskHM) exitWith { Error_1("Task %1 lacks a constructor", configName (_taskHM get "cfg")) };
GVAR(activeTasks) pushBackUnique _taskHM;
_taskHM call (_taskHM get "constructor");

private _stage = _taskHM getOrDefault ["__CurrentStage", 1];
private _stages = (_taskHM get "stages") select [_stage-1, count (_taskHM get "stages")];
if (_stage > 1) then { _taskHM call ((_stages#0) getOrDefault ["Init",{}]) }; //if loading any state other than first stage, run innit code to set prepare for to run the stage

_taskHM set ["rewards",[]];
{
    //update the map task info
    _taskHM call FUNC(updateTaskState);
    if !("action" in _x) exitWith { Error_1("Stage %1 is missing the action",_x) };
    if !("condition" in _x) exitWith { Error_1("Stage %1 is missing the condition",_x) };

    //start stage
    private _endTime = time + (_x getOrDefault ["timeout", 1e12]); //stage time limit
    _taskHM call (_x get "action"); //run stage action
    _taskHM call FUNC(updateTaskState); //update task map task info

    //condition for moving to next stage
    waitUntil {
        sleep 1;
        (if ("timeout" in _x) then {time >= _endTime} else {false}) //check timelimit for stage
        || _taskHM call (_x get "condition") //check stage specific conditions
        || (_taskHM getOrDefault ["cancellationToken", false]) //allow cancelation at the global level
        || (_x getOrDefault ["cancellationToken", false]) // allow cancelation at the stage level
    };
    _taskHM set ["__CurrentStage", (_taskHM get "__CurrentStage") +1]; //stage finished, increment stage count (for saving/loading)

    //if global canceled bail as fast as possible
    if (_taskHM getOrDefault ["cancellationToken", false]) exitWith {
        _taskHM set ["successful", false];
        _taskHM set ["state", "CANCELED"];
    };

    //reward is always run even for failures, if stage is canceled no reward is triggered for that stage, but delayed rewarded previous stages still run reward code
    //reward code handles both reward and punishment
    if ("reward" in _x) then {
        if (_x getOrDefault ["rewardInstant",false]) then (
            _x getOrDefault ["reward",{}] //returns code block
         ) else {
            (_taskHM get "rewards") pushBack (_x get "reward");
        };
    };

    //stage state info
    private _successful = (if ("timeout" in _x) then {time < _endTime} else {true}) && !(_x getOrDefault ["cancellationToken", false]);
    _x set ["successful", _successful];
    _x set ["state", (switch true do {
        case _successful: {"SUCCEEDED"};
        case (_x getOrDefault ["cancellationToken", false]): {"CANCELED"};
        Default {"FAILED"};
    })];

    //if stage failed/canceled and was required for the task, fail and bail
    if (!_successful && (_x getOrDefault ["required", true])) exitWith {
        _taskHM set ["successful", false];
        _taskHM set ["state", "FAILED"];
    };
} forEach _stages;

//update task state info and if part of chain update record
if (_taskHM getOrDefault ["successful", true]) then {// on completion assume task successful unless otherwise state (global cancel or failed/canceled required stage)
    _taskHM set ["state", "SUCCEEDED"]; //update tasks state (failed or canceled updated above in stage loop)

    if (isClass ((_taskHM get "cfg")/"chain")) then { //if part of chain
        private _chain = (_taskHM get "cfg")/"chain";
        private _name = _chain/"name";

        if (getNumber (_chain/"blockProgress") < 1) then { //if task is part of chain only increment chain progress if not side task in chain
            GVAR(chainStates) set [_name, (GVAR(chainStates) getOrDefault [_name, 1]) +1];
        };

        if (getNumber (_chain/"lastStage") > 0) then { //reset chain when last chain completed
            GVAR(chainStates) deleteAt _name;
        };
    };
};

{_taskHM call _x} forEach (_taskHM get "rewards"); //dish out none instat rewards for all completed stages of the task
_taskHM call (_taskHM getOrDefault ["destructor", {}]); //run task destructor to clean up, should be none halting

_taskHM call FUNC(updateTaskState); //update the task map info
GVAR(activeTasks) deleteAt ( GVAR(activeTasks) findIf {(_x get "taskID") isEqualTo (_taskHM get "taskID")} ); // cleare from active task record
