#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", ["_force", false]];

#define CTASKS_CFG (configFile/"A3A"/"CityTasks")

private _breakOut = call {
    if (_force) exitWith {false};
    if (sidesX getVariable _marker != Occupants) exitWith {true};
    if (_marker in A3A_activeCityBattles) exitWith {true};

    private _chance = A3A_cityTaskTimer get _marker;
    if (random 1 < _chance) exitWith {false};

    // 15% chance per minute of 100-pop town generating a mission after 20 calls
    A3A_cityTaskTimer set [_marker, _chance + 0.002 * sqrt (A3A_cityPop get _marker)];
    true;
};
if (_breakOut) exitWith {""};

A3A_cityTaskTimer set [_marker, -0.25];         // reset the chance so that we can't spawn another mission for a while

private _ranTask = "";
private _allTasks = "true" configClasses CTASKS_CFG;

while {_allTasks isNotEqualTo []} do {
    private _taskCfg = _allTasks deleteAt (floor random count _allTasks);
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

    private _params = [_marker] call _paramsFnc;
    if (_params isEqualType false) then {
        Trace_2("Couldn't find position for task %1 in %2", _taskName, _marker);
        continue;
    };

    Trace_2("Running task %1 in city %2", _taskName, _marker);
    [_taskFnc, _params] spawn A3A_tasks_fnc_runTask;
    _ranTask = _taskName;
    break;
};

_ranTask;
