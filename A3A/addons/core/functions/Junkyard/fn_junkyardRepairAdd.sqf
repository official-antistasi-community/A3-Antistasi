/*
Maintainer: Shoter
    Puts a scrapped vehicle class into the junkyard repair shop. Called when a wreck is stripped for scrap,
    whatever side it belonged to. The repair takes A3A_junkyardRepairMinHours to A3A_junkyardRepairMaxHours of
    campaign uptime, longer for expensive, armored, tracked and air vehicles. Afterwards the vehicle can be bought
    for A3A_junkyardRepairPriceMin to A3A_junkyardRepairPriceMax of its junkyard price for A3A_junkyardRepairBuyWindow
    seconds before it is removed. All times run on the campaign clock, so skipping the in-game time does not speed them up.
    When the shop is full, the entry closest to its removal makes room.

    Entry format: [<SCALAR> id, <STRING> class, <SCALAR> price, <SCALAR> queued at, <SCALAR> ready at, <SCALAR> removed at], times on A3A_fnc_junkyardClock.

Arguments:
    <STRING> Vehicle class
    <SCALAR> Junkyard price of the class, -1 to calculate it [DEFAULT = -1]

Return Value:
    <ARRAY> The new entry, [] when the class cannot be sold by the junkyard

Scope: Server
Environment: Any
Public: No
Dependencies: A3A_fnc_junkyardClock, A3A_fnc_junkyardPrice, A3A_fnc_junkyardComplexity, HR_GRG_fnc_getCatIndex

Example:
    [typeOf _wreck, _price] call A3A_fnc_junkyardRepairAdd;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); [] };
params [["_class", "", [""]], ["_junkPrice", -1, [0]]];

// Same class rules as the junkyard stock: existing class, loaded DLC, placeable by the garage, no statics
private _cfg = configFile >> "CfgVehicles" >> _class;
if !(isClass _cfg) exitWith { [] };
if (_cfg call A3A_fnc_getModOfConfigClass in A3A_disabledDLC) exitWith { [] };
private _cat = [_class] call HR_GRG_fnc_getCatIndex;
if (_cat < 0 or _cat == 7) exitWith { Info_1("Junkyard repair: %1 cannot be placed by the garage, skipped", _class); [] };

if (_junkPrice < 0) then { _junkPrice = [_class] call A3A_fnc_junkyardPrice };

// Repair complexity 0..1 (A3A_fnc_junkyardComplexity), plus a random part that keeps similar vehicles apart
private _complexity = [_class, _junkPrice] call A3A_fnc_junkyardComplexity;
_complexity = ((_complexity - 0.1 + random 0.2) max 0) min 1;
private _repairTime = 3600 * (A3A_junkyardRepairMinHours + (A3A_junkyardRepairMaxHours - A3A_junkyardRepairMinHours) * _complexity);

// Price after repair, rounded like the junkyard price
private _price = _junkPrice * (A3A_junkyardRepairPriceMin + random (A3A_junkyardRepairPriceMax - A3A_junkyardRepairPriceMin));
_price = call {
    if (_price > 2000) exitWith { ceil (_price / 100) * 100 };
    if (_price > 200) exitWith { ceil (_price / 10) * 10 };
    ceil _price;
};
_price = _price max 50;

// Full shop: drop the entry that would be removed first anyway
if (count A3A_junkyardRepairs >= A3A_junkyardRepairMax) then {
    private _soonest = 0;
    { if (_x#5 < (A3A_junkyardRepairs # _soonest # 5)) then { _soonest = _forEachIndex } } forEach A3A_junkyardRepairs;
    private _dropped = A3A_junkyardRepairs deleteAt _soonest;
    Info_1("Junkyard repair shop full, dropped %1", _dropped);
};

private _id = 1;
{ _id = _id max ((_x#0) + 1) } forEach A3A_junkyardRepairs;
private _now = call A3A_fnc_junkyardClock;
private _readyAt = _now + _repairTime;
private _entry = [_id, _class, _price, _now, _readyAt, _readyAt + A3A_junkyardRepairBuyWindow];
A3A_junkyardRepairs pushBack _entry;
publicVariable "A3A_junkyardRepairs";

Info_3("Junkyard repair: %1 queued, ready in %2 h for %3", _class, (_repairTime / 3600) toFixed 1, _price);
_entry;
