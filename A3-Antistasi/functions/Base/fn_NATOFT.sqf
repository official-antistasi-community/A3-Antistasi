_checkX = false;
_sideX = side (group player);
_enemyFaction = if (_sideX == Occupants) then {Invaders} else {Occupants};
{_enemyX = _x;
if (((side _enemyX == _enemyFaction) or (side _enemyX == teamPlayer)) and (_enemyX distance player < 500) and (not(captive _enemyX))) exitWith {_checkX = true};
} forEach allUnits;

if (_checkX) exitWith {[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_travel_enemy"] call A3A_fnc_customHint;};

if (vehicle player != player) then {if (!(canMove vehicle player)) then {_checkX = true}};
if (_checkX) exitWith {[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_travel_noDriver"] call A3A_fnc_customHint;};

positionTel = [];

[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_travel_map"] call A3A_fnc_customHint;
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

	if ((sidesX getVariable [_base,sideUnknown] == teamPlayer) or (_base in _mrkENY)) exitWith {[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_travel_enemy_control"] call A3A_fnc_customHint; openMap [false,false]};

	if ((!(_base in airportsX)) and (!(_base in seaports)) and (!(_base in outposts)) and (_base != _mrkRespawn)) exitWith {[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_trevel_info"] call A3A_fnc_customHint; openMap [false,false]};

	{
		if (((side (group _x) == teamPlayer) or (side (group _x) == _enemyFaction)) and (_x distance (getMarkerPos _base) < 500) and (not(captive _x))) then {_checkX = true};
	} forEach allUnits;

	if (_checkX) exitWith {[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_trevel_attack"] call A3A_fnc_customHint; openMap [false,false]};

	if (_positionTel distance getMarkerPos _base < 50) then
		{
		_positionX = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
		_distanceX = round (((position player) distance _positionX)/200);
		disableUserInput true;
		cutText [localize "STR_antistasi_cutText_tp","BLACK",2];
		sleep 2;
		(vehicle player) setPos _positionX;
		player allowDamage false;
		sleep _distanceX;
		disableUserInput false;
		cutText [localize "STR_antistasi_cutText_tpDone","BLACK IN",3];
		sleep 5;
		player allowDamage true;
		}
	else
		{
		[localize "STR_a3_fastravel1", localize "STR_antistasi_customHint_fast_trevel_click"] call A3A_fnc_customHint;
		};
	};
openMap false;
