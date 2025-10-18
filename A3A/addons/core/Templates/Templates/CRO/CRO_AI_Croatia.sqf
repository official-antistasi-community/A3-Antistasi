//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Croatian Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "Croatian support corridor"] call _fnc_saveToTemplate;

["flag", "CRO_Obj_Flag_Croatia"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\Croatia_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Croatia"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CRO_HMMWV_M1151_W", "CRO_MRAP_M1232_W"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CRO_HMMWV_GMBR_M1151_PKM_W", "CRO_HMMWV_GMBR_M1151_Mk19_W", "CRO_HMMWV_GMBR_M1151_M2_W", "CRO_MRAP_M1240A1_M240_W", "CRO_MRAP_M1240A1_M2_W", "CRO_MRAP_M1240A1_Mk19_W", "CRO_MRAP_M1232_Mk19_W", "CRO_MRAP_M1232_M2_W"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CRO_Truck_TAM110_Open", "CRO_Truck_TAM110", "CRO_Truck_TAM150_Open", "CRO_Truck_TAM150"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CRO_Truck_TAM150_Flatbed"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CRO_Truck_TAM150_Ammo_Open"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CRO_Truck_TAM150_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CRO_Truck_TAM150_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CRO_AMV_BOV_San"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CRO_APC_BOV_M86", "CRO_APC_BOV_M86_M2", "CRO_ATGM_GOMBR_BOV_M83"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CRO_AMV_BOVP127", "CRO_AMV_BOVP40ABG", "CRO_AMV_BOVP30L"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["CRO_IFV_M80A", "CRO_IFV_M2A2ODS_W"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CRO_MBT_M84A","CRO_MBT_M84A4_Snajper"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CRO_SPAAG_GOMBR_BOV3"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["rhsgref_cdf_su25"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhssaf_airforce_l_18_101"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["USAF_C130J"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["CRO_HeliTransport_UH60M_MEV_W"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CRO_Heli_Mi8MTV1"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CRO_HeliTransport_UH60M_M134_W", "CRO_HeliTransport_UH60M_ESSS_W", "CRO_HeliTransport_UH60M_W", "CRO_Heli_Mi171Sh"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["CRO_Heli_Mi171Sh_S8"]] call _fnc_saveToTemplate; 
["vehiclesHelisAttack", ["rhsgref_cdf_Mi24D"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CRO_SPH_2S1_W"]] call _fnc_saveToTemplate;        
["magazines", createHashMapFromArray [
["CRO_SPH_2S1_W", ["rhs_mag_3of56_35"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;     
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["CRO_HMMWV_M1151_PKM_W"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CRO_Truck_TAM110_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CRO_HMMWV_M1151_W"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CRO_Turret_M2"]] call _fnc_saveToTemplate;
["staticAT", ["CRO_Turret_GOMBR_TOW_TriPod", "CRO_Turret_GOMBR_Metis_9K115"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSBoundingMine"]] call _fnc_saveToTemplate;

#include "CRO_Vehicle_Attributes.sqf"

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
_loadoutData set ["AALaunchers", ["CRO_launch_Strela"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];
_loadoutData set ["ATMines", ["SLAMDirectionalMine_Wire_Mag"]];
_loadoutData set ["APMines", ["APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhssaf_mag_br_m75"]];
_loadoutData set ["smokeGrenades", ["rhs_grenade_anm8_mag"]];
_loadoutData set ["signalsmokeGrenades", ["rhssaf_mag_brd_m83_blue", "rhssaf_mag_brd_m83_green", "rhssaf_mag_brd_m83_orange", "rhssaf_mag_brd_m83_red"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["rhssaf_zrak_rd7j"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []];    
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["CRO_B_M117_CROPAT_W"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["CRO_H_MilCap_CROPAT_W"]];
_loadoutData set ["sniHats", ["CRO_H_Army_Booniehat_CROPAT_W"]];

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
_sfLoadoutData set ["uniforms", ["CRO_U_M2021_CoyoteBoots_RHOS_CROPAT_W"]];
_sfLoadoutData set ["vests", ["CRO_V_M401B_Pouches_R_CROPAT_W"]];
_sfLoadoutData set ["mgVests", ["CRO_V_M401B_Pouches_R_CROPAT_W"]];    
_sfLoadoutData set ["medVests", ["CRO_V_M401B_Triple_CROPAT_W"]];
_sfLoadoutData set ["glVests", ["CRO_V_M401B_VHS2_GL_R_CROPAT_W"]];
_sfLoadoutData set ["backpacks", ["CRO_B_M117_CROPAT_W", "CRO_B_AssaultPack_CROPAT_W"]];
_sfLoadoutData set ["helmets", ["CRO_H_BK_ACH_HC_Pelt_Cam_CROPAT_W", "CRO_H_BK_ACH_HC_Pelt_NSW_CROPAT_W"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_sfLoadoutData set ["binoculars", ["rhssaf_zrak_rd7j"]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_wmx_bk", "rhsusf_acc_su230", ["rhsgref_30rnd_556x45_vhs2"], [], "rhsusf_acc_grip2"],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], "rhsusf_acc_grip1"],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_TDIM_G36"], [], "rhsusf_acc_grip3"],
["rhs_weap_vhsd2_ct15x", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "", ["rhssaf_30rnd_556x45_MDIM_G36"], [], "rhsusf_acc_tdstubby_blk"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], "rhsusf_acc_grip1"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d10_m320", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_TDIM_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["CRO_smg_MP5SD", "", "", "", ["CRO_30Rnd_9x21_Stanag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhssaf_250Rnd_762x54R"], [], ""],
["rhs_weap_m249_pip", "rhsusf_acc_rotex5_grey", "", "", ["rhsusf_200Rnd_556x45_mixed_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_fnmag", "", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m80a1epr"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_sr25", "rhsusf_acc_SR25S", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541_low", [], [], "rhsusf_acc_harris_swivel"]
]];
_sfLoadoutData set ["lightATLaunchers", [
"rhs_weap_M136_hedp",
"rhs_weap_rpg26",
"rhs_weap_m80"
]];
_sfLoadoutData set ["ATLaunchers", [
["CRO_Launch_RGW90_HH", "", "", "", ["CRO_RGW90_HEAT"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["CRO_U_M2021_GMBR_CROPAT_W"]];
_militaryLoadoutData set ["vests", ["CRO_V_M401B_VHS2_CROPAT_W", "CRO_V_M401B_Essentials_CROPAT_W"]];
_militaryLoadoutData set ["mgVests", ["CRO_V_M401B_Pouches_CROPAT_W"]];    
_militaryLoadoutData set ["medVests", ["CRO_V_M401B_CROPAT_W"]];
_militaryLoadoutData set ["slVests", ["CRO_V_M401B_VHS2_SL_Motorola_CROPAT_W"]];
_militaryLoadoutData set ["sniVests", ["CRO_V_M401B_CROPAT_W"]];
_militaryLoadoutData set ["glVests", ["CRO_V_M401B_VHS2_GL_CROPAT_W"]];
_militaryLoadoutData set ["backpacks", ["CRO_B_AssaultPack_CROPAT_W", "CRO_B_Carryall_CROPAT_W", "CRO_B_M117_Belt_CROPAT_W"]];
_militaryLoadoutData set ["helmets", ["CRO_H_BK3_CROPAT_W", "CRO_H_BK3_G_C_CROPAT_W", "CRO_H_BK3_G_C_C_CROPAT_W", "CRO_H_BK3_G_CROPAT_W"]];
_militaryLoadoutData set ["binoculars", ["rhssaf_zrak_rd7j"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_vhsd2", "", "", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_EPR_G36"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsk2", "", "", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_TDIM_G36"], [], "rhsusf_acc_grip3"]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_vhsd2_ct15x", "", "", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_TDIM_G36"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_vhsd2", "", "", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_TDIM_G36"], [], "rhsusf_acc_kac_grip"]
]];
_militaryLoadoutData set ["carbines", [
["CRO_arifle_AKS", "", "", "", ["rhssaf_30Rnd_762x39_M82_api", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39mm_M67"], [], ""],
["rhs_weap_vhsk2", "", "rhsusf_acc_anpeq15side_bk", "", ["rhssaf_30rnd_556x45_TDIM_G36"], [], "rhsusf_acc_rvg_blk"]
]];
_militaryLoadoutData set ["SMGs", [
["CRO_smg_MP5", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "", "", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_MDIM_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhssaf_250Rnd_762x54R"], [], ""],
["rhs_weap_m249_pip", "rhsusf_acc_SFMB556", "", "", ["rhsusf_200rnd_556x45_M855_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m2", ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""],
["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15", "rhsusf_acc_M8541_mrds", ["rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["lightATLaunchers", [
"rhs_weap_m80",
"rhs_weap_M136_hedp",
"rhs_weap_rpg26"
]];
_militaryLoadoutData set ["ATLaunchers", [
["CRO_Launch_RGW90_HH", "", "", "", ["CRO_RGW90_HEAT"], [], ""],
["CRO_Launch_RGW90_HESH", "", "", "", ["CRO_RGW90_HESH"], [""],""]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ", "rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
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
_policeLoadoutData set ["SMGs", [
["CRO_smg_MP5", "", "", "", [], [], ""],
["rhs_weap_M590_5RD", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["CRO_U_M2021_CROPAT_D"]];
_militiaLoadoutData set ["vests", ["rhsgref_alice_webbing", "CRO_V_M401B_AK_Blk"]];
_militiaLoadoutData set ["backpacks", ["CRO_B_AssaultPack_CROPAT_D"]];
_militiaLoadoutData set ["atBackpacks", ["CRO_B_M117_Belt_CROPAT_D"]];
_militiaLoadoutData set ["helmets", ["rhssaf_helmet_m97_black_nocamo", "rhssaf_helmet_m97_black_nocamo_black_ess", "rhssaf_helmet_m97_black_nocamo_black_ess_bare"]];
_militiaLoadoutData set ["slHat", ["CRO_H_Beret_VP"]];
_militiaLoadoutData set ["sniHats", ["rhssaf_beret_black"]];

_militiaLoadoutData set ["rifles", [
["CRO_arifle_AKM", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["CRO_arifle_AKS", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["rhs_weap_savz58p", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CRO_arifle_AKS", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akm_gp25", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], ["rhs_VG40SZ", "rhs_VG40TB", "rhs_VOG25", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CRO_smg_MP5", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_m84", "", "", "", ["rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_m249", "", "", "", ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"], [], "rhsusf_acc_saw_bipod"]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m21", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_LEUPOLDMK4", [], [], "rhsusf_acc_harris_swivel"]
]];
_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_militiaLoadoutData set ["ATLaunchers", [
["CRO_Launch_RGW90_HESH", "", "", "", ["CRO_RGW90_HESH"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["CRO_U_Army_Coveralls"]];
_crewLoadoutData set ["vests", ["V_Rangemaster_belt"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4"]];
_crewLoadoutData set ["carbines", [
["rhs_weap_vhsk2", "", "", "", ["rhssaf_30rnd_556x45_TDIM_G36"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["CRO_V_M401B_Essentials_CROPAT_W"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B", "H_CrewHelmetHeli_B"]];

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
