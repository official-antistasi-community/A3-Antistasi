// @description: Saves with the six pre-2026-11 town upgrades load as clinic, militia post and city office
// @timeout: 30
// @start: new
// @world: Altis
#include "\x\A3A_autotest\test.hpp"

// Sorted keys of a hashmap, hashmaps themselves compare by reference
private _three = ["clinic", "militia", "office"];
private _clinicOffice = ["clinic", "office"];
private _none = [];
private _keysOf = { private _k = keys _this; _k sort true; _k };

private _posClinic = [[1,1,1], [0,1,0], [0,0,1]];
private _posRadio = [[2,2,2], [0,1,0], [0,0,1]];
private _posMarket = [[3,3,3], [0,1,0], [0,0,1]];
private _posRecruit = [[4,4,4], [0,1,0], [0,0,1]];
private _posSafehouse = [[5,5,5], [0,1,0], [0,0,1]];
private _posMilitia = [[6,6,6], [0,1,0], [0,0,1]];

private _townAll = createHashMapFromArray [["clinic", _posClinic], ["radio", _posRadio], ["market", _posMarket], ["recruit", _posRecruit], ["safehouse", _posSafehouse], ["militia", _posMilitia]];
private _townLegacy = createHashMapFromArray [["radio", _posRadio], ["safehouse", _posSafehouse], ["recruit", _posRecruit]];
private _townMarket = createHashMapFromArray [["market", _posMarket]];
private _townNew = createHashMapFromArray [["clinic", _posClinic], ["office", _posRecruit]];
private _saved = createHashMapFromArray [["TownAll", _townAll], ["TownLegacy", _townLegacy], ["TownMarket", _townMarket], ["TownNew", _townNew]];

private _migrated = ["cityInvest", _saved] call A3A_fnc_townUpgradeMigrate;
INFO(str _migrated);

// Every merged pair present: the current building wins, the market goes, the office takes the recruitment office spot
private _all = _migrated get "TownAll";
private _allKeys = _all call _keysOf;
ASSERT_EQ(_allKeys, _three, "town with all six keeps three");
ASSERT_EQ(_all get "clinic", _posClinic, "existing clinic keeps its building");
ASSERT_EQ(_all get "militia", _posMilitia, "existing militia post keeps its building");
ASSERT_EQ(_all get "office", _posRecruit, "office stands where the recruitment office was");

// Only legacy buildings: each becomes its merged upgrade in place
private _legacy = _migrated get "TownLegacy";
private _legacyKeys = _legacy call _keysOf;
ASSERT_EQ(_legacyKeys, _three, "legacy town gets all three");
ASSERT_EQ(_legacy get "clinic", _posRadio, "radio relay becomes the clinic");
ASSERT_EQ(_legacy get "militia", _posSafehouse, "safehouse becomes the militia post");

// A market alone is removed
private _marketKeys = (_migrated get "TownMarket") call _keysOf;
ASSERT_EQ(_marketKeys, _none, "market alone is removed");

// Already migrated data passes through
private _newKeys = (_migrated get "TownNew") call _keysOf;
ASSERT_EQ(_newKeys, _clinicOffice, "current ids unchanged");

// Kits in transit keep town and price, legacy ids are re-bound, a market kit becomes an office kit
private _kits = [["radio", "Kavala", 3500, [1,2,0], 90], ["market", "Pyrgos", 3000, [3,4,0], 0], ["safehouse", "Sofia", 1500, [5,6,0], 0], ["clinic", "Zaros", 6000, [7,8,0], 0]];
private _kitsMigrated = ["townKits", _kits] call A3A_fnc_townUpgradeMigrate;
private _kitsExpected = [["clinic", "Kavala", 3500, [1,2,0], 90], ["office", "Pyrgos", 3000, [3,4,0], 0], ["militia", "Sofia", 1500, [5,6,0], 0], ["clinic", "Zaros", 6000, [7,8,0], 0]];
ASSERT_EQ(_kitsMigrated, _kitsExpected, "kits re-bound to merged upgrades");
ASSERT_EQ(_kits # 0 # 0, "radio", "input kits are not modified");

// The catalogue matches what the migration produces
private _catalogue = (keys A3A_townUpgradeHM) call { _this sort true; _this };
ASSERT_EQ(_catalogue, _three, "catalogue holds the three merged upgrades");
