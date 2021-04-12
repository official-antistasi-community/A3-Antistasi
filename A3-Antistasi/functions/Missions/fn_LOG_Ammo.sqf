//Mission: Logistics for ammunition
if (!isServer and hasInterface) exitWith{};

private ["_pos","_truckX","_truckCreated","_groupX","_groupX1","_mrk"];

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;
_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_timeLimit = if (_difficultX) then {30} else {60};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;
_typeVehX = if (_sideX == Occupants) then {vehNATOAmmoTruck} else {vehCSATAmmoTruck};
_size = [_markerX] call A3A_fnc_sizeMarker;

_road = [_positionX] call A3A_fnc_findNearestGoodRoad;
_pos = position _road;
_pos = _pos findEmptyPosition [1,60,_typeVehX];
if (count _pos == 0) then {_pos = position _road};

[[teamPlayer,civilian],"LOG",[format ["We've spotted an Ammotruck in an %1. Go there and destroy or steal it before %2.",_nameDest,_displayTime],"Steal or Destroy Ammotruck",_markerX],_pos,false,0,true,"rearm",true] call BIS_fnc_taskCreate;
_truckCreated = false;
missionsX pushBack ["LOG","CREATED"]; publicVariable "missionsX";

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
	_typeGroup = if (_difficultX) then {if (_sideX == Occupants) then {NATOSquad} else {CSATSquad}} else {if (_sideX == Occupants) then {groupsNATOSentry} else {groupsCSATSentry}};
	//_cfg = if (_sideX == Occupants) then {cfgNATOInf} else {cfgCSATInf};
	_groupX = [_pos,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
	sleep 1;
	if (random 10 < 33) then
		{
		_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
		[_dog] spawn A3A_fnc_guardDog;
		};

	_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "NOVEH2"] execVM "scripts\UPSMON.sqf";

	_groupX1 = [_pos,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
	sleep 1;
	_nul = [leader _groupX1, _mrk, "SAFE","SPAWNED", "NOVEH2"] execVM "scripts\UPSMON.sqf";

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
		["LOG",[format ["We've spotted an Ammotruck in an %1. Go there and destroy or steal it before %2.",_nameDest,_displayTime],"Steal or Destroy Ammotruck",_markerX],_positionX,"FAILED","rearm"] call A3A_fnc_taskUpdate;
		[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
	if ((not alive _truckX) or (call _fnc_truckReturnedToBase)) then
		{

			["LOG",[format ["We've spotted an Ammotruck in an %1. Go there and destroy or steal it before %2.",_nameDest,_displayTime],"Steal or Destroy Ammotruck",_markerX],_positionX,"SUCCEEDED","rearm"] call A3A_fnc_taskUpdate;
			[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			{if (_x distance _truckX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
			[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
	["LOG",[format ["We've spotted an Ammotruck in an %1. Go there and destroy or steal it before %2.",_nameDest,_displayTime],"Steal or Destroy Ammotruck",_markerX],_positionX,"FAILED","rearm"] call A3A_fnc_taskUpdate;
	[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

_nul = [1200,"LOG"] spawn A3A_fnc_deleteTask;
if (_truckCreated) then
{
	// TODO: Head off to nearby base
	[_groupX] spawn A3A_fnc_groupDespawner;
	[_groupX1] spawn A3A_fnc_groupDespawner;
	[_truckX] spawn A3A_fnc_vehDespawner;
	// delete truck contents maybe?
};
