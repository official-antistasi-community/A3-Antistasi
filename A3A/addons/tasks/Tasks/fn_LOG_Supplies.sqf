
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


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

private _fnc_createDescription = {
	private _nameDest = [_this get "_marker"] call A3A_fnc_localizar;
	private _displayTime = [(_this get "_endTime") - time] call FUNC(minutesFromNow);
	private _holdTime = (_this get "_difficulty") * 2;

	private _taskName = localize "STR_antistasi_LTasks_LOG_Supplies_title";
	private _taskDesc = format [localize "STR_antistasi_LTasks_LOG_Supplies_description",_nameDest,_displayTime, _holdTime];
	private _taskPos = markerPos (_this get "_marker");
	private _notify = isNil {_this get "checkpoint"};
	[true, (_this get "taskId"), [_desc,_taskName], _markerPos, false, -1, _notify, "Heal", true] call BIS_fnc_taskCreate;

	_this set ["_taskDesc", _taskDesc];		// save for updates
};

private _fnc_getSaveData = {
	[_this get "_marker", getPosATL (_this get "_box"), (_this get "_endTime") - time, _this get "_difficulty"];
};


params ["_task", "_params", "_checkpoint"];

if (isNil "_checkpoint") then {
	_params params ["_marker"];

	// Specify larger object to leave space around box
	private _boxPos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"C_Van_01_box_F"];
	[_boxPos] call _fnc_createBox;

	// Determine end time and description
	_difficulty = [1, 2] select (random 10 < tierWar);
	_task set ["_marker", _marker];
	_task set ["_difficulty", _difficulty];
	_task set ["_endTime", time + 15*60 + 30*60*_difficulty];
	_task call _fnc_createDescription;
}
else {
	_params params ["_marker", "_boxPos", "_remTime", "_difficulty"];

	[_boxPos] call _fnc_createBox;

	_task set ["_marker", _marker];
	_task set ["_difficulty", _difficulty];
	_task set ["_endTime", time + _remTime];
	_task call _fnc_createDescription;

};

_task set ["cf_started", _fnc_getSaveData];
_task set ["checkpoint", "cf_started"];
// probably needs to be different if the box is already in the zone?
_task set ["state", "s_waitForPlace"];


// Ok now into the actual states

_task set ["s_waitForPlace", {
	if (_this get "_endTime" < time) exitWith { _this set ["state", "s_failed"]; false };

	// All these states need to check for time limit expiry

	// check if box has been (initially) placed
	if (time > 

	private _box = _this get "_box";

	// checks: timelimit first?

}];
_task set ["s_succeeded", {
	[petros,"hint",(localize "STR_antistasi_LTasks_LOG_Supplies_supplies_delivered"), "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

	private _bonus = _this get "_difficulty";
	private _marker = _this get "_marker";

	// TODO: pull this shit out
	private _playersInRange = (allPlayers - (entities "HeadlessClient_F")) inAreaArray [markerPos _marker, 250, 250];
	{[10*_bonus * tierWar, _x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
	[5*_bonus * tierWar, theBoss] call A3A_fnc_playerScoreAdd;

	[-15 * _bonus, 15 * _bonus, _marker] remoteExec ["A3A_fnc_citySupportChange", 2];
	[0, 200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA", 2];

	[_this get "taskId", "SUCCEEDED"] call BIS_fnc_taskSetState;
	_this set ["state", "s_cleanup"]; false;
};
_task set ["s_failed", {
	[5, -5, _this get "_marker"] remoteExec ["A3A_fnc_citySupportChange", 2];
	[-10, theBoss] call A3A_fnc_playerScoreAdd;

	[_this get "taskId", "FAILED"] call BIS_fnc_taskSetState;
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

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or ((_truckX distance _positionX < 40) and (isNull attachedTo _truckX) and (isNull ropeAttachedTo _truckX)) or (isNull _truckX)};
_bonus = if (_difficultX) then {2} else {1};
if ((dateToNumber date > _dateLimitNum) or (isNull _truckX)) then
	{
	[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
	[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	_countX = 120*_bonus;//120
	["TaskFailed", ["", format ["%2 deploying supplies in %1",_nameDest,FactionGet(reb,"name")]]] remoteExec ["BIS_fnc_showNotification",Occupants];
	{_friendX = _x;
	if (captive _friendX) then
		{
		[_friendX,false] remoteExec ["setCaptive",0,_friendX];
		_friendX setCaptive false;
		};
	{
	if ((side _x == Occupants) and (_x distance _positionX < distanceSPWN)) then
		{
		if (_x distance _positionX < 300) then {_x doMove _positionX} else {_x reveal [_friendX,4]};
		};
	if ((side _x == civilian) and (_x distance _positionX < 300) and (vehicle _x == _x)) then {_x doMove position _truckX};
	} forEach allUnits;
	} forEach ([300,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
	while {(_countX > 0)/* or (_truckX distance _positionX < 40)*/ and (dateToNumber date < _dateLimitNum) and !(isNull _truckX)} do
		{
		while {(_countX > 0) and (_truckX distance _positionX < 40) and ({[_x] call A3A_fnc_canFight} count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits) == count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) and ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits == 0) and (dateToNumber date < _dateLimitNum) and (isNull attachedTo _truckX)} do
			{
			_formatX = format ["Keep the area clear of hostiles for %1 more seconds", _countX];
			{if (isPlayer _x) then {[petros,"hint",_formatX,"Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
			sleep 1;
			_countX = _countX - 1;
			};
		if (_countX > 0) then
			{
			_countX = 120*_bonus;//120
			if (((_truckX distance _positionX > 40) or (not([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) or ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits != 0)) and (alive _truckX)) then {{[petros,"hint","Stay close to the crate, and clean all BLUFOR presence in the surroundings or count will restart", "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([100,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)};
			waitUntil {sleep 1; ((_truckX distance _positionX < 40) and ([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits) and ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits == 0)) or (dateToNumber date > _dateLimitNum) or (isNull _truckX)};
			};
		if (_countX < 1) exitWith {};
		};
		if ((dateToNumber date < _dateLimitNum) and !(isNull _truckX)) then
			{
			[petros,"hint","Supplies Delivered", "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
			[_taskId, "SUPP", "SUCCEEDED"] call A3A_fnc_taskSetState;
			{if (_x distance _positionX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			[-15*_bonus,15*_bonus,_markerX] remoteExec ["A3A_fnc_citySupportChange",2];
            Debug("aggroEvent | Rebels won a supply mission");
			[Occupants, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
			}
		else
			{
			[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
			[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			};
	};

_ecpos = getpos _truckX;
deleteVehicle _truckX;
_emptybox = "Land_Pallet_F" createVehicle _ecpos;
[_emptybox] spawn A3A_fnc_postmortem;

[_taskId, "SUPP", 900] spawn A3A_fnc_taskDelete;
