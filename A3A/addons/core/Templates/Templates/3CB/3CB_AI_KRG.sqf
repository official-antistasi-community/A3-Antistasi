//////////////////////////
//   Side Information   //
//////////////////////////

["name", "KRG"] call _fnc_saveToTemplate;
["spawnMarkerName", "KRG Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_KRG"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_krg\flag\krg_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_KRG"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_KRG_B_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_KRG_B_M270_Transport", "UK3CB_KRG_B_BTR40", "UK3CB_KRG_B_M1025_Unarmed", "UK3CB_KRG_B_M998_2DR", "UK3CB_KRG_B_M998_4DR", "UK3CB_KRG_B_Pickup"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_KRG_B_Pickup_M2", "UK3CB_KRG_B_Pickup_DSHKM", "UK3CB_KRG_B_M1025_TOW", "UK3CB_KRG_B_M1025_M2", "UK3CB_KRG_B_M939_ZU23", "UK3CB_KRG_B_MTVR_ZU23"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_KRG_B_M939_Closed", "UK3CB_KRG_B_M939_Guntruck", "UK3CB_KRG_B_M939_Open", "UK3CB_KRG_B_MTVR_Closed"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_KRG_B_M939_Recovery", "UK3CB_KRG_B_MTVR_Recovery", "UK3CB_KRG_B_M270_Carrier"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_KRG_B_M939_Reammo", "UK3CB_KRG_B_MTVR_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_KRG_B_M939_Repair", "UK3CB_KRG_B_MTVR_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_KRG_B_MTVR_Refuel", "UK3CB_KRG_B_M939_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_KRG_B_M113tank_medical", "UK3CB_KRG_B_MTLB_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_KRG_B_M113tank_M2_90", "UK3CB_KRG_B_M113tank_M2_90", "UK3CB_KRG_B_MTLB_KPVT", "UK3CB_KRG_B_MTLB_PKT", "UK3CB_KRG_B_BTR40_MG"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_KRG_B_M2A2", "UK3CB_KRG_B_BTR60", "UK3CB_KRG_B_BTR60", "UK3CB_KRG_B_MTLB_ZU23", "UK3CB_KRG_B_MTLB_BMP", "UK3CB_KRG_B_MTLB_Cannon"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_KRG_B_M2A2"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_KRG_B_FV4201", "UK3CB_KRG_B_M60A3", "UK3CB_KRG_B_M60A1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_KRG_B_M270_Avenger", "UK3CB_KRG_B_ZsuTank"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_KRG_B_BTR60", "UK3CB_KRG_B_M113tank_M2_90"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_KRG_B_L39_PYLON"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_KRG_B_L39_PYLON"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_KRG_B_C47_Late"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_KRG_B_Bell412_Utility", "UK3CB_KRG_B_UH1H"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_KRG_B_UH1H_M240"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_KRG_B_Bell412_Armed", "UK3CB_KRG_B_Bell412_Armed_AT", "UK3CB_KRG_B_UH1H_GUNSHIP"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_KRG_B_M109", "UK3CB_KRG_B_M270_MLRS_Cluster", "UK3CB_KRG_B_M270_MLRS_HE", "UK3CB_KRG_B_M939_MLRS", "UK3CB_KRG_B_MTVR_MLRS", "UK3CB_KRG_B_M119"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_KRG_B_M109", ["rhs_mag_155mm_m795_28"]],
["UK3CB_KRG_B_M119", ["RHS_mag_m1_he_12"]],
["UK3CB_KRG_B_M270_MLRS_HE", ["UK3CB_M31_MLRS_X12"]],
["UK3CB_KRG_B_M270_MLRS_Cluster", ["UK3CB_M26_MLRS_X12"]],
["UK3CB_KRG_B_M939_MLRS", ["rhs_mag_40Rnd_122mm_rockets"]],
["UK3CB_KRG_B_MTVR_MLRS", ["rhs_mag_40Rnd_122mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_LNM_B_Hilux_M2", "UK3CB_LNM_B_LR_M2", "UK3CB_LNM_B_LR_SF_M2", "UK3CB_LNM_B_Offroad_M2", "UK3CB_LNM_B_Pickup_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_LNM_B_Ural_Open", "UK3CB_LNM_B_Van_Transport", "UK3CB_LNM_B_Zil131_Open", "UK3CB_LNM_B_Zil131_Covered", "UK3CB_LNM_B_Ural"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_LNM_B_Pickup", "UK3CB_LNM_B_Offroad", "UK3CB_LNM_B_LR_Closed", "UK3CB_LNM_B_LR_Open", "UK3CB_LNM_B_Hilux_Open", "UK3CB_LNM_B_Hilux_Closed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_ADP_B_Hilux_Closed"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_KRG_B_M240_High", "UK3CB_KRG_B_DSHKM", "UK3CB_KRG_B_M2_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_KRG_B_TOW_TriPod"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_KRG_B_ZU23", "UK3CB_KRG_B_Stinger_AA_pod"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_LDF_B_M252"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "3CBFactions_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"]] call _fnc_saveToTemplate;
["voices", ["Male01PER", "Male02PER", "Male03PER"]] call _fnc_saveToTemplate;
"TakistaniMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", [
"UK3CB_BHP", "rhsusf_weap_m1911a1"]];

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
_loadoutData set ["NVGs", ["UK3CB_ANPVS7"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["sniVests", ["UK3CB_V_Chestrig_Tan"]];
_loadoutData set ["backpacks", ["UK3CB_B_Alice_K", "B_Carryall_cbr", "B_Kitbag_cbr", "UK3CB_ANA_B_B_RIF"]];
_loadoutData set ["engBackpacks", ["UK3CB_TKA_O_B_ENG_Tan"]];
_loadoutData set ["medBackpacks", ["UK3CB_TKP_I_B_ASS_MED_TAN", "UK3CB_B_Alice_Medic_Bedroll_K"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["Medhelmets", []];
_loadoutData set ["slHat", ["UK3CB_KRG_B_H_Beret_OFF"]];
_loadoutData set ["sniHats", []];

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
_sfLoadoutData set ["uniforms", ["UK3CB_KRG_B_U_SF_Uniform_01_DES_DIGI"]];
_sfLoadoutData set ["helmets", ["rhsusf_opscore_ut", "rhsusf_opscore_ut_pelt"]];
_sfLoadoutData set ["sniHats", ["UK3CB_KRG_B_H_BoonieHat_DIGI"]];
_sfLoadoutData set ["vests", ["UK3CB_KRG_I_V_TacVest_DES_DIGI"]];
_sfLoadoutData set ["backpacks", ["B_Kitbag_cbr", "UK3CB_B_Backpack_Pocket"]];
_sfLoadoutData set ["medBackpacks", ["UK3CB_B_Backpack_Med"]];
_sfLoadoutData set ["slBackpacks", ["UK3CB_B_I_Backpack_Radio_Chem"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["UK3CB_G36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["UK3CB_G36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_su230_mrds", ["rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_ACOG_RMR", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230_mrds", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_grip1"],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_ACOG_RMR", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230_mrds", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_m4a1_blockII_bk", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["rhs_weap_m4a1_blockII_bk", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_su230_mrds_c", ["rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_AG36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SPR_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_su230_mrds_c", ["rhssaf_30rnd_556x45_SPR_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];

_sfLoadoutData set ["rifles", [
["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_grip1"],
["UK3CB_G36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_g33_xps3_tan", ["rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["UK3CB_G36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_aks74n_2", "rhs_acc_dtk4short", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk4short", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_g33_xps3_tan", ["rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25_npz", "rhs_acc_pbs1", "", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25_npz", "rhs_acc_pbs1", "", "rhsusf_acc_compm4", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["UK3CB_AG36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_g33_xps3_tan", ["rhssaf_30rnd_556x45_SPR_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_AG36V", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["UK3CB_MP5SD5", "", "", "rhsusf_acc_compm4", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_T1", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m240G", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_su230a", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_premier_mrds", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_CZ75", "rhsusf_acc_omega9k", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""],
["UK3CB_BHP", "rhsusf_acc_omega9k", "", "", ["UK3CB_BHP_9_13Rnd"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_KRG_B_U_CombatUniform_02_DDPM", "UK3CB_KRG_B_U_CombatUniform_01_DDPM",
"UK3CB_KRG_I_U_CombatUniform_02_DDPM"]];
_militaryLoadoutData set ["helmets", ["UK3CB_KRG_I_H_6b27m_ESS_DES", "UK3CB_ABP_B_H_6b27m_DES"]];
_militaryLoadoutData set ["sniHats", ["UK3CB_KRG_B_H_BoonieHat_DDPM"]];
_militaryLoadoutData set ["vests", ["rhsgref_alice_webbing", "UK3CB_KRG_B_V_TacVest_DDPM"]];
_militaryLoadoutData set ["backpacks", ["UK3CB_B_Alice_K", "UK3CB_UN_B_B_ASS"]];
_militaryLoadoutData set ["slBackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_G3A3", "", "", "", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3KA4_GL", "", "", "", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "", ["UK3CB_HK33_30rnd_556x45_GT", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_G3A3", "", "", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3A3V", "", "", "", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_HK33KA1", "", "", "", ["UK3CB_HK33_30rnd_556x45_GT", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
"UK3CB_MP5A3"
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_G3KA4_GL", "", "", "", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "", ["UK3CB_HK33_30rnd_556x45_GT", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_MG3_Railed", "", "", "", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_RM"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_nxs_3515x50f1_h58", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_nxs_3515x50f1_h58", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], "rhsusf_acc_harris_bipod"]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "rhsusf_acc_compm4", [], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_M952V", "rhsusf_acc_compm4", [], [], ""],
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", [], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_M952V", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["UK3CB_USP", "", "acc_flashlight_pistol", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_ADR_B_U_CombatUniform_CC_KHK", "UK3CB_ADR_B_U_CombatUniform_03_CC", "UK3CB_ADR_B_U_CombatUniform_02_CC",
"UK3CB_ADR_B_U_CombatUniform_01_CC"]];
_militiaLoadoutData set ["vests", ["UK3CB_ADA_B_V_TacVest_CC", "V_Chestrig_khk"]];
_militiaLoadoutData set ["helmets", ["UK3CB_TKA_I_H_SSh68_Khk"]];
_militiaLoadoutData set ["slBackpacks", ["UK3CB_B_I_Radio_Backpack"]];
_militiaLoadoutData set ["sniHats", ["UK3CB_ADA_B_H_BoonieHat_CC"]];

_militiaLoadoutData set ["rifles", [
"UK3CB_M16A1", "UK3CB_M16A2", "rhs_weap_ak74n", "rhs_weap_akmn"
]];
_militiaLoadoutData set ["carbines", [
"UK3CB_M16_Carbine"
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akmn_gp25", "", "", "", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "", "", "", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["SMGs", ["UK3CB_MP5A2"]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_m240G", "", "", "", ["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["UK3CB_M60", "", "", "", ["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_FNFAL_FULL", "", "", "uk3cb_optic_SUIT_FNFAL", ["UK3CB_FNFAL_20rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["UK3CB_FNFAL_FULL", "", "", "uk3cb_optic_SUIT_FNFAL", ["UK3CB_FNFAL_20rnd_762x51"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess_bala", "rhs_tsh4_ess", "rhs_tsh4"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_KRG_I_U_H_Pilot_Uniform_01"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["UK3CB_KRG_I_H_hgu56p_tan_stripe"]];


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
    ["vests"] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;
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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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
    [["Medhelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;


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
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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


    [selectRandom["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

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

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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