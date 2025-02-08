//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ION"] call _fnc_saveToTemplate;
["spawnMarkerName", "ION Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_ION"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_ION"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_ION_B_Desert_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_ION_B_Desert_Hilux", "UK3CB_ION_B_Desert_Hilux_Open", "UK3CB_ION_B_Desert_Landcruiser", "UK3CB_ION_B_Desert_LR_Closed", "UK3CB_ION_B_Desert_LR_Open", "UK3CB_ION_B_Desert_M1025", "UK3CB_ION_B_Desert_M998_2DR", "UK3CB_ION_B_Desert_M998_4DR", "UK3CB_ION_B_Desert_Offroad", "UK3CB_ION_B_Desert_Pickup", "UK3CB_ION_B_Desert_SUV", "UK3CB_ION_B_Desert_SUV_Armoured", "UK3CB_ION_B_Desert_Transit_Transport"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_ION_B_Desert_M1025_M2", "UK3CB_ION_B_Desert_M1025_TOW", "UK3CB_ION_B_Desert_Offroad_M2", "UK3CB_ION_B_Desert_Pickup_M2", "UK3CB_ION_B_Desert_SUV_Armed"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_ION_B_Desert_T810_Closed", "UK3CB_ION_B_Desert_T810_Open", "UK3CB_ION_B_Desert_Transit_Transport"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_ION_B_Desert_T810_Recovery", "UK3CB_ION_B_Desert_Transit_Cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_ION_B_Desert_M113_supply", "UK3CB_ION_B_Desert_T810_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_ION_B_Desert_Offroad_Service", "UK3CB_ION_B_Desert_T810_Repair", "UK3CB_ION_B_Desert_Transit_Service"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_ION_B_Desert_T810_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_ION_B_Desert_Hilux_Ambulance", "UK3CB_ION_B_Desert_M113_AMB", "UK3CB_ION_B_Desert_Transit_Medevac"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_B_LAV25_HQ_US_WDL", "UK3CB_ION_B_Desert_M113_M2", "UK3CB_ION_B_Desert_M113_MK19", "UK3CB_KDF_B_MTLB_KPVT", "UK3CB_KRG_B_MTLB_PKT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_B_LAV25_US_WDL", "UK3CB_B_LAV25_US_WDL", "UK3CB_B_AAV_US_WDL", "UK3CB_B_AAV_US_WDL", "RHS_M2A2_wd", "UK3CB_KDF_B_MTLB_BMP", "UK3CB_KDF_B_MTLB_Cannon"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["RHS_M2A2_wd"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_KDF_B_T55", "UK3CB_KDF_B_T72A", "UK3CB_KDF_B_T72BM"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd", "UK3CB_KRG_B_M270_Avenger"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_B_AAV_US_WDL"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_KDF_B_Su25SM_CAS", "UK3CB_ION_B_Desert_T28Trojan_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_ADA_I_L39_PYLON"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_ION_B_Desert_Bell412_Utility", "UK3CB_ION_B_Desert_MELB_H6M", "UK3CB_ION_B_Desert_UH1H", "UK3CB_ION_B_Desert_Unarmed_MH9"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_ION_B_Desert_Benches_MH9", "UK3CB_ION_B_Desert_Merlin", "UK3CB_ION_B_Desert_Orca", "UK3CB_ION_B_Desert_UH1H_M240"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_ION_B_Desert_UH1H_GUNSHIP", "UK3CB_ION_B_Desert_Orca_Armed_AT", "UK3CB_ION_B_Desert_Orca_Armed_CAS", "UK3CB_ION_B_Desert_Bell412_Armed", "UK3CB_ION_B_Desert_Bell412_Armed_AT", "UK3CB_ION_B_Desert_MELB_AH6M_H"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CW_US_B_LATE_AH1Z_GS", "UK3CB_CW_US_B_LATE_AH1Z", "UK3CB_CW_US_B_LATE_AH1Z_CS"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsusf_m109_usarmy", "UK3CB_B_M270_MLRS_HE_WDL", "UK3CB_B_M270_MLRS_Cluster_WDL"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhsusf_m109_usarmy", ["rhs_mag_155mm_m795_28"]],
["UK3CB_B_M270_MLRS_HE_WDL", ["UK3CB_M31_MLRS_X12"]],
["UK3CB_B_M270_MLRS_Cluster_WDL", ["UK3CB_M26_MLRS_X12"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_ION_B_Urban_LR_M2", "UK3CB_ION_B_Urban_M1025_M2", "UK3CB_ION_B_Urban_Offroad_M2", "UK3CB_ION_B_Urban_SUV_Armed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_ION_B_Urban_T810_Closed", "UK3CB_ION_B_Urban_T810_Open", "UK3CB_ION_B_Urban_Transit_Transport"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_ION_B_Urban_Hilux", "UK3CB_ION_B_Urban_Hilux_Open", "UK3CB_ION_B_Urban_Landcruiser", "UK3CB_ION_B_Urban_Offroad", "UK3CB_ION_B_Urban_Pickup", "UK3CB_ION_B_Urban_SUV"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_APD_B_LandRover_Closed", "UK3CB_APD_B_LandRover_Open", "UK3CB_APD_B_Pickup", "UK3CB_APD_B_SUV_POL", "UK3CB_APD_I_Hilux_Closed", "UK3CB_APD_I_Hilux_Open", "UK3CB_APD_I_Landcruiser_POL"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_D"]] call _fnc_saveToTemplate;
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

["faces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem", "GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_05",
"GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Mavros", "Sturrock", "WhiteHead_01", "WhiteHead_02",
"WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_13",
"WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG", "Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE", "Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB", "Male01ENGFRE", "Male02ENGFRE"]] call _fnc_saveToTemplate;
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
_loadoutData set ["AALaunchers", [
"rhs_weap_fim92"
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

//Basic equipment.
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", ["UK3CB_ION_B_U_Uniform_01_WIN", "UK3CB_ION_B_U_Uniform_02_WIN", "UK3CB_ION_B_U_Uniform_03_WIN", "UK3CB_ION_B_U_Uniform_04_WIN"]];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["UK3CB_ION_B_B_ASS_WIN_02", "UK3CB_ION_B_B_RIF_WIN_02"]];
_loadoutData set ["atBackpacks", ["UK3CB_ION_B_B_ENG_WIN"]];
_loadoutData set ["slBackpacks", ["UK3CB_B_I_Backpack_Radio_Chem_OLI"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_blk"]];
_loadoutData set ["sniHats", ["rhs_Booniehat_ucp"]];
_loadoutData set ["glasses", ["rhs_googles_black", "rhs_googles_clear", "rhs_googles_orange", "rhs_googles_yellow", "rhsusf_oakley_goggles_clr", "rhsusf_oakley_goggles_ylw", "rhsusf_oakley_goggles_blk"]];
_loadoutData set ["facewear", ["rhsusf_shemagh_white", "rhsusf_shemagh_gogg_white"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["UK3CB_ION_B_U_CombatSmock_01_WIN", "UK3CB_ION_B_Uniform_Jumper_U_01_WIN",
"UK3CB_ION_B_Uniform_Jumper_U_02_WIN", "UK3CB_ION_B_Uniform_Jumper_U_03_WIN", "UK3CB_ION_B_Uniform_Jumper_U_04_WIN"]];
_sfLoadoutData set ["vests", ["UK3CB_V_MBAV_RIFLEMAN_WIN"]];
_sfLoadoutData set ["mgVests", ["UK3CB_ION_B_V_MBAV_MG_WIN_02"]];
_sfLoadoutData set ["medVests", ["UK3CB_ION_B_V_MBAV_MEDIC_WIN_02"]];
_sfLoadoutData set ["glVests", ["UK3CB_V_MBAV_GRENADIER_WIN"]];
_sfLoadoutData set ["helmets", ["UK3CB_H_Radio_Cap_ION_WHI_ALT", "UK3CB_H_Cap_Headset_ION_WHI", "UK3CB_H_Radio_Cap_ION_WHI", "UK3CB_H_Cap_Back_ION_WHI",
"UK3CB_H_Radio_Cap_Back_ION_WHI", "UK3CB_H_Radio_Cap_Back_ION_WHI_ALT", "UK3CB_ION_B_H_OPSCORE_WIN", "UK3CB_ION_B_H_OPSCORE_PELT_WIN", "UK3CB_ION_B_H_OPSCORE_WIN", "UK3CB_ION_B_H_OPSCORE_PELT_WIN",
"UK3CB_ION_B_H_OPSCORE_WIN", "UK3CB_ION_B_H_OPSCORE_PELT_WIN"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["glasses", ["rhs_googles_black", "UK3CB_G_Tactical_Black_Shemagh_Tan", "G_Aviator", "rhsusf_oakley_goggles_blk"]];
_sfLoadoutData set ["facewear", ["rhsusf_shemagh2_gogg_white", "rhsusf_shemagh2_white", "UK3CB_G_Balaclava_Neck_Shemag", "UK3CB_G_Balaclava2_BLK"]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["UK3CB_G36V", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhssaf_30rnd_556x45_SOST_G36"], [], ""],
["UK3CB_G36V", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhssaf_30rnd_556x45_EPR_G36"], [], ""],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk"], [], "rhsusf_acc_kac_grip"],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]]];

_sfLoadoutData set ["rifles", [
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["UK3CB_G36V", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhssaf_30rnd_556x45_SOST_G36"], [], ""],
["UK3CB_G36V", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhssaf_30rnd_556x45_EPR_G36"], [], ""],
["rhs_weap_hk416d145", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["rhs_weap_hk416d145", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"], [], "rhsusf_acc_kac_grip"],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["UK3CB_FAMAS_25rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["UK3CB_G36A1_KSK_K", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_EPR_G36"], [], ""],
["UK3CB_G36A1_KSK_K", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36"], [], ""],
["UK3CB_G36A1_KSK_K", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SOST_G36"], [], ""],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36_KSK", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_SOST_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36_KSK", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SOST_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36_KSK", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhssaf_30rnd_556x45_EPR_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36_KSK", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhssaf_30rnd_556x45_EPR_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_T1_high", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["UK3CB_P90C_TR_black", "muzzle_snds_570", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", [], [], "rhs_acc_grip_ffg2"],
["UK3CB_P90C_TR_black", "muzzle_snds_570", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_mrds", [], [], "rhs_acc_grip_ffg2"],
["UK3CB_P90C_TR_black", "muzzle_snds_570", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_T1_high", [], [], "rhs_acc_grip_ffg2"],
["UK3CB_P90C_TR_black", "muzzle_snds_570", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", [], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
//Makeshift MG36
["UK3CB_G36V", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhssaf_100rnd_556x45_EPR_G36"], [], ""],
["UK3CB_G36V", "rhsusf_acc_nt4_black", "", "rhsusf_acc_su230_mrds", ["rhssaf_100rnd_556x45_EPR_G36"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_m14_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_m14_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_m14_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541_d", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2_d", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp"
]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""],
["UK3CB_CZ75", "rhsusf_acc_omega9k", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""]
]];
_sfLoadoutData set ["glSidearms", [
["rhs_weap_M320", "", "", "", ["rhs_mag_M397_HET", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP"], [], ""],
["rhs_weap_M320", "", "", "", ["rhs_mag_m4009", "rhs_mag_m714_White", "rhs_mag_m716_yellow"], [], ""] //Stun
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["vests", ["UK3CB_ION_B_V_RIF_WIN_01"]];
_militaryLoadoutData set ["mgVests", ["UK3CB_ION_B_V_LMG_WIN_01"]];
_militaryLoadoutData set ["medVests", ["UK3CB_ION_B_V_MD_WIN_01"]];
_militaryLoadoutData set ["slVests", ["UK3CB_ION_B_V_SL_WIN_01"]];
_militaryLoadoutData set ["glVests", ["UK3CB_ION_B_V_GREN_WIN_01"]];
_militaryLoadoutData set ["slBackpacks", ["UK3CB_B_I_Backpack_Radio_Chem_OLI"]];
_militaryLoadoutData set ["helmets", ["rhsusf_ach_helmet_ucp_norotos", "rhsusf_ach_helmet_ucp_alt", "rhsusf_ach_helmet_ESS_ucp", "rhsusf_ach_helmet_ESS_ucp_alt"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_G36V", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230_mrds", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "rhsusf_acc_su230a_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
["UK3CB_AG36V", "", "", "rhsusf_acc_su230_mrds", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "", "", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_G36V", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], [], ""],
["UK3CB_G36V", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_G36V_K", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], [], ""],
["UK3CB_G36V_C", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], [], ""],
["rhs_weap_hk416d10", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_G36V_C", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_AG36V", "", "", "rhsusf_acc_eotech_552", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36V", "", "", "rhsusf_acc_compm4", ["UK3CB_G36_30rnd_556x45", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_R", "UK3CB_G36_30rnd_556x45_RT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_MG3_Railed", "", "", "rhsusf_acc_eotech_552", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["UK3CB_MG3_Railed", "", "", "rhsusf_acc_su230a_mrds", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["rhs_weap_m249_pip_ris", "", "", "rhsusf_acc_eotech_552", ["rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_pip_ris", "", "", "rhsusf_acc_su230_mrds", ["rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_pip_ris", "", "", "rhsusf_acc_ACOG_MDO", ["rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
//Makeshift MG36
["UK3CB_G36V", "", "", "rhsusf_acc_eotech_552", ["UK3CB_G36_100rnd_556x45_R", "UK3CB_G36_100rnd_556x45_RT"], [], ""],
["UK3CB_G36V", "", "", "rhsusf_acc_su230_mrds", ["UK3CB_G36_100rnd_556x45_R", "UK3CB_G36_100rnd_556x45_RT"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_nxs_3515x50f1_h58", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_nxs_3515x50f1_h58", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData set ["lightATLaunchers", [
"rhs_weap_m72a7"
]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ", "rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["UK3CB_APD_B_U_CombatUniform_01_BLU", "UK3CB_APD_B_U_PoloShirt_Pants_01"]];
_policeLoadoutData set ["vests", ["UK3CB_APD_B_V_TacVest_01"]];
_policeLoadoutData set ["helmets", ["UK3CB_H_Cap_APD", "UK3CB_H_Radio_Cap_APD", "UK3CB_H_Cap_Headset_APD", "UK3CB_H_Cap_Earpiece_APD"]];
_policeLoadoutData set ["glasses", ["rhs_googles_black", "rhs_googles_clear", "rhs_googles_orange", "rhs_googles_yellow", "rhsusf_oakley_goggles_clr", "rhsusf_oakley_goggles_ylw", "rhsusf_oakley_goggles_blk", "G_Shades_Black"]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", ["UK3CB_P90_black", "UK3CB_P90C_black", "UK3CB_MP5A4"]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["vests", ["UK3CB_ION_B_V_TacVest_blk_03"]];
_militiaLoadoutData set ["sniVests", ["UK3CB_V_Chestrig_OLI"]];
_militiaLoadoutData set ["slBackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_militiaLoadoutData set ["atBackpacks", ["UK3CB_ION_B_B_RIF_WIN_01"]];
_militiaLoadoutData set ["helmets", ["rhsusf_ach_helmet_ucp", "UK3CB_H_MilCap_ION_WIN"]];
_militiaLoadoutData set ["rifles", [
["UK3CB_M16A3", "", "", "", ["UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_HK33KA2_RIS", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_RT"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45_RT"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45_RT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_RT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", ["UK3CB_MP5A4"]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_MG3", "", "", "", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["rhs_weap_fnmag", "", "", "", ["rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1_RIS", "", "", "uk3cb_optic_accupoint_g3", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["UK3CB_USP", "rhsusf_weap_glock17g4"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_alt_helmet", "rhsusf_cvc_green_ess"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_ION_B_U_H_Pilot_Uniform_01_WIN", "UK3CB_ION_B_U_H_Pilot_Uniform_02_WIN"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest_WIN"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_visor_black", "rhsusf_hgu56p_mask_black_skull", "rhsusf_hgu56p_visor_mask_Empire_black"]];
_pilotLoadoutData set ["glasses", ["G_Aviator"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [selectRandom [[],"glasses", "facewear"]] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
