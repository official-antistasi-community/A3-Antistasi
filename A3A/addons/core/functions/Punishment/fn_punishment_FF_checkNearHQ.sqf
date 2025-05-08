/*
Function:
	A3A_fnc_punishment_FF_checkNearHQ

Description:
	Checks if grenade or explosive created near Petros. Punishes accordingly.

Scope:
	<LOCAL> Execute on player you wish to check for FF.

Environment:
	<UNSCHEDULED>

Parameters:
	<OBJECT> Player that created grenade or explosive.
	<STRING> Weapon that created projectile.
	<OBJECT> Projectile.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if not near HQ; nil if it has crashed.

Examples Vanilla:
	private _EH_fired = {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
	};
	player addEventHandler ["Fired", _EH_fired];

Examples ACE:
	private _EH_ace_explosives_place = {
		params ["_explosive","_dir","_pitch","_unit"];
		[_unit,"Put",_explosive] call A3A_fnc_punishment_FF_checkNearHQ;
	};
	["ace_explosives_place", _EH_ace_explosives_place] call CBA_fnc_addEventHandler;

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit","_weapon","_projectile"];
private _fileName = "fn_punishment_FF_checkNearHQ";

if !(_weapon in ["Put","Throw"]) exitWith {false};
private _distancePetros = _unit distance petros;

if (_unit isNotEqualTo player) exitWith {};

if (_weapon == "Put") then 
{
    ServerInfo_5("Player %1 [UID: %2] tried to place %3 at grid %4 %5 meters away from HQ",name _unit, getPlayerUID _unit, typeOf _projectile, mapGridPosition _projectile,_distancePetros);
};

if !(_distancePetros <= 75) exitWith {false};

deleteVehicle _projectile;
[_unit, 60, 0.4, objNull, localize "STR_A3A_fn_punishment_FF_checkNearHQ"] remoteExec ["A3A_fnc_punishment_evaluateEvent",2,false];
true;
