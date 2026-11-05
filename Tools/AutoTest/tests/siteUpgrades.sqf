// @description: Site upgrade levels: prices, install through kits, income, garrison limit, release cap, capture drop, save and load
// @timeout: 90
// @start: new
// @world: Altis
#include "\x\A3A_autotest\test.hpp"

private _res = resourcesX select { !(_x in destroyedSites) } select 0;
private _fact = factories select { !(_x in destroyedSites) } select 0;
private _oldResSide = sidesX getVariable [_res, sideUnknown];
private _oldFactSide = sidesX getVariable [_fact, sideUnknown];
private _oldFunds = server getVariable ["resourcesFIA", 0];
private _oldMembership = membershipEnabled;
membershipEnabled = false;          // everyone may buy, the member rule has its own test
server setVariable ["resourcesFIA", 1000000, true];

// Both sites to the rebels through the normal scripted capture, which also converts their garrisons
private _fnc_despawned = { (spawner getVariable [_this, 0]) == 2 };
private _resRebel = WAIT_UNTIL(_res call _fnc_despawned, 20);
ASSERT(_resRebel, "resource despawned before the side change");
[teamPlayer, _res, true] call A3A_fnc_markerChange;
[teamPlayer, _fact, true] call A3A_fnc_markerChange;
ASSERT_EQ(sidesX getVariable _res, teamPlayer, "resource is rebel");
ASSERT_EQ(sidesX getVariable _fact, teamPlayer, "factory is rebel");
// The side changes spawn faction money updates, A3A_fnc_resourcesFIA is not atomic in scheduled code: let them finish
sleep 3;
private _settled = WAIT_UNTIL(!resourcesIsChanging, 10);
ASSERT(_settled, "faction money settled");

// Prices: round(typeBase x mapScale x weight / 100) x 100
private _resScale = 0.5 max (20 / count resourcesX) min 2;
private _factScale = 0.5 max (10 / count factories) min 2;
private _expectedRes1 = 100 * round (1000 * _resScale * 1 / 100);
private _expectedRes2 = 100 * round (1000 * _resScale * 1.5 / 100);
private _expectedFact7 = 100 * round (1500 * _factScale * 6 / 100);
private _priceRes1 = [_res, 1] call A3A_fnc_siteUpgradePrice;
private _priceRes2 = [_res, 2] call A3A_fnc_siteUpgradePrice;
private _priceFact7 = [_fact, 7] call A3A_fnc_siteUpgradePrice;
private _priceHQ = ["Synd_HQ", 1] call A3A_fnc_siteUpgradePrice;
ASSERT_EQ(_priceRes1, _expectedRes1, "resource level 1 price");
ASSERT_EQ(_priceRes2, _expectedRes2, "resource level 2 price");
ASSERT_EQ(_priceFact7, _expectedFact7, "factory level 7 price");
ASSERT_EQ(_priceHQ, 0, "no price for a marker that is not a site");

// A buyer standing at the resource, so the crate can be placed and installed there
private _group = createGroup teamPlayer;
private _buyer = _group createUnit [typeOf petros, markerPos _res, [], 0, "NONE"];
private _cratePos = (markerPos _res) vectorAdd [5, 5, 0];
_cratePos set [2, 0];

private _income0 = [] call A3A_fnc_siteUpgradeIncome;
private _limit0 = [_res] call A3A_fnc_getGarrisonLimit;

