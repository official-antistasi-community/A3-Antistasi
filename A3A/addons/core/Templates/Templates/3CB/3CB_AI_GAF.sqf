//////////////////////////
//   Side Information   //
//////////////////////////

["name", "GAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "GAF Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_GAF"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_GAF\Flag\GAF_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_GAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_GAF_B_M1030"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_GAF_B_Offroad", "UK3CB_GAF_B_Offroad_Covered", "UK3CB_GAF_B_UAZ_Closed", "UK3CB_GAF_B_UAZ_Open"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_GAF_B_Offroad_HMG", "UK3CB_GAF_B_UAZ_AGS30", "UK3CB_GAF_B_Offroad_AT", "UK3CB_GAF_B_UAZ_SPG9", "UK3CB_GAF_B_Gaz66_ZU23", "UK3CB_GAF_B_Ural_Zu23"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_GAF_B_Gaz66_Open", "UK3CB_GAF_B_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_GAF_B_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_GAF_B_Gaz66_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_GAF_B_Gaz66_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_GAF_B_Ural_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_GAF_B_Gaz66_Med", "UK3CB_GAF_B_MTLB_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_GAF_B_MTLB_PKT", "UK3CB_GAF_B_MTLB_KPVT", "UK3CB_GAF_B_MTLB_Cannon", "UK3CB_GAF_B_MTLB_Cannon", "UK3CB_GAF_B_BTR60", "UK3CB_GAF_B_BTR70", "UK3CB_GAF_B_BTR80", "UK3CB_GAF_B_BTR80a", "UK3CB_GAF_B_BTR60"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_GAF_B_BMD1", "UK3CB_GAF_B_MTLB_BMP"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_GAF_B_BMP2"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["UK3CB_GAF_B_BRM1K","UK3CB_GAF_B_T72BC"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_GAF_B_T80UK", "UK3CB_GAF_B_T80", "UK3CB_GAF_B_T80A","UK3CB_GAF_B_T72BC"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_GAF_B_ZsuTank", "UK3CB_GAF_B_MTLB_ZU23"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_GAF_B_MTLB_PKT", "UK3CB_GAF_B_MTLB_KPVT", "UK3CB_GAF_B_MTLB_Cannon", "UK3CB_GAF_B_MTLB_Cannon", "UK3CB_GAF_B_BTR60", "UK3CB_GAF_B_BTR70", "UK3CB_GAF_B_BTR80", "UK3CB_GAF_B_BTR80a", "UK3CB_GAF_B_BTR60"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_GAF_B_MIG21_AT"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_GAF_B_MIG21_AA", "UK3CB_GAF_B_MIG21_AA", "UK3CB_GAF_B_MIG29S"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_KRG_B_C47_Late"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_GAF_B_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_GAF_B_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_GAF_B_Mi_24P"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_GAF_B_Mi_24G_UPK23"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_GAF_B_2S1"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_GAF_B_2S1", ["rhs_mag_3of56_35"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_GAF_B_UAZ_MG", "UK3CB_GAF_B_UAZ_AGS30", "UK3CB_GAF_B_UAZ_SPG9"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_GAF_B_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_GAF_B_UAZ_Closed", "UK3CB_GAF_B_Offroad_Covered"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_APD_B_Octavia_Pol"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_GAF_B_PKM_High", "UK3CB_GAF_B_M2_TriPod", "UK3CB_GAF_B_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_GAF_B_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_KRG_B_ZU23", "UK3CB_GAF_B_Igla_AA_pod"]] call _fnc_saveToTemplate;
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

_loadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VS_mag", "rhs_rpg7_type69_airburst_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", [
"rhs_weap_makarov_pm", "UK3CB_PC9_ZOAF"]];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag", "SLAMDirectionalMine_Wire_Mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5"]];
_loadoutData set ["smokeGrenades", ["rhssaf_mag_brd_m83_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhssaf_mag_brd_m83_yellow", "rhssaf_mag_brd_m83_red", "rhssaf_mag_brd_m83_orange", "rhssaf_mag_brd_m83_green"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["UK3CB_PVS5A"]];
_loadoutData set ["binoculars", ["rhs_tr8_periscope_pip"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", ["UK3CB_GAF_B_MBAV_MG_DIGI_03"]];
_loadoutData set ["glVests", ["UK3CB_GAF_B_MBAV_GRENADIER_DIGI"]];
_loadoutData set ["vests", []];
_loadoutData set ["sniVests", ["UK3CB_GAF_B_MBAV_LIGHT_DIGI_OLI"]];
_loadoutData set ["backpacks", ["UK3CB_GAF_B_B_RIF_DIGI"]];
_loadoutData set ["engBackpacks", ["UK3CB_GAF_B_B_RIF_DIGI"]];
_loadoutData set ["medBackpacks", ["UK3CB_GAF_B_B_RIF_MED_DIGI"]];
_loadoutData set ["atBackpacks", ["UK3CB_GAF_B_B_RPG"]];
_loadoutData set ["slBackpacks", ["UK3CB_ION_I_B_RadioBag_OLI"]];
_loadoutData set ["helmets", []];
_loadoutData set ["Medhelmets", []];
_loadoutData set ["slHat", ["UK3CB_GAF_B_H_OFF_Field_Cap_DIGI"]];
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
_sfLoadoutData set ["uniforms", ["UK3CB_GAF_B_U_SF_CombatUniform_03_MULTICAM"]];
_sfLoadoutData set ["helmets", ["UK3CB_GAF_B_H_Opscore_Mar_TAN_01", "UK3CB_GAF_B_H_Opscore_Mar_TAN_02"]];
_sfLoadoutData set ["sniHats", ["UK3CB_LNM_B_H_BoonieHat_MULTICAM"]];
_sfLoadoutData set ["vests", ["UK3CB_V_MBAV_RIFLEMAN_MULTI"]];
_sfLoadoutData set ["backpacks", ["UK3CB_GAF_B_B_RIF_OLI", "UK3CB_GAF_B_B_ENG_MULTICAM_02"]];
_sfLoadoutData set ["medBackpacks", ["UK3CB_APD_B_B_RIF_MED_EKAM_BLK"]];
_sfLoadoutData set ["slBackpacks", ["UK3CB_GAF_B_B_RIF_Radio_OLI"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["rhs_weap_m4_carryhandle", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_m4a1_m203s", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], ["rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m4009", "rhs_mag_m713_Red"], ""]
]];

_sfLoadoutData set ["rifles", [
["rhs_weap_m4_carryhandle", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_m4_carryhandle_mstock", "rhsusf_acc_nt4_black", "", "rhsusf_acc_anpvs27", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_tdstubby_blk"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4_carryhandle_m203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_m576", "rhs_mag_m4009", "rhs_mag_M664_red_cluster"], "rhsusf_acc_grip_m203_blk"]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_aks74un", "rhs_acc_tgpa", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_2mag_plum_AK"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip_L", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_ELCAN_ard", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch"], [], ""],
["UK3CB_RPK_74N_BLK", "rhs_acc_pbs1", "", "rhs_acc_pso1m21", ["UK3CB_RPK74_60rnd_545x39_GM", "UK3CB_RPK74_60rnd_545x39_RM"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_sr25", "rhsusf_acc_SR25S", "", "rhsusf_acc_premier_anpvs27", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25", "rhsusf_acc_SR25S", "", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_SVD_OLD", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["uk3cb_HS50", "", "", "rhsusf_acc_premier", ["uk3cb_hs50_50bmg_MK211_5Rnd_magazine"], [], ""],
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier_mrds", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""],
["rhs_weap_makarov_pm", "", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_GAF_B_U_CombatUniform_05_DIGI"]];
_militaryLoadoutData set ["helmets", ["UK3CB_GAF_B_H_6b27m_DIGI", "UK3CB_GAF_B_H_6b27m_ESS_DIGI"]];
_militaryLoadoutData set ["sniHats", ["UK3CB_GAF_B_H_BoonieHat_DIGI"]];
_militaryLoadoutData set ["vests", ["UK3CB_GAF_B_MBAV_RIFLEMAN_DIGI", "UK3CB_GAF_B_MBAV_LIGHT_DIGI"]];
_militaryLoadoutData set ["backpacks", ["UK3CB_GAF_B_B_RIF_DIGI", "UK3CB_GAF_B_B_ENG_DIGI"]];
_militaryLoadoutData set ["slBackpacks", ["UK3CB_GAF_B_B_RIF_Radio_DIGI"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_m21a", "", "", "", ["rhsgref_30rnd_556x45_m21_t", "rhsgref_30rnd_556x45_m21"], [], ""],
["rhs_weap_m21a_pbg40", "", "", "", ["rhsgref_30rnd_556x45_m21_t", "rhsgref_30rnd_556x45_m21"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_GDM40"], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_m21s", "", "", "rhs_acc_pkas", ["rhsgref_30rnd_556x45_m21"], [], ""],
["rhs_weap_m21s", "", "", "rhs_acc_nita", ["rhsgref_30rnd_556x45_m21"], [], ""],
["rhs_weap_m70b1", "", "", "", ["rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["rhs_weap_m21a", "", "", "", ["rhsgref_30rnd_556x45_m21"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39_M82_api", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39mm_M67"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
"uk3cb_mat49m"
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m21a_pbg40", "", "", "", ["rhsgref_30rnd_556x45_m21"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GRD40_Red"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_UKM2000P", "", "", "", ["UK3CB_MG3_250rnd_762x51_YM"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39_YT"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m2", ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["UK3CB_CSAT_N_O_U_SF_CombatUniform_Shortsleeve_02", "UK3CB_CSAT_N_O_U_SF_CombatUniform_02"]];
_policeLoadoutData set ["vests", ["UK3CB_ANP_B_V_TacVest_BLU"]];
_policeLoadoutData set ["helmets", ["UK3CB_H_Radio_Cap_APD"]];
_policeLoadoutData set ["shotGuns", [
["uk3cb_enfield_l42_walnut", "", "", "", ["uk3cb_l42_enfield_762_10Rnd_magazine_RT", "uk3cb_l42_enfield_762_10Rnd_magazine_WT"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["uk3cb_ppsh41", "", "", "", [], [], ""],
["uk3cb_mat49m", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhs_weap_type94_new", "", "", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_GAF_B_U_SF_CombatSmock_01_MULTICAM_OLIVE", "UK3CB_GAF_B_U_SF_CombatSmock_03_MULTICAM_OLIVE"]];
_militiaLoadoutData set ["vests", ["UK3CB_TKA_I_V_6Sh92_Oli", "UK3CB_TKA_I_V_6Sh92_Khk"]];
_militiaLoadoutData set ["helmets", ["UK3CB_GAF_B_H_Beret_Army"]];
_militiaLoadoutData set ["slBackpacks", ["UK3CB_ION_I_B_RadioBag_OLI"]];
_militiaLoadoutData set ["sniHats", ["UK3CB_GAF_B_H_BoonieHat_DIGI"]];

_militiaLoadoutData set ["rifles", [
"uk3cb_sks_01", "rhs_weap_ak74", "rhs_weap_ak74_2", "uk3cb_ak47"
]];
_militiaLoadoutData set ["carbines", [
"uk3cb_sks_01_sling"
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_aks74_gp25", "", "", "", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["SMGs", ["UK3CB_Uzi_Stock"]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39_G"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m2", ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn93_1", ["UK3CB_SVD_10rnd_762x54"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess_bala", "rhs_tsh4_bala", "UK3CB_GAF_B_H_Field_Cap_DIGI"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_J_Pilot_Uniform_01_OLI"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green_alt"]];


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