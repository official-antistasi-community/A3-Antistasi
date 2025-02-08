//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Soviets"] call _fnc_saveToTemplate;
["spawnMarkerName", "Soviets Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_CW_SOV_ARMY"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CW_SOV_ARMY"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_CW_SOV_O_LATE_BTR40", "UK3CB_CW_SOV_O_LATE_BRDM2_UM", "UK3CB_CW_SOV_O_LATE_VDV_UAZ_Open", "UK3CB_CW_SOV_O_LATE_VDV_UAZ_Closed"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["UK3CB_CW_SOV_O_LATE_VDV_UAZ_SPG9", "UK3CB_CW_SOV_O_LATE_VDV_UAZ_MG", "UK3CB_CW_SOV_O_LATE_VDV_UAZ_AGS30", "UK3CB_CW_SOV_O_LATE_Ural_Zu23"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CW_SOV_O_LATE_Zil131_Open", "UK3CB_CW_SOV_O_LATE_VDV_Ural_Open", "UK3CB_CW_SOV_O_LATE_VDV_Ural", "UK3CB_CW_SOV_O_LATE_VDV_Kraz255_Open", "UK3CB_CW_SOV_O_LATE_VDV_Gaz66_Open_Flatbed", "UK3CB_CW_SOV_O_LATE_VDV_Gaz66_Covered_Flatbed"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CW_SOV_O_LATE_Zil131_Flatbed", "UK3CB_CW_SOV_O_LATE_VDV_Ural_Recovery", "UK3CB_CW_SOV_O_LATE_VDV_Kraz255_Flatbed"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CW_SOV_O_LATE_Ural_Ammo", "UK3CB_CW_SOV_O_LATE_Gaz66_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CW_SOV_O_LATE_Gaz66_Repair", "UK3CB_CW_SOV_O_LATE_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CW_SOV_O_LATE_Kraz255_Fuel", "UK3CB_CW_SOV_O_LATE_Ural_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CW_SOV_O_LATE_Gaz66_Med", "UK3CB_CW_SOV_O_LATE_MTLB_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_CW_SOV_O_LATE_BRDM2", "UK3CB_CW_SOV_O_LATE_BRDM2_ATGM", "UK3CB_CW_SOV_O_LATE_BRDM2_HQ", "UK3CB_CW_SOV_O_LATE_BTR40_MG","UK3CB_CW_SOV_O_LATE_MTLB_KPVT", "UK3CB_CW_SOV_O_LATE_MTLB_PKT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CW_SOV_O_LATE_BMD1", "UK3CB_CW_SOV_O_LATE_BMD1K", "UK3CB_CW_SOV_O_LATE_BMD1P", "UK3CB_CW_SOV_O_LATE_BMD1PK", "UK3CB_CW_SOV_O_LATE_BMD2", "UK3CB_CW_SOV_O_LATE_BMP1", "UK3CB_CW_SOV_O_LATE_BMP2", "UK3CB_CW_SOV_O_LATE_BMP2K", "UK3CB_CW_SOV_O_LATE_BRM1K", "UK3CB_CW_SOV_O_LATE_BTR60", "UK3CB_CW_SOV_O_LATE_BTR70", "UK3CB_CW_SOV_O_LATE_BTR80", "UK3CB_CW_SOV_O_LATE_BTR80a", "UK3CB_CW_SOV_O_LATE_MTLB_ZU23", "UK3CB_CW_SOV_O_LATE_MTLB_BMP"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_CW_SOV_O_LATE_BMP2", "UK3CB_CW_SOV_O_LATE_BMP2K"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_CW_SOV_O_LATE_T80A", "UK3CB_CW_SOV_O_LATE_T80", "UK3CB_CW_SOV_O_LATE_T80U", "UK3CB_CW_SOV_O_LATE_T80BVK", "UK3CB_CW_SOV_O_LATE_T72BE", "UK3CB_CW_SOV_O_LATE_T72BC", "UK3CB_CW_SOV_O_LATE_T72BB", "UK3CB_CW_SOV_O_LATE_T72A", "UK3CB_CW_SOV_O_LATE_T72B", "UK3CB_CW_SOV_O_LATE_T55"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_CW_SOV_O_LATE_ZsuTank"]] call _fnc_saveToTemplate; //UK3CB_CW_SOV_O_LATE_2S6M_Tunguska