// Level 1 and 2 through the kit layer: buy, install
private _fnc_buyInstall = {
    params ["_marker", "_level"];
    private _crate = ["site", _level, _marker, _cratePos, 0, _buyer] call A3A_fnc_upgradeKitPurchase;
    if (isNull _crate) exitWith { false };
    [_crate, [], [0,1,0], [0,0,1], _buyer] call A3A_fnc_siteUpgradeInstall;
};
private _fundsBefore = server getVariable "resourcesFIA";
private _ok1 = [_res, 1] call _fnc_buyInstall;
ASSERT(_ok1, "level 1 bought and installed");
ASSERT_EQ(_fundsBefore - (server getVariable "resourcesFIA"), _expectedRes1, "level 1 charged its price");
private _ok2 = [_res, 2] call _fnc_buyInstall;
ASSERT(_ok2, "level 2 bought and installed");
private _resLevel = [_res] call A3A_fnc_siteLevel;
ASSERT_EQ(_resLevel, 2, "resource at level 2");
ASSERT_EQ(A3A_siteLevels get _res, 2, "level stored in A3A_siteLevels");

// Level 1 again is the wrong level, level 3 is above the R2 cap
private _again = ["site", 1, _res, _cratePos, 0, _buyer] call A3A_fnc_upgradeKitPurchase;
ASSERT(isNull _again, "an old level cannot be bought again");
private _capRefusal = [_res, 3] call A3A_fnc_siteUpgradeRefusal;
ASSERT(_capRefusal != "", "level 3 refused by the release cap");
private _overCap = ["site", 3, _res, _cratePos, 0, _buyer] call A3A_fnc_upgradeKitPurchase;
ASSERT(isNull _overCap, "level 3 purchase refused");

// One crate per site: a second kit for the same site is refused while the first is in transit
_buyer setPosATL (markerPos _fact);
private _factCrate = ["site", 1, _fact, (markerPos _fact) vectorAdd [5, 0, 0], 0, _buyer] call A3A_fnc_upgradeKitPurchase;
ASSERT(!isNull _factCrate, "factory level 1 kit bought");
private _inTransit = [_fact] call A3A_fnc_siteKitInTransit;
ASSERT(_inTransit, "factory kit counted in transit");
private _transitRefusal = [_fact, 1] call A3A_fnc_siteUpgradeRefusal;
ASSERT(_transitRefusal != "", "second kit for the same site refused");

