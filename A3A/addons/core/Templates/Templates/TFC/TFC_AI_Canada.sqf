//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Canadian Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "Canadian support corridor"] call _fnc_saveToTemplate;

["flag", "tfc_flag_canada"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\Canada_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Canada"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["tfc_vs_luvw_f", "tfc_vs_milcot_chev", "tfc_mrzr4_d", "tfc_chev_ltv"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["tfc_vs_luvw_armed_f", "tfc_mrzr4_d_m2", "tfc_mrzr4_d_c16", "tfc_mrzr4_d_tow"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["tfc_msvs_ext_cab_f", "tfc_msvs_f", "TFC_AHSVS_covered_F", "tfc_mlvw_f"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["TFC_AHSVS_mover_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["tfc_mlvw_ammo_f"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["tfc_mlvw_repair_f"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["tfc_mlvw_fuel_f"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["tfc_mlvw_amb_f"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["TFC_Wheeled_Bison_CP", "tfc_cougar_gmg_F", "tfc_tapv_unarmed"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["tfc_wheeled_lav6_cp", "tfc_wheeled_lav6_isc", "tfc_wheeled_lav6_ifv_lrss"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["TFC_MBT_Leopard2A4M_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["TFC_CP140_dynamicLoadout", "I_tfc_ct156"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_tfc_cf35b_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["tfc_cc177701"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["TFC_Bell206_training_unarmed"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["TFC_Bell206_training_unarmed"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["tfc_ch146epx_H", "B_tfc_ch148_unarmed_F", "B_CH147F_F", "B_CH147F_CASEVAC_321_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["B_tfc_ch148_dynamicLoadout_F"]] call _fnc_saveToTemplate; 
["vehiclesHelisAttack", ["tfc_ch164_dynamicLoadout"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["TFC_M777C1_TW"]] call _fnc_saveToTemplate;        
["magazines", createHashMapFromArray [
["TFC_M777C1_TW", ["TFC_M795_155mm_30rdHE"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["TFC_CQ9B_dynamicLoadout_F"]] call _fnc_saveToTemplate;     
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["tfc_mrzr4_d_m2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["c_tfc_vs_lsvw_transport_uncovered_f", "c_tfc_vs_lsvw_transport_covered_f"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["tfc_dagor_unarmed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["TFC_BGM_71_Tripod"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "TFC_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
//     "Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];
_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["rhsusf_radio_anprc152"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["TFC_NVG_PVS14", "TFC_NVG_PVS23"]];
_loadoutData set ["binoculars", ["rhsusf_bino_m24"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []];    
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["TFC_CB_CTS_Rucksack_TW"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["TFC_CH_Beret_ppcli"]];
_loadoutData set ["sniHats", ["TFC_CH_BCAP_BW_TW"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["TFC_CU_Operator_otw_tw"]];
_sfLoadoutData set ["vests", ["tfc_vest_pico_dsx", "tfc_vest_pico_dsx_astl", "tfc_vest_pico_dsx_astl2", "tfc_vest_pico_dsx_ast3", "tfc_vest_pico_dsx_ast4", "tfc_vest_pico_dsx_jtac"]];   
_sfLoadoutData set ["medVests", ["tfc_vest_pico_dsx_Med"]];
_sfLoadoutData set ["glVests", ["tfc_vest_pico_dsx_tl2"]];
_sfLoadoutData set ["backpacks", ["TFC_Backpanel_5_Mcam", "TFC_Backpanel_4_Mcam", "TFC_Backpanel_3_Mcam", "TFC_Backpanel_2_Mcam", "TFC_Backpanel_1_Mcam", "TFC_tf_Mysteryranch_rt1523g_Mcam", "TFC_CB_Mysteryranch_mcam"]];
_sfLoadoutData set ["helmets", ["tfc_ch_helmet_viper_p4", "tfc_ch_helmet_viper_p4_JTAC", "tfc_ch_helmet_viper_p4_amps", "tfc_ch_helmet_viper_p4_Cover", "tfc_ch_helmet_viper_p4_Cover_Hel"]];
_sfLoadoutData set ["NVGs", ["TFC_NVG_GPNVG18_blk"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_sfLoadoutData set ["slRifles", [
["TFC_W_mrr_carbine_Black", "TFC_WA_opsinc_556", "TFC_WA_peq15_blk", "TFC_WA_Elcan_SpecterDR_3d_mrds_blk", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "TFC_WA_grip_afg"],
["TFC_W_mrr_carbine_Black", "TFC_WA_opsinc_556", "TFC_WA_peq15_blk", "rhsusf_acc_T1_high", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "TFC_WA_Virtgrip"],
["TFC_W_c8SFW_m203", "TFC_WA_opsinc_556", "TFC_WA_peq15_blk", "rhsusf_acc_T1_high", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["rifles", [
["TFC_W_C8SFW", "TFC_WA_opsinc_556", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull"], [], "TFC_WA_grip_afg"],
["TFC_W_C8SFW", "TFC_WA_opsinc_556", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["carbines", [
["TFC_W_C8IUR", "TFC_WA_opsinc_556", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull"], [], "TFC_WA_cadex_grip"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["TFC_W_c8SFW_m203", "TFC_WA_opsinc_556", "rhsusf_acc_anpeq15_bk", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "", "", "", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["TFC_W_mk48", "", "", "TFC_WA_Elcan_SpecterDR_3d_blk", ["150Rnd_762x54_Box_Tracer"], [], ""],
["TFC_W_mk46", "", "", "TFC_WA_Elcan_SpecterDR_3d_blk", ["rhsusf_200Rnd_556x45_mixed_soft_pouch_ucp"], [], "TFC_WA_mk48_vg"]
]];
_sfLoadoutData set ["marksmanRifles", [
["TFC_W_sig716", "TFC_WA_c20_suppressor", "rhsusf_acc_anpeq15_wmx", "tfc_wa_5_25_x56_high", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "TFC_WA_c20_vgbp"]
]];
_sfLoadoutData set ["sniperRifles", [
["TFC_W_c21_TW", "TFC_WA_supp_C21_tw", "", "tfc_wa_5_25_x56_low", [], [], "tfc_wa_harris_bipod_small"]
]];
_sfLoadoutData set ["lightATLaunchers", [
"TFC_launch_M72A6"
]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["tfc_w_P320_tab", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_tunic_cadpat_TW"]];
_militaryLoadoutData set ["vests", ["TFC_CV_SORD_Ballistic_TW", "TFC_CV_BV_tw"]];
_militaryLoadoutData set ["glVests", ["TFC_CV_OTV_BV_tw"]];
_militaryLoadoutData set ["backpacks", ["TFC_CB_Smallpack_TW", "TFC_CB_Smallpack_TW_TFAR", "TFC_CB_Medbag_tw"]];
_militaryLoadoutData set ["helmets", ["TFC_CH_CG634_CADPAT_TW", "TFC_CH_CG634_CADPAT_GG_TW", "TFC_CH_CG634_CADPAT_SCRIM_01_TW", "TFC_CH_CG634_CADPAT_SCRIM_02_TW", "TFC_CH_CG634_CADPAT_SCRIM_03_TW", "TFC_CH_CG634_CADPAT_SCRIM_L_01_TW", "TFC_CH_CG634_CADPAT_SCRIM_L_02_TW", "TFC_CH_CG634_CADPAT_SCRIM_L_03_TW"]];
_militaryLoadoutData set ["binoculars", ["rhsusf_bino_m24"]];

_militaryLoadoutData set ["slRifles", [
["TFC_W_mrr_rifle_black", "", "", "TFC_WA_c79_Elcan_3d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], "TFC_WA_c20_vgbp"],
["TFC_W_mrr_rifle_black", "", "", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["tfc_w_c7a2", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
["tfc_w_c7a2", "", "", "TFC_WA_c79_Elcan_3d", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["TFC_W_C8IUR", "", "", "rhsusf_acc_T1_low", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["tfc_w_c7a2_m203", "", "", "TFC_WA_c79_Elcan_3d", ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["TFC_W_c8a3_m203", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["TFC_W_c9a2", "", "", "", ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_ucp"], [], ""],
["TFC_W_c6", "", "", "", ["TFC_220Rnd_762x51_Box"], [], ""],
["TFC_W_c6a1", "", "", "TFC_WA_Eotech_flip_up_blk", ["TFC_220Rnd_762x51_Box"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["TFC_W_c20", "", "", "tfc_wa_3_20_x50", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], "TFC_WA_c20_vgbp"]
]];
_militaryLoadoutData set ["sniperRifles", [
["TFC_W_c21", "", "", "tfc_wa_3_20_x50", ["tfc_8rnd_338"], [], "tfc_wa_cadex_falcon_lite"],
["TFC_W_c15a2", "", "", "tfc_wa_5_25_x56_high", ["tfc_5rnd_50"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
"TFC_launch_M72A6"
]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [""],""]
]];
_militaryLoadoutData set ["sidearms", [
["tfc_w_C22", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["tfc_w_bhp", "", "", "", ["16Rnd_9x21_red_Mag"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_Instructor_Air_Force_TW"]];
_militiaLoadoutData set ["vests", ["V_BandollierB_rgr", "V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["TFC_CB_Smallpack_TW_TFAR"]];
_militiaLoadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_militiaLoadoutData set ["helmets", ["TFC_CH_BCAP_Pilot_Tan", "TFC_CH_BCAP_FW_Pilot_MCAM", "TFC_CH_Tuque_green"]];
_militiaLoadoutData set ["slHat", ["TFC_CH_Beret_CSOR_Generic"]];
_militiaLoadoutData set ["sniHats", ["TFC_CH_BCAP_BW_BLUE"]];

_militiaLoadoutData set ["rifles", [
["tfc_w_c7a2", "", "", "", ["rhs_mag_20Rnd_556x45_M855_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["TFC_W_C8IUR", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M855_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["TFC_W_c8a3_m203", "", "", "", ["rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M193_Stanag"], ["rhs_mag_M397_HET", "rhs_mag_m661_green", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_m249", "", "", "", ["rhsusf_100Rnd_556x45_M855_soft_pouch"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["TFC_W_c20", "", "", "TFC_WA_Eotech_flip_up_blk", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["TFC_W_c21", "", "", "tfc_wa_3_20_x50", [], [], "rhsusf_acc_harris_bipod"]
]];
_militiaLoadoutData set ["lightATLaunchers", ["TFC_launch_M72A6"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEDP"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["tfc_w_bhp"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_tunic_cadpat_TW"]];
_crewLoadoutData set ["vests", ["TFC_CV_BV_tw"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_helmet"]];
_crewLoadoutData set ["carbines", [
["TFC_W_c8a3", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_Aircrew_TW"]];
_pilotLoadoutData set ["vests", ["TFC_CV_AIRCREW_TEMPERATE"]];
_pilotLoadoutData set ["helmets", ["TFC_CH_Helo_Pilot", "TFC_CH_Helo_Pilot_up"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["missileATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
