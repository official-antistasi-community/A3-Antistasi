#include "..\script_component.hpp"
FIX_LINE_NUMBERS()


// Don't use checkpoints for minor missions
params ["_params", "_checkpoint"];
_params params ["_marker", "_target"];
Trace_1("Params: %1", _params);

private _task = createHashMap;

_task set ["_hintTitle", localize "STR_A3A_Tasks_killcop_title"];
_task set ["_marker", _marker];
_task set ["_target", _target];
_task set ["_endTime", time + 20*60];

// Create the task
private _displayTime = [((_task get "_endTime") - time) / 60] call FUNC(minutesFromNow);
private _taskDesc = format [localize "STR_A3A_Tasks_killcop_desc", _marker, _displayTime];
private _taskId = call FUNC(genTaskUID);
[true, _taskId, [_taskDesc, _task get "_hintTitle"], _target, false, -1, true, "Kill", true] call BIS_fnc_taskCreate;
_task set ["_taskId", _taskId];


_task set ["state", "s_waitForKill"];
_task set ["interval", 1];

Trace_1("Initial data: %1" _task);

_task set ["s_waitForKill", {
    private _target = _this get "_target";
    if (isNull _target) exitWith {
        // Despawned. Delete the mission and exit.
   		[_this, true, true] call BIS_fnc_deleteTask;
    	true;		                                    // delete the task
    };

    if (!alive _target) exitWith {
        // "Good riddance"
		[_this get "_hintTitle", localize "STR_A3A_Tasks_killcop_kill", getPosATL _target, 200] call FUNC(hintNear);
        _this set ["state", "s_success"]; false;
    };

    if (_target getVariable ["surrendered", false]) exitWith {
        // "Looks like you've convinced the scumbag of the error of his ways. We'll find a good use for his talents."
		[_this get "_hintTitle", localize "STR_A3A_Tasks_killcop_surrender", getPosATL _target, 200] call FUNC(hintNear);
        _this set ["_surrender", true];
        _this set ["state", "s_success"]; false;
    };

    if (time > _this get "_endTime") exitWith {
        // "We've lost track of the target. Maybe another time"
		[_this get "_hintTitle", localize "STR_A3A_Tasks_killcop_timeout", getPosATL _target, 200] call FUNC(hintNear);
    	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
        _this set ["state", "s_cleanup"]; false;        
    };
    false;
}];

_task set ["s_success", {
    private _target = _this get "_target";
    private _value = [4, 8] select (alive _target);
	private _playersInRange = units teamPlayer inAreaArray [getPosATL _target, 200, 200];
	{[_value/2, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[_value/4, theBoss] call A3A_fnc_playerScoreAdd;

	[_value, _this get "_marker"] remoteExecCall ["A3A_fnc_citySupportChange", 2];

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
    _this set ["state", "s_cleanup"]; false;        
}];

_task set ["s_cleanup", {
	(_this get "_taskId") spawn {
		sleep 600;
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the task
}];

_task;
