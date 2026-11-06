// @description: Landing point and Workshop discounts, price paid on units and vehicles, garrison price lists, refunds capped at the price paid, garage state keeps the price
// @timeout: 120
// @start: new
// @world: Altis
#include "\x\A3A_autotest\test.hpp"

private _sea = seaports select { !(_x in destroyedSites) } select 0;
private _fact = factories select { !(_x in destroyedSites) } select 0;
private _sites = [_sea, _fact];
private _oldSides = _sites apply { sidesX getVariable [_x, sideUnknown] };
private _oldFunds = server getVariable ["resourcesFIA", 0];
private _oldHR = server getVariable ["hr", 0];
private _rifle = A3A_faction_reb get "unitRifle";
private _oldRiflePrice = server getVariable _rifle;
server setVariable ["resourcesFIA", 1000000, true];
server setVariable ["hr", 100, true];

private _fnc_despawned = { (spawner getVariable [_this, 0]) == 2 };
{
    private _despawned = WAIT_UNTIL(_x call _fnc_despawned, 20);
    ASSERT(_despawned, "site despawned before the side change");
    [teamPlayer, _x, true] call A3A_fnc_markerChange;
} forEach _sites;
sleep 3;
private _settled = WAIT_UNTIL(!resourcesIsChanging, 10);
ASSERT(_settled, "faction money settled");

private _capFact = A3A_siteUpgradeLevelCap get "factory";
ASSERT_EQ(_capFact, 3, "factory cap raised to 3");

// Landing point: 10% off per level 7 seaport, rounded to 5
private _base = server getVariable _rifle;
private _price0 = [_rifle] call A3A_fnc_rebelUnitPrice;
ASSERT_EQ(_price0, _base, "no discount without a level 7 seaport");
[_sea, 7] call A3A_fnc_siteLevelSet;
private _price7 = [_rifle] call A3A_fnc_rebelUnitPrice;
private _expected7 = 5 * round (_base * 0.9 / 5);
ASSERT_EQ(_price7, _expected7, "level 7 seaport takes 10% off");
private _unknown = ["notAUnitType"] call A3A_fnc_rebelUnitPrice;
ASSERT_EQ(_unknown, 0, "unknown unit type costs 0");

// Garrison unit bought with the discount records its price
private _troops = A3A_garrison get _sea get "troops";
private _countBefore = count _troops;
[_sea, _rifle, 2] call A3A_fnc_garrisonServer_addUnitType;
ASSERT_EQ(count _troops, _countBefore + 1, "garrison unit added");
private _paidList = (A3A_garrison get _sea getOrDefault ["troopsPaid", createHashMap]) getOrDefault [_rifle, []];
ASSERT_EQ(_paidList, [_expected7], "garrison keeps the price paid");
sleep 2;
private _boughtSettled = WAIT_UNTIL(!resourcesIsChanging, 10);
ASSERT(_boughtSettled, "money settled after the purchase");

// Prices rise (as with training): the refund is half the price paid, not half the new price
server setVariable [_rifle, _base * 2, true];
private _fundsBefore = server getVariable "resourcesFIA";
[_sea, _rifle, 2] call A3A_fnc_garrisonServer_remUnitType;
private _target = round (_fundsBefore + _expected7 / 2);        // A3A_fnc_resourcesFIA rounds the total
private _refunded = WAIT_UNTIL(server getVariable "resourcesFIA" == _target, 10);
ASSERT(_refunded, "garrison refund is half the price paid");
private _paidAfter = (A3A_garrison get _sea getOrDefault ["troopsPaid", createHashMap]) getOrDefault [_rifle, []];
ASSERT_EQ(_paidAfter, [], "price removed with the unit");

// A unit with no recorded price is refunded at the current price, a cheaper current price caps the refund
private _takeUnknown = ["take", _sea, _rifle] call A3A_fnc_garrisonPaid;
ASSERT_EQ(_takeUnknown, _base * 2, "no recorded price: current price");
["add", _sea, _rifle, _base * 3] call A3A_fnc_garrisonPaid;
private _takeCapped = ["take", _sea, _rifle] call A3A_fnc_garrisonPaid;
ASSERT_EQ(_takeCapped, _base * 2, "refund never above the current price");
server setVariable [_rifle, _oldRiflePrice, true];

