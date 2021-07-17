private ["_flagX","_pos","_markerX","_positionX","_size","_powerpl","_revealX"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//Variable Setup.
_flagX = _this select 0;
_playerX = _this select 1;
_revealX = [];
_pos = getPos _flagX;
_markerX = [markersX,_pos] call BIS_fnc_nearestPosition;

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) exitWith {};
_positionX = getMarkerPos _markerX;
_size = [_markerX] call A3A_fnc_sizeMarker;

if ((!isNull _playerX) and (captive _playerX)) exitWith {[localize "STR_antistasi_customHint_capture", localize "STR_antistasi_customHint_capture_undercover"] call A3A_fnc_customHint;};
if ((_markerX in airportsX) and (tierWar < 3)) exitWith {[localize "STR_antistasi_customHint_capture", localize "STR_antistasi_customHint_capture_warlevel"] call A3A_fnc_customHint;};

//Check if the flag is locked
if(_flagX getVariable ["isGettingCaptured", false]) exitWith
{
	[localize "STR_antistasi_customHint_capture", format [localize "STR_antistasi_customHint_capture_wait",30]] call A3A_fnc_customHint;
};

//Lock the flag
_flagX setVariable ["isGettingCaptured", true, true];

//Unlock the flag after 30 seconds
_flagX spawn
{
	sleep 30;
	_this setVariable ["isGettingCaptured", nil, true];
};

if (!isNull _playerX) then
{
    Info_2("Flag capture at %1 initiated by %2", _markerX, str _playerX);
	if (_size > 300) then
	{
		_size = 300
	};
	{
		if (((side _x == Occupants) or (side _x == Invaders)) and ([_x,_markerX] call A3A_fnc_canConquer)) then
		{
			_revealX pushBack _x
		};
	} forEach allUnits;
	if (player == _playerX) then
	{
		_playerX playMove "MountSide";
		sleep 8;
		_playerX playMove "";
		{
			player reveal _x
		} forEach _revealX;
	};
};

if ((count _revealX) > 2*({([_x,_markerX] call A3A_fnc_canConquer) and (side _x == teamPlayer)} count allUnits)) exitWith
{
    Debug_1("Markers left to be conquered: %1 ", _revealX);
    Info_1("Flag capture by %1 abandoned due to outnumbering", str _playerX);
	[localize "STR_antistasi_customHint_capture", localize "STR_antistasi_customHint_capture_enemy"] call A3A_fnc_customHint;
};

{
	if (isPlayer _x) then
	{
		[5,_x] remoteExec ["A3A_fnc_playerScoreAdd",_x];
		if (captive _x) then
		{
			[_x,false] remoteExec ["setCaptive",0,_x];
			_x setCaptive false;
		};
	}
} forEach ([_size,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);

Info_1("Flag capture by %1 rewarded", str _playerX);
[teamPlayer,_markerX] remoteExec ["A3A_fnc_markerChange",2];
