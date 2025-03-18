///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "TKM"] call _fnc_saveToTemplate;

["flag", "Flag_TKM_B"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_MARKER_B_TKM"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_TKM_B_LR_Open", "UK3CB_TKM_B_Pickup", "UK3CB_TKM_B_Hilux_Open"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_TKM_B_LR_M2", "UK3CB_TKM_B_Hilux_M2", "UK3CB_TKM_B_Hilux_Dshkm", "UK3CB_TKM_B_Pickup_M2"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["UK3CB_TKM_B_Ural_Open", "UK3CB_TKM_B_V3S_Open", "UK3CB_TKM_B_V3S_Closed", "UK3CB_NAP_I_Van_Transport"]] call _fnc_saveToTemplate;
["vehiclesAT", ["UK3CB_I_G_Hilux_Spg9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_TKM_I_V3S_Zu23", "UK3CB_TKM_B_Hilux_Zu23", "UK3CB_TKM_B_Hilux_Zu23_Front"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F", "UK3CB_I_G_Fishing_Boat_SPG9", "UK3CB_CHD_I_Fishing_Boat_Zu23_front"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["UK3CB_CHC_I_Antonov_AN2"]] call _fnc_saveToTemplate;
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
"uk3cb_enfield_no4","uk3cb_enfield_no3", 
["rhs_weap_rpg75", 50],
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"UK3CB_BHP_9_13Rnd", "rhs_mag_762x25_8", "uk3cb_no4_enfield_303_10Rnd_magazine", "uk3cb_no4_enfield_303_10Rnd_magazine_GT", "uk3cb_1rnd_riflegrenade_mas_flare", "rhs_grenade_mkii_mag", "rhs_grenade_mki_mag", "rhs_mag_rdg2_black", "rhs_grenade_m15_mag",
"UK3CB_CHC_C_B_MED", "UK3CB_B_Bedroll_Backpack", "UK3CB_TKC_C_B_Sidor_MED", "UK3CB_CW_SOV_O_LATE_B_Sidor_RIF", "UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF",
"UK3CB_V_CW_Chestrig", "UK3CB_V_CW_Chestrig_2_Small", "UK3CB_V_Belt_KHK", "UK3CB_V_Belt_Rig_KHK", "UK3CB_V_Belt_Rig_Lite_KHK", "UK3CB_V_Pouch", "UK3CB_V_Chestrig_TKA_OLI", "UK3CB_V_Chestrig_2_Small_OLI", "UK3CB_V_Chestrig_TKA_BRUSH", "UK3CB_V_Chestrig_Lite_KHK", "UK3CB_V_Chestrig_Lite_2_Small_KHK",
"rhs_acc_2dpZenit", "Binocular"];

_initialRebelEquipment append [selectRandom["uk3cb_enfield_no4_walnut", "uk3cb_enfield_no5", "uk3cb_enfield_no5_walnut"]];
_initialRebelEquipment append [selectRandom["uk3cb_enfield_no3t", "uk3cb_enfield_no4t", "uk3cb_enfield_no4t_walnut"]];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155", "tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};
_initialRebelEquipment append ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "UK3CB_ADE_I_U_02_J",
    "UK3CB_ADM_I_U_Tshirt_01_WDL_03",
    "UK3CB_ADM_B_U_Tshirt_01_WDL",
    "UK3CB_TKM_I_U_01",
    "UK3CB_TKM_I_U_01_B",
    "UK3CB_TKM_I_U_01_C",
    "UK3CB_TKM_I_U_03",
    "UK3CB_TKM_I_U_03_B",
    "UK3CB_TKM_I_U_03_C",
    "UK3CB_TKM_I_U_04",
    "UK3CB_TKM_I_U_04_B",
    "UK3CB_TKM_I_U_04_C",
    "UK3CB_TKM_I_U_05",
    "UK3CB_TKM_I_U_05_B",
    "UK3CB_TKM_I_U_05_C",
    "UK3CB_TKM_I_U_06",
    "UK3CB_TKM_I_U_06_B",
    "UK3CB_TKM_I_U_06_C"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "UK3CB_TKC_H_Turban_01_1",
    "UK3CB_TKC_H_Turban_02_1",
    "UK3CB_TKC_H_Turban_06_1",
    "UK3CB_TKC_H_Turban_04_1",
    "UK3CB_TKC_H_Turban_05_1"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01PER", "Male02PER", "Male03PER"]] call _fnc_saveToTemplate;
["faces", ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"]] call _fnc_saveToTemplate;
"TakistaniMen" call _fnc_saveNames;

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
