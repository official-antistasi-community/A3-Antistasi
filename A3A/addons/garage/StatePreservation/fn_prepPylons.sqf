/*
    Author: [Håkon]
    Description:
        strips pylon weapons to avoid unusable dry weapons in the vehicle on use

        note: needs to be called on vehicle before state restoration or pylon modifications

    Arguments:
    0. <Object> Vehicle to clean up weapons from vehicle

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_prepPylons;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_veh", objNull, [objNull]]];

#define weaponMag(X) getArray (configFile/"CfgWeapons"/X/"magazines")
#define magPylonWeapon(X) getText (configFile/"CfgMagazines"/X/"pylonWeapon")

private _turrets = [[-1]] + allTurrets _veh;
private _toRemove = [];
{
    private _turret = _x;
    private _baseWeapons = getArray (([_veh, _turret] call BIS_fnc_turretConfig) / "Weapons");
    private _weapons = (_veh weaponsTurret _turret) apply { toLower _x };
    // Avoiding array subtract in case there's a pylon and non-pylon copy of the same weapon
    // RHS has case bugs (zu-23 notably) so we force everything lower
    { _weapons deleteAt (_weapons find toLower _x) } forEach _baseWeapons;
    { _toRemove pushBack [_x, _turret] } forEach _weapons;

} forEach _turrets;

Trace_1("Removing pylon weapons: %1",_toRemove);
{ _veh removeWeaponTurret _x } forEach _toRemove;
