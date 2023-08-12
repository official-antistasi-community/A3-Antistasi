
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// only public vars:
// state - key of state function
// checkpoint - key of checkpoint function (retrieves data for save)
// interval - time until next update in seconds
// lastUpdate - time previous update was run (from time command)
// init call:
// params ["_task", "_params", "_checkpoint"];
// every other call: _this = task
// could sanitize so that loadParams

private _fnc_createBox = {
	params ["_pos"];
	private _box = "Land_FoodSacks_01_cargo_brown_F" createVehicle _pos;
	_box enableRopeAttach true;
	_box allowDamage false;
	[_box] call A3A_Logistics_fnc_addLoadAction;
	[_box, teamPlayer] call A3A_fnc_AIVEHinit;		// probably not useful?
	[_box,"Supply Box"] spawn A3A_fnc_inmuneConvoy;
	_task set ["_box", _box];
};

private _fnc_createTask = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [(_this get "_endTime") - time] call FUNC(minutesFromNow);
	private _holdTime = (_this get "_difficulty") * 2;

	private _taskName = localize "STR_antistasi_LTasks_LOG_Supplies_title";
	private _taskDesc = format [localize "STR_antistasi_LTasks_LOG_Supplies_description",_nameDest,_displayTime, _holdTime];
	private _taskPos = markerPos (_this get "_marker");
	private _notify = isNil {_this get "checkpoint"};
	private _taskId = call A3A_fnc_genTaskUID;
	[true, _taskId, [_desc,_taskName], _taskPos, false, -1, _notify, "Heal", true] call BIS_fnc_taskCreate;
	_this set ["_taskId", _taskId];
};

// Or: Pass in task with params and optionally checkpoint
// maybe makes more sense?

params ["_task", "_params", "_checkpoint"];

if (isNil "_checkpoint") then {
	_params params ["_marker"];

	// Specify larger object to leave space around box
	private _boxPos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"C_Van_01_box_F"];
	[_boxPos] call _fnc_createBox;

	// Determine end time and description
	_difficulty = [1, 2] select (random 10 < tierWar);
	if (sidesX getVariable _marker == teamPlayer) then { _difficulty = 1 };

	_task set ["_marker", _marker];
	_task set ["_difficulty", _difficulty];
	_task set ["_endTime", time + 60 * (15 + 30*_difficulty)];
	_task call _fnc_createTask;
}
else {
	_params params ["_marker", "_boxPos", "_remTime", "_difficulty"];

	[_boxPos] call _fnc_createBox;

	_task set ["_marker", _marker];
	_task set ["_difficulty", _difficulty];
	_task set ["_endTime", time + _remTime];
	_task call _fnc_createTask;
};

_task set ["checkpoint", "c_started"];
_task set ["state", "s_waitForPlace"];
_task set ["interval", 1];

_task set ["_hintTitle", localize "STR_A3A_LTasks_LOG_Supplies_title"];

_task set ["c_started", {
	[_this get "_marker", getPosATL (_this get "_box"), (_this get "_endTime") - time, _this get "_difficulty"];
};


/////////////////////
// State functions //
/////////////////////

// called with local vars _box and _marker
private _fnc_placedCondition = {
	if (_box distance2d markerPos _marker > 40) exitWith {false};
	if (spawner getVariable _marker != 0) exitWith { false };
	if ((!isNull attachedTo _box) or (!isNull ropeAttachedTo _box)) exitWith { false };
	true;
};

_task set ["s_waitForPlace",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	// check if box has been (initially) placed
	private _box = _this get "_box";
	private _marker = _this get "_marker";
	if !(call _fnc_placedCondition) exitWith {false};

	// Ok, now we go into the placed state
	_this set ["state", "s_boxPlaced"];
	_this set ["_countdown", 120 * (_this get "_difficulty")];			// maybe shouldn't reset?

	// Remove captive from friendlies
	{
		if (captive _x) then { [_x, false] remoteExec ["setCaptive", _x] };
	} forEach (units teamPlayer inAreaArray [getPosATL _box, 300, 300]);

	// Get nearby enemies to move towards the box
	{
		if (_x != leader _x or {_x != vehicle _x}) then { continue };
		group _x move getPosATL _box;
	} forEach (units Occupants inAreaArray [getPosATL _box, 500, 500]);

	// Difficult version: Send a QRF instead of longer time?
}];

