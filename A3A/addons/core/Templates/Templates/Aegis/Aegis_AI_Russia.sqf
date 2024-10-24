//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Russia"] call _fnc_saveToTemplate;
["spawnMarkerName", "Russian Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_Russia_F"] call _fnc_saveToTemplate;
["flagTexture", "a3_aegis\data_f_aegis\flags\flag_rus_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Russia"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["O_R_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["O_R_MRAP_02_F","O_R_MRAP_02_F", "O_R_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["O_R_MRAP_02_gmg_F","O_R_MRAP_02_hmg_F","O_R_MRAP_02_gmg_F","O_R_MRAP_02_hmg_F","O_R_LSV_02_armed_F","O_R_LSV_02_AT_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["O_R_Truck_03_transport_F","O_R_Truck_03_covered_F","O_R_Truck_02_transport_F","O_R_Truck_02_F"]] call _fnc_saveToTemplate;
private _cargoTrucks = ["O_R_Truck_03_transport_F","O_R_Truck_03_covered_F","O_R_Truck_02_transport_F","O_R_Truck_02_F"];
["vehiclesAmmoTrucks", ["O_R_Truck_02_Ammo_F","O_R_Truck_03_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_R_Truck_03_repair_F","O_R_Truck_02_box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_R_Truck_02_fuel_F","O_R_Truck_03_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_R_Truck_02_medical_F","O_R_Truck_03_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
private _APCs = [];
["vehiclesIFVs", ["Aegis_O_R_APC_Tracked_02_30mm_lxWS"]] call _fnc_saveToTemplate;
private _Tanks = ["O_R_MBT_02_cannon_F"];
private _AA = ["O_R_APC_Tracked_02_AA_F"];

["vehiclesTransportBoats", ["O_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_R_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_R_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_T_Plane_Transport_01_infantry_ghex_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["O_R_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["O_R_Heli_Transport_04_bench_F","O_R_Heli_Transport_04_covered_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["O_R_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["O_R_Heli_Attack_02_dynamicLoadout_F", "Aegis_O_R_Heli_Attack_04_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_R_MBT_02_arty_F", "O_R_Truck_02_MRL_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["O_R_MBT_02_arty_F", ["32Rnd_155mm_Mo_shells_O"]],
["O_R_Truck_02_MRL_F", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_R_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["O_R_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["O_R_LSV_02_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_R_Truck_02_transport_F", "O_R_Truck_02_F", "O_R_Truck_03_covered_F", "O_R_Truck_03_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["O_R_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//If Western Sahara DLC
if ("ws" in A3A_enabledDLC) then {
	_cargoTrucks append ["O_R_Truck_02_cargo_F","O_R_Truck_02_flatbed_F"];
	_APCs append ["O_R_APC_Wheeled_04_cannon_F"];
	_AA append ["Aegis_O_R_Truck_02_aa_F"];
};
if ("tanks" in A3A_enabledDLC) then {
	["vehiclesHeavyTanks", ["O_R_MBT_04_cannon_F", "O_R_MBT_04_command_F"]] call _fnc_saveToTemplate;
};
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;
["vehiclesTanks", _Tanks] call _fnc_saveToTemplate; 
["vehiclesAA", _AA] call _fnc_saveToTemplate;


#include "Aegis_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_02","AsianHead_A3_04","AsianHead_A3_07","LivonianHead_1","LivonianHead_10",
"LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_8","LivonianHead_9",
"RussianHead_3","RussianHead_4","RussianHead_5","WhiteHead_01","WhiteHead_02",
"WhiteHead_04","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_18","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [Aegis_launch_RPG7M_F]];
_loadoutData set ["ATLaunchers", [
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_camo_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_O_Titan_short_camo_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""],
["launch_O_Titan_short_camo_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_O_Titan_camo_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade_East", "HandGrenade_Guer"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_ocamo"]];
_loadoutData set ["sniHats", ["H_Booniehat_taiga_hs"]];

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
_sfLoadoutData set ["uniforms", ["U_O_R_Gorka_01_camo_F"]];
_sfLoadoutData set ["slUniforms", ["U_O_R_Gorka_01_F"]];
_sfLoadoutData set ["vests", ["V_SmershVest_01_F", "V_SmershVest_01_radio_F"]];
_sfLoadoutData set ["Hvests", ["V_TacVest_grn"]];
_sfLoadoutData set ["backpacks", ["B_Carryall_taiga_F", "B_FieldPack_taiga_F", "B_AssaultPack_taiga_F"]];
_sfLoadoutData set ["helmets", ["H_HelmetSpecter_cover_taiga_F", "H_HelmetSpecter_cover_khaki_F", "H_HelmetSpecter_headset_F"]];
_sfLoadoutData set ["NVGs", ["O_NVGoggles_grn_F"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_sfLoadoutData set ["slRifles", [
["arifle_AK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12_GL_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_AK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_Holosight_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_ACO_grn_AK_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "Aegis_optic_ROS", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_AK12U_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_Holosight_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_ACO_grn_AK_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "Aegis_optic_ROS", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_Holosight_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_ACO_grn_AK_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "Aegis_optic_ROS", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SMG_03C_TR_hex", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_03C_TR_hex", "muzzle_snds_570", "acc_pointer_IR", "optic_ACO_grn_smg", [], [], ""],
["SMG_03C_TR_hex", "muzzle_snds_570", "acc_pointer_IR", "Aegis_optic_ROS_SMG", [], [], ""],
["SMG_03C_hex", "muzzle_snds_570", "", "", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_ACO_grn_smg", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "Aegis_optic_ROS_SMG", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["arifle_RPK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_Holosight_lush_F", ["75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_RPK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "optic_ACO_grn_AK_F", ["75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_RPK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR", "Aegis_optic_ROS", ["75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS_weathered_Kir_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_02_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Rook40_F", "muzzle_snds_L", "", "", [], [], ""],
["hgun_Mk26_F", "", "Aegis_acc_pointer_compact_pistol_green", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_O_R_CombatUniform_taiga_F", "U_O_R_CombatUniform_taiga_F", "U_O_R_CombatUniform_tshirt_taiga_F"]];
_militaryLoadoutData set ["slUniforms", ["U_O_R_OfficerUniform_taiga_F"]];
_militaryLoadoutData set ["vests", ["Aegis_V_OCarrierLuchnik_Lite_F"]];
_militaryLoadoutData set ["glVests", ["Aegis_V_OCarrierLuchnik_GL_F"]];
_militaryLoadoutData set ["Hvests", ["Aegis_V_OCarrierLuchnik_CQB_F"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_taiga_F", "B_FieldPack_taiga_F", "B_AssaultPack_taiga_F"]];
_militaryLoadoutData set ["helmets", ["H_HelmetLuchnik_cover_grn_F", "H_HelmetLuchnik_cover_rutaiga_F"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_militaryLoadoutData set ["slRifles", [
["arifle_AK12_545_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_GL_545_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_AK12_545_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_pointer_IR", "Aegis_optic_ROS", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_AK12U_545_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_pointer_IR", "Aegis_optic_ROS", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_545_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_pointer_IR", "Aegis_optic_ROS", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["shotGuns", [
["sgun_Mp153_black_F", "", "Aegis_acc_pointer_compact_pistol_green", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_03C_TR_hex", "", "acc_pointer_IR", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_03C_TR_hex", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_hex", "", "acc_pointer_IR", "Aegis_optic_ROS_SMG", [], [], ""],
["SMG_03C_hex", "", "", "", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "Aegis_optic_ROS_SMG", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["Aegis_arifle_RPK12_545_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["Aegis_60Rnd_545x39_AK12_Mag_F", "Aegis_60Rnd_545x39_AK12_Mag_F", "Aegis_60Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["Aegis_arifle_RPK12_545_F", "", "acc_pointer_IR", "optic_ACO_grn", ["Aegis_60Rnd_545x39_AK12_Mag_F", "Aegis_60Rnd_545x39_AK12_Mag_F", "Aegis_60Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["Aegis_arifle_RPK12_545_F", "", "acc_pointer_IR", "Aegis_optic_ROS", ["Aegis_60Rnd_545x39_AK12_Mag_F", "Aegis_60Rnd_545x39_AK12_Mag_F", "Aegis_60Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_DMS_weathered_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_02_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["carbines", [
["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Mag_F"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["sgun_Mp153_black_F", "", "acc_flashlight_pistol", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["SMG_03C_hex", "", "", "", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_Pistol_01_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_O_R_officer_noInsignia_taiga_F"]];
_militiaLoadoutData set ["slUniforms", ["U_O_R_OfficerUniform_taiga_F"]];
_militiaLoadoutData set ["vests", ["Aegis_V_ChestrigEast_RUtaiga_F"]];
_militiaLoadoutData set ["glVests", ["V_TacVest_grn"]];
_militiaLoadoutData set ["Hvests", ["Aegis_V_OCarrierLuchnik_F"]];
_militiaLoadoutData set ["backpacks", ["B_Carryall_taiga_F", "B_FieldPack_taiga_F", "B_AssaultPack_taiga_F"]];
_militiaLoadoutData set ["helmets", ["H_MilCap_taiga"]];

_militiaLoadoutData set ["rifles", [
["Aegis_arifle_AK74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["Aegis_arifle_AK74_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["Aegis_arifle_AKS74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["Aegis_arifle_AKS74_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AKS_alt_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["Aegis_arifle_AK74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["Aegis_arifle_AK74_GL_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_RPK_F", "", "acc_flashlight_pistol", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["srifle_DMR_01_black_F", "", "acc_flashlight", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_Arco_blk_F", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_O_R_CombatUniform_taiga_F"]];
_crewLoadoutData set ["vests", ["V_BandollierB_taiga_F"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_O_R_PilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_Rangemaster_belt_taiga_F"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_O", "H_PilotHelmetHeli_O_visor_up", "H_PilotHelmetHeli_O"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_O_ParadeUniform_01_CSAT_F", "U_O_ParadeUniform_01_CSAT_decorated_F"]];
_officerLoadoutData set ["vests", ["V_Rangemaster_belt_taiga_F"]];
_officerLoadoutData set ["helmets", ["H_ParadeDressCap_01_CSAT_F"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["SMGs", [
["arifle_AK12U_545_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["arifle_AK12U_545_F", "", "acc_pointer_IR", "optic_ACO_grn", [], [], ""],
["arifle_AK12U_545_F", "", "acc_pointer_IR", "Aegis_optic_ROS", [], [], ""]
]];

if ("mark" in A3A_enabledDLC) then {
    (_sfLoadoutData get "machineGuns") append [
    ["MMG_01_hex_F", "muzzle_snds_93mmg", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["MMG_01_hex_F", "muzzle_snds_93mmg", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_02_F_hex"]
    ];

    (_militaryLoadoutData get "machineGuns") append [
    ["MMG_01_hex_F", "", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["MMG_01_hex_F", "", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_02_F_hex"]];
};

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
	["slHat"] call _fnc_setHelmet;
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	[["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

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
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[[selectRandom ["carbines", "shotGuns", "rifles"], selectRandom ["carbines", "rifles"]] call _fnc_fallback] call _fnc_setPrimary;
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

	[[selectRandom ["carbines", "shotGuns", "SMGs"], selectRandom ["carbines", "SMGs"]] call _fnc_fallback] call _fnc_setPrimary;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

    [[selectRandom ["carbines", "shotGuns", "SMGs"], "SMGs"] call _fnc_fallback] call _fnc_setPrimary;
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
["other", [["Official", _policeTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
