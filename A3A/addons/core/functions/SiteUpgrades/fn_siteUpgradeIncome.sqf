/*
Maintainer: Shoter
    Income parts of resources, factories and seaports for one income tick, with their upgrade levels.
    Every rebel-held, not destroyed site adds its base contribution times (1 + 0.1 x level).
    The level 0 sums are returned too, so the income tick can report what the levels added.

Arguments:
    None

Return Value:
    <ARRAY>
        0: <SCALAR> money from resources, with levels
        1: <SCALAR> factory part of the income multiplier, with levels
        2: <SCALAR> seaport part of the income multiplier, with levels
        3: <SCALAR> HR from site upgrades (0 until the level 3 and 5 bonuses exist)
        4: <SCALAR> money from resources at level 0
        5: <SCALAR> factory multiplier part at level 0
        6: <SCALAR> seaport multiplier part at level 0

Scope: Server
Environment: Any
Public: No
Dependencies: A3A_fnc_siteLevel
    A3A_rebelCashResMult, A3A_rebelCashFactMult, A3A_rebelCashSeaportMult

Example:
    ([] call A3A_fnc_siteUpgradeIncome) params ["_resMoney", "_factMult", "_seaMult", "_hr", "_baseRes", "_baseFact", "_baseSea"];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// [sum with levels, sum at level 0] of one site list
private _fnc_sum = {
    params ["_sites", "_perSite"];
    private _withLevels = 0;
    private _base = 0;
    {
        if (sidesX getVariable [_x, sideUnknown] != teamPlayer or {_x in destroyedSites}) then { continue };
        _base = _base + _perSite;
        _withLevels = _withLevels + _perSite * (1 + 0.1 * ([_x] call A3A_fnc_siteLevel));
    } forEach _sites;
    [_withLevels, _base];
};

([resourcesX, A3A_rebelCashResMult] call _fnc_sum) params ["_resMoney", "_baseRes"];
([factories, A3A_rebelCashFactMult] call _fnc_sum) params ["_factMult", "_baseFact"];
([seaports, A3A_rebelCashSeaportMult] call _fnc_sum) params ["_seaMult", "_baseSea"];

[_resMoney, _factMult, _seaMult, 0, _baseRes, _baseFact, _baseSea];
