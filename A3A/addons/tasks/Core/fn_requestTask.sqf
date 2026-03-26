#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

#define TASKS_CFG (configFile/"A3A"/"Tasks")

if (!isServer) exitWith { Error("Server-only function miscalled") };
if (A3A_petrosMoving) exitWith {};

params [["_type", "ANY"], ["_requester", clientOwner], ["_silent", false]];

waitUntil {isNil "A3A_taskRequestInProgress"};
A3A_taskRequestInProgress = true;


private _titleStr = localize "STR_A3A_Tasks_requestTask_title";

if (_type in A3A_activeTasks) exitWith {
    if (!_silent) then {[petros,"globalChat",localize "STR_A3A_Tasks_requestTask_existing"] remoteExec ["A3A_fnc_commsMP",_requester]};
    A3A_taskRequestInProgress = nil;
};


private _taskFncHM = createHashMap;
private _taskWeights = [];
{
    private _taskCfg = _x;
    private _taskType = getText (_taskCfg >> "category");
    if !(_type in ["ANY", _taskType]) then { continue };
    if (_taskType in A3A_activeTasks) then { continue };
    private _taskName = configName _taskCfg;

    if (!isText (_taskCfg >> "params") or !isText (_taskCfg >> "func")) then {
        Error_1("Missing params or func entry in config for task %1", _taskName);
        continue;
    };

    private _paramsFncName = getText (_taskCfg >> "params");
    private _paramsFnc = missionNamespace getVariable _paramsFncName; 
    if (isNil "_paramsFnc") then {
        Error_1("No function %1 found", _paramsFncName);
        continue;
    };
    private _taskFncName = getText (_taskCfg >> "func");
    private _taskFnc = missionNamespace getVariable _taskFncName;
    if (isNil "_taskFnc") then {
        Error_1("No function %1 found", _taskFncName);
        continue;
    };

    private _params = call _paramsFnc;
    if (_params isEqualType false) then {
        Trace_1("Couldn't find position for task %1", _taskName);
        continue;
    };
    private _legacy = getNumber (_taskCfg >> "isLegacy");

    _taskFncHM set [_taskName, [_taskFnc, _legacy, _params#1]];
    _taskWeights append [_taskName, _params#0];

} forEach ("true" configClasses TASKS_CFG);

// Failure feedback
// Just use hint per category at the moment?
// and single "I have no %1 missions for you"
private _taskName = selectRandomWeighted _taskWeights;
if (isNil "_taskName") exitWith {
    if (!_silent) then {
        [petros, "globalChat", localize ("STR_A3A_Tasks_requestTask_no_" + _type)] remoteExec ["A3A_fnc_commsMP", _requester];
        [petros, "hint", localize ("STR_A3A_Tasks_requestTask_noHint_" + _type), _titleStr] remoteExec ["A3A_fnc_commsMP", _requester];
    };
    A3A_taskRequestInProgress = nil;
};

// Now start the task
_taskFncHM get _taskName params ["_taskFnc", "_isLegacy", "_taskParams"];
if (_isLegacy != 0) then {
    Trace_2("Running legacy mission %1 with params %2", _taskName, _taskParams);
    _taskParams spawn _taskFnc;
} else {
    Trace_2("Running FSM mission %1 with params %2", _taskName, _taskParams);
    [_taskFnc, _taskParams] spawn A3A_tasks_fnc_runTask;
};

if (!_silent) then {[petros,"globalChat",localize "STR_A3A_Tasks_requestTask_addMission"] remoteExec ["A3A_fnc_commsMP",_requester]};
sleep 3;			// delay lockout until the mission is registered
A3A_taskRequestInProgress = nil;

