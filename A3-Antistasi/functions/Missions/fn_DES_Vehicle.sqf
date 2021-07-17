//Mission: Destroy the vehicle
if (!isServer and hasInterface) exitWith{};

private ["_markerX","_positionX","_dateLimit","_dateLimitNum","_nameDest","_typeVehX","_textX","_truckCreated","_size","_pos","_veh","_groupX","_unit"];

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_positionX = getMarkerPos _markerX;
_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_timeLimit = if (_difficultX) then {30} else {120};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;

_typeVehX = if (_sideX == Occupants) then {vehNATOAA} else {vehCSATAA};

private _taskId = "DES" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_antistasi_mission_vehArmor_text",_nameDest,_displayTime,getText (configFile >> "CfgVehicles" >> (_typeVehX) >> "displayName")],localize "STR_antistasi_mission_vehArmori",_markerX],_positionX,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_truckCreated = false;
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (spawner getVariable _markerX == 0)};
_bonus = if (_difficultX) then {2} else {1};
if (spawner getVariable _markerX == 0) then
	{
	_truckCreated = true;
	_size = [_markerX] call A3A_fnc_sizeMarker;
	_pos = [];
	if (_size > 40) then {_pos = [_positionX, 10, _size, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos} else {_pos = _positionX findEmptyPosition [10,60,_typeVehX]};
	_veh = createVehicle [_typeVehX, _pos, [], 0, "NONE"];
	_veh allowdamage false;
	_veh setDir random 360;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;

	_groupX = createGroup _sideX;

	sleep 5;
	_veh allowDamage true;
	_typeX = if (_sideX == Occupants) then {NATOCrew} else {CSATCrew};
	for "_i" from 1 to 3 do
		{
		_unit = [_groupX, _typeX, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,""] call A3A_fnc_NATOinit;
		sleep 2;
		};

	if (_difficultX) then
		{
		_groupX addVehicle _veh;
		}
	else
		{
		waitUntil {sleep 1;({leader _groupX knowsAbout _x > 1.4} count ([distanceSPWN,0,leader _groupX,teamPlayer] call A3A_fnc_distanceUnits) > 0) or (dateToNumber date > _dateLimitNum) or (not alive _veh) or ({(_x getVariable ["spawner",false]) and (side group _x == teamPlayer)} count crew _veh > 0)};

		if ({leader _groupX knowsAbout _x > 1.4} count ([distanceSPWN,0,leader _groupX,teamPlayer] call A3A_fnc_distanceUnits) > 0) then {_groupX addVehicle _veh;};
		};

	waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (not alive _veh) or ({(_x getVariable ["spawner",false]) and (side group _x == teamPlayer)} count crew _veh > 0)};

	if ((not alive _veh) or ({(_x getVariable ["spawner",false]) and (side group _x == teamPlayer)} count crew _veh > 0)) then
		{
		[_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;
		if ({(_x getVariable ["spawner",false]) and (side group _x == teamPlayer)} count crew _veh > 0) then
			{
			["TaskFailed", ["", format [localize "STR_antistasi_notification_AA_stolen",_nameDest]]] remoteExec ["BIS_fnc_showNotification",_sideX];
			};
		[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
        [_sideX, 10, 60] remoteExec ["A3A_fnc_addAggression", 2];
		if (_sideX == Invaders) then
        {
            [0,10*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2]
        }
        else
        {
            [0,5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2]
        };
		[1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{if (_x distance _veh < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
    [_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
	[-5*_bonus,-100*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	[5*_bonus,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-600*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

if (_truckCreated) then
{
	[_groupX] spawn A3A_fnc_groupDespawner;
	[_veh] spawn A3A_fnc_vehDespawner;
};
