// @description: Members buy and return town kits through the shared kit layer, kits survive save and load with their price paid
// @timeout: 60
// @start: new
// @world: Altis
#include "\x\A3A_autotest\test.hpp"

// State changed by the test, restored at the end
private _city = citiesX select { !(_x in destroyedSites) } select 0;
private _oldSide = sidesX getVariable [_city, sideUnknown];
private _oldFunds = server getVariable ["resourcesFIA", 0];
private _oldMembership = membershipEnabled;
private _memberUid = "A3A_autotest_member";

sidesX setVariable [_city, teamPlayer, true];
server setVariable ["resourcesFIA", 100000, true];
membershipEnabled = true;
membersX pushBack _memberUid;

// A fake member and a non-member standing at HQ. On the playerless server theBoss is null, so only membership counts
private _hqPos = markerPos "Synd_HQ";
private _group = createGroup teamPlayer;
private _member = _group createUnit [typeOf petros, _hqPos, [], 0, "NONE"];
_member setVariable ["A3A_playerUID", _memberUid];
private _stranger = _group createUnit [typeOf petros, _hqPos, [], 0, "NONE"];
_stranger setVariable ["A3A_playerUID", "A3A_autotest_stranger"];
private _cratePos = _hqPos vectorAdd [4, 4, 0];
_cratePos set [2, 0];

private _kitsOf = { A3A_upgradeKits select { ((_x getVariable ["A3A_upgradeKit", []]) select [0, 3]) isEqualTo _this } };
private _funds = { server getVariable ["resourcesFIA", 0] };

// Permission rule
private _memberAllowed = [_member] call A3A_fnc_upgradeKitAllowed;
ASSERT(_memberAllowed, "member may buy kits");
private _strangerAllowed = [_stranger] call A3A_fnc_upgradeKitAllowed;
ASSERT(!_strangerAllowed, "non-member may not buy kits with membership on");
ASSERT_EQ(A3A_upgradeKitKinds get "town", "A3A_fnc_townKitHandlers", "town kind registered");

// Non-member purchase is refused and costs nothing
private _before = call _funds;
private _refused = ["town", "clinic", _city, _cratePos, 0, _stranger] call A3A_fnc_upgradeKitPurchase;
ASSERT(isNull _refused, "non-member purchase refused");
ASSERT_EQ(call _funds, _before, "refused purchase takes no money");

// Member purchase takes exactly the town price, computed on the server
private _key = ["town", "clinic", _city];
private _price = ["clinic", _city] call A3A_fnc_townUpgradePrice;
_before = call _funds;
private _crate = ["town", "clinic", _city, _cratePos, 0, _member] call A3A_fnc_upgradeKitPurchase;
ASSERT(!isNull _crate, "member purchase creates the crate");
ASSERT_EQ(_before - (call _funds), _price, "purchase takes the town upgrade price");
private _record = _crate getVariable ["A3A_upgradeKit", []];
private _expectedRecord = ["town", "clinic", _city, _price];
ASSERT_EQ(_record, _expectedRecord, "crate kit record");
ASSERT(_crate in A3A_upgradeKits, "crate tracked in A3A_upgradeKits");

// A second crate for the same upgrade and town is refused
_before = call _funds;
private _second = ["town", "clinic", _city, _cratePos vectorAdd [2, 0, 0], 0, _member] call A3A_fnc_upgradeKitPurchase;
ASSERT(isNull _second, "duplicate purchase refused");
ASSERT_EQ(call _funds, _before, "duplicate purchase takes no money");
ASSERT_EQ(count (_key call _kitsOf), 1, "still one crate for the upgrade");

// Save and load: the townKits format is unchanged and the crate keeps its price paid
private _saved = ([] call A3A_fnc_townUpgradeSaveData) # 1;
private _savedKit = _saved select { (_x select [0, 2]) isEqualTo ["clinic", _city] };
ASSERT_EQ(count _savedKit, 1, "crate written to the save");
ASSERT_EQ(_savedKit # 0 # 2, _price, "saved price paid");
ASSERT_EQ(count (_savedKit # 0), 5, "saved kit keeps the five field format");

[_crate] call A3A_fnc_upgradeKitRemove;
ASSERT_EQ(count (_key call _kitsOf), 0, "crate removed before load");
// A kit written before the shared kit layer: same format, bought for a different price
private _oldKit = ["office", _city, 1234, _cratePos vectorAdd [0, 3, 0], 45];
private _toLoad = [_savedKit # 0, _oldKit];
["townKits", _toLoad] call A3A_fnc_loadStat;

private _loaded = _key call _kitsOf;
ASSERT_EQ(count _loaded, 1, "saved crate loaded");
_crate = _loaded # 0;
private _loadedPaid = (_crate getVariable ["A3A_upgradeKit", []]) # 3;
ASSERT_EQ(_loadedPaid, _price, "loaded crate keeps its price paid");
private _oldKey = ["town", "office", _city];
private _oldLoaded = _oldKey call _kitsOf;
ASSERT_EQ(count _oldLoaded, 1, "kit from an older save loaded");
private _oldCrate = _oldLoaded # 0;
private _oldPaid = (_oldCrate getVariable ["A3A_upgradeKit", []]) # 3;
ASSERT_EQ(_oldPaid, 1234, "older save kit keeps its price paid");

// Return: refused for a non-member, full refund for a member
_before = call _funds;
private _refundStranger = [_crate, _stranger] call A3A_fnc_upgradeKitReturn;
ASSERT_EQ(_refundStranger, -1, "non-member return refused");
ASSERT(_crate in A3A_upgradeKits, "refused return keeps the crate");
ASSERT_EQ(call _funds, _before, "refused return pays nothing");

private _refund = [_crate, _member] call A3A_fnc_upgradeKitReturn;
ASSERT_EQ(_refund, _price, "return refunds the price paid");
ASSERT_EQ((call _funds) - _before, _price, "refund reaches faction funds");
ASSERT(isNull _crate or {!(_crate in A3A_upgradeKits)}, "returned crate is gone");

_before = call _funds;
private _refundOld = [_oldCrate, _member] call A3A_fnc_upgradeKitReturn;
ASSERT_EQ(_refundOld, 1234, "older save kit refunds its own price paid");
ASSERT_EQ((call _funds) - _before, 1234, "older save kit refund reaches faction funds");

// Membership off: everyone may buy
membershipEnabled = false;
private _strangerAllowedOff = [_stranger] call A3A_fnc_upgradeKitAllowed;
ASSERT(_strangerAllowedOff, "everyone may buy kits with membership off");

// Restore
membershipEnabled = _oldMembership;
membersX deleteAt (membersX find _memberUid);
{ [_x] call A3A_fnc_upgradeKitRemove } forEach ((_key call _kitsOf) + (_oldKey call _kitsOf));
deleteVehicle _member;
deleteVehicle _stranger;
deleteGroup _group;
sidesX setVariable [_city, _oldSide, true];
server setVariable ["resourcesFIA", _oldFunds, true];