["vehiclesTransportBoats", ["O_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_CHD_O_Fishing_Boat_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_CW_SOV_O_LATE_BTR80", "UK3CB_CW_SOV_O_LATE_BTR80a", "UK3CB_CW_SOV_O_LATE_BMP2K"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_CW_SOV_O_LATE_Su25SM_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_CW_SOV_O_LATE_MIG29S"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_CW_SOV_O_EARLY_LI2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_CW_SOV_O_LATE_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_CW_SOV_O_LATE_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_CW_SOV_O_LATE_Mi8AMTSh"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CW_SOV_O_LATE_Mi_24V", "UK3CB_CW_SOV_O_LATE_Mi_24P"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_CW_SOV_O_LATE_2S1", "UK3CB_CW_SOV_O_LATE_2S3", "UK3CB_CW_SOV_O_LATE_BM21"]] call _fnc_saveToTemplate;         //this line determines artillery vehicles -- Example: ["vehiclesArtillery", ["B_MBT_01_arty_F"]] -- Array, can contain multiple assets
["magazines", createHashMapFromArray [
["UK3CB_CW_SOV_O_LATE_2S1", ["rhs_mag_3of56_35"]],
["UK3CB_CW_SOV_O_LATE_2S3",["rhs_mag_HE_2a33", "rhs_mag_WP_2a33"]],
["UK3CB_CW_SOV_O_LATE_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_CW_SOV_O_EARLY_UAZ_MG", "UK3CB_CW_SOV_O_EARLY_UAZ_SPG9", "UK3CB_CW_SOV_O_EARLY_BRDM2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CW_SOV_O_EARLY_VDV_Gaz66_Open_Flatbed", "UK3CB_CW_SOV_O_EARLY_VDV_Gaz66_Covered_Flatbed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CW_SOV_O_EARLY_UAZ_Closed", "UK3CB_CW_SOV_O_EARLY_UAZ_Open", "UK3CB_CW_SOV_O_EARLY_BRDM2_UM"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_CPD_O_Lada", "UK3CB_CPD_O_Gaz24", "UK3CB_CPD_O_UAZ_Open", "UK3CB_CPD_O_UAZ_Closed"]] call _fnc_saveToTemplate;

["staticMGs", ["rhs_KORD_high_MSV"]] call _fnc_saveToTemplate;
["staticAT", ["rhs_Kornet_9M133_2_msv"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_CW_SOV_O_Late_Igla_AA_pod", "RHS_ZU23_MSV"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;             //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;         //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "3CBFactions_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04",
"AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07", "LivonianHead_6", "Sturrock",
"WhiteHead_02", "WhiteHead_03", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07",
"WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_12", "WhiteHead_13",
"WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_18", "WhiteHead_19",
"WhiteHead_20"]] call _fnc_saveToTemplate;
["voices", ["RHS_Male01RUS", "RHS_Male02RUS", "RHS_Male03RUS", "RHS_Male04RUS", "RHS_Male05RUS"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_loadoutData set ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", [
"rhs_weap_makarov_pm", "rhs_weap_pya", "rhs_weap_6p53"]];

_loadoutData set ["ATMines", ["rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_loadoutData set ["aaBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["engBackpacks", ["rhs_assault_umbts_engineer_empty"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["UK3CB_CW_SOV_O_LATE_H_Officer_Cap"]];
_loadoutData set ["sniHats", ["H_Booniehat_mgrn"]];

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
_sfLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_Late_U_Spetsnaz_Uniform_Gorka_01_KLMK"]];
_sfLoadoutData set ["vests", ["rhs_6b5_rifleman"]];
_sfLoadoutData set ["slVests", ["rhs_6b5_officer"]];
_sfLoadoutData set ["medVests", ["rhs_6b5_medic"]];
_sfLoadoutData set ["backpacks", ["rhs_assault_umbts", "rhs_sidor"]];
_sfLoadoutData set ["helmets", ["rhs_altyn_novisor", "rhs_altyn_novisor_bala", "rhs_altyn_novisor_ess", "rhs_altyn_novisor_ess_bala", "rhs_altyn_visordown", "rhs_altyn", "rhs_altyn_bala"]];
_sfLoadoutData set ["slHat", ["rhs_beret_mvd"]];

_sfLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N22_AK"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["UK3CB_RPK_74N", "", "", "", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK", "", "", "", ["UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_GT"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_svdp_wd", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["rhs_uniform_m88_patchless"]];
_militaryLoadoutData set ["vests", ["rhs_6b5_rifleman_khaki"]];
_militaryLoadoutData set ["slVests", ["rhs_6b5_officer_khaki"]];
_militaryLoadoutData set ["medVests", ["rhs_6b5_medic_khaki"]];
_militaryLoadoutData set ["backpacks", ["rhs_assault_umbts", "rhs_sidor"]];
_militaryLoadoutData set ["helmets", ["UK3CB_CW_SOV_O_LATE_H_SSh68"]];

_militaryLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["UK3CB_RPK_74N", "", "", "", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK", "", "", "", ["UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_GT"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_GM"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2", [], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_svdp_wd", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["UK3CB_CPD_O_U_CombatUniform_01_Grey"]];
_policeLoadoutData set ["vests", ["UK3CB_CPD_O_V_6b23_ml_BLU"]];
_policeLoadoutData set ["helmets", ["UK3CB_CPD_O_H_Beret"]];
_policeLoadoutData set ["rifles", [
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_10Rnd_762x39mm"], [], ""]
]];
_policeLoadoutData set ["carbines", [
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_Izh18", "", "", "", ["rhsgref_1Rnd_00Buck", "rhsgref_1Rnd_Slug"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_Early_U_VDV_CombatUniform_01_KLMK"]];
_militiaLoadoutData set ["vests", ["UK3CB_V_CW_Chestrig"]];
_militiaLoadoutData set ["backpacks", ["rhs_sidor"]];
_militiaLoadoutData set ["helmets", ["UK3CB_CW_SOV_O_EARLY_H_SSh68"]];
_militiaLoadoutData set ["slHat", ["UK3CB_KDF_B_H_Officer_Cap"]];
_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["UK3CB_RPK_74N", "", "", "", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK", "", "", "", ["UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_G", "UK3CB_RPK_75rnd_762x39_GT"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39"], [], ""],
["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_GM"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
//The following lines are determining the loadout of the vehicle crew
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_Early_U_Tank_Crew_Uniform_03_BLK"]];
_crewLoadoutData set ["vests", ["rhs_vest_commander"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_bala", "rhs_tsh4_ess", "rhs_tsh4_ess_bala", "rhs_gssh18"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_H_Pilot_Uniform_01_TTSKO"]];
_pilotLoadoutData set ["vests", ["rhs_vest_commander"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

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
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
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
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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

    [selectRandom ["heavyATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

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

    [selectRandom ["lightATLaunchers", "heavyATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    [["aaBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["vests"] call _fnc_setVest;
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
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


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
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["carbines", "rifles", "shotGuns"]] call _fnc_setPrimary;
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

    ["carbines"] call _fnc_setPrimary;
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
