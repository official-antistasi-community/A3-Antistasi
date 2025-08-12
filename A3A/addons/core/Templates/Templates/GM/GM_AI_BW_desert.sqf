//////////////////////////
//   Side Information   //
//////////////////////////

["name", "BW"] call _fnc_saveToTemplate;
["spawnMarkerName", "BW support corridor"] call _fnc_saveToTemplate;

["flag", "gm_flag_GE"] call _fnc_saveToTemplate;
["flagTexture", "\gm\gm_core\data\flags\gm_flag_ge_co"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_germany"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["gm_ge_army_k125"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["gm_ge_army_iltis_cargo_des", "gm_ge_army_typ1200_cargo_des", "gm_ge_army_typ253_cargo_des", "gm_ge_army_typ253_mp_des", 
    "gm_ge_army_typ247_cargo_des", "gm_ge_army_typ247_firefighter_des", "gm_ge_bgs_w123_cargo", "gm_ge_bgs_typ253_cargo", "gm_ge_army_w123_cargo"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["gm_ge_army_iltis_milan_des", "gm_ge_army_iltis_mg3_des", "gm_ge_army_iltis_mg3_des", "gm_ge_army_luchsa1_des", "gm_ge_army_luchsa2_des"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["gm_ge_army_u1300l_cargo_des", "gm_ge_army_u1300l_container_des", "gm_ge_army_kat1_451_cargo_des", "gm_ge_army_kat1_451_container_des"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["gm_ge_army_kat1_454_cargo_des", "gm_ge_army_u1300l_container_des", "gm_ge_army_kat1_452_container_des", "gm_ge_army_kat1_451_container_des"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["gm_ge_army_kat1_454_reammo_des", "gm_ge_army_kat1_451_reammo_des"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["gm_ge_army_u1300l_repair_des", "gm_ge_army_bpz2a0_des", "gm_ge_army_fuchsa0_engineer_des", "gm_dk_army_m113a1dk_engineer_des"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["gm_ge_army_kat1_451_refuel_des"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["gm_ge_army_u1300l_medic_des_rc", "gm_ge_army_m113a1g_medic_des_rc"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["gm_dk_army_m113a2dk_des", "gm_ge_army_leopard1a1_des", "gm_ge_army_leopard1a1a1_des", "gm_ge_army_leopard1a1a2_des", "gm_ge_army_leopard1a3_des", "gm_ge_army_leopard1a3a1_des", "gm_ge_army_leopard1a5_des", 
    "gm_dk_army_leopard1a3_des"]] call _fnc_saveToTemplate;
["vehiclesAA", ["gm_ge_army_gepard1a1_des", "CUP_B_M163_Vulcan_USA"]] call _fnc_saveToTemplate; // vulcan has no desert camo

["vehiclesLightAPCs", ["gm_ge_army_fuchsa0_command_des", "gm_ge_army_fuchsa0_reconnaissance_des"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["gm_ge_army_m113a1g_apc_milan_des", 
    "gm_dk_army_m113a1dk_apc_des", "gm_ge_army_m113a1g_apc_des", "gm_ge_army_m113a1g_command_des"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["gm_ge_army_marder1a1plus_des", "gm_ge_army_marder1a1a_des", "gm_ge_army_marder1a2_des", "CUP_B_M2A3Bradley_USA_D", 
    "CUP_B_M2Bradley_USA_D"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_B_Zodiac_USMC"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["gm_ge_army_luchsa1_des", "gm_ge_army_luchsa2_des", "gm_ge_army_m113a1g_apc_milan_des","gm_ge_army_m113a1g_apc_des", "gm_ge_army_m113a1g_command_des",
    "gm_ge_army_fuchsa0_command_des", "gm_ge_army_fuchsa0_reconnaissance_des"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_A10_DYN_USA"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_AV8B_DYN_USMC"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["gm_ge_airforce_do28d2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["gm_ge_army_bo105m_vbh", "gm_ge_army_bo105p1m_vbh", "gm_ge_army_bo105p1m_vbh_swooper", "CUP_B_MH6M_USA", "CUP_B_MH6J_USA"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["gm_ge_army_ch53gs", "gm_ge_army_ch53g", "CUP_B_UH60M_FFV_US", "CUP_B_UH1D_GER_KSK", "CUP_B_UH1D_slick_GER_KSK", "CUP_B_AW159_Unarmed_GER"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH64_DL_USA"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["gm_ge_army_bo105p_pah1", "gm_ge_army_bo105p_pah1a1", "CUP_B_MH60L_DAP_2x_US", "CUP_B_MH60L_DAP_4x_US", "CUP_B_AH6J_USA", "CUP_B_AH6M_USA",
    "CUP_B_UH1D_armed_GER_KSK", "CUP_B_UH1D_gunship_GER_KSK", "CUP_B_AW159_GER"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["gm_ge_army_kat1_463_mlrs_des", "gm_ge_army_m109g_des", "gm_dk_army_m109_des"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["gm_ge_army_kat1_463_mlrs_des",["gm_36Rnd_mlrs_110mm_he_dm21","gm_36Rnd_mlrs_110mm_icm_dm602","gm_36Rnd_mlrs_110mm_mine_dm711"]],
    ["gm_ge_army_m109g_des",["gm_20Rnd_155mm_he_dm21","gm_20Rnd_155mm_he_dm111","gm_20Rnd_155mm_icm_dm602","gm_20Rnd_155mm_he_m107","gm_20Rnd_155mm_he_m795"]],
    ["gm_dk_army_m109_des",["gm_20Rnd_155mm_he_m107","gm_20Rnd_155mm_he_m795","gm_20Rnd_155mm_he_dm21","gm_20Rnd_155mm_he_dm111","gm_20Rnd_155mm_icm_dm602"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["gm_ge_army_iltis_mg3_des"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["gm_ge_army_u1300l_cargo_des", "gm_ge_army_u1300l_container_des"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["gm_ge_army_iltis_cargo_des"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["gm_ge_pol_typ1200", "gm_ge_pol_w123", "gm_ge_pol_typ253"]] call _fnc_saveToTemplate;

["staticMGs", ["gm_ge_army_mg3_aatripod"]] call _fnc_saveToTemplate;
["staticAT", ["gm_ge_army_milan_launcher_tripod"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["gm_minestatic_at_dm21", "gm_minestatic_at_dm1233"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["gm_minestatic_ap_dm31"]] call _fnc_saveToTemplate;

#include "GM_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["gm_voice_male_deu_05","gm_voice_male_deu_06","gm_voice_male_deu_07", "gm_voice_male_deu_01","gm_voice_male_deu_02"]] call _fnc_saveToTemplate;
["faces", ["gm_face_whiteHead_01","gm_face_whiteHead_02", "WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21" ]] call _fnc_saveToTemplate;
["sfFaces", ["gm_WhiteHead_01_camo_01","gm_WhiteHead_02_camo_01","gm_WhiteHead_03_camo_01",
    "gm_WhiteHead_04_camo_01","gm_WhiteHead_05_camo_01","gm_WhiteHead_06_camo_01",
    "gm_WhiteHead_07_camo_01","gm_WhiteHead_08_camo_01","gm_WhiteHead_09_camo_01",
    "gm_WhiteHead_10_camo_01","gm_WhiteHead_11_camo_01","gm_WhiteHead_12_camo_01",
    "gm_WhiteHead_13_camo_01","gm_WhiteHead_14_camo_01","gm_WhiteHead_15_camo_01",
    "gm_WhiteHead_16_camo_01","gm_WhiteHead_17_camo_01","gm_WhiteHead_18_camo_01",
    "gm_WhiteHead_19_camo_01","gm_WhiteHead_20_camo_01","gm_WhiteHead_21_camo_01"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
    ["gm_m72a3_oli", "", "", "", ["gm_1Rnd_66mm_heat_m72a3"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["gm_pzf44_2_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""],
    ["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3", "gm_1Rnd_60mm_heat_dm12_pzf3"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["gm_mine_at_dm21", "gm_mine_at_dm1233"]];
_loadoutData set ["APMines", ["gm_mine_ap_dm31"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["gm_explosive_petn_charge"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["gm_handgrenade_frag_dm51", "gm_handgrenade_frag_dm51a1"]];
_loadoutData set ["smokeGrenades", ["gm_smokeshell_wht_dm25"]];
_loadoutData set ["signalsmokeGrenades", ["gm_smokeshell_grn_dm21", "gm_smokeshell_red_dm23", "gm_smokeshell_yel_dm26", "gm_smokeshell_org_dm32"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["gm_watch_kosei_80"]];
_loadoutData set ["compasses", ["gm_ge_army_conat2"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS7"]];
_loadoutData set ["binoculars", ["gm_df7x40_blk", "gm_ferod16_des", "gm_ferod16_oli", "gm_ferod16_win"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["glBackpacks", []];
_loadoutData set ["slBackpacks", ["gm_ge_backpack_sem35_oli"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["gm_ge_headgear_beret_grn_infantry"]];
_loadoutData set ["sniHats", ["gm_ge_headgear_hat_boonie_oli", "gm_ge_headgear_hat_boonie_flk"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["gm_repairkit_01", "MineDetector"];
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
_sfLoadoutData set ["uniforms", ["CUP_U_B_GER_Crye", "CUP_U_B_GER_Crye2"]];
_sfLoadoutData set ["vests", ["CUP_V_B_GER_Armatus_Trop", "CUP_V_B_GER_Armatus_BB_Trop"]];
_sfLoadoutData set ["backpacks", ["CUP_B_GER_Pack_Tropentarn"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Covered_Tropen_NoHS", "CUP_H_OpsCore_Covered_Tropen_SF"]];
_sfLoadoutData set ["sniHats", ["CUP_H_Ger_Boonie2_desert"]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];

_sfLoadoutData set ["rifles", [
    ["gm_g3a3_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_g3a3a1_ris_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_g3a3a0_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_hk33a2_blk", "gm_suppressor_atec150_556mm_blk", "", "", ["gm_30Rnd_556x45mm_B_T_DM21_hk33_blk","gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
    ["gm_hk33ka2_blk", "gm_suppressor_atec150_556mm_blk", "", "", ["gm_30Rnd_556x45mm_B_T_DM21_hk33_blk","gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""]
]];

_sfLoadoutData set ["carbines", [
    ["gm_g3a4_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], ""],
    ["gm_hk33a3_blk", "gm_suppressor_atec150_556mm_blk", "", "", ["gm_30Rnd_556x45mm_B_T_DM21_hk33_blk","gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
    ["gm_hk33ka3_blk", "gm_suppressor_atec150_556mm_blk", "", "", ["gm_30Rnd_556x45mm_B_T_DM21_hk33_blk","gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
    ["gm_g3a4a0_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], ""],
    ["gm_g3a4a0_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], ""]
]];

_sfLoadoutData set ["grenadeLaunchers", [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell"], [], ""],
    ["gm_g3a3_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_g3a3a1_ris_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_g3a3a0_oli", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["gm_mp5sd2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5sd3_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5sd5_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5sd6_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5nsd1_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5nsd2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_lmgm62_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_g8a2_blk", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk", "gm_40Rnd_762x51mm_AP_DM151_g3_blk", "gm_40Rnd_762x51mm_B_DM111_g3_blk", "gm_40Rnd_762x51mm_B_DM41_g3_blk"], [], ""],
    ["gm_mg8a2_blk", "gm_suppressor_atec150_762mm_blk", "", "", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["gm_g3a3_dmr_des", "muzzle_snds_B", "acc_pointer_IR", "gm_feroz24_blk", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], "bipod_01_F_blk"],
    ["gm_msg90a1_blk", "gm_suppressor_atec150_762mm_blk", "", "gm_zf10x42_stanaghk_blk", ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk"], [], "gm_msg90_bipod_blk"],
    ["gm_g3sg1_oli", "gm_suppressor_atec150_762mm_blk", "", "gm_feroz24_stanagClaw_blk", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], "gm_g3_bipod_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_G22_des", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland_pip", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];
_sfLoadoutData set ["sidearms", [
    ["gm_p1sd_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p1_blk", "gm_8Rnd_9x19mm_BSD_DM81_p1_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk"], [], ""] //silenced pistol
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["CUP_U_B_GER_Tropentarn_1", "CUP_U_B_GER_Tropentarn_2", "CUP_U_B_GER_Tropentarn_3", "CUP_U_B_GER_Tropentarn_4"]];
_militaryLoadoutData set ["vests", ["CUP_V_B_GER_PVest_Trop_RFL", "CUP_V_B_GER_PVest_Trop_RFL_LT"]];
_militaryLoadoutData set ["slVests", ["CUP_V_B_GER_PVest_Trop_TL", "CUP_V_B_GER_PVest_Trop_OFC"]];
_militaryLoadoutData set ["medVests", ["CUP_V_B_GER_PVest_Trop_Med"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_B_GER_PVest_Trop_MG"]];
_militaryLoadoutData set ["glVests", ["CUP_V_B_GER_PVest_Trop_Gren"]];
_militaryLoadoutData set ["backpacks", ["CUP_B_GER_Pack_Tropentarn"]];
_militaryLoadoutData set ["helmets", ["CUP_H_Ger_M92_Cover_Trop_GG_CB", "CUP_H_Ger_M92_Cover_Trop_GG_CF", "CUP_H_Ger_M92_Cover_Trop_GG"]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryLoadoutData set ["slRifles", [
    ["gm_c7a1_blk", "", "", "gm_c79a1_blk", ["gm_30Rnd_556x45mm_B_M855_stanag_gry", "gm_30Rnd_556x45mm_B_T_M856_stanag_gry"], [], ""],
    ["gm_hk33a2_blk", "gm_bayonet_g3_blk", "", "gm_rv_stanagClaw_blk", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka2_blk", "", "", "gm_rv_stanagClaw_blk", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_sg542_blk", "", "", "gm_rv_stanagSig_blk", ["gm_20Rnd_762x51mm_B_T_DM21_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["gm_g3a3_oli", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_sg542_blk", "", "", "", ["gm_20Rnd_762x51mm_B_T_DM21_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""],
    ["gm_hk33a2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_c7a1_blk", "", "", "gm_c79a1_blk", ["gm_30Rnd_556x45mm_B_M855_stanag_gry", "gm_30Rnd_556x45mm_B_T_M856_stanag_gry"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["gm_g3a4_oli", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], ""],
    ["gm_sg550_blk", "", "", "", ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn", "gm_30Rnd_556x45mm_B_DM11_sg550_brn", "gm_30Rnd_556x45mm_B_DM11_sg550_brn"], [], ""],
    ["gm_hk33a3_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka3_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_gvm75carb_oli", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell"], ["1Rnd_HE_Grenade_shell"], ""],
    ["gm_g3a3_oli", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], ["gm_1rnd_67mm_heat_dm22a1_g3"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM11_mp2_blk", "gm_32Rnd_9x19mm_B_DM51_mp2_blk", "gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
    ["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_sg551_blk", "", "", "", ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn", "gm_30Rnd_556x45mm_B_DM11_sg550_brn", "gm_30Rnd_556x45mm_B_DM11_sg550_brn"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_lmgm62_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_g8a2_blk", "", "", "", ["gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk", "gm_40Rnd_762x51mm_AP_DM151_g3_blk", "gm_40Rnd_762x51mm_B_DM111_g3_blk", "gm_40Rnd_762x51mm_B_DM41_g3_blk"], [], ""],
    ["gm_mg8a2_blk", "", "", "", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["gm_g3a3_dmr_des", "", "acc_pointer_IR", "gm_feroz24_blk", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], "bipod_01_F_blk"],
    ["gm_msg90a1_blk", "", "", "gm_zf10x42_stanaghk_blk", ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk"], [], "gm_msg90_bipod_blk"],
    ["gm_g3sg1_oli", "", "", "gm_feroz24_stanagClaw_blk", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], "gm_g3_bipod_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_G22_des", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland_pip", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];
_militaryLoadoutData set ["sidearms", [
    ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p1_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk"], [], ""],
    ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""],
    ["gm_p2a1_blk", "", "", "", ["gm_1Rnd_265mm_flare_multi_red_gc", "gm_1Rnd_265mm_flare_single_red_gc", "gm_1Rnd_265mm_flare_single_wht_gc", "gm_1Rnd_265mm_flare_single_yel_DM10", "gm_1Rnd_265mm_flare_single_grn_DM11", "gm_1Rnd_265mm_flare_single_red_DM13", "gm_1Rnd_265mm_flare_single_wht_DM15", "gm_1Rnd_265mm_flare_para_yel_DM16", "gm_1Rnd_265mm_flare_multi_yel_DM20", "gm_1Rnd_265mm_flare_multi_grn_DM21", "gm_1Rnd_265mm_flare_multi_red_DM23", "gm_1Rnd_265mm_flare_multi_nbc_DM47", "gm_1Rnd_265mm_flare_multi_wht_DM25", "gm_1Rnd_265mm_smoke_single_blk_gc", "gm_1Rnd_265mm_smoke_single_blu_gc", "gm_1Rnd_265mm_smoke_single_yel_gc", "gm_1Rnd_265mm_smoke_single_yel_DM19", "gm_1Rnd_265mm_smoke_single_org_DM22", "gm_1Rnd_265mm_smoke_single_vlt_DM24", "gm_1Rnd_265mm_flare_single_grn_gc"], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["gm_ge_pol_uniform_suit_80_grn", "gm_ge_pol_uniform_blouse_80_blk"]];
_policeLoadoutData set ["vests", ["gm_ge_pol_vest_80_wht"]];
_policeLoadoutData set ["helmets", ["gm_ge_pol_headgear_cap_80_grn", "gm_ge_pol_headgear_cap_80_wht"]];

_policeLoadoutData set ["SMGs", [
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM11_mp2_blk", "gm_32Rnd_9x19mm_B_DM51_mp2_blk", "gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
    ["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a4_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a5_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p1_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk"], [], ""],
    ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["gm_ge_army_uniform_soldier_80_ols", "gm_ge_army_uniform_soldier_80_oli", "gm_ge_army_uniform_soldier_gloves_80_ols", "gm_ge_army_uniform_soldier_parka_80_ols", "gm_ge_army_uniform_soldier_parka_80_oli"]];
_militiaLoadoutData set ["vests", ["gm_ge_vest_90_rifleman_flk", "gm_ge_army_vest_80_rifleman", "gm_ge_army_vest_80_rifleman_smg"]];
_militiaLoadoutData set ["slVests", ["gm_ge_army_vest_80_leader", "gm_ge_army_vest_80_leader_smg"]];
_militiaLoadoutData set ["medVests", ["gm_ge_army_vest_80_medic"]];
_militiaLoadoutData set ["mgVests", ["gm_ge_army_vest_80_machinegunner"]];
_militiaLoadoutData set ["glVests", ["gm_ge_army_vest_80_demolition"]];
_militiaLoadoutData set ["backpacks", ["gm_ge_backpack_satchel_80_blk"]];
_militiaLoadoutData set ["medBackpacks", ["gm_ge_backpack_satchel_80_san"]];
_militiaLoadoutData set ["glBackpacks", ["gm_ge_backpack_satchel_80_blk"]];
_militiaLoadoutData set ["helmets", ["gm_dk_headgear_m52_oli", "gm_dk_headgear_m52_net_oli", "gm_ge_bgs_headgear_m35_53_blk", "gm_ge_bgs_headgear_m35_53_net_blk"]];

_militiaLoadoutData set ["rifles", [
    ["gm_m16a1_blk", "", "", "", ["gm_20Rnd_556x45mm_B_M855_stanag_gry", "gm_20Rnd_556x45mm_B_T_M856_stanag_gry"], [], ""],
    ["gm_hk53a2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["gm_gvm75carb_oli", "", "", "", ["gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
    ["gm_hk53a3_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM11_mp2_blk", "gm_32Rnd_9x19mm_B_DM51_mp2_blk", "gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
    ["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["gm_lmgm62_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_g8a2_blk", "", "", "", ["gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk", "gm_40Rnd_762x51mm_AP_DM151_g3_blk", "gm_40Rnd_762x51mm_B_DM111_g3_blk", "gm_40Rnd_762x51mm_B_DM41_g3_blk"], [], ""],
    ["gm_mg8a2_blk", "", "", "", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["gm_g3a3_dmr_des", "", "acc_pointer_IR", "gm_feroz24_blk", ["gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["sidearms", [["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p1_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk"], [], ""]]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["gm_ge_army_uniform_crew_90_flk"]];
_crewLoadoutData set ["vests", ["gm_ge_vest_armor_90_crew_flk", "gm_ge_army_vest_80_crew"]];
_crewLoadoutData set ["helmets", ["gm_ge_headgear_headset_crew_oli", "gm_ge_headgear_crewhat_80_blk"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["gm_ge_army_uniform_pilot_oli", "gm_ge_army_uniform_pilot_rolled_oli"]];
_pilotLoadoutData set ["vests", ["gm_ge_vest_90_crew_flk"]];
_pilotLoadoutData set ["helmets", ["gm_ge_headgear_sph4_oli"]];





/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slBackpacks","backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

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
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;;
    ["primary", 7] call _fnc_addMagazines;

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


    ["SMGs"] call _fnc_setPrimary;
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

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
