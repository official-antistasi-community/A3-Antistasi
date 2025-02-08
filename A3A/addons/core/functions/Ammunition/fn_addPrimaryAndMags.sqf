/*
    Equip rebel unit with primary weapon or handgun
    Adds magazines by mass. Uses default magazine of selected weapon

Parameters:
    0. <OBJECT> Rebel unit to equip with primary weapon.
    1. <STRING> Weapon classname
    2. <STRING> Optic type preference ("OpticsClose", "OpticsMid", "OpticsLong")
    3. <NUMBER> Total mass of primary magazines to add to inventory.
    4. <NUMBER> Optional: Number of GL mags to add if secondary.

Returns:
    Nothing

Environment:
    Scheduled, any machine
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_weapon", "_opticType", "_totalMagWeight", ["_glMags", 5]];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

// Probably shouldn't ever be executed
if !(primaryWeapon _unit isEqualTo "") then {
    if (_weapon == primaryWeapon _unit) exitWith {};
    private _magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
    {_unit removeMagazines _x} forEach _magazines;			// Broken, doesn't remove mags globally. Pain to fix.
    _unit removeWeapon (primaryWeapon _unit);
};

private _categories = _weapon call A3A_fnc_equipmentClassToCategories;

if ("GrenadeLaunchers" in _categories && {"Rifles" in _categories} ) then {
    // lookup real underbarrel GL magazine, because not everything is 40mm
    private _config = configFile >> "CfgWeapons" >> _weapon;
    private _glmuzzle = getArray (_config >> "muzzles") select 1;		// guaranteed by category
    _glmuzzle = configName (_config >> _glmuzzle);                      // bad-case fix. compatibleMagazines is case-sensitive as of 2.12
    private _glmag = compatibleMagazines [_weapon, _glmuzzle] select 0;
    _unit addMagazines [_glmag, 5];
};

private _magazine = compatibleMagazines _weapon select 0;
private _magweight = 5 max getNumber (configFile >> "CfgMagazines" >> _magazine >> "mass");

_unit addWeapon _weapon;
if ("Handguns" in _categories) then {
    _unit addHandgunItem _magazine;
} else {
    _unit addPrimaryWeaponItem _magazine;
};
_unit addMagazines [_magazine, round (random 0.5 + _totalMagWeight / _magWeight)];


private _compatOptics = A3A_rebelOpticsCache get _weapon;
if (isNil "_compatOptics") then {
    private _compatItems = compatibleItems _weapon;

    _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get _opticType);
    if (_compatOptics isEqualTo [] and _opticType != "OpticsClose") then {
        private _fallbackType = ["OpticsClose", "OpticsMid"] select (_opticType == "OpticsLong");
        _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get _fallbackType);
    };
    A3A_rebelOpticsCache set [_weapon, _compatOptics];
};
if (_compatOptics isNotEqualTo []) then { _unit addPrimaryWeaponItem (selectRandom _compatOptics) };
