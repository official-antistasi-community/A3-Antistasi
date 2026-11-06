/*
Maintainer: Shoter
    Repair complexity of a vehicle class, 0 to 1 before any random part, shared by the junkyard repair shop and
    factory production. Mostly the junkyard price on a log scale, from 300 € (civilian car) to 200000 € (jet),
    which already carries vehicle tier, armament and armor. Tracked and air vehicles take a little longer,
    boats a little less, and every extra weapon system adds some.

Arguments:
    <STRING> Vehicle class
    <SCALAR> Junkyard price of the class

Return Value:
    <SCALAR> Complexity, not clamped: callers add their random part and clamp to 0..1

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_getVehicleWeaponTiers

Example:
    private _complexity = ([_class, _junkPrice] call A3A_fnc_junkyardComplexity) max 0 min 1;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_class", "", [""]], ["_junkPrice", 300, [0]]];

private _complexity = (log ((_junkPrice max 300) / 300)) / (log (200000 / 300));
_complexity = _complexity + call {
    if (_class isKindOf "Air") exitWith { 0.1 };
    if (_class isKindOf "Tank") exitWith { 0.1 };
    if (_class isKindOf "Ship") exitWith { -0.05 };
    0;
};
_complexity + ((0.03 * count ([_class] call A3A_fnc_getVehicleWeaponTiers)) min 0.15);
