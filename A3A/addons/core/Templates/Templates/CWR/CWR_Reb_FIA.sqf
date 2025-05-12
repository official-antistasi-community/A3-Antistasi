///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FIA"] call _fnc_saveToTemplate; 

["flag", "cwr3_Flag_FIA"] call _fnc_saveToTemplate;
["flagTexture", "cwr3\general\cwr3_flags\data\fia.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "cwr3_faction_fia"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["cwr3_i_uaz", "cwr3_i_uaz_open", "cwr3_i_uaz452"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["cwr3_i_uaz_dshkm"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["cwr3_i_ural", "cwr3_i_btr40"]] call _fnc_saveToTemplate;
["vehiclesAT", ["cwr3_i_uaz_spg9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["cwr3_i_ural_zu23"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["cwr3_i_zodiac"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["cwr3_i_cessna_t41"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["cwr3_c_cessna"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["cwr3_i_uaz452_mev"]] call _fnc_saveToTemplate;


["vehiclesCivCar", ["cwr3_c_mini","cwr3_c_rapid", "cwr3_c_trabant"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["cwr3_c_uaz452", "cwr3_c_bus"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_Mi17_Civilian_RU"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["cwr3_i_dshkm_high", "cwr3_i_ags30"]] call _fnc_saveToTemplate;
["staticAT", ["cwr3_i_spg9"]] call _fnc_saveToTemplate;
["staticAA", ["cwr3_i_zu23"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_2b14_82mm_NAPA"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

#include "CWR_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_sgun_CZ584", "cwr3_srifle_l42a1",
    "CUP_1Rnd_12Gauge_Pellets_No4_Buck", "CUP_1Rnd_762x51_CZ584", "CUP_5Rnd_762x51_M24",
    "CUP_hgun_Makarov", "CUP_8Rnd_9x18_Makarov_M",
    ["CUP_launch_RPG18", 50],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_I_Carrier_Belt", "CUP_V_I_Guerilla_Jacket", "CUP_V_I_RACS_Carrier_Rig_2", "CUP_V_I_RACS_Carrier_Rig_wdl_2",
    "CUP_V_RUS_Smersh_New_Light", "CUP_V_OI_TKI_Jacket1_06", "CUP_V_OI_TKI_Jacket5_05", "CUP_V_OI_TKI_Jacket5_06", "CUP_V_OI_TKI_Jacket3_04",
    "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oli","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk",
    "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "tf_anprc155";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};


_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "CUP_I_B_PARA_Unit_2",
    "CUP_I_B_PARA_Unit_6",
    "CUP_I_B_PARA_Unit_9",
    "CUP_U_I_GUE_Anorak_01",
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_WorkU_01",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_GUE_Flecktarn3",
    "cwr3_i_uniform_alpenflage_rolled",
    "cwr3_i_uniform_alpenflage_og107",
    "cwr3_i_uniform_alpenflage_gloves",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];          //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "cwr3_i_uniform_alpenflage_og107",
    "cwr3_i_uniform_alpenflage_rolled",
    "cwr3_i_uniform_alpenflage_rolled",
    "cwr3_i_uniform_alpenflage_rolled",
    "cwr3_i_uniform_alpenflage_rolled",
    "cwr3_i_uniform_alpenflage_og107",
    "cwr3_i_uniform_alpenflage_og107",
    "cwr3_i_uniform_alpenflage_og107",
    "cwr3_i_uniform_alpenflage_gloves",
    "cwr3_i_uniform_alpenflage_gloves"
];          //Uniforms given to AI Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "cwr3_i_headgear_boonie_alpenflage",
    "cwr3_i_headgear_boonie_alpenflage",
    "cwr3_i_headgear_boonie_alpenflage",
    "cwr3_i_headgear_boonie_alpenflage",
    "cwr3_i_headgear_boonie_rolled_alpenflage",
    "cwr3_i_headgear_boonie_rolled_alpenflage",
    "cwr3_i_headgear_boonie_rolled_alpenflage",
    "cwr3_i_headgear_boonie_rolled_alpenflage",
    "cwr3_i_headgear_boonie_rolled_alpenflage"
    ]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09",
"Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;
"CUP_Names_CzechMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", ["None","CUP_G_Balaclava_blk","CUP_G_Balaclava_oli","CUP_G_Bandanna_aviator","CUP_G_Bandanna_beast",
"CUP_G_Bandanna_blk","CUP_G_Bandanna_khk","CUP_G_Bandanna_oli","CUP_G_Bandanna_shades","CUP_G_Shades_Black"
]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

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