///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FIA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["gm_ge_firstaidkit_vehicle","gm_gc_firstaidkit_vehicle","gm_ge_army_firstaidkit_vehicle","gm_gc_army_medkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["gm_gc_army_medbox","gm_ge_army_medkit_80"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["toolKits", ["gm_repairkit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection.

["flyGear", ["gm_ge_uniform_pilot_commando_blk", "gm_ge_uniform_pilot_commando_gry", "gm_ge_uniform_pilot_commando_oli", "gm_ge_uniform_pilot_commando_rolled_blk", "gm_ge_uniform_pilot_commando_rolled_gry", "gm_ge_uniform_pilot_commando_rolled_oli","gm_backpack_t10_parachute"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["gm_ge_army_k125"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["gm_ge_army_iltis_cargo"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["gm_gc_army_uaz469_dshkm"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["gm_ge_army_kat1_451_container"]] call _fnc_saveToTemplate;
["vehiclesAT", ["gm_gc_army_uaz469_spg9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Ural_ZU23_NAPA"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["gm_gc_civ_l410s_passenger"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["gm_gc_civ_p601", "gm_ge_civ_w123"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["gm_gc_civ_ural375d_cargo"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["gm_gc_civ_mi2p"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["gm_gc_army_dshkm_aatripod"]] call _fnc_saveToTemplate;
["staticAT", ["gm_gc_army_spg9_tripod"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_I_ZU23_NAPA"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_O_2b14_82mm_RU"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "gm_mine_at_dm21"] call _fnc_saveToTemplate;         // , "gm_mine_at_dm1233"]]
["mineAPERS", "gm_mine_ap_dm31"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["gm_explosive_petn_charge", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

#include "GM_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"gm_p1_blk","gm_pm_blk","gm_p2a1_blk",
"CUP_srifle_Mosin_Nagant","CUP_srifle_LeeEnfield", "CUP_srifle_Remington700",
"CUP_5Rnd_762x54_Mosin_M","CUP_10x_303_M","CUP_6Rnd_762x51_R700",
["gm_m72a3_oli", 20], "gm_1Rnd_66mm_heat_m72a3",
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"gm_8Rnd_9x18mm_B_pst_pm_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk",
"gm_1Rnd_265mm_flare_single_red_gc", "gm_1Rnd_265mm_flare_single_wht_gc", "gm_1Rnd_265mm_flare_single_grn_DM11", 
"gm_1Rnd_265mm_flare_single_wht_DM15", "gm_1Rnd_265mm_flare_multi_wht_DM25",
"gm_handgrenade_frag_dm51","gm_smokeshell_wht_dm25", "gm_handgrenade_frag_rgd5",
"B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_khk",
"gm_ge_bgs_vest_80_rifleman","gm_gc_bgs_vest_80_border_str","gm_gc_army_vest_80_at_str","Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

_rebUniforms = [
    "gm_gc_army_uniform_soldier_80_blk", 
    "gm_ge_uniform_soldier_tshirt_90_flk", 
    "gm_ge_bgs_uniform_soldier_80_smp",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F",
    "U_I_L_Uniform_01_deserter_F"
    ];

//for later if i also add RHS to the options for GM-Templates
_rebUniforms append [
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
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_Woodland1",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];

private _dlcUniforms = [];

if (allowDLCEnoch) then {_dlcUniforms append [
    "U_I_L_Uniform_01_camo_F"
];
};

if (allowDLCExpansion) then {_dlcUniforms append [
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Camo_F"
];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", ["gm_ge_headgear_hat_boonie_flk", "gm_dk_headgear_hat_boonie_m84", "gm_ge_headgear_hat_boonie_oli", "gm_ge_headgear_hat_boonie_wdl", 
    "gm_ge_bgs_headgear_m35_53_blk", "gm_ge_bgs_headgear_m35_53_net_blk", "gm_dk_headgear_m52_oli"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["gm_face_whiteHead_01","gm_face_whiteHead_02", "WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["gm_voice_male_deu_08", "gm_voice_male_deu_03", "gm_voice_male_deu_05","gm_voice_male_deu_07", "gm_voice_male_deu_01"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////



private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
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
