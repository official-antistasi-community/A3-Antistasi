//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Turkish Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "Turkish support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_Turkiye"] call _fnc_saveToTemplate;
["flagTexture", "TMT\TMT_Core\Data\TR_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Turkish"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["tmt_landrover_w", "TMT_Kirpi_MRAP_W"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["TMT_Cobra_RCWS_W", "TMT_KirpiII_MRAP_W", "TMT_Kirpi_MRAP_RCWS_W"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["TMT_Unimog_Transport_W"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["TMT_Unimog_Transport_W"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["TMT_Unimog_Ammo_W"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["TMT_Unimog_Repair_W"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["TMT_Unimog_Fuel_W"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["tmt_landrover_w_amb", "TMT_ACV300_W_Amb"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["TMT_ACV300_W_M2", "TMT_M113_W_M2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["TMT_ACV300_W_M242"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["TMT_M60A3_W","TMT_LEO2A4_w"]] call _fnc_saveToTemplate;
["vehiclesAA", ["TMT_Landrover_w_AA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["TMT_CRRC_Assault"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["a3a_Plane_Fighter_03_grey_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["a3a_Plane_Fighter_04_grey_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["TMT_C130"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["TMT_T70_OKK"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["TMT_T70"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["TMT_T70", "TMT_CH47F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["TMT_S70B"]] call _fnc_saveToTemplate; 
["vehiclesHelisAttack", ["TMT_AH1W", "TMT_AH1W_HIRSS", "TMT_AH1W_DZKK_HIRSS"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["TMT_T155_W"]] call _fnc_saveToTemplate;        
["magazines", createHashMapFromArray [
["TMT_T155_W", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["TMT_BayraktarTB2"]] call _fnc_saveToTemplate;     
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["a3a_Offroad_01_tan_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["TMT_Unimog_Transport"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["tmt_landrover"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSBoundingMine"]] call _fnc_saveToTemplate;

#include "TMT_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem", "GreekHead_A3_05", "GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
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
_loadoutData set ["AALaunchers", ["TMT_FIM92_launcher"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];
_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["TMT_NVG_A100", "TMT_NVG_ANPVS31"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Laserdesignator"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []];    
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["tmt_alicepack_full_rpg"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["tmt_cap_kkk_officer"]];
_loadoutData set ["sniHats", ["tmt_booniehat_kkk"]];

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
_sfLoadoutData set ["uniforms", ["tmt_digital_combat_uniform_gloves_kneepad"]];
_sfLoadoutData set ["vests", ["TMT_BLACK_WarriorAssaultVest_556", "TMT_BLACK_WarriorAssaultVest_556_Belt"]];
_sfLoadoutData set ["mgVests", ["TMT_BLACK_WarriorAssaultVest_MG", "TMT_BLACK_WarriorAssaultVest_MG_belt"]];    
_sfLoadoutData set ["medVests", ["TMT_BLACK_WarriorAssaultVest_Medic_Belt"]];
_sfLoadoutData set ["glVests", ["tmt_file_assault_vest_gl_desert"]];
_sfLoadoutData set ["backpacks", ["tmt_tacticalpack_desert", "tmt_tacticalpack_mat_desert", "tmt_tacticalpack_radio_desert", "tmt_backpack_compact_desert_base", "tmt_backpack_compact_desert"]];
_sfLoadoutData set ["helmets", ["tmt_garanti_helmet_cut_cover_peltor_IR_digital", "tmt_garanti_helmet_cut_cover_peltor_IR_full_digital", "tmt_garanti_helmet_cut_cover_peltor_digital", "tmt_garanti_helmet_cut_cover_peltor_IR_jgk", "tmt_garanti_helmet_cut_cover_peltor_IR_full_jgk"]];
_sfLoadoutData set ["facewear", ["tmt_ballisticglasses", "tmt_ballisticglasses_buff_green", "tmt_ballisticglasses_shamagh_filet_green","tmt_buff_desert"]];
_sfLoadoutData set ["slHat", ["tmt_cap_digital"]];
_sfLoadoutData set ["sniHats", ["tmt_booniehat_digital"]];
_sfLoadoutData set ["NVGs", ["TMT_GPNVG"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];

_sfLoadoutData set ["slRifles", [
["TMT_MPT76_2", "tmt_m110_suppresor_black", "tmt_anpeq15black_side", "TMT_3EOS_KESKIN_B", ["TMT_20Rnd_762x51_B_mpt76"], [], ""],
["TMT_MPT76_2", "tmt_m110_suppresor_black", "tmt_anpeq15black_top", "TMT_MiniTsd_TWS", ["TMT_20Rnd_762x51_B_mpt76"], [], ""],
["TMT_MPT76_2", "tmt_m110_suppresor_black", "", "TMT_3EOS_KESKIN_TSD_B", ["TMT_20Rnd_762x51_B_mpt76"], [], ""],
["TMT_MPT55_C_clamp", "muzzle_snds_M", "tmt_anpeq15black_m952", "TMT_A600", ["TMT_30Rnd_Lancer_Mag"], [], ""],
["TMT_MPT55_C_clamp", "muzzle_snds_M", "tmt_dbala2_m952", "TMT_EOTechxps3_b_magnifier_open", ["TMT_30Rnd_Lancer_Mag"], [], ""]
]];
_sfLoadoutData set ["rifles", [
["TMT_HK416_14_5_alt_Black_Gripod", "muzzle_snds_M", "tmt_anpeq16black_m952", "TMT_EOTech552_b_magnifier_open", ["TMT_30Rnd_Lancer_Mag"], [], ""],
["TMT_KCR556_BLK_14_5_Grip", "muzzle_snds_M", "tmt_dbala2_side", "TMT_A340_NVS", ["TMT_30Rnd_Lancer_Mag"], [], ""],
["TMT_MPT55_grip", "muzzle_snds_M", "tmt_surefirem952_black", "TMT_EOTechxps3_b_magnifier_open", ["TMT_30Rnd_Lancer_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["TMT_KCR556_BLK_7_5_Grip", "muzzle_snds_M", "tmt_anpeq16black_side", "TMT_ACOG_TA31_RMR_Combo", ["TMT_30Rnd_Lancer_Mag"], [], ""],
["TMT_M4_Carbine_Gasblock_Grip_str", "muzzle_snds_M", "tmt_dbala2_top", "TMT_EOTechxps3_b", ["TMT_30Rnd_Lancer_Mag"], [], ""],
["TMT_HK416_11_Black_Gripod", "muzzle_snds_M", "tmt_surefirem952_black", "TMT_EOTech552_b", ["TMT_30Rnd_Lancer_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["TMT_MPT55_K_AK40", "muzzle_snds_M", "tmt_dbala2_side", "TMT_Piton_TWS", ["TMT_30Rnd_Lancer_Mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], ""],
["TMT_KCR556_BLK_11_KGL40", "muzzle_snds_M", "", "TMT_ACOG_TA31_RMR_Combo", ["TMT_30Rnd_Lancer_Mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["TMT_SAR109", "muzzle_snds_M", "tmt_dbala2_m952", "TMT_EOTech552_b", ["TMT_30Rnd_9x19_Mag_SAR109"], [], ""],
["TMT_SAR109_Standart", "muzzle_snds_M", "tmt_dbala2_m952", "TMT_EOTechxps3_b", ["TMT_30Rnd_9x19_Mag_SAR109"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["TMT_M249_Para", "muzzle_snds_M", "", "TMT_EOTech552_b", ["tmt_200rnd_556x45_Mdim_SAW_Standart"], [], ""],
["TMT_M249E2_Squant", "muzzle_snds_M", "", "TMT_ACOG_TA31_RMR_Combo", ["tmt_200rnd_556x45_Mdim_SAW_Standart"], [], ""],
["TMT_M249E2", "muzzle_snds_M", "", "TMT_EOTech552_b_magnifier_open", ["tmt_200rnd_556x45_Mdim_SAW_Standart"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["TMT_KNT76_BLACK", "tmt_m110_suppresor_black", "", "TMT_3EOS_KESKIN_TSD_B", ["TMT_20Rnd_762x51_B_mpt76"], [], ""],
["TMT_KNT76_TAN_2", "tmt_m110_suppresor_black", "tmt_anpeq16tan_m952", "TMT_3EOS_KESKIN_B", ["TMT_20Rnd_762x51_B_mpt76"], [], ""],
["TMT_M110_Black", "tmt_m110_suppresor_black", "", "TMT_3EOS_KESKIN_B", ["TMT_20Rnd_762x51_B_M110"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["TMT_Accuracy", "tmt_m110_suppresor_black", "", "TMT_3EOS_KESKIN_B", ["TMT_5Rnd_338lm_B_accuracy"], [], ""],
["TMT_Accuracy_rails", "tmt_m110_suppresor_black", "", "TMT_3EOS_KESKIN_B", ["TMT_5Rnd_338lm_B_accuracy"], [], ""],
["TMT_BORA_12_Black_Silenced", "", "", "TMT_3EOS_KESKIN_B", ["TMT_10Rnd_762x59_B_jng90"], [], "TMT_Bipod_blk"],
["TMT_BORA_12_Tan_Silenced", "", "", "TMT_3EOS_KESKIN_B", ["TMT_10Rnd_762x59_B_jng90"], [], "TMT_Bipod_blk"]
]];
_sfLoadoutData set ["ATLaunchers", [
["TMT_RPG7", "", "", "", ["TMT_rpg7_PG7VR_mag", "TMT_rpg7_TBG7V_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["TMT_Canik_TP9SFX_blk", "muzzle_snds_L", "acc_flashlight_pistol", "", ["TMT_16Rnd_9x19_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["tmt_kkk_combat_uniform", "tmt_kkk_combat_uniform_gloves", "tmt_kkk_green_combat_uniform_gloves", "tmt_kkk_combat_uniform_gloves_kneepad"]];
_militaryLoadoutData set ["vests", ["TMT_WarriorAssaultVest_556", "TMT_WarriorAssaultVest_556_Belt"]];
_militaryLoadoutData set ["mgVests", ["TMT_WarriorAssaultVest_MG_belt"]];    
_militaryLoadoutData set ["medVests", ["TMT_WarriorAssaultVest_Medic_Belt"]];
_militaryLoadoutData set ["slVests", ["TMT_WarriorAssaultVest"]];
_militaryLoadoutData set ["sniVests", ["TMT_WarriorAssaultVest_556_Sling"]];
_militaryLoadoutData set ["glVests", ["TMT_WarriorAssaultVest_belt"]];
_militaryLoadoutData set ["backpacks", ["tmt_alicepack", "tmt_alicepack_radio", "tmt_alicepack_full_fireplace_camp"]];
_militaryLoadoutData set ["helmets", ["tmt_m88helmet_camo_kkk", "tmt_m88helmet_camo_kkk_googles", "tmt_garanti_helmet_cut_patch_peltor_jgk", "tmt_garanti_helmet_cut_cover_jgk", "tmt_garanti_helmet_midcut_fullcover_patch_JGK"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];

_militaryLoadoutData set ["slRifles", [
["TMT_MPT76", "", "tmt_surefirem952_black", "TMT_ACOG_TA31_RMR_Combo", ["TMT_20Rnd_762x51_B_mpt76_greentracer"], [], ""],
["TMT_MPT76", "", "tmt_dbala2_side", "TMT_EOTech552_b", ["TMT_20Rnd_762x51_B_mpt76_greentracer"], [], ""],
["TMT_SIG516_Grip", "", "", "TMT_EOTechxps3_b_magnifier_open", ["TMT_30Rnd_STANAG_PULL_Mag", "TMT_30Rnd_STANAG_Mag_Tracer_Green"], [], ""],
["TMT_SIG516_Grip", "", "tmt_surefirem952_black", "TMT_EOTechxps3_b", ["TMT_30Rnd_STANAG_PULL_Mag_Tracer_Green", "TMT_30Rnd_STANAG_PULL_Mag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["TMT_MPT55_K", "", "", "TMT_ACOG_TA31_RMR_Combo", ["TMT_30Rnd_PMAG_Mag_Black", "TMT_30Rnd_PMAG_Mag_Black_Tracer_Green"], [], ""],
["TMT_MPT76", "", "", "TMT_EOTechxps3_b_magnifier_open", ["TMT_20Rnd_762x51_B_mpt76", "TMT_20Rnd_762x51_B_mpt76_redtracer"], [], ""],
["TMT_M4_Carbine_Gasblock", "", "", "TMT_EOTech552_b_magnifier_open", ["TMT_30Rnd_STANAG_PULL_Mag", "TMT_30Rnd_STANAG_PULL_Mag_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["TMT_MPT55_K", "", "tmt_dbala2_side", "TMT_EOTechxps3_b", ["TMT_30Rnd_STANAG_PULL_Mag"], [], ""],
["TMT_KCR556_BLK_7_5", "", "", "TMT_EOTechxps3_b_magnifier_open", ["TMT_30Rnd_STANAG_PULL_Mag", "TMT_30Rnd_STANAG_PULL_Mag_Tracer_Green"], [], ""],
["TMT_M4A1_AFG", "", "", "TMT_EOTech552_b", ["TMT_30Rnd_STANAG_PULL_Mag", "TMT_30Rnd_STANAG_PULL_Mag_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["TMT_SAR109_Grip", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["TMT_M4_Carbine_M320_Gasblock", "", "", "", ["TMT_30Rnd_STANAG_PULL_Mag", "TMT_30Rnd_STANAG_PULL_Mag_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], ""],
["TMT_SIG516_M320", "", "", "TMT_ACOG_TA31_RMR_Combo", ["TMT_30Rnd_STANAG_PULL_Mag", "TMT_30Rnd_STANAG_PULL_Mag_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], ""],
["TMT_MPT76_AK40", "", "", "TMT_EOTechxps3_b_magnifier_open", ["TMT_20Rnd_762x51_B_mpt76", "TMT_20Rnd_762x51_B_mpt76_redtracer"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["TMT_PKM", "", "", "TMT_EOTech552_t_magnifier_open", ["150Rnd_762x54_Box"], [], ""],
["TMT_PKM_Grip", "", "", "", ["150Rnd_762x54_Box_Tracer"], [], ""],
["TMT_M249E1", "", "", "", ["tmt_200rnd_556x45_T_SAW_Standart", "tmt_200rnd_556x45_B_SAW_Pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["TMT_M110_Black", "", "tmt_anpeq16black_m952", "TMT_3EOS_KESKIN_B", ["TMT_20Rnd_762x51_B_M110", "TMT_20Rnd_762x51_B_M110_tracer"], [], "TMT_Bipod_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["TMT_Accuracy", "", "", "TMT_3EOS_KESKIN_B", ["TMT_5Rnd_338lm_B_accuracy", "TMT_5Rnd_338lm_B_accuracy_tracer"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
["TMT_RPG7", "", "", "", ["TMT_rpg7_PG7V_mag", "TMT_rpg7_PG7VM_mag", "TMT_rpg7_OG7V_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["TMT_Zigana_PX9", "", "", "", ["TMT_16Rnd_9x19_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["tmt_police_combat_tshirt_uniform"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["tmt_MilCap_police"]];
_policeLoadoutData set ["SMGs", [
["TMT_SAR109", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["TMT_Zigana_PX9", "", "", "", ["TMT_16Rnd_9x19_Mag_Tracer_Green"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["tmt_multicamcombat_tshirt_gl_kneepad_uniform"]];
_militiaLoadoutData set ["vests", ["V_TacVest_khk", "V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["tmt_backpack_compact_kkk_base", "tmt_backpack_compact_kkk"]];
_militiaLoadoutData set ["atBackpacks", ["tmt_tacticalpack_tan"]];
_militiaLoadoutData set ["helmets", ["tmt_8ABMK_helmet_camo", "tmt_m88helmet_camo_kkk_googles","tmt_m88helmet_camo_kkk"]];
_militiaLoadoutData set ["sniHats", ["tmt_booniehat_navy"]];

_militiaLoadoutData set ["rifles", [
["TMT_G3A3", "", "", "", ["TMT_20Rnd_762x51_B_G3", "TMT_20Rnd_762x51_B_G3_greentracer", "TMT_20Rnd_762x51_B_G3_redtracer"], [], ""],
["TMT_HK33_RIFLE_STOCK", "", "", "", ["TMT_30Rnd_HK33_Mag", "TMT_30Rnd_HK33_Mag_Tracer_Red", "TMT_30Rnd_HK33_Mag_Tracer_Green"], [], ""],
["TMT_G3A4", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["TMT_HK33_RIFLE_STOCK_R", "", "", "", ["TMT_30Rnd_HK33_Mag", "TMT_30Rnd_HK33_Mag_Tracer_Green", "TMT_30Rnd_HK33_Mag_Tracer_Yellow"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["TMT_HK33_RIFLE_GL", "", "", "TMT_ACOG_TA31_RMR_Combo", ["TMT_30Rnd_HK33_Mag", "TMT_30Rnd_HK33_Mag_Tracer_Green", "TMT_30Rnd_HK33_Mag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["TMT_SAR109_Standart", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["TMT_M249E1", "", "", "", ["tmt_200rnd_556x45_M_SAW_Standart", "tmt_200rnd_556x45_Mdim_SAW_Standart", "tmt_200rnd_556x45_B_SAW_Standart"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["TMT_MPT76_Handle", "", "", "TMT_3EOS_KESKIN_B", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["TMT_Accuracy", "", "", "TMT_3EOS_KESKIN_B", [], [], ""]
]];
_militiaLoadoutData set ["ATLaunchers", [
["TMT_RPG7", "", "", "", ["TMT_rpg7_PG7VM_mag", "TMT_rpg7_OG7V_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["TMT_Canik_TP9EliteSCombat_blk"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["tmt_kkk_combat_uniform"]];
_crewLoadoutData set ["vests", ["TMT_WarriorAssaultVest_belt"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];
_crewLoadoutData set ["carbines", [
["TMT_HK33_RIFLE_STOCK", "", "", "", ["TMT_30Rnd_HK33_Mag"], [], ""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["tmt_coveralls_pilot_kkk_base"]];
_pilotLoadoutData set ["vests", ["V_TacVest_oli"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B", "H_PilotHelmetHeli_O"]];

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
