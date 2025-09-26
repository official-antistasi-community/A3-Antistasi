///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FIA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_FIA_I_Offroad", "UK3CB_FIA_I_Hilux_Open", "UK3CB_FIA_I_Pickup", "UK3CB_FIA_I_LR_Closed"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_FIA_I_Offroad_M2", "UK3CB_FIA_I_Hilux_M2", "UK3CB_FIA_I_Pickup_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["UK3CB_FIA_I_M939_Open", "UK3CB_FIA_B_Van_Transport"]] call _fnc_saveToTemplate;
["vehiclesAT", ["UK3CB_FIA_I_LR_SPG9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_FIA_I_M939_ZU23", "UK3CB_FIA_B_Hilux_Zu23", "UK3CB_FIA_B_Hilux_Zu23_Front"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F", "UK3CB_I_G_Fishing_Boat_SPG9", "UK3CB_CHD_I_Fishing_Boat_Zu23_front"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["UK3CB_FIA_I_Cessna_T41", "RHS_AN2"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["UK3CB_C_AC500", "UK3CB_C_DC3"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_FIA_I_Hilux_Ambulance"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["UK3CB_C_Golf", "UK3CB_C_Landcruiser", "C_Offroad_01_F", "UK3CB_C_Hilux_Open", "UK3CB_C_Pickup", "UK3CB_C_SUV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["UK3CB_CHC_C_V3S_Open", "UK3CB_C_Ural_Open", "UK3CB_TKC_C_Kamaz_Open", "UK3CB_C_V3S_Recovery", "UK3CB_C_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["UK3CB_C_Bell412_Civ", "UK3CB_C_Bell412_Medic"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat", "UK3CB_CHC_C_Fishing_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_NAP_I_DSHKM", "UK3CB_FIA_I_M240_Low", "UK3CB_FIA_I_M240_High", "UK3CB_MEI_I_KORD_high", "UK3CB_MEI_I_KORD", "UK3CB_MEI_I_PKM_Low", "UK3CB_MEI_I_DSHkM_Mini_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_UN_I_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_UN_I_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_FIA_I_M252", "rhsgref_ins_g_2b14"]] call _fnc_saveToTemplate;
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
"UK3CB_BHP", "rhs_weap_tt33",
"uk3cb_enfield_l8", "uk3cb_enfield_l8_walnut",
["rhs_weap_rpg75", 50],
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"UK3CB_BHP_9_13Rnd", "rhs_mag_762x25_8", "uk3cb_l42_enfield_762_10Rnd_magazine", "uk3cb_l42_enfield_762_10Rnd_magazine_WT", "uk3cb_1rnd_riflegrenade_mas_flare", "rhs_grenade_mkii_mag", "rhs_grenade_mki_mag", "rhs_mag_rdg2_black", "rhs_grenade_m15_mag",
"UK3CB_CHC_C_B_MED", "UK3CB_B_Bedroll_Backpack", "UK3CB_TKC_C_B_Sidor_MED", "UK3CB_CW_SOV_O_LATE_B_Sidor_RIF", "UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF",
"UK3CB_V_CW_Chestrig", "UK3CB_V_CW_Chestrig_2_Small", "UK3CB_V_Belt_KHK", "UK3CB_V_Belt_Rig_KHK", "UK3CB_V_Belt_Rig_Lite_KHK", "UK3CB_V_Pouch", "UK3CB_V_Chestrig_TKA_OLI", "UK3CB_V_Chestrig_2_Small_OLI", "UK3CB_V_Chestrig_TKA_BRUSH", "UK3CB_V_Chestrig_Lite_KHK", "UK3CB_V_Chestrig_Lite_2_Small_KHK",
"rhs_acc_2dpZenit", "Binocular"];

_initialRebelEquipment append [selectRandom["uk3cb_enfield_l8t", "uk3cb_enfield_l8t_walnut"]];
_initialRebelEquipment append [selectRandom["uk3cb_enfield_l42", "uk3cb_enfield_l42_walnut"]];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155", "tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM01_GRK_LIZ01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM01_TRK01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM01_WDL01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM01_WDL02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM02_GRK_LIZ01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM02_TRK01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM02_TRK01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM02_VEG01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_DPM02_WDL01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_DPM01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_DPM01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_DPM02_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_MAR01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_TRK01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_TRK01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_WDL01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_WDL01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_GRK_LIZ01_WDL02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_MAR01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_MAR01_DPM01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_MAR01_DPM02_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_MAR01_GRK_LIZ01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_MAR01_WDL01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_TRK01_DPM02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_TRK01_GRK_LIZ01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_TRK01_MAR01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_TRK01_WDL02_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_DPM01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_DPM02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_MAR01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_TRK01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_WDL01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_VEG01_WDL02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_DPM01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_GRK_LIZ01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_GRK_LIZ01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_MAR01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_MAR01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_TRK01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_VEG01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL01_WDL02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_GRK_LIZ01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_MAR01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_TRK01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_TRK01_02",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_WDL01_01",
    "UK3CB_FIA_I_U_M10_CombatUniform_WDL02_WDL01_02"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Bandanna_camo",
    "H_Bandanna_cbr",
    "H_Bandanna_mcamo",
    "H_Bandanna_sand",
    "H_Bandanna_sgg",
    "H_Booniehat_khk",
    "H_Booniehat_oli",
    "H_Cap_grn",
    "H_Cap_oli",
    "H_Cap_red",
    "H_Shemag_olive",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "UK3CB_H_Bandanna_DPM_68",
    "UK3CB_H_Bandanna_GRK_LIZ",
    "UK3CB_H_Bandanna_VEG",
    "UK3CB_H_BoonieHat_DPM_68",
    "UK3CB_H_BoonieHat_GRK_LIZ",
    "UK3CB_H_BoonieHat_VEG",
    "UK3CB_H_BoonieHat_WDL_01",
    "UK3CB_H_BoonieHat_WDL_02",
    "UK3CB_H_Cap_DPM_68",
    "UK3CB_H_Cap_DPM_Arid",
    "UK3CB_H_Cap_TRK",
    "UK3CB_H_Cap_VEG",
    "UK3CB_H_MilCap_TRK",
    "UK3CB_H_Shemag_grey",
    "UK3CB_H_Shemag_oli",
    "UK3CB_H_Shemag_tan",
    "UK3CB_H_Shemag_white",
    "UK3CB_H_Woolhat_CBR",
    "UK3CB_H_Woolhat_GRN",
    "UK3CB_H_Woolhat_KHK"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04",
"GreekHead_A3_05", "GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08",
"GreekHead_A3_09", "Ioannou", "Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE"]] call _fnc_saveToTemplate;
"GreekMen" call _fnc_saveNames;

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