// A dead garrison unit takes its price with it, clear forgets every price
["add", _sea, _rifle, 50] call A3A_fnc_garrisonPaid;
["clear", _sea] call A3A_fnc_garrisonPaid;
private _hasPaidKey = "troopsPaid" in (A3A_garrison get _sea);
ASSERT(!_hasPaidKey, "clear removes the price lists");

// Live units: refund base from A3A_pricePaid
private _group = createGroup teamPlayer;
private _unit = _group createUnit [typeOf petros, markerPos "Synd_HQ", [], 0, "NONE"];
_unit setVariable ["unitType", _rifle];
private _noPrice = [_unit] call A3A_fnc_refundBase;
ASSERT_EQ(_noPrice, server getVariable _rifle, "unit without a price: current price");
_unit setVariable ["A3A_pricePaid", 5];
private _withPrice = [_unit] call A3A_fnc_refundBase;
ASSERT_EQ(_withPrice, 5, "unit refund capped at its price paid");

// Workshop: a level 3 factory takes 10% off vehicles, together with the seaport or war tier discount at most 40%
private _vehType = (A3A_faction_reb get "vehiclesTruck") # 0;
private _full = server getVariable _vehType;
private _vehPrice0 = [_vehType] call A3A_fnc_vehiclePrice;
[_fact, 3] call A3A_fnc_siteLevelSet;
private _vehPrice3 = [_vehType] call A3A_fnc_vehiclePrice;
private _expectedVeh = if (count seaports > 3) then {
    private _ports = ({ sidesX getVariable [_x, sideUnknown] == teamPlayer } count seaports) min 6;
    round (_full - _full * ((0.05 * _ports + 0.1) min 0.4))
} else {
    private _tier = 0 max ((tierWar - 4) * 0.5);
    5 * round ((_full - _full * ((0.1 * _tier + 0.1) min 0.4)) / 5)
};
ASSERT_EQ(_vehPrice3, _expectedVeh, "Workshop discount on vehicles");
ASSERT(_vehPrice3 < _vehPrice0, "Workshop makes vehicles cheaper");

// A vehicle bought with the Workshop discount, after the factory drops below level 3, refunds at most its price paid
private _veh = _vehType createVehicle [0, 0, 1000];
_veh setVariable ["A3A_pricePaid", _vehPrice3];
[_fact, 2] call A3A_fnc_siteLevelSet;
private _vehRefund = [_veh] call A3A_fnc_refundBase;
ASSERT_EQ(_vehRefund, _vehPrice3, "vehicle refund capped at the price paid");
private _vehPriceNow = [_vehType] call A3A_fnc_vehiclePrice;
ASSERT_EQ(_vehPriceNow, _vehPrice0, "price back to normal below level 3");

// The garage state carries the price paid; states saved before it was added still load
private _state = [_veh] call HR_GRG_fnc_getState;
ASSERT_EQ(count _state, 5, "garage state has the price paid");
private _veh2 = _vehType createVehicle [0, 50, 1000];
[_veh2, _state] call HR_GRG_fnc_setState;
private _restored = _veh2 getVariable ["A3A_pricePaid", -1];
ASSERT_EQ(_restored, _vehPrice3, "price paid restored from the garage state");
private _veh3 = _vehType createVehicle [0, 100, 1000];
[_veh3, _state select [0, 4]] call HR_GRG_fnc_setState;
private _oldState = _veh3 getVariable ["A3A_pricePaid", -1];
ASSERT_EQ(_oldState, -1, "old garage state without a price");

// Restore
{ deleteVehicle _x } forEach [_veh, _veh2, _veh3, _unit];
deleteGroup _group;
A3A_siteLevels = createHashMap;
publicVariable "A3A_siteLevels";
{
    if (sidesX getVariable _x != (_oldSides # _forEachIndex)) then { [_oldSides # _forEachIndex, _x, true] call A3A_fnc_markerChange };
} forEach _sites;
sleep 3;
server setVariable ["resourcesFIA", _oldFunds, true];
server setVariable ["hr", _oldHR, true];
