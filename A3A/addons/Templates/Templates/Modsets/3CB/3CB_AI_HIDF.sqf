//////////////////////////
//   Side Information   //
//////////////////////////

["name", "HIDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "HIDF Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_HorizonIslands_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f_exp\flags\flag_tanoa_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Tanoa"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_B_M1030_HIDF"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_B_M151_Jeep_Closed_HIDF", "UK3CB_B_M151_Jeep_Closed_HIDF", "UK3CB_B_M151_Jeep_Open_HIDF", "UK3CB_B_M151_Jeep_Open_HIDF", "rhsgref_hidf_m1025", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_M998_2dr_fulltop", "rhsgref_hidf_M998_2dr_halftop"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_B_M151_Jeep_TOW_HIDF", "rhsgref_hidf_m1025_mk19", "rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025_m2"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_B_M939_Closed_HIDF", "UK3CB_B_M939_Open_HIDF", "UK3CB_B_MTVR_Open_HIDF", "UK3CB_B_MTVR_Closed_HIDF", "UK3CB_B_M939_Guntruck_HIDF"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_B_M939_Recovery_HIDF", "UK3CB_B_MTVR_Recovery_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_B_M939_Reammo_HIDF", "UK3CB_B_MTVR_Reammo_HIDF"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_B_M939_Repair_HIDF", "UK3CB_B_MTVR_Repair_HIDF"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_B_MTVR_Refuel_HIDF", "UK3CB_B_M939_Refuel_HIDF"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CW_US_B_EARLY_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["rhsgref_hidf_m113a3_m2", "rhsgref_hidf_m113a3_m2", "rhsgref_hidf_m113a3_mk19", "UK3CB_B_MaxxPro_M2_US_W", "UK3CB_B_MaxxPro_MK19_US_W", "UK3CB_B_LAV25_HQ_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_B_LAV25_HIDF", "UK3CB_B_LAV25_HIDF", "UK3CB_B_AAV_HIDF", "UK3CB_B_AAV_HIDF"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_B_M60A3_HIDF", "UK3CB_B_M60A1_HIDF", "UK3CB_CW_US_B_EARLY_M1A1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_B_LAV25_HIDF", "UK3CB_B_AAV_HIDF"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_B_Mystere_HIDF_CAS1"]] call _fnc_saveToTemplate;      // "RHSGREF_A29B_HIDF" -> needs laser activation
["vehiclesPlanesAA", ["UK3CB_B_Mystere_HIDF_AA1"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["rhs_uh1h_hidf_unarmed", "UK3CB_B_Bell412_Utility_HIDF"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["rhs_uh1h_hidf", "UK3CB_B_Bell412_Utility_HIDF"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["rhs_uh1h_hidf_gunship", "UK3CB_B_Bell412_Armed_HIDF", "UK3CB_B_Bell412_Armed_AT_HIDF"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CW_US_B_EARLY_AH1Z", "UK3CB_CW_US_B_EARLY_AH1Z_CS", "UK3CB_CW_US_B_EARLY_AH1Z_GS"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_CW_US_B_EARLY_M109"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CW_US_B_EARLY_M109", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["rhsgref_tla_g_offroad_armed", "UK3CB_I_G_LandRover_M2", "UK3CB_I_G_LandRover_SF_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_I_G_Ural_Covered", "UK3CB_I_G_Ural_Open", "I_G_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_tla_g_offroad", "UK3CB_I_G_LandRover_Closed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_ADP_B_Datsun_Pickup","UK3CB_ADP_B_Hilux_Closed","UK3CB_ADP_B_Hilux_Open","UK3CB_ADP_B_LandRover_Open","UK3CB_ADP_B_LandRover_Closed","UK3CB_ADP_B_Offroad","UK3CB_ADP_B_Van_Transport"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_D"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "3CBFactions_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05",
"TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
"rhs_weap_M136",
"rhs_weap_M136_hedp"
]];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", [
"rhs_weap_fim92"
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag", "SLAMDirectionalMine_Wire_Mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
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
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["sniVests", ["UK3CB_V_Chestrig_ERDL"]];
_loadoutData set ["backpacks", ["rhsusf_falconii", "rhsgref_hidf_alicepack", "UK3CB_B_Fieldpack", "B_Kitbag_rgr"]];
_loadoutData set ["engBackpacks", ["rhs_rk_sht_30_olive_engineer_empty"]];
_loadoutData set ["medBackpacks", ["UK3CB_B_TacticalPack_Med_Oli"]];
_loadoutData set ["atBackpacks", ["B_Kitbag_sgg"]];
_loadoutData set ["slBackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_blk"]];
_loadoutData set ["sniHats", ["UK3CB_CW_US_B_EARLY_H_BoonieHat_ERDL_02"]];

_loadoutData set ["glasses", ["rhs_googles_black", "rhs_googles_clear", "G_Tactical_Clear", "G_Tactical_Black", "G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["rhsusf_oakley_goggles_ylw", "rhsusf_oakley_goggles_clr", "rhsusf_oakley_goggles_blk"]];

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

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData;
_sfLoadoutData set ["uniforms", ["rhs_uniform_g3_rgr"]];
_sfLoadoutData set ["vests", ["V_TacVest_oli"]];
_sfLoadoutData set ["sniVests", ["V_Chestrig_oli"]];
_sfLoadoutData set ["backpacks", ["rhsusf_falconii"]];
_sfLoadoutData set ["helmets", ["rhsusf_opscore_fg", "rhsusf_opscore_fg_pelt", "rhsusf_opscore_fg_pelt_cam"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_01_khk_F"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip3"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip3"]
]];
_sfLoadoutData set ["slRifles", [
["rhs_weap_m4a1_blockII_M203_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_blockII_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4a1_blockII_M203_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_FMJ"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_556x45_soft_pouch"], [], "rhsusf_acc_grip4_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m118_special_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_premier_mrds", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];

_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""],
["rhs_weap_smaw_green", "", "acc_pointer_IR", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"],""],
["rhs_weap_smaw_green", "", "acc_pointer_IR", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEAA"], ["rhs_mag_smaw_SR"],""]

]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["rhs_uniform_bdu_erdl"]];
_militaryLoadoutData set ["vests", ["rhsgref_alice_webbing", "rhsgref_TacVest_ERDL", "rhsgref_TacVest_ERDL", "rhsgref_TacVest_ERDL"]];
_militaryLoadoutData set ["Hvests", ["rhsgref_otv_khaki"]];
_militaryLoadoutData set ["sniVests", ["rhsgref_alice_webbing"]];
_militaryLoadoutData set ["helmets", ["rhsgref_helmet_pasgt_erdl"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_01_khk_F"]];

_militaryLoadoutData set ["rifles", [
["UK3CB_HK33KA2_RIS", "", "", "", ["UK3CB_HK33_30rnd_556x45"], [], ""],
["UK3CB_HK33KA2_RIS", "", "", "rhsusf_acc_eotech_552", ["UK3CB_HK33_30rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["slRifles", [
["UK3CB_HK33KA2_RIS_GL", "", "", "rhsusf_acc_compm4", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "rhsusf_acc_ACOG", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_HK33KA3", "", "", "", ["UK3CB_HK33_30rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_HK33KA2_RIS_GL", "", "", "", ["UK3CB_HK33_30rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "rhsusf_acc_eotech_552", ["UK3CB_HK33_30rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP5", "", "", "", ["UK3CB_MP5_30Rnd_Magazine"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_MG3_KWS_G", "", "", "rhsusf_acc_ACOG_wd", ["UK3CB_MG3_100rnd_762x51_R", "UK3CB_MG3_100rnd_762x51_R", "UK3CB_MG3_100rnd_762x51_GM"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_M14_Railed", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5", "", "", "rhsusf_acc_M8541_low_wd", ["rhsusf_5Rnd_762x51_AICS_m118_special_Mag"], [], "rhsusf_acc_harris_swivel"]
]];

_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_m9", "", "", "", ["rhsusf_mag_15Rnd_9x19_FMJ"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_MilCap_gen_F", "H_Beret_gen_F"]];

_policeLoadoutData set ["SMGs", [
["UK3CB_MP5", "", "", "", ["UK3CB_MP5_30Rnd_Magazine"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["uniforms", ["rhs_uniform_bdu_erdl"]];
_militiaLoadoutData set ["vests", ["rhsgref_chicom"]];
_militiaLoadoutData set ["helmets", ["H_Bandanna_gry", "H_Cap_oli", "H_Bandanna_sgg"]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["UK3CB_M16A1", "", "", "", ["UK3CB_M16_20rnd_556x45"], [], ""],
["UK3CB_FNFAL_FULL", "", "", "", ["UK3CB_FNFAL_20rnd_762x51"], [], ""],
["UK3CB_G3A3V", "", "", "", ["UK3CB_G3_20rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["UK3CB_M16_20rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["UK3CB_M16_20rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""],
["UK3CB_Sten", "", "", "", ["UK3CB_Sten_34Rnd_Magazine"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_Bren", "", "", "", ["UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine_GT"], [], ""],
["UK3CB_Bren", "", "", "", ["UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine_GT"], [], ""],
["rhs_weap_mg42", "", "", "rhsgref_mg42_acc_AAsight", ["rhsgref_50Rnd_792x57_SmK_drum", "rhsgref_50Rnd_792x57_SmK_drum", "rhsgref_50Rnd_792x57_SmK_alltracers_drum"], [], ""],
["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_kar98k", "", "", "", ["rhsgref_5Rnd_792x57_kar98k"], [], ""],
["rhs_weap_m38", "", "", "", ["rhsgref_5Rnd_762x54_m38"], [], ""]
]];

_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
"rhs_weap_m72a7"
]];
_militiaLoadoutData set ["sidearms", [
["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""],
["UK3CB_BHP", "", "", "", ["UK3CB_BHP_9_13Rnd"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData;
_crewLoadoutData set ["uniforms", ["rhsgref_uniform_og107_erdl"]];
_crewLoadoutData set ["vests", ["UK3CB_V_Chestrig_ERDL"]];
_crewLoadoutData set ["helmets", ["rhsgref_hat_M1951"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_J_Pilot_Uniform_01_OLI"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["UK3CB_H_Pilot_Helmet"]];