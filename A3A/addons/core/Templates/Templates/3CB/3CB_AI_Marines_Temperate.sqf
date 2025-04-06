//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US Marines"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsusf_m998_w_s_2dr", "rhsusf_m998_w_s_2dr_halftop", "rhsusf_m998_w_s_4dr"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["rhsusf_m1025_w_s_m2", "rhsusf_m1025_w_s_Mk19", "rhsusf_m1151_m240_v3_usmc_wd", "rhsusf_m1151_m2_v3_usmc_wd", "rhsusf_m1151_mk19_v3_usmc_wd", "rhsusf_m966_w"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CW_US_B_LATE_M939_Open", "UK3CB_CW_US_B_LATE_M939_Guntruck", "UK3CB_CW_US_B_LATE_M939_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CW_US_B_LATE_M939_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CW_US_B_LATE_M939_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CW_US_B_LATE_M939_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CW_US_B_LATE_M939_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", [""]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_CW_US_B_LATE_LAV25_HQ"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CW_US_B_LATE_AAV", "UK3CB_CW_US_B_LATE_LAV25", "rhsusf_stryker_m1134_wd"]] call _fnc_saveToTemplate;
["vehiclesIFVs", [""]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhsusf_m1a1hc_wd", "rhsusf_m1a1fep_od", "UK3CB_CW_US_B_EARLY_M60a3"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_KRG_B_M270_Avenger"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_CW_US_B_LATE_LAV25", "UK3CB_CW_US_B_LATE_AAV"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_CW_US_B_LATE_A10"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhsusf_f22"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_B_Osprey_USMC_WD"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["RHS_UH1Y_UNARMED"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_B_Osprey_USMC_WD", "rhsusf_CH53E_USMC", "rhsusf_CH53E_USMC_GAU21", "RHS_UH1Y_UNARMED", "UK3CB_B_Osprey_IDWS_HMG_USMC_WD", "UK3CB_B_Osprey_IDWS_MG_USMC_WD", "UK3CB_B_Osprey_IDWS_USMC_WD"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_UH1Y_FFAR", "RHS_UH1Y_FFAR", "RHS_MELB_AH6M"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CW_US_B_LATE_AH1Z_GS", "UK3CB_CW_US_B_LATE_AH1Z_CS", "UK3CB_CW_US_B_LATE_AH1Z"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["RHS_M119_WD", "UK3CB_CW_US_B_EARLY_M109", "UK3CB_CW_US_B_LATE_M270_MLRS_HE", "UK3CB_CW_US_B_LATE_M270_MLRS_CLUSTER"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["RHS_M119_WD", ["RHS_mag_m1_he_12" ]],
["UK3CB_CW_US_B_EARLY_M109", ["rhs_mag_155mm_m795_28"]],
["UK3CB_CW_US_B_LATE_M270_MLRS_HE", ["UK3CB_M31_MLRS_X12"]],
["UK3CB_CW_US_B_LATE_M270_MLRS_CLUSTER", ["UK3CB_M26_MLRS_X12"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_CW_US_B_LATE_M151_Jeep_HMG", "UK3CB_CW_US_B_EARLY_M151_Jeep_TOW"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CW_US_B_LATE_M939_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CW_US_B_LATE_M151_Jeep_Open", "UK3CB_CW_US_B_LATE_M151_Jeep_Closed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_APD_B_Offroad_Unarmed_EKAM", "UK3CB_APD_B_Offroad_Comms_EKAM", "UK3CB_APD_B_Octavia_Pol", "UK3CB_APD_B_SUV_POL", "UK3CB_APD_B_MB4WD_Unarmed"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_D", "UK3CB_B_Static_M240_Elcan_High_USMC_D"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_D"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_D"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "3CBFactions_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09",
"Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15",
"WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
//     "Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["AALaunchers", [
"rhs_weap_fim92"
]];
_loadoutData set ["lightATLaunchers", [
["uk3cb_m72a1_law_loaded", "", "", "", [""], [], ""],
["rhs_weap_M136", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"], ""],
["rhs_weap_smaw_green", "", "", "", ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"], ""],
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT", "rhs_fgm148_magazine_AT"], [], ""],
["uk3cb_m47", "", "", "", ["UK3CB_M47_Missile"], [], ""],
["uk3cb_m47", "", "", "", ["UK3CB_M47_Missile"], [], ""]
]];
_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];
_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_loadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];
_loadoutData set ["rangefinders", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []];    
_loadoutData set ["medVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", ["rhsusf_falconii"]];
_loadoutData set ["atBackpacks", ["UK3CB_GAF_B_B_ENG_OLI"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["UK3CB_H_MilCap_MAR"]];
_loadoutData set ["sniHats", ["rhs_Booniehat_m81"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.

private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard"];
};

_loadoutData set ["items_squadLeader_extras", []];
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
_sfLoadoutData set ["uniforms", ["rhs_uniform_g3_m81", "rhs_uniform_g3_rgr"]];
_sfLoadoutData set ["vests", ["rhsusf_plateframe_teamleader", "rhsusf_plateframe_rifleman", "rhsusf_plateframe_machinegunner"]];
_sfLoadoutData set ["backpacks", ["rhsusf_falconii", "rhsusf_assault_eagleaiii_coy"]];
_sfLoadoutData set ["helmets", ["rhsusf_opscore_mar_fg_pelt","rhsusf_opscore_mar_ut_pelt"]];
_sfLoadoutData set ["slHat", ["H_Cap_headphones"]];
_sfLoadoutData set ["sniHats", ["H_Booniehat_oli"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];

_sfLoadoutData set ["rifles", [
["rhs_weap_m27iar_grip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_Stanag_Ranger", "rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger"], [], "rhsusf_acc_grip3"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_mk18_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull", "rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull"], [], "rhsusf_acc_grip3"]
]];
_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_wmx_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhsusf_acc_grip2"],
["UK3CB_MP5_SD", "", "", "", [], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk318_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_MDO", ["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_MP5N_UGL", "uk3cb_muzzle_snds_mp5", "rhsusf_acc_wmx_bk", "", ["UK3CB_MP5_30Rnd_9x19_Magazine_WT"], ["rhs_mag_M433_HEDP", "rhs_mag_m4009", "rhs_mag_m576", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger", "rhs_mag_30Rnd_556x45_Mk262_Stanag_Ranger"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_M952V", "rhsusf_acc_ACOG_anpvs27", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip_S_para", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_200Rnd_556x45_soft_pouch_ucp"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_556x45_M995_soft_pouch_ucp"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_m240B", "muzzle_snds_H_MG", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_mk17_LB", "rhsusf_acc_aac_scarh_silencer", "", "rhsusf_acc_ACOG_anpvs27", ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_tdstubby_tan"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_M8541_low", ["rhsusf_20Rnd_762x51_m993_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_P320_BLK", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["rhs_uniform_FROG01_wd", "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_02", "UK3CB_FIA_B_U_M10_CombatUniform_MAR01_01"]];
_militaryLoadoutData set ["vests", ["rhsusf_spc_light", "rhsusf_spc_iar", "rhsusf_mbav_rifleman"]];
_militaryLoadoutData set ["mgVests", ["rhsusf_mbav_mg"]];    
_militaryLoadoutData set ["medVests", ["rhsusf_spc_corpsman"]];
_militaryLoadoutData set ["sniVests", ["rhsusf_mbav"]];
_militaryLoadoutData set ["backpacks", ["rhsusf_assault_eagleaiii_coy", "rhsusf_falconii_coy", "UK3CB_B_Backpack_Med"]];
_militaryLoadoutData set ["helmets", ["rhsusf_lwh_helmet_marpatwd", "rhsusf_lwh_helmet_marpatwd_blk_ess", "rhsusf_lwh_helmet_marpatwd_headset_blk2", "rhsusf_lwh_helmet_marpatwd_headset_blk", "rhsusf_lwh_helmet_marpatwd_headset", "rhsusf_lwh_helmet_marpatwd_ess"]];

_militaryLoadoutData set ["rifles", [
["rhs_weap_m16a4", "rhsusf_acc_SF3P556", "", "rhsusf_acc_ACOG2_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_m16a4", "rhsusf_acc_SF3P556", "", "rhsusf_acc_ACOG2_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_m16a4", "rhsusf_acc_SF3P556", "", "rhsusf_acc_ACOG2_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], ""],
["rhs_weap_m27iar", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_m16a4_imod", "", "", "rhsusf_acc_ACOG_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m16a4_imod", "", "", "rhsusf_acc_ACOG_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_m16a4_imod", "", "", "rhsusf_acc_ACOG_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_M16A3", "", "", "", ["rhs_mag_20Rnd_556x45_M855_Stanag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP5A4", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine_RT"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_SF3P556", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], ["rhs_mag_M441_HE"], ""],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_SF3P556", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], "rhsusf_acc_grip_m203_blk"],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_SF3P556", "", "rhsusf_acc_ACOG2_USMC", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], "rhsusf_acc_grip_m203_blk"],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_SFMB556", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_SF3P556", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_carryhandle_M203", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger"], ["rhs_mag_M397_HET"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "", "rhsusf_acc_ELCAN_ard", ["rhsusf_100Rnd_556x45_M855_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_pip_S", "rhsusf_acc_SFMB556", "", "rhsusf_acc_T1_high", ["rhsusf_100Rnd_556x45_M855_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "", "", "rhsusf_acc_su230", ["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_100Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag"], [], ""],
["rhs_weap_m14ebrri", "", "", "rhsusf_acc_nxs_3515x50_md", ["UK3CB_DMR_20rnd_762x51_GT", "UK3CB_DMR_20rnd_762x51_RT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", [
["UK3CB_P320_BLK", "", "", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];
_policeLoadoutData set ["SMGs", [
["UK3CB_M1903A1", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine_YT"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_m9", "", "", "", [], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["UK3CB_FIA_B_U_M10_CombatUniform_WDL01_01"]];
_militiaLoadoutData set ["vests", ["rhsgref_alice_webbing"]];
_militiaLoadoutData set ["backpacks", ["UK3CB_B_Kitbag_WDL_01"]];
_militiaLoadoutData set ["helmets", ["rhssaf_helmet_m97_woodland"]];
_militiaLoadoutData set ["rifles", [
["UK3CB_M16A2", "", "", "", ["rhs_mag_20Rnd_556x45_M855_Stanag"], [], ""],
["UK3CB_M1903A1", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["UK3CB_M16_20rnd_556x45_G"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_M79", "", "", "", ["rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_M585_white_cluster"], [""], ""]
]];
_militiaLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_M60", "", "", "", ["rhsusf_50Rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_M14DMR_BLK", "", "", "", ["UK3CB_M14_20rnd_762x51_R"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5_wd", "", "", "rhsusf_acc_LEUPOLDMK4_wd", ["rhsusf_5Rnd_762x51_m118_special_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m9"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
//The following lines are determining the loadout of the vehicle crew
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["rhs_uniform_FROG01_wd"]];
_crewLoadoutData set ["vests", ["rhsusf_spc_crewman"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_helmet", "rhsusf_cvc_green_alt_helmet", "rhsusf_cvc_helmet", "rhsusf_cvc_ess"]];
_crewLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""]
]];
//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_CW_US_B_LATE_U_J_Pilot_Uniform_01_NATO"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_visor_mask_skull"]];
_pilotLoadoutData set ["SMGs", [
["rhs_weap_m4_carryhandle", "", "", "", ["rhs_mag_20Rnd_556x45_M855_Stanag"], [], ""]
]];
// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
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
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
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
    ["antiTankGrenades", 3] call _fnc_addItem;
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

    ["lightATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
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

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
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
    ["launcher", 1] call _fnc_addMagazines;

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
    ["binoculars"] call _fnc_addBinoculars;
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
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
