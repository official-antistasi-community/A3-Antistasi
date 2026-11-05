/*
Maintainer: Shoter
    Builds the town upgrade catalogue and the constants used by the bonus hooks.
    Called from initVarServer, the catalogue variables are broadcast with the other server variables.

    A3A_townUpgradeHM: id -> [propClass, basePrice, markerType, letterCode, bonusValue]
    bonusValue per id:
        clinic     support added to the town every income tick (civilian death losses are halved separately)
        market     multiplier on the town's money income
        recruit    multiplier on the town's HR income
        radio      positive support multiplier, the town counts as having a rebel radio tower
        militia    multiplier on the town's garrison limit
        safehouse  fast travel time divisor, travel to the town is also free

Arguments:
    None

Return Value:
    <nil>

Scope: Server
Environment: Unscheduled
Public: No
Dependencies:

Example:
    call A3A_fnc_initTownUpgrades;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// First class of the list that exists in the loaded config, "" when none does
private _fnc_pickClass = {
    params ["_id", "_classes"];
    private _index = _classes findIf { isClass (configFile >> "CfgVehicles" >> _x) };
    if (_index == -1) exitWith { Error_2("No class available for town upgrade %1, tried %2", _id, _classes); "" };
    _classes # _index;
};

A3A_townUpgradeHM = createHashMapFromArray [
    ["clinic",    [["clinic",    ["Land_MedicalTent_01_white_IDAP_open_F", "Land_MedicalTent_01_aaf_generic_open_F", "Land_MedicalTent_01_MTP_closed_F"]] call _fnc_pickClass, 2500, "loc_Hospital",    "C", 0.1]],
    ["market",    [["market",    ["Land_MarketShelter_F", "Land_Sacks_goods_F"]] call _fnc_pickClass,                                                                    3000, "n_service",       "M", 1.5]],
    ["recruit",   [["recruit",   ["Land_Cargo_House_V1_F", "Land_Cargo_House_V2_F"]] call _fnc_pickClass,                                                                 2500, "n_inf",           "R", 1.5]],
    ["radio",     [["radio",     ["Land_TTowerSmall_1_F", "Land_TTowerSmall_2_F"]] call _fnc_pickClass,                                                                   3500, "loc_Transmitter", "A", 2]],
    ["militia",   [["militia",   ["Land_BagBunker_Tower_F", "Land_HBarrier_01_big_tower_green_F"]] call _fnc_pickClass,                                                    2000, "loc_Bunker",      "P", 1.5]],
    ["safehouse", [["safehouse", ["Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F"]] call _fnc_pickClass,                                                                  1500, "n_installation",  "S", 2]]
];

// Display order, hashmap keys are unordered
A3A_townUpgradeOrder = ["clinic", "market", "recruit", "radio", "militia", "safehouse"];

// Kit crate class. Needs a logistics cargo entry (logistics\Cargo) so it can be loaded into vehicles
A3A_townUpgradeCrateClass = ["kit crate", ["Land_PaperBox_01_open_boxes_F", "Land_PlasticCase_01_medium_F"]] call _fnc_pickClass;

// Maximum distance from the town centre marker at which an upgrade can be built
A3A_townUpgradeRadius = 400;

// Civilian deaths in a town with a clinic cost this fraction of the normal support loss (server only)
A3A_townUpgradeClinicDeathMult = 0.5;

Info_1("Town upgrades initialised: %1", A3A_townUpgradeHM);
