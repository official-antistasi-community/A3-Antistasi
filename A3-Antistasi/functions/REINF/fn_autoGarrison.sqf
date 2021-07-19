#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
if (!isServer and hasInterface) exitWith {};

private ["_markerX","_destinationX","_originX","_groups","_soldiers","_vehiclesX","_size","_groupX","_truckX","_radiusX","_roads","_road","_pos"];

_markerX = _this select 0;
if (not(_markerX in smallCAmrk)) exitWith {};

_destinationX = getMarkerPos _markerX;
_originX = getMarkerPos respawnTeamPlayer;

_groups = [];
_soldiers = [];
_vehiclesX = [];

_size = [_markerX] call A3A_fnc_sizeMarker;

_divisor = 50;

if (_markerX in airportsX) then {_divisor = 100};

_size = round (_size / _divisor);

if (_size == 0) then {_size = 1};

_typesGroup = [GROUP("medium"),GROUP("AT"),GROUP("squad"),GROUP("Sniper")];

while {(_size > 0)} do
	{
	_groupX = [_originX, teamPlayer, selectRandom _typesGroup,false,true] call A3A_fnc_spawnGroup;
	if !(isNull _groupX) then
		{
		_groups pushBack _groupX;
		{[_x] spawn A3A_fnc_FIAinit; _soldiers pushBack _x} forEach units _groupX;
		_Vwp1 = _groupX addWaypoint [_destinationX, 0];
		_Vwp1 setWaypointType "MOVE";
		_Vwp1 setWaypointBehaviour "AWARE";
		sleep 30;
		};
	_size = _size - 1;
	};

waitUntil {sleep 1;((not(_markerX in smallCAmrk)) or (sidesX getVariable [_markerX,sideUnknown] == Occupants) or (sidesX getVariable [_markerX,sideUnknown] == Invaders))};
/*
{_vehicle = _x;
waitUntil {sleep 1; {_x distance _vehicle < distanceSPWN} count (allPlayers - (entities "HeadlessClient_F")) == 0};
deleteVehicle _vehicle;
} forEach _vehiclesX;*/
{_soldierX = _x;
waitUntil {sleep 1; {_x distance _soldierX < distanceSPWN} count (allPlayers - (entities "HeadlessClient_F")) == 0};
deleteVehicle _soldierX;
} forEach _soldiers;
{deleteGroup _x} forEach _groups;
