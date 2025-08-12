//Mission: Destroy the antenna
if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_antenna","_positionX","_timeLimit","_markerX","_nameDest","_mrkFinal","_tsk"];

_antenna = _this select 0;
_markerX = [markersX,_antenna] call BIS_fnc_nearestPosition;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_nameDest = [_markerX] call A3A_fnc_localizar;
_positionX = getPos _antenna;

private _side = sidesX getVariable [_markerX, sideUnknown];

_timeLimit = if (_difficultX) then {30} else {120};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_mrkFinal = createMarker [format ["DES%1", random 100], _positionX];
_mrkFinal setMarkerShape "ICON";

private _taskId = "DES" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_fn_mission_des_ante_text",_nameDest,_displayTime,FactionGet(occ,"name")],localize "STR_A3A_fn_mission_des_ante_titel",_mrkFinal],_positionX,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (not alive _antenna) or (not(sidesX getVariable [_markerX,sideUnknown] == Occupants))};

_bonus = if (_difficultX) then {2} else {1};

if (dateToNumber date > _dateLimitNum) then
	{
	[_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	sleep 15;
	[_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [_side, 10, 120] remoteExec ["A3A_fnc_addAggression", 2];
	[400*_bonus, _side] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _positionX < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

deleteMarker _mrkFinal;

[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;
