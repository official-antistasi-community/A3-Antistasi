///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "LSM"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_LSM\Flag\LSM_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_LSM"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_LSM_B_TT650", "I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_LSM_B_LR_Open", "UK3CB_LSM_B_LR_Closed", "UK3CB_LSM_B_Hilux_Open"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_LSM_B_LR_M2", "UK3CB_LSM_B_LR_SF_M2", "UK3CB_LSM_B_BTR40_MG", "UK3CB_LSM_B_Hilux_Pkm"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["UK3CB_LSM_B_Gaz66_Open", "UK3CB_LSM_B_Gaz66_Covered", "UK3CB_LSM_B_BTR40"]] call _fnc_saveToTemplate;
["vehiclesAT", ["UK3CB_LSM_B_LR_SPG9", "UK3CB_LSM_B_Hilux_Mortar"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_LSM_B_Gaz66_ZU23"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F", "UK3CB_I_G_Fishing_Boat_SPG9", "UK3CB_CHD_I_Fishing_Boat_Zu23_front"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["UK3CB_FIA_I_Cessna_T41", "RHS_AN2"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["UK3CB_C_AC500", "UK3CB_C_DC3"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_FIA_I_Hilux_Ambulance"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["UK3CB_C_Golf", "UK3CB_C_Landcruiser", "UK3CB_C_Hilux_Open", "UK3CB_C_Pickup", "UK3CB_C_SUV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["UK3CB_CHC_C_V3S_Open", "UK3CB_C_Ural_Open", "UK3CB_C_V3S_Recovery", "UK3CB_C_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["UK3CB_C_Bell412_Civ", "UK3CB_C_Bell412_Medic"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat", "UK3CB_CHC_C_Fishing_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_NAP_I_DSHKM", "UK3CB_MEI_I_PKM_High", "UK3CB_MEI_I_PKM_Low", "UK3CB_MEI_I_DSHkM_Mini_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_UN_I_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_UN_I_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_FIA_I_M252"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "rhs_mine_smine35_press_mag"] call _fnc_saveToTemplate;
["mineAPERS", "rhs_mine_pmn2_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

#include "3CB_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"rhs_weap_makarov_pm", "rhs_weap_tt33",
"a3a_UK3CB_CZ550_8mm",
["rhs_weap_rpg75", 50],
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"rhs_mag_9x18_8_57N181S", "rhs_mag_762x25_8", "rhsgref_5Rnd_792x57_kar98k", "rhs_grenade_sthgr43_mag", "rhs_grenade_nbhgr39_mag",
"UK3CB_CHC_C_B_MED", "UK3CB_B_Bedroll_Backpack", "UK3CB_TKC_C_B_Sidor_MED", "UK3CB_CW_SOV_O_LATE_B_Sidor_RIF", "UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF",
"UK3CB_V_CW_Chestrig", "UK3CB_V_CW_Chestrig_2_Small", "UK3CB_V_Belt_KHK", "UK3CB_V_Belt_Rig_KHK", "UK3CB_V_Belt_Rig_Lite_KHK", "UK3CB_V_Pouch", "UK3CB_V_Chestrig_TKA_OLI", "UK3CB_V_Chestrig_2_Small_OLI", "UK3CB_V_Chestrig_TKA_BRUSH", "UK3CB_V_Chestrig_Lite_KHK", "UK3CB_V_Chestrig_Lite_2_Small_KHK",
"rhs_acc_2dpZenit", "Binocular",
"rhs_weap_rsp30_white",
"rhs_weap_rsp30_green",
"rhs_weap_rsp30_red"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155", "tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [    "UK3CB_LNM_I_U_CombatSmock_36",
    "UK3CB_LNM_I_U_CombatSmock_35",
    "UK3CB_LNM_I_U_CombatSmock_34",
    "UK3CB_LNM_I_U_CombatSmock_33",
    "UK3CB_LNM_I_U_CombatSmock_32",
    "UK3CB_LNM_I_U_CombatSmock_31",
    "UK3CB_LNM_I_U_CombatSmock_30",
    "UK3CB_LNM_I_U_CombatSmock_29",
    "UK3CB_LNM_I_U_CombatSmock_28",
    "UK3CB_LNM_I_U_CombatSmock_27",
    "UK3CB_LNM_I_U_CombatSmock_26",
    "UK3CB_LNM_I_U_CombatSmock_25",
    "UK3CB_LNM_I_U_CombatSmock_24",
    "UK3CB_LNM_I_U_CombatSmock_23",
    "UK3CB_LNM_I_U_CombatSmock_22",
    "UK3CB_LNM_I_U_CombatSmock_21",
    "UK3CB_LSM_I_U_CombatSmock_20",
    "UK3CB_LSM_I_U_CombatSmock_19",
    "UK3CB_LSM_I_U_CombatSmock_18",
    "UK3CB_LSM_I_U_CombatSmock_17",
    "UK3CB_LSM_I_U_CombatSmock_16",
    "UK3CB_LSM_I_U_CombatSmock_15",
    "UK3CB_LSM_I_U_CombatSmock_14",
    "UK3CB_LSM_I_U_CombatSmock_13",
    "UK3CB_LSM_I_U_CombatSmock_12",
    "UK3CB_LSM_I_U_CombatSmock_11",
    "UK3CB_LSM_I_U_CombatSmock_10",
    "UK3CB_LSM_I_U_CombatSmock_09",
    "UK3CB_LSM_I_U_CombatSmock_08",
    "UK3CB_LSM_I_U_CombatSmock_07",
    "UK3CB_LSM_I_U_CombatSmock_06",
    "UK3CB_LSM_I_U_CombatSmock_05",
    "UK3CB_LSM_I_U_CombatSmock_04",
    "UK3CB_LSM_I_U_CombatSmock_03",
    "UK3CB_LSM_I_U_CombatSmock_02",
    "UK3CB_LSM_I_U_CombatSmock_01"
];

private _nonSmockUniforms = [
    "UK3CB_LNM_I_U_Shirt_Pants_16",
    "UK3CB_LNM_I_U_Shirt_Pants_15",
    "UK3CB_LNM_I_U_Shirt_Pants_14",
    "UK3CB_LNM_I_U_Shirt_Pants_13",
    "UK3CB_LNM_I_U_Shirt_Pants_12",
    "UK3CB_LNM_I_U_Shirt_Pants_11",
    "UK3CB_LNM_I_U_Shirt_Pants_10",
    "UK3CB_LNM_I_U_Shirt_Pants_09",
    "UK3CB_LNM_I_U_Shirt_Pants_08",
    "UK3CB_LNM_I_U_Shirt_Pants_07",
    "UK3CB_LNM_I_U_Shirt_Pants_06",
    "UK3CB_LNM_I_U_Shirt_Pants_05",
    "UK3CB_LNM_I_U_Shirt_Pants_04",
    "UK3CB_LNM_I_U_Shirt_Pants_03",
    "UK3CB_LNM_I_U_Shirt_Pants_02",
    "UK3CB_LNM_I_U_Shirt_Pants_01",
    "UK3CB_LNM_I_U_CombatUniform_15",
    "UK3CB_LNM_I_U_CombatUniform_14",
    "UK3CB_LNM_I_U_CombatUniform_13",
    "UK3CB_LNM_I_U_CombatUniform_12",
    "UK3CB_LNM_I_U_CombatUniform_11",
    "UK3CB_LNM_I_U_CombatUniform_10",
    "UK3CB_LNM_I_U_CombatUniform_09",
    "UK3CB_LNM_I_U_CombatUniform_08",
    "UK3CB_LNM_I_U_CombatUniform_07",
    "UK3CB_LNM_I_U_CombatUniform_06",
    "UK3CB_LNM_I_U_CombatUniform_05",
    "UK3CB_LNM_I_U_CombatUniform_04",
    "UK3CB_LNM_I_U_CombatUniform_03",
    "UK3CB_LNM_I_U_CombatUniform_02",
    "UK3CB_LNM_I_U_CombatUniform_01"
];

_rebUniforms append _nonSmockUniforms;
_rebUniforms append _nonSmockUniforms;

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "UK3CB_LSM_I_H_BoonieHat_BLK",
    "UK3CB_LSM_I_H_BoonieHat_KHK",
    "UK3CB_LSM_I_H_BoonieHat_OLI",
    "UK3CB_LSM_I_H_BoonieHat_PART",
    "UK3CB_LSM_I_H_BoonieHat_TIG_01",
    "UK3CB_LSM_I_H_BoonieHat_TIG_02",
    "UK3CB_LSM_I_H_BoonieHat_WDL",
    "UK3CB_LSM_I_H_Field_Cap_BLK",
    "UK3CB_LSM_I_H_Field_Cap_KHK",
    "UK3CB_LSM_I_H_Field_Cap_OLI",
    "UK3CB_LSM_I_H_Field_Cap_PART",
    "UK3CB_LSM_I_H_Field_Cap_TIG_01",
    "UK3CB_LSM_I_H_Field_Cap_TIG_02",
    "UK3CB_LSM_I_H_Field_Cap_WDL",
    "UK3CB_LSM_I_H_M88_Field_Cap_BLK",
    "UK3CB_LSM_I_H_M88_Field_Cap_KHK",
    "UK3CB_LSM_I_H_M88_Field_Cap_WDL",
    "UK3CB_LSM_I_H_M88_Field_Cap_TIG_02",
    "UK3CB_LSM_I_H_M88_Field_Cap_TIG_01",
    "UK3CB_LSM_I_H_M88_Field_Cap_PART",
    "UK3CB_LSM_I_H_M88_Field_Cap_OLI"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1", "LivonianHead_10", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4", "LivonianHead_6", "LivonianHead_9", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_17", "WhiteHead_18", "WhiteHead_20", "WhiteHead_21", "WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01pol", "Male02pol", "Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
