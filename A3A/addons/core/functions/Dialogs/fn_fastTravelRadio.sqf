//TODO: add header

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_roads","_pos","_positionX","_groupX"];
private _titleStr = localize "STR_A3A_fn_dialogs_ftradio_title";

if (limitedFT == 2) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_param"] call A3A_fnc_customHint;};

_markersX = markersX + [respawnTeamPlayer];

_esHC = false;
if (count hcSelected player > 1) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_grp_select"] call A3A_fnc_customHint;};
if (count hcSelected player == 1) then {_groupX = hcSelected player select 0; _esHC = true} else {_groupX = group player};
_checkForPlayer = false;
if ((!_esHC) and (limitedFT == 1)) then {_checkForPlayer = true};
_boss = leader _groupX;

if ((_boss != player) and (!_esHC)) then {_groupX = player};

if (({isPlayer _x} count units _groupX > 1) and (_esHC))
exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_command"] call A3A_fnc_customHint;};

if (player != player getVariable ["owner",player])
exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_control"] call A3A_fnc_customHint;};

if (!_esHC and !isNil {vehicle player getVariable "SA_Tow_Ropes"})
exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_tow"] call A3A_fnc_customHint;};

if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed})
exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_ff"] call A3A_fnc_customHint;};

_checkX = false;

{if ([getPosATL _x] call A3A_fnc_enemyNearCheck) exitWith {_checkX = true}} forEach units _groupX;
if (_checkX) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_enemy1"] call A3A_fnc_customHint;};

{if ((vehicle _x!= _x) and ((isNull (driver vehicle _x)) or (!canMove vehicle _x) or (vehicle _x isKindOf "Boat"))) then
	{
	if (not(vehicle _x isKindOf "StaticWeapon")) then {_checkX = true};
	}
} forEach units _groupX;
if (_checkX) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_other"] call A3A_fnc_customHint;};

positionTel = [];

//if (_esHC) then {hcShowBar false};
[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_click_zone"] call A3A_fnc_customHint;
if (!visibleMap) then {openMap true};
showCommandingMenu "";
onMapSingleClick "positionTel = _pos; true";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

_positionTel = positionTel;

if (count _positionTel > 0) then
	{
	_base = [_markersX, _positionTel] call BIS_Fnc_nearestPosition;
	if (_checkForPlayer and ((_base != "SYND_HQ") and !(_base in airportsX)))
	exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_onlyhq"] call A3A_fnc_customHint;};
    if ((sidesX getVariable [_base,sideUnknown]) in [Occupants, Invaders])
	exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_enemy2"] call A3A_fnc_customHint; openMap [false,false]};
	if (_base in forcedSpawn)
	exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_attack1"] call A3A_fnc_customHint; openMap [false,false]};

	//if (_base in outpostsFIA) exitWith {hint "You cannot Fast Travel to roadblocks and watchposts"; openMap [false,false]};

	if ([getMarkerPos _base] call A3A_fnc_enemyNearCheck)
	exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_no_attack2"] call A3A_fnc_customHint; openMap [false,false]};
	if (!(player call A3A_fnc_isMember || player == theBoss) && {!([_positionTel] call A3A_fnc_playerLeashCheckPosition)})
	exitWith {[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_no_members", ceil (memberDistance/1e3)]] call A3A_fnc_customHint;};

	if (_positionTel distance getMarkerPos _base < 50) then
		{
		_positionX = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
		_distanceX = round (((position _boss) distance _positionX)/200);
		//if (!_esHC) then {disableUserInput true; cutText ["Fast traveling, please wait","BLACK",2]; sleep 2;} else {hcShowBar false;hcShowBar true;hint format ["Moving group %1 to destination",groupID _groupX]; sleep _distanceX;};
		_forcedX = false;
		if (!isMultiplayer) then {if (not(_base in forcedSpawn)) then {_forcedX = true; forcedSpawn = forcedSpawn + [_base]}};
		if (!_esHC) then {
			disableUserInput true;
			cutText [format [localize "STR_A3A_fn_dialogs_fastTravelRadio_begin", ([[_distanceX] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format)],"BLACK",1];
			sleep 1;
		} else {
			[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_grp_moving",groupID _groupX]] call A3A_fnc_customHint;
			sleep _distanceX;
		};
 		if (!_esHC) then
 			{
 			_timePassed = 0;
 			while {_timePassed < _distanceX} do
 				{
 				cutText [format [localize "STR_A3A_fn_dialogs_fastTravelRadio_begin", ([[_distanceX - _timePassed] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format)],"BLACK",0.0001];
 				sleep 1;
 				_timePassed = _timePassed + 1;
 				}
 			};
		_exit = false;
		if (limitedFT == 1) then
			{
			_vehicles = [];
			{if (vehicle _x != _x) then {_vehicles pushBackUnique (vehicle _x)}} forEach units _groupX;
			{if ((vehicle _x) in _vehicles) exitWith {_checkForPlayer = true}} forEach (call A3A_fnc_playableUnits);
			};
		if (_checkForPlayer and ((_base != "SYND_HQ") and !(_base in airportsX)))
		exitWith {[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_cancelled",groupID _groupX]] call A3A_fnc_customHint;};
		private _ftUnits = [];
		{
		_unit = _x;
		if ((!isPlayer _unit) or (_unit == player)) then
			{
			//_unit hideObject true;
			_unit allowDamage false;
			_ftUnits pushBack _unit;
			if (_unit != vehicle _unit) then
				{
				if (driver vehicle _unit == _unit) then
					{
					sleep 3;
					_radiusX = 10;
					while {true} do
						{
						_roads = _positionX nearRoads _radiusX;
						if (count _roads > 0) exitWith {};
						_radiusX = _radiusX + 10;
						};
					_road = _roads select 0;
					_pos = position _road findEmptyPosition [10,100,typeOf (vehicle _unit)];
					vehicle _unit setPos _pos;
					};
				if ((vehicle _unit isKindOf "StaticWeapon") and (!isPlayer (leader _unit))) then
					{
					_pos = _positionX findEmptyPosition [10,100,typeOf (vehicle _unit)];
					vehicle _unit setPosATL _pos;
					};
				}
			else
				{
				if (!(_unit getVariable ["incapacitated",false])) then
					{
					_positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
					_unit setPosATL _positionX;
					if (isPlayer leader _unit) then {_unit setVariable ["rearming",false]};
					_unit doWatch objNull;
					_unit doFollow leader _unit;
					}
				else
					{
					_positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
					_unit setPosATL _positionX;
					};
				};
			};
			//_unit hideObject false;
		} forEach units _groupX;
		//if (!_esHC) then {sleep _distanceX};
		if (!_esHC) then {disableUserInput false;cutText [localize "STR_A3A_fn_dialogs_fastTravelRadio_end","BLACK IN",1]}
		else {[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_grp_arrived",groupID _groupX]] call A3A_fnc_customHint;};
		if (_forcedX) then {forcedSpawn = forcedSpawn - [_base]};
		[] call A3A_fnc_playerLeashRefresh;
		sleep 5;
		{_x allowDamage true} forEach _ftUnits;
		}
	else
		{
		[_titleStr, localize "STR_A3A_fn_dialogs_ftradio_click_marker"] call A3A_fnc_customHint;
		};
	};

if (!_esHC) then { openMap false };
