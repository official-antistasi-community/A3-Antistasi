//Mission: Logistics for ammunition
if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_pos","_truckX","_truckCreated","_groupX","_groupX1","_mrk"];

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;
_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
_timeLimit = if (_difficultX) then {30} else {60};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;
_typeVehX = selectRandom (_faction get "vehiclesAmmoTrucks");
_size = [_markerX] call A3A_fnc_sizeMarker;

_road = [_positionX] call A3A_fnc_findNearestGoodRoad;
_pos = position _road;
_pos = _pos findEmptyPosition [1,60,_typeVehX];
if (count _pos == 0) then {_pos = position _road};

private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_fn_mission_log_ammo_text",_nameDest,_displayTime],localize "STR_A3A_fn_mission_log_ammo_titel",_markerX],_pos,false,0,true,"rearm",true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_truckCreated = false;
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))};
_bonus = if (_difficultX) then {2} else {1};
if ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) then
	{
	//sleep 10;

	_truckX = _typeVehX createVehicle _pos;
	_truckX setDir (getDir _road);
	_truckCreated = true;
	[_truckX] spawn A3A_fnc_fillLootCrate;
	[_truckX, _sideX] call A3A_fnc_AIVEHinit;

	_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _pos];
	_mrk setMarkerShapeLocal "RECTANGLE";
	_mrk setMarkerSizeLocal [20,20];
	_mrk setMarkerTypeLocal "hd_warning";
	_mrk setMarkerColorLocal "ColorRed";
	_mrk setMarkerBrushLocal "DiagGrid";
	if (!debug) then {_mrk setMarkerAlphaLocal 0};
	_typeGroup = if (_difficultX) then {selectRandom (_faction get "groupsSquads")} else {_faction get "groupSentry"};
	//_cfg = if (_sideX == Occupants) then {cfgNATOInf} else {cfgCSATInf};
	_groupX = [_pos,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
	sleep 1;
	if (random 10 < 33) then
		{
		_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
		[_dog] spawn A3A_fnc_guardDog;
		};

	[_groupX, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

	_groupX1 = [_pos,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
	sleep 1;

	[_groupX1, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

	{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;
	{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX1;

	private _fnc_truckReturnedToBase = {
		//DistanceSqr is faster, and we're hard coding it anyway.
		(_truckX distanceSqr posHQ) < 10000;
	};

	_truckX setVariable ["ammoTruckLocation", _nameDest];
	_truckX addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];

		private _owningSide = (_vehicle getVariable "originalSide");		// set by AIVEHinit

		if (_unit getVariable ["spawner",false]) then {
			["TaskFailed", ["", format ["Ammotruck Stolen in an %1",(_vehicle getVariable ["ammoTruckLocation", ""])]]] remoteExec ["BIS_fnc_showNotification",_owningSide];
		};

		_truckX removeEventHandler ["GetIn", _thisEventHandler];
	}];

	waitUntil {sleep 3; (not alive _truckX) or (dateToNumber date > _dateLimitNum) or (call _fnc_truckReturnedToBase)};

	if (dateToNumber date > _dateLimitNum) then
		{
		[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
		[-200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10, theBoss] call A3A_fnc_playerScoreAdd;
		};
	if ((not alive _truckX) or (call _fnc_truckReturnedToBase)) then
		{

			[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
			[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[400*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			{if (_x distance _truckX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			[10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
	[-200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10, theBoss] call A3A_fnc_playerScoreAdd;
	};

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
if (_truckCreated) then
{
	// TODO: Head off to nearby base
	[_groupX] spawn A3A_fnc_groupDespawner;
	[_groupX1] spawn A3A_fnc_groupDespawner;
	[_truckX] spawn A3A_fnc_vehDespawner;
	// delete truck contents maybe?
};
