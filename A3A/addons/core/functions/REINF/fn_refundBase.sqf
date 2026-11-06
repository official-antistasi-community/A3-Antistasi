/*
Maintainer: Shoter
    Full price a refund of a rebel unit or vehicle is based on: the price paid, but never more than the current price.
    Discounts can make a purchase cheaper than today's price, so refunding today's price would pay out more than was spent.
    Objects without a recorded price (bought before this version, or not bought) use the current price, as before.
    Callers multiply the result by their usual refund fraction.

Arguments:
    <OBJECT> Unit (uses its "unitType" and the undiscounted unit price) or vehicle (uses A3A_fnc_vehiclePrice)

Return Value:
    <SCALAR> Refund base in money

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_vehiclePrice

Example:
    _refund = _refund + 0.5 * ([_unit] call A3A_fnc_refundBase);
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_object", objNull, [objNull]]];

private _current = if (_object isKindOf "CAManBase") then {
    server getVariable [_object getVariable ["unitType", ""], 0]
} else {
    [typeOf _object] call A3A_fnc_vehiclePrice
};
if !(_current isEqualType 0) then { _current = 0 };

private _paid = _object getVariable ["A3A_pricePaid", -1];
if (_paid < 0) exitWith { _current };
_paid min _current;
