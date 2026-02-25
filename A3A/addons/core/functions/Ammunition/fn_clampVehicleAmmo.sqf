/*
    Clamp vehicle ammo to 3/4 of vehicle cost

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicle"];

private _vehPrice = server getVariable typeof _vehicle;
if (isNil "_vehPrice") exitWith {
    Error_1("Vehicle type %1 has no price?", typeof _vehicle);
};
_vehPrice = _vehPrice * 0.75;

private _blacklistMags = ["FakeWeapon", "FakeMagazine"];
private _allMags = magazinesAllTurrets _vehicle apply {_x#0} select {!(_x in _blacklistMags)};
if (count _allMags == 0) exitWith {};

private _magPrice = 0;
{
    _magPrice = _magPrice + ([_x, "mag"] call A3A_GUI_fnc_calculateItemPrice);
} forEach _allMags;

if (_vehPrice < _magPrice) then {
    _vehicle setVehicleAmmo (_vehPrice / _magPrice)
};
