#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_staticX","_nearX","_playerX"];

_staticX = _this select 0;
_playerX = _this select 1;

if (!alive _staticX) exitWith {["Steal Static", "You cannot steal a destroyed static weapon"] call A3A_fnc_customHint;};

if (alive gunner _staticX) exitWith {["Steal Static", "You cannot steal a static weapon when someone is using it"] call A3A_fnc_customHint;};

if ((alive assignedGunner _staticX) and (!isPlayer (assignedGunner _staticX))) exitWith {["Steal Static", "The gunner of this static weapon is still alive"] call A3A_fnc_customHint;};

if (A3A_hasRHS and ((typeOf _staticX == FactionGet(reb,"staticAT")) or (typeOf _staticX == FactionGet(reb,"staticAA")))) exitWith {["Steal Static", "This weapon cannot be dissassembled"] call A3A_fnc_customHint;};

_nearX = [markersX,_staticX] call BIS_fnc_nearestPosition;

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {["Steal Static", "You have to conquer this zone in order to be able to steal this Static Weapon"] call A3A_fnc_customHint;};

_staticX setOwner (owner _playerX);

private _staticClass =	typeOf _staticX;
private _staticComponents = getArray (configFile >> "CfgVehicles" >> _staticClass >> "assembleInfo" >> "dissasembleTo");

deleteVehicle _staticX;

//We need to create the ground weapon holder first, otherwise it won't spawn exactly where we tell it to.
private _groundWeaponHolder = createVehicle ["GroundWeaponHolder", (getPosATL _playerX), [], 0, "CAN_COLLIDE"];

for "_i" from 0 to ((count _staticComponents) - 1) do
	{
		_groundWeaponHolder addBackpackCargoGlobal [(_staticComponents select _i), 1];
	};

[_groundWeaponHolder] call A3A_fnc_postmortem;

["Steal Static", "Weapon Stolen. It won't despawn when you assemble it again"] call A3A_fnc_customHint;
