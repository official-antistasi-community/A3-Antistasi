/*
Maintainer: Shoter
    Prices paid for the troops of a rebel garrison, so a refund never pays more than was spent (Landing point discount).
    Garrison troops are stored by unit type only, and units of one type are interchangeable, so each garrison keeps
    "troopsPaid": unit type -> prices paid, oldest first. A missing price means the unit was bought before this
    version or joined without a price: it is refunded at the current price, as before.

    Modes:
        "add"   [marker, unitType, price]: records the price of one unit that joined the garrison.
        "take"  [marker, unitType]: removes the oldest price of that type and returns the refund base,
                min(price paid, current undiscounted price), or the current price when none is recorded.
                Call it for every unit that leaves the garrison, refunded or not.
        "clear" [marker]: forgets every price, for a garrison that loses all its troops.

    The key is saved with the garrison data. Saves without it load with no prices.

Arguments:
    <STRING> Mode
    <STRING> Garrison marker
    <STRING> Unit type ("add", "take")
    <SCALAR> Price paid ("add")

Return Value:
    <SCALAR> Refund base for "take", otherwise 0

Scope: Server
Environment: Any
Public: No
Dependencies: A3A_garrison

Example:
    private _refund = 0.5 * (["take", _marker, _unitType] call A3A_fnc_garrisonPaid);
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_mode", "", [""]], ["_marker", "", [""]], ["_unitType", "", [""]], ["_price", -1, [0]]];

private _garrison = A3A_garrison getOrDefault [_marker, createHashMap];

switch (_mode) do {
    case "add": {
        if (_price < 0) exitWith { 0 };
        private _paid = _garrison getOrDefault ["troopsPaid", createHashMap, true];
        _paid getOrDefault [_unitType, [], true] pushBack _price;
        0;
    };
    case "take": {
        private _current = server getVariable [_unitType, 0];
        private _prices = (_garrison getOrDefault ["troopsPaid", createHashMap]) getOrDefault [_unitType, []];
        if (_prices isEqualTo []) exitWith { _current };
        (_prices deleteAt 0) min _current;
    };
    case "clear": {
        _garrison deleteAt "troopsPaid";
        0;
    };
    default {
        Error_1("Unknown garrisonPaid mode %1", _mode);
        0;
    };
};
