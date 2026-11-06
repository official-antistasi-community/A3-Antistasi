/*
Maintainer: Shoter
    Price of one rebel AI unit of a type, with the Landing point discount of level 7 seaports:
    10% per rebel-held, not destroyed seaport at level 7, at most 50%, rounded to 5. HR cost is not changed.

Arguments:
    <STRING> Unit type, for example FactionGet(reb,"unitRifle")

Return Value:
    <SCALAR> Price in money, 0 for an unknown type

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_siteLevel, A3A_siteUpgradeLandingDiscount, A3A_siteUpgradeLandingCap

Example:
    private _cost = [FactionGet(reb,"unitRifle")] call A3A_fnc_rebelUnitPrice;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_unitType", "", [""]]];

private _base = server getVariable [_unitType, 0];
if !(_base isEqualType 0) exitWith { 0 };

private _ports = { [_x] call A3A_fnc_siteLevel >= 7 } count seaports;
if (_ports == 0) exitWith { _base };

private _discount = (_ports * A3A_siteUpgradeLandingDiscount) min A3A_siteUpgradeLandingCap;
5 * round (_base * (1 - _discount) / 5);
