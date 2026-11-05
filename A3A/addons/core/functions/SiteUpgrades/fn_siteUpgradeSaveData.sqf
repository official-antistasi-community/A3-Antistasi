/*
Maintainer: Shoter
    Collects the site upgrade state for the save. Levels are saved for every site whichever side holds it.
    Everything returned is JSON safe (strings, numbers, arrays).

Arguments:
    None

Return Value:
    <ARRAY>
        0: <ARRAY> siteUpgrades value: [version, levels [[marker, level], ...], buildings [[marker, level, posWorld, vecDir, vecUp], ...]]
        1: <ARRAY> siteKits value: [[level, marker, pricePaid, posATL, dir], ...], the same layout as townKits

Scope: Server
Environment: Any
Public: No
Dependencies:
    A3A_siteLevels, A3A_siteBuildingData, A3A_upgradeKits

Example:
    ([] call A3A_fnc_siteUpgradeSaveData) params ["_siteUpgrades", "_siteKits"];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _levels = [];
{ _levels pushBack [_x, _y] } forEach A3A_siteLevels;

private _buildings = [];
{
    private _parts = _x splitString "|";
    if (count _parts != 2) then { continue };
    _y params ["_posWorld", "_vecDir", "_vecUp"];
    _buildings pushBack [_parts # 0, parseNumber (_parts # 1), _posWorld, _vecDir, _vecUp];
} forEach A3A_siteBuildingData;

private _kits = [];
{
    if (isNull _x or {!alive _x}) then { continue };
    (_x getVariable ["A3A_upgradeKit", ["", 0, "", 0]]) params ["_kind", "_level", "_marker", "_paid"];
    if (_kind != "site") then { continue };
    _kits pushBack [_level, _marker, _paid, getPosATL _x, getDir _x];
} forEach A3A_upgradeKits;

[[1, _levels, _buildings], _kits];
