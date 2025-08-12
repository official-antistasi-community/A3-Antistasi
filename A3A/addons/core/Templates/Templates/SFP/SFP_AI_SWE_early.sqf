//////////////////////////
//   Side Information   //
//////////////////////////

["name", "SDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "SDF Support Corridor"] call _fnc_saveToTemplate;

["flag", "sfp_flagcarrier_sweden"] call _fnc_saveToTemplate;
["flagTexture", "\sfp_config\data\flag_sweden_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "sfp_marker_sweden"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;


["vehiclesBasic", ["CUP_B_M1030_USA"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["sfp_tgb11","sfp_tgb1112"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["sfp_tgb1111_sog_ksp58"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["sfp_bv206", "sfp_tgb1317", "sfp_tgb20", "sfp_tgb13_ksp58","I_E_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["sfp_tgb20", "sfp_tgb13_ksp58","I_E_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["I_E_Truck_02_Ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["I_E_Truck_02_Box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["I_E_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["sfp_tgb1314","I_E_Truck_02_Medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["sfp_pbv302_mounted", "sfp_pbv302", "sfp_pbv302"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["sfp_strf90c"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["sfp_ikv91"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["sfp_strv103c","sfp_strv102","sfp_strv121"]] call _fnc_saveToTemplate;
["vehiclesAA", ["sfp_lvkv90c"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["sfp_gruppbat"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["sfp_strb90"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["sfp_pbv302_mounted", "sfp_pbv302", "sfp_pbv302"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["sfp_jas39", "sfp_jas39_rb15"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["sfp_jas39_cap"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["sfp_tp84_2015"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["sfp_hkp6","sfp_hkp9"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["sfp_hkp9", "sfp_hkp9_sog", "sfp_hkp9_sog"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_B_CH47F_GB"]] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["sfp_hkp9_rb55","CUP_B_UH1D_armed_GER_KSK_Des"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["sfp_fh77"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["sfp_fh77",["32Rnd_155mm_Mo_shells"]]]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["sfp_tgb16_ksp58_mp"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["sfp_tgb20"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["sfp_tgb11"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["sfp_police_offroad"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_RBS70_ACR"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "SFP_Vehicle_Attributes.sqf"
/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
"WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08",
"WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
//SpecialForces, Militia, Police Faces and Voices, these are Optional if there is no reason to Include them, leave them out.
["sfFaces", ["sfp_face01_camo","sfp_face02_camo"]] call _fnc_saveToTemplate;
"sfp_swedish_names" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["shotguns", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["CUP_launch_M136_Loaded"]];
_loadoutData set ["ATLaunchers", [
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag", "sfp_grg_heat_mag", "sfp_grg_he_mag"], ["sfp_grg_smoke_mag", "sfp_grg_illum_mag"], ""],
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_66_mag", "sfp_grg_heat_66_mag", "sfp_grg_he_mag"], ["sfp_grg_smoke_mag", "sfp_grg_illum_mag"], ""],
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_62_mag","sfp_grg_heat_62_mag", "sfp_grg_he_mag"], ["sfp_grg_smoke_mag", "sfp_grg_illum_mag"], ""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", []];
_loadoutData set ["smokeGrenades", []];
_loadoutData set ["signalsmokeGrenades", []];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["sfp_stridssele_backpack"]];
_loadoutData set ["hvBackpacks", ["sfp_backpack_lk35"]];
_loadoutData set ["latBackpacks", ["sfp_stridssele_backpack_grg"]];
_loadoutData set ["atBackpacks", ["sfp_backpack_grg_loader"]];
_loadoutData set ["slBackpacks", ["sfp_ra180"]];
_loadoutData set ["medBackpacks", ["sfp_backpack_sjvv9"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHats", ["sfp_army_beret"]];
_loadoutData set ["sniHats", ["sfp_m90w_booniehat"]];

_loadoutData set ["facewear", ["G_Bandanna_oli","G_Shades_Black", "", ""]];
_loadoutData set ["medicFacewear", ["sfp_armband_medic","sfp_armband_medic_white"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["sfp_m90w_uniform"]];
_sfLoadoutData set ["vests", ["sfp_stridsvast2000_light","sfp_stridsvast2000","sfp_kroppskydd94_sv2k_rifle1"]];
_sfLoadoutData set ["helmets", ["sfp_m90w_booniehat","sfp_m90green_helmet_clean_peltor_nvg_velcro"]];
_sfLoadoutData set ["slHats", ["sfp_kj_beret"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
["sfp_ak5b", "muzzle_snds_M", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5", "muzzle_snds_M", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["sfp_ak5b", "muzzle_snds_M", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["sfp_ak5_m203", "muzzle_snds_M", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["sfp_mp5_rail", "muzzle_snds_L", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_9mm_mp5"], [], ""],
["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""]]];
_sfLoadoutData set ["shotguns", []];
_sfLoadoutData set ["machineGuns", [
["sfp_ksp90b", "", "", "sfp_optic_aimpoint", ["sfp_200Rnd_556x45_ksp90"], [], ""],
["sfp_ksp58B2", "muzzle_snds_H_MG_blk_F", "", "sfp_optic_3x_aimpoint", ["sfp_50Rnd_762x51_ksp58"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [
["sfp_ak4", "muzzle_snds_B", "", "sfp_optic_hensoldt_4x", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4_irtracer"], [], ""],
["sfp_ak5b", "muzzle_snds_M", "", "sfp_optic_susat_4x", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "muzzle_snds_B", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""],
["sfp_psg90_camo", "muzzle_snds_B", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""],
["sfp_ag90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_10Rnd_127x99_ag90"], [], ""]]];
_sfLoadoutData set ["sidearms", [["CUP_hgun_Glock17_blk", "muzzle_snds_L", "sfp_tlr2", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["sfp_m90w_uniform"]];
_militaryLoadoutData set ["vests", ["sfp_stridsbalte_304k","sfp_stridsbalte_304k_extrabag","sfp_stridsbalte_304k_ar","sfp_stridsbalte_304k_gl","sfp_kroppsskydd94","sfp_kroppskydd94_rifle1"]];
_militaryLoadoutData set ["medVests", ["sfp_stridsbalte_304k_medic"]];
_militaryLoadoutData set ["helmets", ["sfp_m90w_helmet_peltor","sfp_m90w_helmet_peltor_nvg","sfp_m90w_helmet_peltor_nomic"]];

_militaryLoadoutData set ["slRifles", [
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5_m203", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["sfp_ak4", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["sfp_riflegrenade_smoke_ak4"], ""]
]];
_militaryLoadoutData set ["carbines", [
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["sfp_ak4_m203", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""],
["sfp_ak4_m203", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""],
["sfp_ak5_m203", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
"sfp_kpistm45", "sfp_kpistm45", "sfp_kpistm45",
["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""]
]];
_militaryLoadoutData set ["shotguns", [
["sfp_remington870_wood_chrome", "", "acc_flashlight", "", ["sfp_12Gauge_8rd_Slug","sfp_12Gauge_8rd_Pellets"], [], ""],
["sfp_remington870_wood_blue", "", "acc_flashlight", "", ["sfp_12Gauge_8rd_Slug","sfp_12Gauge_8rd_Pellets"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", ["sfp_ksp58"]];
_militaryLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_hensoldt_4x", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], [], ""],
["sfp_ak4", "", "", "sfp_optic_hensoldt_4x", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_susat_4x", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["CUP_hgun_Glock17_blk", "", "sfp_tlr2", "", ["CUP_17Rnd_9x19_glock17"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;


_policeLoadoutData set ["uniforms", ["sfp_m59w_uniform"]];
_policeLoadoutData set ["vests", ["sfp_police_belt"]];
_policeLoadoutData set ["helmets", ["sfp_m37w_helmet_mp_green"]];
_policeLoadoutData set ["facewear", ["sfp_armband_mp"]];

_policeLoadoutData set ["SMGs", ["sfp_kpistm45b"]];
_policeLoadoutData set ["shotguns", [["sfp_remington870_wood_chrome", "", "acc_flashlight", "", ["sfp_12Gauge_8rd_Slug","sfp_12Gauge_8rd_Pellets"], [], ""],["sfp_remington870_wood_blue", "", "acc_flashlight", "", ["sfp_12Gauge_8rd_Slug","sfp_12Gauge_8rd_Pellets"], [], ""]]];
_policeLoadoutData set ["sidearms", [["CUP_hgun_Glock17_blk", "", "sfp_tlr2", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_TaurusTracker455", "", "", "", ["CUP_6Rnd_45ACP_M"], [], ""]]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["sfp_m90w_uniform"]];
_militiaLoadoutData set ["vests", ["sfp_stridssele","sfp_stridssele_extrabag"]];
_militiaLoadoutData set ["medVests", ["sfp_stridssele_medic"]];
_militiaLoadoutData set ["helmets", ["sfp_m90w_cap", "sfp_m90w_cap_alt"]];
_militiaLoadoutData set ["slHats", ["sfp_homeguard_beret"]];

_militiaLoadoutData set ["ATLaunchers", [
["CUP_launch_MAAWS", "", "", "", ["sfp_grg_heat_66_mag", "sfp_grg_heat_66_mag", "sfp_grg_he_mag"], ["sfp_grg_smoke_mag", "sfp_grg_illum_mag"], ""],
["CUP_launch_MAAWS", "", "", "", ["sfp_grg_heat_62_mag","sfp_grg_heat_62_mag", "sfp_grg_he_mag"], ["sfp_grg_smoke_mag", "sfp_grg_illum_mag"], ""]
]];

_militiaLoadoutData set ["rifles", [
["sfp_ak4", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["sfp_riflegrenade_smoke_ak4"], ""]]];
_militiaLoadoutData set ["carbines", [
["sfp_ak4", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["sfp_riflegrenade_smoke_ak4"], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [
["sfp_ak4_m203", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", ["sfp_kpistm45b"]];
_militiaLoadoutData set ["shotguns", [
["sfp_remington870_wood_chrome", "", "acc_flashlight", "", ["sfp_12Gauge_8rd_Slug","sfp_12Gauge_8rd_Pellets"], [], ""],
["sfp_remington870_wood_blue", "", "acc_flashlight", "", ["sfp_12Gauge_8rd_Slug","sfp_12Gauge_8rd_Pellets"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", ["sfp_ksp58a"]];
_militiaLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_hensoldt_4x", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["CUP_hgun_FlareGun", "", "", "", ["CUP_FlareWhite_265_M","CUP_FlareRed_265_M","CUP_FlareGreen_265_M","CUP_FlareYellow_265_M","CUP_IllumFlareWhite_265_M","CUP_IllumFlareRed_265_M","CUP_IllumFlareGreen_265_M","CUP_IllumFlareYellow_265_M","CUP_StarClusterWhite_265_M","CUP_StarClusterRed_265_M","CUP_StarClusterGreen_265_M","CUP_StarClusterYellow_265_M"], [], ""], ""]
];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["sfp_m90p_uniform"]];
_crewLoadoutData set ["vests", ["sfp_kroppskydd94_crew"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];
_crewLoadoutData set ["facewear", ["G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["sfp_m87_flying_suit"]];
_pilotLoadoutData set ["vests", ["sfp_kroppsskydd94"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];
_pilotLoadoutData set ["facewear", ["G_Bandanna_oli", "G_Aviator", "G_Squares_Tinted","G_Bandanna_aviator"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHats"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["slBackpacks"] call _fnc_setBackpack;

    [["slRifles", selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;

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
    ["medicFacewear"] call _fnc_setFacewear;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["medBackpacks"] call _fnc_setBackpack;
	[selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["hvBackpacks"] call _fnc_setBackpack;

    [[selectRandom ["SMGs","shotguns", "carbines"], selectRandom ["SMGs","carbines"]] call _fnc_fallback] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["hvBackpacks"] call _fnc_setBackpack;

    [[selectRandom ["SMGs","shotguns", "carbines"], selectRandom ["SMGs","carbines"]] call _fnc_fallback] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

	private _at = selectRandom ["lightATLaunchers", "ATLaunchers"];
    [_at] call _fnc_setLauncher;
	if (_at == "ATLaunchers") then {
		["latBackpacks"] call _fnc_setBackpack; //use the light grg pack if grg gunner
		["launcher", 2] call _fnc_addMagazines;
	};

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["atBackpacks"] call _fnc_setBackpack;

    [selectRandom ["SMGs", "carbines"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2 + round(random 2)] call _fnc_addMagazines;
    ["launcher", round(random 1)] call _fnc_addAdditionalMuzzleMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["SMGs", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;


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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["shotguns", "SMGs"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

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
private _pilotTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
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
["other", [["Pilot", _pilotTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
