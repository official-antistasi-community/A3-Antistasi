#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_createTask = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [(_this get "_endTime") - time] call FUNC(minutesFromNow);
	private _holdTime = (_this get "_difficulty") * 2;

	private _taskName = localize "STR_A3A_Tasks_LOG_Supplies_title";
	private _taskDesc = format [localize "STR_A3A_Tasks_LOG_Supplies_description", _nameDest, _displayTime, _holdTime];
	private _taskPos = markerPos (_this get "_marker");
	private _notify = isNil {_this get "checkpoint"};
	private _taskId = call FUNC(genTaskUID);
	[true, _taskId, [_taskDesc,_taskName], _taskPos, false, -1, _notify, "Heal", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};


params ["_params", "_checkpoint"];

private _task = createHashMap;

if (isNil "_checkpoint") then {
	_params params ["_marker"];

	// Determine end time and description
	private _difficulty = [1, 2] select (random 10 < tierWar);
	if (sidesX getVariable _marker == teamPlayer) then { _difficulty = 1 };

	_task set ["_marker", _marker];
	_task set ["_difficulty", _difficulty];
	_task set ["_endTime", time + 60 * (15 + 30*_difficulty)];
	_task call _fnc_createTask;
}
else {
	_params params ["_marker", "_remTime", "_difficulty"];

	_task set ["_marker", _marker];
	_task set ["_difficulty", _difficulty];
	_task set ["_endTime", time + _remTime];
	_task call _fnc_createTask;
};

_task set ["checkpoint", "c_started"];
_task set ["state", "s_waitForPlace"];
_task set ["interval", 1];

_task set ["_hintTitle", localize "STR_A3A_Tasks_LOG_Supplies_title"];

_task set ["c_started", {
	[_this get "_marker", (_this get "_endTime") - time, _this get "_difficulty"];
}];


/////////////////////
// State functions //
/////////////////////

// called with local vars _box and _marker
_task set ["_fnc_condition", {
    // condition for the task to progres
	true;
}];

_task set ["s_stage1",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	if !(call (_this get "_fnc_condition")) exitWith {false};

	// Condition fulfilled, run any extra code
	_this set ["state", "s_stage2"];

	false;
}];

_task set ["s_stage2",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };
	false;
}];

_task set ["s_succeeded", {
	private _bonus = _this get "_difficulty";
	private _marker = _this get "_marker";

	private _playersInRange = (allPlayers - (entities "HeadlessClient_F")) inAreaArray [markerPos _marker, 250, 250];
	{[10*_bonus * tierWar, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5*_bonus * tierWar, theBoss] call A3A_fnc_playerScoreAdd;

	[-15 * _bonus, 15 * _bonus, _marker] remoteExec ["A3A_fnc_citySupportChange", 2];
	[0, 200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA", 2];

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_failed", {
	// Need a message here just to avoid the cooldown?
	[_this get "_hintTitle", localize "STR_A3A_Tasks_LOG_Supplies_failed", getPosATL _box, 300] call FUNC(hintNear);

	[5, -5, _this get "_marker"] remoteExec ["A3A_fnc_citySupportChange", 2];
	[-10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_cleanup", {
	// just dismantle anything remaining

	// TODO: task deletion, rate throttling?
	// maybe we should restrict tasks based on request time not completion/failure time?
	// so then throttling moves to the request management

	(_this get "taskId") spawn {
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the damned task
}];

// Return the task hashmap
_task;
