#include "..\..\script_component.hpp"
//Mission: Assassinate a SpecOp team
FIX_LINE_NUMBERS()

if (!isServer and hasInterface) exitWith{};

_markerX = _this select 0;

_positionX = getMarkerPos _markerX;

_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_difficultX = if (random 10 < tierWar) then {true} else {false};
_timeLimit = if (_difficultX) then {60} else {120};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_nameDest = [_markerX] call A3A_fnc_localizar;
_naming = if (_sideX == Invaders) then {FactionGet(inv,"name")} else {FactionGet(occ,"name")};
private _taskString = format [localize "STR_A3A_fn_mission_as_specop_text",_nameDest,_displayTime,_naming];
private _taskId = "AS" + str A3A_taskCount;

[[teamPlayer,civilian],_taskId,[_taskString,localize "STR_A3A_fn_mission_as_specop_titel",_markerX],_positionX,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
waitUntil  {sleep 5; (dateToNumber date > _dateLimitNum) or (sidesX getVariable [_markerX,sideUnknown] == teamPlayer)};

if (dateToNumber date > _dateLimitNum) then
{
	[_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;
	[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10,theBoss] call A3A_fnc_playerScoreAdd;
}
else
{
	private _bonus = [1, 1.5] select _difficultX;
	[_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
	[0,200*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	[0,5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[800*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	{if (isPlayer _x) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
	[10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
    [_sideX, 10, 60] remoteExec ["A3A_fnc_addAggression", 2];
	["TaskFailed", ["", format [localize "STR_A3A_fn_mission_AS_specOP_dec",_nameDest]]] remoteExec ["BIS_fnc_showNotification",_sideX];
};

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;
