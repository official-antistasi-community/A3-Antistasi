/*
Maintainer: Shoter
    Collects the town upgrade state for the save: installed upgrades per town and town kit crates still in transit.
    The kit format is the one written before the shared kit layer, so saves stay compatible both ways.
    Everything returned is JSON safe (strings, numbers, arrays, string keyed hashmaps).

Arguments:
    None

Return Value:
    <ARRAY>
        0: <HASHMAP> copy of A3A_cityInvest, city -> (id -> [posWorld, vectorDir, vectorUp])
        1: <ARRAY> kits, [[id, city, pricePaid, posATL, dir], ...]

Scope: Server
Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_cityInvest
    <ARRAY> A3A_upgradeKits

Example:
    ([] call A3A_fnc_townUpgradeSaveData) params ["_cityInvest", "_kits"];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _kits = [];
{
    if (isNull _x or {!alive _x}) then { continue };
    (_x getVariable ["A3A_upgradeKit", ["", "", "", 0]]) params ["_kind", "_id", "_city", "_paid"];
    if (_kind != "town") then { continue };
    _kits pushBack [_id, _city, _paid, getPosATL _x, getDir _x];
} forEach A3A_upgradeKits;

[+A3A_cityInvest, _kits];
