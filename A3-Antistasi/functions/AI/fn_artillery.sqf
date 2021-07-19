if (!isServer and hasInterface) exitWith{};

private ["_mrkOrigin","_pos","_attackingSide","_countX","_mrkDestination","_veh","_posOrigin","_sideTargets","_posDestination","_typeVehX","_typeAmmunition","_size","_vehicle","_vehCrew","_groupVeh","_roundsX","_objectiveX","_objectivesX","_timeX"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

_mrkOrigin = _this select 0;
_posOrigin = if (_mrkOrigin isEqualType "") then {getMarkerPos _mrkOrigin} else {_mrkOrigin};
_mrkDestination = _this select 1;
_attackingSide = _this select 2;
private _faction = Faction(_attackingSide);
_sideTargets = _attackingSide call BIS_fnc_enemySides;
_posDestination = getMarkerPos _mrkDestination;
_typeVehX = (_faction get "vehiclesArtillery");

if !([_typeVehX] call A3A_fnc_vehAvailable) exitWith {};

_typeAmmunition = ((_faction get "magazines") get _typeVehX) #0;

_pos = [_posOrigin, 50,100, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos;

_vehicle=[_pos, random 360,_typeVehX, _attackingSide] call A3A_fnc_spawnVehicle;
_veh = _vehicle select 0;
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_veh, _attackingSide] call A3A_fnc_AIVEHinit;
_groupVeh = _vehicle select 2;
_size = [_mrkDestination] call A3A_fnc_sizeMarker;

if (!alive _veh) exitWith {Error("Arty piece destroyed on spawn, fire mission canceled")};
if (_posDestination inRangeOfArtillery [[_veh], ((getArtilleryAmmo [_veh]) select 0)]) then
	{
	while {(alive _veh) and ({_x select 0 == _typeAmmunition} count magazinesAmmo _veh > 0) and (_mrkDestination in forcedSpawn)} do
		{
		_objectiveX = objNull;
		_roundsX = 1;
		_objectivesX = vehicles select {(side (group driver _x) in _sideTargets) and (_x distance _posDestination <= _size * 2) and (_attackingSide knowsAbout _x >= 1.4) and (speed _x < 1)};
		if (count _objectivesX > 0) then
			{
			{
			if (typeOf _x in FactionGet(all,"vehiclesAttack")) exitWith {_objectiveX = _x; _roundsX = 4};
			} forEach _objectivesX;
			if (isNull _objectiveX) then {_objectiveX = selectRandom _objectivesX};
			}
		else
			{
			_objectivesX = allUnits select {(side (group _x) in _sideTargets) and (_x distance _posDestination <= _size * 2) and (_attackingSide knowsAbout _x >= 1.4) and (_x == leader group _x)};
			if (count _objectivesX > 0) then
				{
				_countX = 0;
				{
				_potential = _x;
				_countGroup = {(alive _x) and (!captive _x)} count units group _potential;
				if (_countGroup > _countX) then
					{
					if ((_attackingSide == Invaders) or ({(side (group _x) == civilian) and (_x distance _potential < 50)} count allUnits == 0)) then
						{
						_objectiveX = _potential;
						if (_countGroup > 6) then {_roundsX = 2};
						};
					};
				} forEach _objectivesX;
				};
			};
		if (!isNull _objectiveX) then
			{
			_veh commandArtilleryFire [position _objectiveX,_typeAmmunition,_roundsX];
			_timeX = _veh getArtilleryETA [position _objectiveX, ((getArtilleryAmmo [_veh]) select 0)];
			sleep 9 + ((_roundsX - 1) * 3);
			}
		else
			{
			sleep 29;
			};
		sleep 1;
		};
	};

[_groupVeh] spawn A3A_fnc_groupDespawner;
[_veh] spawn A3A_fnc_vehDespawner;