// Income: the resource adds 20% of its share, factories unchanged
private _income2 = [] call A3A_fnc_siteUpgradeIncome;
private _resGain = (_income2 # 0) - (_income0 # 0);
private _expectedGain = A3A_rebelCashResMult * 0.2;
ASSERT(abs (_resGain - _expectedGain) < 0.01, "resource level 2 adds 20% of its money");
ASSERT_EQ(_income2 # 4, _income0 # 4, "level 0 resource sum unchanged");
ASSERT_EQ(_income2 # 1, _income0 # 1, "factory multiplier unchanged");

// Garrison limit: +20% of the base per level
if (A3A_rebelGarrisonLimit != -1) then {
    private _limit2 = [_res] call A3A_fnc_getGarrisonLimit;
    private _expectedLimit = round (A3A_rebelGarrisonLimit * 0.5 * 1.4);
    ASSERT_EQ(_limit2, _expectedLimit, "garrison limit at level 2");
    ASSERT(_limit2 >= _limit0, "garrison limit did not shrink");
};

// A level 3 building (set directly, R2 does not sell level 3): the drop removes only the lost level's building
[_fact, 3] call A3A_fnc_siteLevelSet;
private _bPos = AGLToASL ((markerPos _fact) vectorAdd [20, 20, 0]);
private _building = [_fact, 3, _bPos, [0,1,0], [0,0,1]] call A3A_fnc_siteBuildingCreate;
ASSERT(!isNull _building, "level 3 building created");
private _bKey = _fact + "|3";
ASSERT(_bKey in A3A_siteBuildingData, "building position recorded");

// Save and load with the factory enemy-held: it keeps its level, the resource keeps its own
private _saved = [] call A3A_fnc_siteUpgradeSaveData;
private _savedKits = _saved # 1;
ASSERT_EQ(count _savedKits, 1, "factory kit written to the save");
private _savedKitPaid = _savedKits # 0 # 2;
private _priceFact1 = [_fact, 1] call A3A_fnc_siteUpgradePrice;
ASSERT_EQ(_savedKitPaid, _priceFact1, "saved site kit keeps its price paid");

// Capture drop through the scripted side change: 3 -> 2, building removed
private _factDespawned = WAIT_UNTIL(_fact call _fnc_despawned, 20);
ASSERT(_factDespawned, "factory despawned before the capture");
[Occupants, _fact, true] call A3A_fnc_markerChange;
private _factStored = [_fact, false] call A3A_fnc_siteLevel;
private _factEffective = [_fact] call A3A_fnc_siteLevel;
ASSERT_EQ(_factStored, 2, "capture drops the factory to level 2");
ASSERT_EQ(_factEffective, 0, "enemy-held factory has effective level 0");
ASSERT(!(_bKey in A3A_siteBuildingData), "level 3 building data removed");
private _buildingGone = WAIT_UNTIL(isNull _building, 5);
ASSERT(_buildingGone, "level 3 building deleted");
private _staleRefusal = [_fact, 1] call A3A_fnc_siteUpgradeRefusal;
ASSERT(_staleRefusal != "", "no purchase for an enemy-held site");

// Round trip: wipe the state, load the save taken after the drop
_saved = [] call A3A_fnc_siteUpgradeSaveData;
{ [_x] call A3A_fnc_upgradeKitRemove } forEach (A3A_upgradeKits select { (_x getVariable ["A3A_upgradeKit", [""]]) # 0 == "site" });
A3A_siteLevels = createHashMap;
private _resWiped = [_res, false] call A3A_fnc_siteLevel;
ASSERT_EQ(_resWiped, 0, "without the save keys every site is level 0");
["siteUpgrades", _saved # 0] call A3A_fnc_loadStat;
["siteKits", _saved # 1] call A3A_fnc_loadStat;
private _resLoaded = [_res, false] call A3A_fnc_siteLevel;
private _factLoaded = [_fact, false] call A3A_fnc_siteLevel;
ASSERT_EQ(_resLoaded, 2, "resource level loaded");
ASSERT_EQ(_factLoaded, 2, "enemy-held factory keeps its level through save and load");
private _loadedKits = A3A_upgradeKits select { (_x getVariable ["A3A_upgradeKit", [""]]) # 0 == "site" };
ASSERT_EQ(count _loadedKits, 1, "site kit loaded");
private _loadedPaid = (_loadedKits # 0 getVariable ["A3A_upgradeKit", []]) # 3;
ASSERT_EQ(_loadedPaid, _savedKitPaid, "loaded site kit keeps its price paid");

// The loaded kit was bought for level 1 and the factory is now level 2: it can only be returned
private _crate = _loadedKits # 0;
_crate setPosATL ((markerPos _fact) vectorAdd [5, 0, 0]);
private _installedStale = [_crate, [], [0,1,0], [0,0,1], _buyer] call A3A_fnc_siteUpgradeInstall;
ASSERT(!_installedStale, "stale kit cannot be installed");

// Restore
{ [_x] call A3A_fnc_upgradeKitRemove } forEach (A3A_upgradeKits select { (_x getVariable ["A3A_upgradeKit", [""]]) # 0 == "site" });
{ if (!isNull _y) then { deleteVehicle _y } } forEach A3A_siteBuildings;
A3A_siteBuildings = createHashMap;
A3A_siteBuildingData = createHashMap;
A3A_siteLevels = createHashMap;
publicVariable "A3A_siteLevels";
deleteVehicle _buyer;
deleteGroup _group;
if (_oldResSide != teamPlayer) then { [_oldResSide, _res, true] call A3A_fnc_markerChange };
if (sidesX getVariable _fact != _oldFactSide) then { [_oldFactSide, _fact, true] call A3A_fnc_markerChange };
membershipEnabled = _oldMembership;
sleep 3;
server setVariable ["resourcesFIA", _oldFunds, true];
