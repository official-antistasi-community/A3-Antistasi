//////////////////////////
//   Side Information   //
//////////////////////////

["name", "MACV"] call _fnc_saveToTemplate;
["spawnMarkerName", "MACV Support Corridor"] call _fnc_saveToTemplate;

["flag", "vn_flag_usa"] call _fnc_saveToTemplate;
["flagTexture", "vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "vn_flag_usa"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "vn_o_ammobox_04"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

// All fo bellow are optional overrides
["firstAidKits", ["vn_b_item_firstaidkit"]] call _fnc_saveToTemplate;
["mediKits", ["vn_b_item_medikit_01"]] call _fnc_saveToTemplate;

["placeIntel_desk", ["Land_vn_us_common_table_01",0]] call _fnc_saveToTemplate;
["placeIntel_itemMedium", ["Land_vn_file1_f",-25,false]] call _fnc_saveToTemplate;
["placeIntel_itemLarge", ["Land_vn_filephotos_f",-25,false]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["vn_b_wheeled_m151_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_b_wheeled_m151_01", "vn_b_wheeled_m151_02", "vn_b_wheeled_m274_01_01"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["vn_b_wheeled_m151_mg_02", "vn_b_wheeled_m151_mg_03", "vn_b_wheeled_m151_mg_04", "vn_b_wheeled_m151_mg_05", "vn_b_wheeled_m54_mg_02", "vn_b_wheeled_m274_mg_01_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["vn_b_wheeled_m54_01", "vn_b_wheeled_m54_02"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["vn_b_wheeled_m54_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["vn_b_wheeled_m54_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["vn_b_wheeled_m54_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", []] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["vn_b_wheeled_m54_mg_03", "vn_b_wheeled_m54_mg_01", "vn_b_armor_m113_01"]] call _fnc_saveToTemplate;
private _vehiclesAPCs = ["vn_b_armor_m113_acav_04", "vn_b_armor_m113_acav_02", "vn_b_armor_m113_acav_01", "vn_b_armor_m113_acav_06", "vn_b_armor_m113_acav_03", "vn_b_armor_m113_acav_05"];
["vehiclesIFVs", ["vn_b_armor_m67_01_01"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["vn_b_armor_m41_01_02"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["vn_b_armor_m48_01_01"]] call _fnc_saveToTemplate;
private _vehiclesAA = ["vn_b_wheeled_m54_mg_02"];

["vehiclesTransportBoats", ["vn_o_boat_02_01", "vn_b_boat_10_01", "vn_b_boat_09_01"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["vn_b_boat_13_02", "vn_b_boat_06_02", "vn_b_boat_05_02", "vn_b_boat_12_02"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["vn_b_air_f4c_at", "vn_b_air_f100d_at"];

["vehiclesPlanesAA", ["vn_b_air_f4c_cap", "vn_b_air_f100d_cap"]] call _fnc_saveToTemplate;
private _vehiclesPlanesTransport = [];
private _vehiclesAirPatrol = ["vn_b_air_uh1d_02_01"];

if (isClass (configFile >> "vnx_credits")) then {
	_vehiclesAPCs append ["vnx_b_armor_lvtp5_01"];
	_vehiclesAA append ["vnx_b_armor_m163_01"];
	_vehiclesPlanesCAS append ["vnx_b_air_ov10a_usmc_mr"];
	_vehiclesPlanesTransport append ["vnx_b_air_ac119_02_01"];
	_vehiclesAirPatrol append ["vnx_b_air_ov10a_covey"];
};

["vehiclesAPCs", _vehiclesAPCs] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["vehiclesAirPatrol", _vehiclesAirPatrol] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["vn_b_air_ch34_01_01"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["vn_b_air_uh1c_07_01", "vn_b_air_uh1d_02_01", "vn_b_air_ch34_01_01", "vn_b_air_ch34_03_01", "vn_b_air_ch47_04_02", "vn_b_air_ch47_01_02"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["vn_b_air_uh1c_01_01", "vn_b_air_uh1c_02_01", "vn_b_air_uh1c_03_01","vn_b_air_ach47_04_01","vn_b_air_ach47_03_01","vn_b_air_ach47_05_01","vn_b_air_ach47_01_01","vn_b_air_ach47_02_01"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["vn_b_air_ah1g_02", "vn_b_air_ah1g_03", "vn_b_air_ah1g_04", "vn_b_air_ah1g_07", "vn_b_air_ah1g_08", "vn_b_air_ah1g_09"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["vn_b_army_static_m101_02"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["vn_b_army_static_m101_02", ["vn_cannon_m101_mag_he_x8", "vn_cannon_m101_mag_ab_x8", "vn_cannon_m101_mag_wp_x8"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["vn_b_air_oh6a_01"]] call _fnc_saveToTemplate;				// scout helis are fine for this
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["vn_i_wheeled_m151_mg_01_mp"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["vn_b_wheeled_m54_02_sog"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["vn_i_wheeled_m151_01_mp"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["vn_b_wheeled_m151_02_mp"]] call _fnc_saveToTemplate;

["staticMGs", ["vn_b_army_static_m2_high", "vn_b_army_static_m2_high", "vn_b_army_static_m60_high", "vn_b_army_static_m1919a4_high"]] call _fnc_saveToTemplate;
["staticAT", ["vn_b_army_static_tow", "vn_b_army_static_m40a1rr"]] call _fnc_saveToTemplate;
["staticAA", ["vn_b_army_static_m45", "vn_b_navy_static_l70mk2", "vn_b_navy_static_l60mk3"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_b_army_static_mortar_m2"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "vn_mortar_m2_mag_he_x8"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "vn_mortar_m2_mag_wp_x8"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "vn_mortar_m2_mag_lume_x8"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["vn_mine_m15"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["vn_mine_m14"]] call _fnc_saveToTemplate;

#include "VN_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem", "GreekHead_A3_05",
"GreekHead_A3_06", "GreekHead_A3_08", "GreekHead_A3_09", "Sturrock", "WhiteHead_01",
"WhiteHead_02", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07",
"WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12",
"WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
"WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
["sfFaces", ["GreekHead_A3_09", "Sturrock", "vn_b_AsianHead_A3_01_02", "vn_b_AsianHead_A3_01_04",
"vn_b_AsianHead_A3_01_07", "vn_b_AsianHead_A3_01_08", "vn_b_AsianHead_A3_01_10", "vn_b_AsianHead_A3_02_01",
"vn_b_AsianHead_A3_02_03", "vn_b_AsianHead_A3_02_04", "vn_b_AsianHead_A3_02_05", "vn_b_AsianHead_A3_02_09",
"vn_b_AsianHead_A3_03_05", "vn_b_AsianHead_A3_03_07", "vn_b_AsianHead_A3_03_09", "vn_b_AsianHead_A3_03_11",
"vn_b_AsianHead_A3_04_05", "vn_b_AsianHead_A3_04_09", "vn_b_AsianHead_A3_04_11", "vn_b_AsianHead_A3_05_02",
"vn_b_AsianHead_A3_05_04", "vn_b_AsianHead_A3_05_05", "vn_b_AsianHead_A3_05_07", "vn_b_AsianHead_A3_05_08",
"vn_b_AsianHead_A3_05_10", "vn_b_AsianHead_A3_06_04", "vn_b_AsianHead_A3_06_06", "vn_b_AsianHead_A3_06_09",
"vn_b_AsianHead_A3_07_03", "vn_b_AsianHead_A3_07_05", "vn_b_AsianHead_A3_07_07", "vn_b_AsianHead_A3_07_11",
"vn_b_GreekHead_A3_11_11", "vn_b_GreekHead_A3_12_11", "vn_b_LivonianHead_10_09", "vn_b_LivonianHead_2_04",
"vn_b_TanoanHead_A3_06_11", "vn_b_TanoanHead_A3_07_10", "vn_b_WhiteHead_19_08", "vn_b_WhiteHead_26_02",
"vn_b_WhiteHead_27_01", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["vn_m72"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["vn_mine_m15_mag"]];
_loadoutData set ["APMines", ["vn_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["vn_mine_m112_remote_mag"]];
_loadoutData set ["heavyExplosives", ["vn_mine_satchel_remote_02_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["vn_m67_grenade_mag", "vn_m61_grenade_mag", "vn_m34_grenade_mag", "vn_m14_early_grenade_mag", "vn_m14_grenade_mag"]];
_loadoutData set ["smokeGrenades", ["vn_m18_white_mag"]];
_loadoutData set ["signalsmokeGrenades", ["vn_m18_yellow_mag", "vn_m18_red_mag", "vn_m18_purple_mag", "vn_m18_green_mag"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["vn_b_item_map"]];
_loadoutData set ["watches", ["vn_b_item_watch"]];
_loadoutData set ["compasses", ["vn_b_item_compass"]];
_loadoutData set ["radios", ["vn_b_item_radio_urc10"]];
_loadoutData set ["binoculars", ["vn_mk21_binocs"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["MGbackpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["engBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["GLhelmets", []];
_loadoutData set ["MGhelmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.

private _eeItems = ["vn_b_item_toolkit", "vn_b_item_trapkit"];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["vn_b_uniform_sog_02_02", "vn_b_uniform_sog_02_05", "vn_b_uniform_macv_06_02", "vn_b_uniform_macv_04_02"]];
_sfLoadoutData set ["vests", ["vn_b_vest_sog_04"]];
_sfLoadoutData set ["medVests", ["vn_b_vest_sog_02"]];
_sfLoadoutData set ["engVests", ["vn_b_vest_sog_03"]];
_sfLoadoutData set ["mgVests", ["vn_b_vest_sog_05"]];
_sfLoadoutData set ["slVests", ["vn_b_vest_sog_06"]];
_sfLoadoutData set ["backpacks", ["vn_b_pack_trp_02", "vn_b_pack_lw_03"]];
_sfLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04", "vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_sfLoadoutData set ["MGbackpacks", ["vn_b_pack_trp_01", "vn_b_pack_trp_01_02"]];
_sfLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_sfLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_sfLoadoutData set ["helmets", ["vn_b_boonie_02_02", "vn_b_boonie_02_01", "vn_b_beret_01_01", "vn_b_beret_01_06", "vn_b_bandana_02"]];
_sfLoadoutData set ["binoculars", ["vn_anpvs2_binoc"]];

_sfLoadoutData set ["rifles", [
["vn_m16_camo", "vn_s_m16", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_sfLoadoutData set ["slRifles", [
["vn_m16_camo", "vn_s_m16", "", "vn_o_4x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_fg", "", "", "vn_o_4x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_fg", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_sfLoadoutData set ["slSidearms", [
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_sfLoadoutData set ["carbines", [
["vn_xm177_short", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_short", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_gau5a", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_gau5a", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["vn_m16_xm148", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m16_m203_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_m203_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""],
["vn_m60_shorty_camo", "", "", "", [], [], ""],
["vn_rpd", "", "", "", [], [], ""],
["vn_m63a_cdo", "", "", "", ["vn_m63a_150_mag", "vn_m63a_150_mag", "vn_m63a_150_t_mag"], [], ""],
["vn_m63a_lmg", "", "", "", ["vn_m63a_100_mag", "vn_m63a_100_mag", "vn_m63a_100_t_mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["vn_m16_camo", "vn_s_m16", "", "vn_o_9x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "vn_o_4x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m14_camo", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14_camo", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14a1", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14a1"],
["vn_m14a1", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14a1"]
]];
_sfLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "vn_s_m14", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "vn_s_m14", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["vn_mx991_m1911", "vn_s_m1911", "", "", [], [], ""],
["vn_mk22", "vn_s_mk22", "", "", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["vn_b_uniform_macv_02_01", "vn_b_uniform_macv_02_07", "vn_b_uniform_macv_01_01", "vn_b_uniform_macv_06_01", "vn_b_uniform_macv_04_01"]];
_militaryLoadoutData set ["vests", ["vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"]];
_militaryLoadoutData set ["glVests", ["vn_b_vest_usarmy_05"]];
_militaryLoadoutData set ["sniVests", ["vn_b_vest_usarmy_08"]];
_militaryLoadoutData set ["medVests", ["vn_o_vest_06", "vn_b_vest_usarmy_12"]];
_militaryLoadoutData set ["engVests", ["vn_b_vest_usarmy_12", "vn_b_vest_usarmy_11"]];
_militaryLoadoutData set ["mgVests", ["vn_b_vest_usarmy_06"]];
_militaryLoadoutData set ["slVests", ["vn_b_vest_usarmy_09", "vn_b_vest_usarmy_11"]];
_militaryLoadoutData set ["backpacks", ["vn_b_pack_lw_01", "vn_b_pack_lw_03"]];
_militaryLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_militaryLoadoutData set ["MGbackpacks", ["vn_b_pack_lw_02", "vn_b_pack_lw_05", "vn_b_pack_trp_01_02"]];
_militaryLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_militaryLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_militaryLoadoutData set ["helmets", ["vn_b_helmet_m1_02_01", "vn_b_helmet_m1_03_01", "vn_b_helmet_m1_05_01", "vn_b_helmet_m1_06_01", "vn_b_helmet_m1_07_01"]];
_militaryLoadoutData set ["GLhelmets", ["vn_b_helmet_m1_04_02"]];
_militaryLoadoutData set ["MGhelmets", ["vn_b_helmet_m1_08_01"]];
_militaryLoadoutData set ["binoculars", ["vn_anpvs2_binoc"]];

_militaryLoadoutData set ["rifles", [
["vn_m16", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m16", "", "vn_b_m16", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""]
]];
_militaryLoadoutData set ["slRifles", [
["vn_m16", "", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177", "", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m16", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""]
]];
_militaryLoadoutData set ["slSidearms", [
"vn_mx991_m1911",
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_militaryLoadoutData set ["carbines", [
["vn_m1carbine", "", "vn_b_carbine", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m1carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m2carbine", "", "vn_b_carbine", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m2carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m1carbine", "", "vn_b_carbine", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m1carbine", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m2carbine", "", "vn_b_carbine", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m2carbine", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["vn_m3a1", "", "", "", ["vn_m3a1_mag", "vn_m3a1_mag", "vn_m3a1_t_mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["vn_m16", "", "", "vn_o_9x_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m16", "", "", "vn_o_4x_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m14_camo", "", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14_camo", "", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"]
]];
_militaryLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
"vn_m1911",
"vn_mx991_m1911",
"vn_p38s"
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_03"]];
_policeLoadoutData set ["vests", ["vn_b_vest_usarmy_13"]];
_policeLoadoutData set ["helmets", ["vn_b_helmet_m1_01_02"]];

_policeLoadoutData set ["rifles", [
["vn_m16", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["vn_m1897", "", "", "", ["vn_m1897_buck_mag", "vn_m1897_fl_mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
"vn_m1911",
"vn_mx991_m1911"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["vn_b_uniform_macv_02_01", "vn_b_uniform_macv_02_07", "vn_b_uniform_macv_01_01"]];
_militiaLoadoutData set ["vests", ["vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"]];
_militiaLoadoutData set ["glVests", ["vn_b_vest_usarmy_05"]];
_militiaLoadoutData set ["sniVests", ["vn_b_vest_usarmy_08"]];
_militiaLoadoutData set ["medVests", ["vn_o_vest_06"]];
_militiaLoadoutData set ["mgVests", ["vn_b_vest_usarmy_06"]];
_militiaLoadoutData set ["slVests", ["vn_b_vest_usarmy_09"]];
_militiaLoadoutData set ["backpacks", ["vn_b_pack_lw_01", "vn_b_pack_lw_03"]];
_militiaLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_militiaLoadoutData set ["MGbackpacks", ["vn_b_pack_lw_02", "vn_b_pack_lw_05", "vn_b_pack_trp_01_02"]];
_militiaLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_militiaLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_militiaLoadoutData set ["helmets", ["vn_b_helmet_m1_01_01", "vn_b_bandana_04", "vn_b_headband_02", "vn_b_helmet_m1_01_01", "vn_b_bandana_06"]];
_militiaLoadoutData set ["binoculars", ["vn_mk21_binocs"]];

_militiaLoadoutData set ["rifles", [
["vn_m14", "", "", "", ["vn_m14_10_mag", "vn_m14_10_mag", "vn_m14_10_t_mag"], [], ""],
["vn_m14", "", "vn_b_m14", "", ["vn_m14_10_mag", "vn_m14_10_mag", "vn_m14_10_t_mag"], [], ""],
["vn_m1_garand", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""],
["vn_m1_garand", "", "vn_b_m1_garand", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""]
]];
_militiaLoadoutData set ["slRifles", [
["vn_m14", "", "", "", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_m14", "", "vn_b_m14", "", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["vn_m1carbine", "", "vn_b_carbine", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m1carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m2carbine", "", "vn_b_carbine", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m2carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m1_garand", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_m1_garand", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["vn_m14", "", "", "vn_o_9x_m14", ["vn_m14_10_mag", "vn_m14_10_mag", "vn_m14_10_t_mag"], [], "vn_b_camo_m14"],
["vn_m14", "", "vn_b_m14", "vn_o_9x_m14", ["vn_m14_10_mag", "vn_m14_10_mag", "vn_m14_10_t_mag"], [], "vn_b_camo_m14"]
]];
_militiaLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
"vn_m1911",
"vn_p38s"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_01"]];
_crewLoadoutData set ["vests", ["vn_b_vest_usarmy_13"]];
_crewLoadoutData set ["helmets", ["vn_b_helmet_t56_02_02", "vn_b_helmet_t56_02_01"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["vn_b_uniform_heli_01_01"]];
_pilotLoadoutData set ["vests", ["vn_b_vest_aircrew_05"]];
_pilotLoadoutData set ["helmets", ["vn_b_helmet_svh4_02_06", "vn_b_helmet_svh4_02_03", "vn_b_helmet_svh4_02_04"]];

if (isClass (configFile >> "vnx_credits")) then {
	(_policeLoadoutData get "shotGuns") append [
	["vnx_m77e", "", "", "", ["vnx_m77e_fl_mag","vnx_m77e_buck_mag"], [], ""],
	["vnx_m77e_shorty", "", "", "", ["vnx_m77e_fl_mag","vnx_m77e_buck_mag"], [], ""]
	];
	(_militaryLoadoutData get "SMGs") append [
	["vnx_m50_smg", "", "", "", ["vnx_m50_smg_t_mag", "vnx_m50_smg_mag"], [], ""],
	["vnx_m12_smg", "", "", "", ["vnx_m12_smg_32_t_mag", "vnx_m12_smg_32_mag", "vnx_m12_smg_20_mag"], [], ""],
	["vnx_m45_sf", "", "", "", ["vn_m45_t_mag", "vn_m45_mag"], [], ""]
	];
	(_sfLoadoutData get "slRifles") append [
	["vnx_type56_xm148", "", "", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
	];
	(_sfLoadoutData get "grenadeLaunchers") append [
	["vnx_type56_xm148", "", "", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
	];
};


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "slRifles"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;

	[["slSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
	["handgun", 4] call _fnc_addMagazines;
	["handgun", 4] call _fnc_addAdditionalMuzzleMagazines;
	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;

	["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["lightATLaunchers"] call _fnc_setLauncher;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _medicTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
  	["carbines"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _grenadierTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	[["slSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
	["handgun", 4] call _fnc_addMagazines;
	["handgun", 2] call _fnc_addAdditionalMuzzleMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _explosivesExpertTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;


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
};

private _engineerTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["carbines"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _latTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;

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
};

private _atTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;

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
};

private _aaTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;

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
};

private _machineGunnerTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["MGbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
};

private _marksmanTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
	["binoculars"] call _fnc_addBinoculars;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sniperRifles"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
	["binoculars"] call _fnc_addBinoculars;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "shotGuns"]] call _fnc_setPrimary;
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

	["SMGs"] call _fnc_setPrimary;
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
