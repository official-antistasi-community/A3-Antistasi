//////////////////////////
//   Side Information   //
//////////////////////////

["name", "LDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "LDF Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_Enoch_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f_enoch\flags\flag_enoch_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Enoch"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_LDF_B_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_LDF_B_BRDM2_UM", "UK3CB_LDF_B_M1025", "UK3CB_LDF_B_M1152", "UK3CB_LDF_B_M998_2DR", "UK3CB_LDF_B_M998_4DR", "UK3CB_LDF_B_Offroad", "UK3CB_LDF_B_SUV_Armoured", "UK3CB_LDF_B_Tigr"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_LDF_B_Tigr_STS", "UK3CB_LDF_B_M1025_M2", "UK3CB_LDF_B_M1025_TOW", "UK3CB_LDF_B_M1151_GPK_M2", "UK3CB_LDF_B_M1151_GPK_PKM", "UK3CB_LDF_B_M1151_OGPK_M2", "UK3CB_LDF_B_Offroad_M2", "UK3CB_LDF_B_SUV_Armed", "UK3CB_LDF_B_T810_ZU23"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_LDF_B_T810_Closed", "UK3CB_LDF_B_T810_Open", "UK3CB_LDF_B_T810_Closed_PKM", "UK3CB_LDF_B_T810_Open_PKM"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_LDF_B_T810_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_LDF_B_T810_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_LDF_B_T810_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_LDF_B_T810_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_LDF_B_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_LDF_B_BRDM2", "UK3CB_LDF_B_BRDM2_ATGM", "UK3CB_LDF_B_BRDM2_HQ", "UK3CB_B_MaxxPro_M2_US_W", "UK3CB_B_MaxxPro_MK19_US_W", "UK3CB_LDF_B_MTLB_KPVT", "UK3CB_LDF_B_MTLB_PKT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_LDF_B_BMP1", "UK3CB_LDF_B_BMP2", "UK3CB_LDF_B_BMP2K", "UK3CB_LDF_B_Marshall", "UK3CB_LDF_B_Marshall_Camo", "UK3CB_LDF_B_Marshall_Cage", "UK3CB_LDF_B_Marshall_Cage_Camo", "UK3CB_LDF_B_MTLB_ZU23", "UK3CB_LDF_B_MTLB_BMP", "UK3CB_LDF_B_MTLB_Cannon"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_LDF_B_BMP2", "UK3CB_LDF_B_BMP2K"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_LDF_B_Leopard", "UK3CB_LDF_B_Leopard_Cage", "UK3CB_LDF_B_T72BB", "UK3CB_LDF_B_T72A"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_LDF_B_ZsuTank"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_LDF_B_BMP1", "UK3CB_LDF_B_BMP2", "UK3CB_LDF_B_BMP2K", "UK3CB_LDF_B_Marshall", "UK3CB_LDF_B_Marshall_Cage"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_LDF_B_MIG21_AT", "UK3CB_LDF_B_L39_PYLON", "UK3CB_LDF_B_Su25SM_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_LDF_B_MIG21_AA", "UK3CB_LDF_B_MIG29SM", "UK3CB_LDF_B_L39_PYLON"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_LDF_B_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_LDF_B_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_LDF_B_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_LDF_B_Mi_24P", "UK3CB_LDF_B_Mi8AMTSh"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_LDF_B_Mi_24V", "UK3CB_LDF_B_Mi_24G_UPK23"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_LDF_B_2S1", "UK3CB_LDF_B_RM70", "UK3CB_LDF_B_RM70_MG", "UK3CB_LDF_B_T810_MLRS"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_LDF_B_2S1", ["rhs_mag_3of56_35"]],
["UK3CB_LDF_B_RM70", ["uk3cb_40nd_mag_122mm_rockets"]],
["UK3CB_LDF_B_RM70_MG", ["uk3cb_40nd_mag_122mm_rockets"]],
["UK3CB_LDF_B_T810_MLRS", ["rhs_mag_40Rnd_122mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesAirPatrol", ["UK3CB_LDF_B_Mi8", "UK3CB_LFR_B_Bell412_FLIR", "UK3CB_LFR_B_Cessna_172", "UK3CB_LFR_B_C400"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["UK3CB_LNM_B_Hilux_M2", "UK3CB_LNM_B_LR_M2", "UK3CB_LNM_B_LR_SF_M2", "UK3CB_LNM_B_Offroad_M2", "UK3CB_LNM_B_Pickup_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_LNM_B_Ural_Open", "UK3CB_LNM_B_Van_Transport", "UK3CB_LNM_B_Zil131_Open", "UK3CB_LNM_B_Zil131_Covered", "UK3CB_LNM_B_Ural"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_LNM_B_Pickup", "UK3CB_LNM_B_Offroad", "UK3CB_LNM_B_LR_Closed", "UK3CB_LNM_B_LR_Open", "UK3CB_LNM_B_Hilux_Open", "UK3CB_LNM_B_Hilux_Closed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_LFR_B_LR_Closed", "UK3CB_LFR_B_Landcruiser", "UK3CB_LFR_B_Offroad_Comms"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_LDF_B_DSHKM", "UK3CB_LDF_B_M2_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_LDF_B_TOW_TriPod"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_LDF_B_Igla_AA_pod", "UK3CB_LDF_B_ZU23"]] call _fnc_saveToTemplate;
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

["faces", ["LivonianHead_1", "LivonianHead_10", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4", "LivonianHead_6", "LivonianHead_9", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_17", "WhiteHead_18", "WhiteHead_20", "WhiteHead_21", "WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01pol", "Male02pol", "Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

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

_loadoutData set ["lightATLaunchers", [
"rhs_weap_M136", "rhs_weap_M136_hedp", "rhs_weap_M136_hp"
]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", [
"UK3CB_BHP",
["UK3CB_USP", "", "acc_flashlight_pistol", "", [], [], ""]
]];

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
_loadoutData set ["vests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", ["UK3CB_V_Chestrig_OLI"]];
_loadoutData set ["backpacks", ["UK3CB_B_TacticalPack_Oli", "B_Carryall_green_F", "B_AssaultPack_rgr", "B_Kitbag_rgr"]];
_loadoutData set ["engBackpacks", ["rhs_rk_sht_30_olive_engineer_empty"]];
_loadoutData set ["medBackpacks", ["UK3CB_B_TacticalPack_Med_Oli"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", ["UK3CB_B_I_Radio_Backpack"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_EAF_01_F"]];
_loadoutData set ["sniHats", ["H_Booniehat_eaf"]];

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
_sfLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_CombatUniform_WDL_01", "UK3CB_LDF_B_U_CombatUniform_Shortsleeve_WDL_01"]];
_sfLoadoutData set ["helmets", ["UK3CB_LDF_B_H_MHB15_GEO", "UK3CB_LDF_B_H_MHB15_EarProtectors_GEO"]];
_sfLoadoutData set ["vests", ["UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["slVests", ["UK3CB_LDF_B_V_TL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_SL_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["mgVests", ["UK3CB_LDF_B_V_LMG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MG_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["medVests", ["UK3CB_LDF_B_V_MD_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["glVests", ["UK3CB_LDF_B_V_GREN_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["sniVests", ["UK3CB_LDF_B_V_MK_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_eaf_F", "B_Carryall_eaf_F"]];
_sfLoadoutData set ["slBackpacks", ["UK3CB_B_I_Backpack_Radio_Chem_OLI"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_eaf_F"]];
_sfLoadoutData set ["medBackpacks", ["UK3CB_B_Backpack_Med_OLI"]];
_sfLoadoutData set ["engBackpacks", ["rhs_rk_sht_30_olive_engineer_empty"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_ACOG_RMR", ["UK3CB_AUG_42Rnd_556x45_Magazine", "UK3CB_AUG_42Rnd_556x45_Magazine_R", "UK3CB_AUG_42Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230_mrds", ["UK3CB_AUG_42Rnd_556x45_Magazine", "UK3CB_AUG_42Rnd_556x45_Magazine_R", "UK3CB_AUG_42Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230", ["UK3CB_AUG_42Rnd_556x45_Magazine", "UK3CB_AUG_42Rnd_556x45_Magazine_R", "UK3CB_AUG_42Rnd_556x45_Magazine_RT"], [], ""],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["UK3CB_AUG_42Rnd_556x45_Magazine", "UK3CB_AUG_42Rnd_556x45_Magazine_R", "UK3CB_AUG_42Rnd_556x45_Magazine_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["UK3CB_AUG_42Rnd_556x45_Magazine", "UK3CB_AUG_42Rnd_556x45_Magazine_R", "UK3CB_AUG_42Rnd_556x45_Magazine_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230", ["UK3CB_AUG_42Rnd_556x45_Magazine", "UK3CB_AUG_42Rnd_556x45_Magazine_R", "UK3CB_AUG_42Rnd_556x45_Magazine_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_EOTECH", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_g33_xps3_tan", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_ACR_Carbine", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_g33_xps3_tan", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_compm4", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_eotech_xps3", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_g33_xps3", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_g33_T1", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_compm4", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_T1", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_ACR_Rifle_Long", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_LEUPOLDMK4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_m8541", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_t5000", "", "", "rhsusf_acc_m8541", ["rhs_5Rnd_338lapua_t5000"], [], "rhs_acc_harris_swivel"],
["rhs_weap_t5000", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhs_5Rnd_338lapua_t5000"], [], "rhs_acc_harris_swivel"],
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", ["rhs_5Rnd_338lapua_t5000"], [], "rhs_acc_harris_swivel"],
["rhs_weap_svdp_wd", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd_npz", "rhs_acc_tgpv2", "", "rhsusf_acc_LEUPOLDMK4", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""],
["UK3CB_CZ75", "rhsusf_acc_omega9k", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""],
["UK3CB_USP", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["UK3CB_USP_9_15Rnd"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_JumperUniform_GEO", "UK3CB_LDF_B_U_CombatUniform_Shortsleeve_GEO", "UK3CB_LDF_B_U_CombatUniform_GEO"]];
_militaryLoadoutData set ["helmets", ["UK3CB_LDF_B_H_HB97_GEO", "UK3CB_LDF_B_H_HB97_ESS_GEO", "UK3CB_LDF_B_H_HB97_ESS_Cover_GEO"]];
_militaryLoadoutData set ["vests", ["UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_Vest_KKZ10_GEO"]];
_militaryLoadoutData set ["slVests", ["UK3CB_LDF_B_V_TL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_SL_Vest_KKZ10_GEO"]];
_militaryLoadoutData set ["mgVests", ["UK3CB_LDF_B_V_LMG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MG_Vest_KKZ10_GEO"]];
_militaryLoadoutData set ["medVests", ["UK3CB_LDF_B_V_MD_Vest_KKZ10_GEO"]];
_militaryLoadoutData set ["glVests", ["UK3CB_LDF_B_V_GREN_Vest_KKZ10_GEO"]];
_militaryLoadoutData set ["sniVests", ["UK3CB_LDF_B_V_MK_Vest_KKZ10_GEO"]];

_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_compm4", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_compm4", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_ACR_Carbine", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], [], ""],
["uk3cb_auga2_carb_blk", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""],
["uk3cb_auga2_carb_blk", "", "", "rhsusf_acc_compm4", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_R", "UK3CB_AUG_30Rnd_556x45_Magazine_RT"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "", "rhsusf_acc_compm4", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5A2", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "", "", "rhsusf_acc_compm4", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_ACR_Rifle_Long", "", "", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "", "", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "", "", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_svdp_wd", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["slUniforms", ["UK3CB_LFR_B_U_Officer_01", "UK3CB_LFR_B_U_Officer_02", "UK3CB_LFR_B_U_Officer_03", "UK3CB_LFR_B_U_Officer_04"]];
_policeLoadoutData set ["uniforms", ["UK3CB_LFR_B_U_RANGER_05", "UK3CB_LFR_B_U_RANGER_06", "UK3CB_LFR_B_U_RANGER_07"]];
_policeLoadoutData set ["vests", ["UK3CB_LFR_B_V_TacVest_BRN", "UK3CB_LFR_B_V_TacVest_OLI", "V_Pocketed_olive_F", "V_LegStrapBag_olive_F", "V_Rangemaster_belt"]];
_policeLoadoutData set ["helmets", ["H_Hat_Safari_olive_F", "H_Booniehat_khk"]];

_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_Slug", "rhsusf_8Rnd_00Buck"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["rifles", [
["rhs_weap_kar98k", "", "", "", ["rhsgref_5Rnd_792x57_kar98k"], [], ""],
["rhs_weap_m38", "", "", "", ["rhsgref_5Rnd_762x54_m38"], [], ""],
["UK3CB_CZ550", "", "", "", ["UK3CB_CZ550_5rnd_Mag"], [], ""]
]];
_policeLoadoutData set ["slRifles", [
["rhs_weap_m76", "", "", "", ["rhssaf_10Rnd_792x57_m76_tracer","rhsgref_10Rnd_792x57_m76"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
"UK3CB_CZ75", "UK3CB_BHP", "rhsusf_weap_m1911a1",
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_LNM_B_U_CombatSmock_01", "UK3CB_LNM_B_U_CombatSmock_08", "UK3CB_LNM_B_U_CombatSmock_09"]];
_militiaLoadoutData set ["vests", ["V_TacVest_oli", "rhsgref_chicom_m88"]];
_militiaLoadoutData set ["backpacks", ["B_Kitbag_rgr", "B_AssaultPack_rgr"]];
_militiaLoadoutData set ["slBackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_militiaLoadoutData set ["atBackpacks", ["UK3CB_LNM_B_B_RPG"]];
_militiaLoadoutData set ["helmets", ["rhs_beanie_green", "rhsgref_helmet_pasgt_flecktarn"]];
_militiaLoadoutData set ["sniHats", ["UK3CB_LNM_B_H_BoonieHat_FLK_03"]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["uk3cb_sks_02", "uk3cb_muzzle_sks_bayonet", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
"uk3cb_ppsh41"
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["UK3CB_UKM2000P", "", "", "", ["UK3CB_UKM_100rnd_762x51", "UK3CB_UKM_100rnd_762x51_GT"], [], ""],
["UK3CB_RPK_74N", "", "", "", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK", "", "", "", ["UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_GT"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_GM"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
["UK3CB_CZ550", "", "", "uk3cb_optic_sro", ["UK3CB_CZ550_5rnd_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
["UK3CB_CZ550", "", "", "uk3cb_optic_sro", ["UK3CB_CZ550_5rnd_Mag"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
"rhs_weap_rpg18", "rhs_weap_rpg26", "rhs_weap_rpg75", "rhs_weap_m80"
]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_Tank_Uniform_GEO"]];
_crewLoadoutData set ["vests", ["UK3CB_LDF_B_V_CREW_Vest_KKZ10_GEO"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_helmet", "rhsusf_cvc_green_alt_helmet", "rhsusf_cvc_green_ess"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_H_Pilot_GEO"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_green", "rhsusf_hgu56p_visor_green"]];


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
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["primary", 4] call _fnc_addMagazines;

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
    ["primary", 4] call _fnc_addMagazines;

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


    [selectRandom["rifles", "shotGuns"]] call _fnc_setPrimary;
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
private _policeSLTemplate = {
    call _policeTemplate;
    ["slUniforms"] call _fnc_setUniform;
    [selectRandom["slRifles", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
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
    ["SquadLeader", _policeSLTemplate],
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
