// TODO: Delete unused script

_checkX = false;
_sideX = side (group player);
_enemyFaction = if (_sideX == Occupants) then {Invaders} else {Occupants};
{_enemyX = _x;
if (((side _enemyX == _enemyFaction) or (side _enemyX == teamPlayer)) and (_enemyX distance player < 500) and (not(captive _enemyX))) exitWith {_checkX = true};
} forEach allUnits;

if (_checkX) exitWith {["Fast Travel", "You cannot Fast Travel while enemies are nearby."] call A3A_fnc_customHint;};

if (vehicle player != player) then {if (!(canMove vehicle player)) then {_checkX = true}};
if (_checkX) exitWith {["Fast Travel", "You cannot Fast Travel if your vehicles don't have a driver or your vehicles immobile."] call A3A_fnc_customHint;};

positionTel = [];

["Fast Travel", "Click on the zone you want to travel to."] call A3A_fnc_customHint;
if (!visibleMap) then {openMap true};
onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

_positionTel = positionTel;

if (count _positionTel > 0) then
	{
	_mrkENY = markersX select {sidesX getVariable [_x,sideUnknown] != _sideX};
	_markersX = +markersX;
	_mrkRespawn = "";
	if (_sideX == Occupants) then
		{
		_markersX pushBack "respawn_west";
		_mrkRespawn = "respawn_west";
		}
	else
		{
		_markersX pushBack "respawn_east";
		_mrkRespawn = "respawn_east";
		};
	_base = [_markersX, _positionTel] call BIS_Fnc_nearestPosition;

	if ((sidesX getVariable [_base,sideUnknown] == teamPlayer) or (_base in _mrkENY)) exitWith {["Fast Travel", "You cannot Fast Travel to an enemy controlled zone."] call A3A_fnc_customHint; openMap [false,false]};

	if ((!(_base in airportsX)) and (!(_base in seaports)) and (!(_base in outposts)) and (_base != _mrkRespawn)) exitWith {["Fast Travel", "You can only Fast Travel to Airbases, Outposts and Seaports."] call A3A_fnc_customHint; openMap [false,false]};

	{
		if (((side (group _x) == teamPlayer) or (side (group _x) == _enemyFaction)) and (_x distance (getMarkerPos _base) < 500) and (not(captive _x))) then {_checkX = true};
	} forEach allUnits;

	if (_checkX) exitWith {["Fast Travel", "You cannot Fast Travel to an area under attack or with enemies in the surrounding area."] call A3A_fnc_customHint; openMap [false,false]};

	if (_positionTel distance getMarkerPos _base < 50) then
		{
		_positionX = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
		_distanceX = round (((position player) distance _positionX)/200);
		disableUserInput true;
		cutText ["Fast traveling, please wait","BLACK",2];
		sleep 2;
		(vehicle player) setPos _positionX;
		player allowDamage false;
		sleep _distanceX;
		disableUserInput false;
		cutText ["You arrived to destination","BLACK IN",3];
		sleep 5;
		player allowDamage true;
		}
	else
		{
		["Fast Travel", "You must click near a marker you control."] call A3A_fnc_customHint;
		};
	};
openMap false;
