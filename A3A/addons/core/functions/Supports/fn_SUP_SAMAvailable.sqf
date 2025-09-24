/*  Get SAM support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend (not currently used)
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

if !(_target isKindOf "Air") exitWith { 0 };     // can't hit anything except air

private _targThreat = A3A_vehicleResourceCosts getOrDefault [typeOf _target, 0];
_targThreat = _targThreat + (_target getVariable ["A3A_airKills", 0]);

// Avoid using SAMs against low-threat targets unless it's a low air faction
private _lowAir = Faction(_side) getOrDefault ["attributeLowAir", false];
if (!_lowAir) then { _targThreat = _targThreat - 150 };

_targThreat / 500;
