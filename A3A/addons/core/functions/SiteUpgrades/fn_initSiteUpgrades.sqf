/*
Maintainer: Shoter
    Sets up site upgrades: levels 0 to 7 for resources, factories and seaports, bought as kits through the shared kit layer.
    Called from initVarServer after A3A_fnc_initTownUpgrades, needs the initZones site lists and income constants.
    The constants and A3A_siteLevels are broadcast with the other server variables, the building registries stay on the server.

    A3A_siteLevels: marker -> stored level (missing = 0), for every site whichever side holds it.
        Effects read A3A_fnc_siteLevel, which gives 0 while the site is enemy-held or destroyed.
    A3A_siteBuildings: "marker|level" -> building object, levels 3, 5 and 7 (server).
    A3A_siteBuildingData: "marker|level" -> [posWorld, vecDir, vecUp], what the save keeps (server).
    Price of a level: round(typeBase x mapScale x weight(level) / 100) x 100.

Arguments:
    None

Return Value:
    <nil>

Scope: Server
Environment: Unscheduled
Public: No
Dependencies:
    <ARRAY> resourcesX, factories, seaports
    <HASHMAP> A3A_upgradeKitKinds

Example:
    call A3A_fnc_initSiteUpgrades;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// First class of the list that exists in the loaded config, "" when none does
private _fnc_pickClass = {
    params ["_key", "_classes"];
    private _index = _classes findIf { isClass (configFile >> "CfgVehicles" >> _x) };
    if (_index == -1) exitWith { Error_2("No class available for site building %1, tried %2", _key, _classes); "" };
    _classes # _index;
};

A3A_siteUpgradeMaxLevel = 7;
A3A_siteUpgradeTypeBase = createHashMapFromArray [["resource", 1000], ["factory", 1500], ["seaport", 1000]];
A3A_siteUpgradeWeights = [1, 1.5, 3, 2, 4, 2.5, 6];          // level 1 to 7

// Fewer sites of a type means each one earns more, so its levels cost more. Clamped so very small or large maps stay sane
private _fnc_scale = {
    params ["_reference", "_count"];
    if (_count == 0) exitWith { 1 };
    0.5 max (_reference / _count) min 2;
};
A3A_siteUpgradeMapScale = createHashMapFromArray [
    ["resource", [20, count resourcesX] call _fnc_scale],
    ["factory", [10, count factories] call _fnc_scale],
    ["seaport", 1]
];

// Buildings may be placed and kits installed up to this distance from the site marker centre
A3A_siteUpgradeRadius = 250;

// Highest level sold per type. Raised release by release, the save keeps any level up to 7
A3A_siteUpgradeLevelCap = createHashMapFromArray [["resource", 7], ["factory", 2], ["seaport", 7]];

// Level bonuses. Resources: 3 Local workers, 5 Fortified compound, 7 Company town.
// Seaports: 3 Smugglers, 5 Foreign volunteers, 7 Landing point (not active yet)
A3A_siteUpgradeResHRPool = 3;               // Local workers: this HR per tick shared over all resources of the map
A3A_siteUpgradeSeaHR = 0.5;                 // Foreign volunteers: HR per tick per seaport
A3A_siteUpgradeHRCap = 5;                   // Most HR per tick from site upgrades
A3A_siteUpgradeFortifiedGarrison = 0.5;     // Fortified compound: added to the garrison limit multiplier
A3A_siteUpgradeCompanyTownRange = 2000;     // Company town: the nearest rebel town within this range
A3A_siteUpgradeSmugglerMags = 5;            // Smugglers: magazines per seaport every second tick
A3A_siteCompanyTowns = [];                  // Towns that got Company town support last tick (server)
// [type, level] of the level 3, 5 and 7 bonuses that work in this version, the tab marks the others as coming later
A3A_siteUpgradeBonusesActive = [["resource", 3], ["resource", 5], ["resource", 7], ["seaport", 3], ["seaport", 5]];

// Levels 3, 5 and 7 place a building that takes no damage
A3A_siteUpgradeBuildings = createHashMap;
{
    _x params ["_key", "_classes"];
    A3A_siteUpgradeBuildings set [_key, [_key, _classes] call _fnc_pickClass];
} forEach [
    ["resource|3", ["Land_Shed_Small_F", "Land_Cargo_House_V1_F"]],
    ["resource|5", ["Land_Cargo_HQ_V1_F", "Land_Cargo_House_V1_F"]],
    ["resource|7", ["Land_Cargo_Tower_V1_F", "Land_Cargo_HQ_V1_F"]],
    ["factory|3", ["Land_Cargo_House_V2_F", "Land_Cargo_House_V1_F"]],
    ["factory|5", ["Land_i_Shed_Ind_F", "Land_Shed_Big_F", "Land_Cargo_HQ_V1_F"]],
    ["factory|7", ["Land_TentHangar_V1_F", "Land_Shed_Big_F", "Land_Cargo_HQ_V1_F"]],
    ["seaport|3", ["Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F"]],
    ["seaport|5", ["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V1_F"]],
    ["seaport|7", ["Land_MobileCrane_01_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V1_F"]]
];

A3A_siteLevels = createHashMap;
A3A_siteBuildings = createHashMap;
A3A_siteBuildingData = createHashMap;

A3A_upgradeKitKinds set ["site", "A3A_fnc_siteKitHandlers"];

Info_2("Site upgrades initialised: scale %1, buildings %2", A3A_siteUpgradeMapScale, A3A_siteUpgradeBuildings);
