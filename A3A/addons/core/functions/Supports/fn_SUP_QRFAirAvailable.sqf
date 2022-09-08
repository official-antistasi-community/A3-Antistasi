/*  Get Air QRF support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend (not currently used)

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// make air a bit more likely with war tier? or not?
// air QRFs are typically *less* effective at higher tiers, right?

params ["_target", "_side"];

// specifically don't use it to attack:
// - Fixed wing aircraft
// - static AA
// - AA tanks/trucks
// TODO: Rework vehicle type system to handle this shit better
private _allAA = (A3A_faction_all get "vehiclesPlanesAA") + (A3A_faction_all get "vehiclesAA") + (A3A_faction_all get "staticAA");
if (typeOf _target in _allAA) exitWith { 0 };

// Otherwise fine?
// Could reduce chance for heli or non-infantry targets in general
// It can technically hit air/tanks, it's just not great at it

private _baseWeight = [1, 0.2] select (Faction(_side) getOrDefault ["attributeLowAir", false]);

if (_target isKindOf "Air") exitWith { _baseWeight * 0.2 };
if !(_target isKindOf "Man") exitWith { _baseWeight * 0.5 };
_baseWeight * 1;