_task set ["s_boxPlaced",
{
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	// Check if box has been picked up or deserted
	private _box = _this get "_box";
	private _marker = _this get "_marker";
	if !(call _fnc_placedCondition) exitWith { _this set ["state", "s_waitForPlace"]; false };

	private _blockTime = _this getOrDefault ["_blockTime", -1000];

	// Check that there are friendlies nearby and enemies not nearby
	if ([_x call A3A_fnc_canFight} count (units Occupants inAreaArray [getPosATL _box, 50, 50]) > 0
		or ({_x call A3A_fnc_canFight} count (units teamPlayer inAreaArray [getPosATL _box, 50, 50]) == 0) exitWith {
		if (time - _blockTime > 60) then {
			[_this get "_hintTitle", localize "STR_A3A_LTasks_LOG_Supplies_condition", getPosATL _box, 50] call A3A_fnc_hintNear;
			_this set ["_blockTime", time];
		};
		false;
	};

	// Safe delivery success if there are no enemies anywhere near
	if (units Occupants inAreaArray [getPosATL _box, 500, 500]) exitWith {
		[_this get "_hintTitle", localize "STR_A3A_LTasks_LOG_Supplies_deliveredSafe", getPosATL _box, 300] call A3A_fnc_hintNear;
		_this set ["state", "s_succeeded"];	false;
	};

	// Need to know actual time since the previous update
	private _timeDiff = time - (_this get "lastUpdate");
	private _countdown = (_this get "_countdown") - _timeDiff;
	_this set ["_countdown", _countdown];

	// Delivery completion success
	if (_countdown <= 0) exitWith {
		[_this get "_hintTitle", localize "STR_A3A_LTasks_LOG_Supplies_delivered", getPosATL _box, 300] call A3A_fnc_hintNear;
		_this set ["state", "s_succeeded"];	false;
	};

	// Show the countdown if blocked on last check
	if (_blockTime >= 0) then {
		private _nearPlayers = playableUnits inAreaArray [getPosATL _box, 300, 300];
		[_this get "_hintTitle", localize "STR_A3A_LTasks_LOG_Supplies_countdown", _countdown, _box, 50] remoteExecCall ["A3A_fnc_customHintCountdown", _nearPlayers];
		_this deleteAt "_blockTime";
	};
	false;
}];


_task set ["s_succeeded", {
	private _bonus = _this get "_difficulty";
	private _marker = _this get "_marker";

	// TODO: pull this shit out
	private _playersInRange = (allPlayers - (entities "HeadlessClient_F")) inAreaArray [markerPos _marker, 250, 250];
	{[10*_bonus * tierWar, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5*_bonus * tierWar, theBoss] call A3A_fnc_playerScoreAdd;

	[-15 * _bonus, 15 * _bonus, _marker] remoteExec ["A3A_fnc_citySupportChange", 2];
	[0, 200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA", 2];

	[_this get "_taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
};
_task set ["s_failed", {
	// Need a message here just to avoid the cooldown?
	[_this get "_hintTitle", localize "STR_A3A_LTasks_LOG_Supplies_failed", getPosATL _box, 300] call A3A_fnc_hintNear;

	[5, -5, _this get "_marker"] remoteExec ["A3A_fnc_citySupportChange", 2];
	[-10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "_taskId", "FAILED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
}];
_task set ["s_cleanup", {
	// just dismantle anything remaining

	private _box = _this get "_box";
	private _ecpos = getposATL _box;
	deleteVehicle _box;
	private _emptybox = "Land_Pallet_F" createVehicle _ecpos;
	[_emptybox] spawn A3A_fnc_postmortem;

	// TODO: task deletion, rate throttling?
	// maybe we should restrict tasks based on request time not completion/failure time?
	// so then throttling moves to the request management

	(_this get "taskId") spawn {
		[_this, true, true] call BIS_fnc_deleteTask;
	};
	true;		// delete the damned task
}];
