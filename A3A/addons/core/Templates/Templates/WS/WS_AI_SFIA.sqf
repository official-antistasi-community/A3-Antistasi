//////////////////////////
//   Side Information   //
//////////////////////////
["name", "SFIA"] call _fnc_saveToTemplate;
["spawnMarkerName", "SFIA Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_SFIA_lxWS"] call _fnc_saveToTemplate;
["flagTexture", "\lxws\data_f_lxws\img\flags\flag_SFIA_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_SFIA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["O_Tura_Offroad_armor_lxWS"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["O_Tura_Offroad_armor_AT_lxWS","O_Tura_Offroad_armor_armed_lxWS", "O_Tura_Offroad_armor_armed_lxWS", "O_SFIA_Truck_02_aa_lxWS"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["O_SFIA_Truck_02_transport_lxWS","O_SFIA_Truck_02_covered_lxWS"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["O_SFIA_Truck_02_flatbed_lxWS","O_SFIA_Truck_02_cargo_lxWS","O_SFIA_Truck_02_transport_lxWS","O_SFIA_Truck_02_covered_lxWS"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["O_SFIA_Truck_02_Ammo_lxWS"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_SFIA_Truck_02_box_lxWS"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_SFIA_Truck_02_fuel_lxWS"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["a3a_SIFA_Truck_02_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["O_SFIA_APC_Wheeled_02_hmg_lxWS"]] call _fnc_saveToTemplate;
["vehiclesAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", ["a3a_SFIA_APC_Tracked_02_30mm_lxWS", "a3a_SFIA_APC_Tracked_02_cannon_lxWS"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["O_SFIA_MBT_02_cannon_lxWS"]] call _fnc_saveToTemplate;
["vehiclesAA", ["O_SFIA_APC_Tracked_02_AA_lxWS"]] call _fnc_saveToTemplate; 


["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["O_SFIA_APC_Wheeled_02_hmg_lxWS"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F", "a3a_Plane_Fighter_03_grey_F", "a3a_Plane_Fighter_03_grey_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_T_VTOL_02_infantry_hex_F"]] call _fnc_saveToTemplate; 

["vehiclesHelisLight", ["O_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["O_Heli_Transport_04_covered_black_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["O_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _vehiclesHelisAttack = ["O_SFIA_Heli_Attack_02_dynamicLoadout_lxWS"];

["vehiclesArtillery", ["O_SFIA_Truck_02_MRL_lxWS", "O_MBT_02_arty_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["O_SFIA_Truck_02_MRL_lxWS", ["12Rnd_230mm_rockets"]],
["O_MBT_02_arty_F",["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
private _vehiclesMilitiaLightArmed = ["O_SFIA_Offroad_armed_lxWS", "O_SFIA_Offroad_armed_lxWS", "O_SFIA_Offroad_AT_lxWS"];
["vehiclesMilitiaTrucks", ["I_C_Van_02_transport_F", "I_C_Van_01_transport_brown_F"]] call _fnc_saveToTemplate;
private _vehiclesMilitiaCars = ["O_SFIA_Offroad_lxWS"];

private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F"];

["staticMGs", ["O_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_SFIA_ZU23_lxWS"]] call _fnc_saveToTemplate;
["staticMortars", ["O_G_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

if ("expansion" in A3A_enabledDLC) then {
    _vehiclesMilitiaCars append ["I_C_Offroad_02_unarmed_F"];
    _vehiclesMilitiaLightArmed append ["I_C_Offroad_02_AT_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_LMG_F"];
};
if ("enoch" in A3A_enabledDLC) then {
    _vehiclesPolice append ["B_GEN_Offroad_01_comms_F","B_GEN_Offroad_01_covered_F"];
};
if ("orange" in A3A_enabledDLC) then {
    _vehiclesPolice append ["B_GEN_Van_02_vehicle_F","B_GEN_Van_02_transport_F"];
};
if ("rf" in A3A_enabledDLC) then {
    _vehiclesPolice append ["a3a_police_Pickup_rf", "B_GEN_Pickup_covered_rf", "a3a_police_Pickup_comms_rf"];
    _vehiclesMilitiaCars append ["O_Pickup_rf"];
    _vehiclesMilitiaLightArmed append ["a3a_hex_Pickup_mmg_rf","a3a_hex_Pickup_mmg_rf"];
    ["vehiclesHelisLight", ["a3a_sfia_Heli_EC_04_military_rf"]] call _fnc_saveToTemplate;
    ["vehiclesHelisTransport", ["a3a_sfia_Heli_EC_04_military_rf"]] call _fnc_saveToTemplate;
    ["vehiclesHelisLightAttack", ["a3a_sfia_Heli_EC_03_rf"]] call _fnc_saveToTemplate;
    _vehiclesHelisAttack append ["a3a_sfia_Heli_EC_02_rf"];
};
if ("ef" in A3A_enabledDLC) then {
    ["vehiclesGunBoats", ["EF_O_CombatBoat_HMG_OPF", "EF_O_CombatBoat_AT_OPF"]] call _fnc_saveToTemplate;
};
["vehiclesHelisAttack", _vehiclesHelisAttack] call _fnc_saveToTemplate;
["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;


//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSBoundingMine", "APERSMine"]] call _fnc_saveToTemplate;

#include "..\Vanilla\Vanilla_Vehicle_Attributes.sqf"
#include "WS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03",
"lxWS_African_Head_Old","lxWS_African_Head_01","lxWS_African_Head_02",
"lxWS_African_Head_03","lxWS_African_Head_04","lxWS_African_Head_05","lxWS_Said_Head",
"lxWS_African_Head_Old_Bard"]] call _fnc_saveToTemplate;
["voices", ["male01fre", "male02fre", "male03fre"]] call _fnc_saveToTemplate;
"lxWS_WSaharaMen" call _fnc_saveNames;

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

_loadoutData set ["lightATLaunchers", [
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F","MRAWS_HEAT55_F"], [], ""],
["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_F", "", "", "", ["RPG32_HE_F", "RPG32_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_O_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT", "Titan_AP"], [], ""],
["launch_O_Vorona_brown_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


if ("expansion" in A3A_enabledDLC) then {
    _loadoutData set ["lightATLaunchers", [
    "launch_RPG7_F", "launch_RPG7_F",
    ["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
    ["launch_RPG32_F", "", "", "", ["RPG32_HE_F", "RPG32_F"], [], ""]
    ]];
};

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_MilCap_gry"]];
_loadoutData set ["sniHats", ["H_Booniehat_tan"]];
_loadoutData set ["facewear", ["G_Aviator","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Lowprofile","G_Combat","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Bandanna_beast"]];
_loadoutData set ["slFacewear", ["G_Aviator","G_Squares_Tinted","G_Tactical_Black"]];

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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["U_SFIA_deserter_lxWS"]];
_sfLoadoutData set ["vests", ["V_PlateCarrier1_blk", "V_PlateCarrier1_rgr_noflag_F"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrier2_blk", "V_PlateCarrier2_rgr_noflag_F"]];
_sfLoadoutData set ["backpacks", ["B_ViperHarness_oli_F"]];
_sfLoadoutData set ["helmets", ["H_turban_02_mask_black_lxws", "lxWS_H_turban_02_gray","lxWS_H_turban_03_gray"]];
_sfLoadoutData set ["facewear", ["G_Balaclava_blk_lxWS"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["arifle_Katiba_C_F", "muzzle_snds_h", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_Para_lxWS", "muzzle_snds_B_snd_F", "saber_light_ir_sand_lxWS", "optic_Holosight_blk_F", ["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Galat_lxWS", "suppressor_h_arid_lxWS", "saber_light_ir_arid_lxWS", "optic_MRCO", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_VelkoR5_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_GL_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_Katiba_F", "suppressor_m_lxWS", "saber_light_ir_lxWS", "optic_r1_low_lxWS", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "suppressor_m_lxWS", "saber_light_ir_lxWS", "optic_r1_low_lxWS", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_MRCO", ["30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_r1_low_sand_lxWS", ["30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_Katiba_C_F", "muzzle_snds_h", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_SLR_Para_lxWS", "muzzle_snds_B_snd_F", "saber_light_ir_sand_lxWS", "optic_Holosight_blk_F", ["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_VelkoR5_GL_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["glaunch_GLX_lxWS", "", "", "optic_MRCO", ["1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareGreen_F"], ""],
["sgun_aa40_lxWS", "muzzle_snds_12Gauge_lxWS", "acc_pointer_IR_sand_lxWS", "optic_Holosight", ["20Rnd_12Gauge_AA40_HE_Tan_lxWS", "8Rnd_12Gauge_AA40_HE_Tan_lxWS", "8Rnd_12Gauge_AA40_HE_Tan_lxWS"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
["arifle_VelkoR5_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["sgun_aa40_lxWS", "muzzle_snds_12Gauge_lxWS", "acc_pointer_IR", "optic_r1_high_lxWS", ["20Rnd_12Gauge_AA40_Pellets_lxWS"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["LMG_S77_Compact_Snakeskin_lxWS", "", "acc_pointer_IR_snake_lxWS", "optic_Holosight_snake_lxWS", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["LMG_S77_Compact_lxWS", "", "acc_pointer_IR_snake_lxWS", "optic_ACO_grn_smg", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["LMG_S77_Desert_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_Arco_arid_F", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["arifle_Galat_lxWS", "suppressor_h_arid_lxWS", "saber_light_ir_arid_lxWS", "optic_MRCO", ["75Rnd_762x39_Mag_F","75Rnd_762x39_Mag_F","75Rnd_762x39_Mag_Tracer_F"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_MRCO", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_KHS_blk", ["20Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_DMS", ["20Rnd_762x51_slr_lxWS"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_DMS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_LRPS", ["20Rnd_762x51_slr_lxWS"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_ACPC2_F", "muzzle_snds_acp", "", "", [], [], ""],
["hgun_Rook40_F", "muzzle_snds_L", "", "", ["30Rnd_9x21_Mag","16Rnd_9x21_Mag"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _milSights = ["optic_r1_low_lxWS","optic_r1_high_lxWS","optic_ACO_grn"];

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_lxWS_SFIA_soldier_1_O","U_lxWS_SFIA_soldier_2_O"]];
_militaryLoadoutData set ["slUniforms", ["U_lxWS_SFIA_Officer_1_O"]];
_militaryLoadoutData set ["vests", ["V_lxWS_TacVestIR_oli", "V_TacVestIR_blk"]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrier1_rgr_noflag_F", "V_PlateCarrier2_rgr_noflag_F"]];
_militaryLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_militaryLoadoutData set ["backpacks", ["B_Kitbag_tan", "B_Kitbag_cbr", "B_Kitbag_rgr"]];
_militaryLoadoutData set ["helmets", ["lxWS_H_ssh40_sand","lxWS_H_ssh40_green"]];

_militaryLoadoutData set ["slRifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_MRCO", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_D_lxWS", "", "acc_flashlight", selectRandom _milSights, ["20Rnd_762x51_slr_desert_lxWS"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Velko_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "optic_MRCO", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", selectRandom _milSights, ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "", "", selectRandom _milSights, ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "", "", "optic_MRCO", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_Galat_lxWS", "", "", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_GL_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_SLR_V_GL_lxWS", "", "", selectRandom _milSights, ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["hgun_PDW2000_F", "", "", selectRandom _milSights, [], [], ""],
["hgun_PDW2000_F", "", "", selectRandom _milSights, [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["LMG_S77_lxWS", "", "", "", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["LMG_S77_lxWS", "", "", selectRandom _milSights, ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["arifle_Velko_lxWS", "", "", "optic_MRCO", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_SOS", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "", "", "optic_DMS", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["arifle_SLR_V_lxWS", "", "", "optic_KHS_blk", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police","lxWS_H_turban_02_blue","lxWS_H_turban_03_blue"]];

_policeLoadoutData set ["SMGs", [
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_ACO_grn_smg", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_ACO_grn_smg", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_ACPC2_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_lxWS_SFIA_soldier_2_O","U_lxWS_SFIA_deserter"]];
_militiaLoadoutData set ["vests", ["V_lxWS_HarnessO_oli"]];
_militiaLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_khk"]];
_militiaLoadoutData set ["helmets", ["lxWS_H_turban_02_gray","lxWS_H_turban_02_sand","lxWS_H_turban_02_green","lxWS_H_turban_02_black","lxWS_H_turban_03_gray","lxWS_H_turban_03_sand","lxWS_H_turban_03_green","lxWS_H_turban_03_black"]];
_militiaLoadoutData set ["facewear", ["G_Aviator","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Lowprofile"]];
_militiaLoadoutData set ["slHat", ["lxWS_H_turban_01_red", "lxWS_H_turban_02_red", "lxWS_H_turban_03_red"]];
_militiaLoadoutData set ["sniHats", ["lxWS_H_turban_02_sand", "lxWS_H_turban_03_sand"]];

_militiaLoadoutData set ["slRifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]]];
_militiaLoadoutData set ["carbines", [
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_SLR_GL_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_SLR_GL_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_58mm_AT_lxWS","1Rnd_40mm_HE_lxWS","1Rnd_50mm_Smoke_lxWS"], ""]
]];
_militiaLoadoutData set ["SMGs", ["hgun_PDW2000_F"]];
_militiaLoadoutData set ["machineGuns", [
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["75Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["75Rnd_762x39_Mag_Tracer_F", "30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_MRCO", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_SOS", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_ACPC2_F"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_lxWS_SFIA_Tanker_O"]];
_crewLoadoutData set ["vests", ["V_TacVestIR_blk"]];
_crewLoadoutData set ["helmets", ["lxWS_H_Tank_tan_F", "lxWS_H_HelmetCrew_I"]];

_crewLoadoutData set ["carbines", [
["arifle_TRG21_F", "", "acc_pointer_IR", selectRandom _milSights, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_TRG20_F", "", "acc_pointer_IR", selectRandom _milSights, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_lxWS_SFIA_pilot_O"]];
_pilotLoadoutData set ["vests", ["V_TacVestIR_blk"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O","H_CrewHelmetHeli_O"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["slUniforms", ["U_lxWS_SFIA_Officer_1_O", "U_O_ParadeUniform_01_CSAT_F", "U_O_ParadeUniform_01_CSAT_decorated_F"]];
_officerLoadoutData set ["vests", ["V_TacVest_khk", "V_LegStrapBag_coyote_F"]];
_officerLoadoutData set ["helmets", ["H_ParadeDressCap_01_CSAT_F"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["slRifles", [
["arifle_VelkoR5_lxWS", "", "saber_light_lxWS", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F"], [], ""]]];
_officerLoadoutData set ["sidearms", ["hgun_ACPC2_F"]];


if ("expansion" in A3A_enabledDLC) then {
    (_militaryLoadoutData get "rifles") append [
    ["arifle_AK12_F", "", "acc_pointer_IR", selectRandom _milSights, ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
    ];
    (_militaryLoadoutData get "grenadeLaunchers") append [
    ["arifle_AK12_GL_F", "", "acc_pointer_IR", selectRandom _milSights, ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
    ];
    (_militaryLoadoutData get "marksmanRifles") append [
    ["arifle_AK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], "bipod_02_F_blk"]
    ];
    
    (_militiaLoadoutData get "rifles") append [
    ["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]];
    (_militiaLoadoutData get "carbines") append [
    ["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
    ];
    (_militiaLoadoutData get "SMGs") append [
    ["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""]];
    
    _militiaLoadoutData set ["sidearms", ["hgun_Pistol_01_F"]];
    
    (_crewLoadoutData get "carbines") append [
    ["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
    ];
    
    (_pilotLoadoutData get "carbines") append [
    ["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""]
    ];
    (_officerLoadoutData get "slRifles") append [
    ["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""]];
};

if ("enoch" in A3A_enabledDLC) then {

    (_militaryLoadoutData get "carbines") append [
    ["arifle_AK12U_F", "", "acc_pointer_IR", selectRandom _milSights, ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
    ];
    (_militaryLoadoutData get "machineGuns") append [
    ["arifle_RPK12_F", "", "acc_pointer_IR", selectRandom _milSights, ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
    ];
    
    (_pilotLoadoutData get "carbines") append [
    ["arifle_AK12U_F", "", "acc_pointer_IR", selectRandom _milSights, ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
    ];
};
if ("rf" in A3A_enabledDLC) then {
    (_sfLoadoutData get "slRifles") append [
    ["arifle_ash12_desert_RF","suppressor_127x55_small_desert_RF","acc_pointer_IR","optic_Arco_blk_F",["20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF"], [], ""],
    ["arifle_ash12_desert_RF","suppressor_127x55_small_desert_RF","acc_pointer_IR","optic_Arco_blk_F",["20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF"], [], ""]
    ];
    (_sfLoadoutData get "rifles") append [["arifle_ash12_desert_RF","suppressor_127x55_small_desert_RF","acc_pointer_IR","optic_Holosight_blk_F",["20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF"], [], ""]];
    (_sfLoadoutData get "grenadeLaunchers") append [["arifle_ash12_GL_desert_RF", "suppressor_127x55_small_desert_RF", "acc_pointer_IR", "optic_Holosight_blk_F", ["20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF","20Rnd_127x55_Mag_desert_RF"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]];
    (_sfLoadoutData get "marksmanRifles") append [
    ["arifle_ash12_LR_desert_RF","suppressor_127x55_big_desert_RF","acc_pointer_IR","optic_Arco_blk_F",["10Rnd_127x55_Mag_desert_RF","10Rnd_127x55_Mag_desert_RF","10Rnd_127x55_Mag_desert_RF"], [], "bipod_02_F_hex"],
    ["arifle_ash12_LR_desert_RF","suppressor_127x55_big_desert_RF","acc_pointer_IR","optic_DMS",["10Rnd_127x55_Mag_desert_RF","10Rnd_127x55_Mag_desert_RF","10Rnd_127x55_Mag_desert_RF"], [], "bipod_02_F_hex"],
    ["arifle_ash12_LR_desert_RF","suppressor_127x55_big_desert_RF","acc_pointer_IR","optic_SOS",["10Rnd_127x55_Mag_desert_RF","10Rnd_127x55_Mag_desert_RF","10Rnd_127x55_Mag_desert_RF"], [], "bipod_02_F_hex"]  
    ];
    (_sfLoadoutData get "helmets") append [
        "H_HelmetHeavy_Sand_RF",
        "H_HelmetHeavy_Simple_Sand_RF",
        "H_HelmetHeavy_VisorUp_Sand_RF"
    ];
    (_sfLoadoutData get "sidearms") append ["hgun_DEagle_RF"];

    (_policeLoadoutData get "sidearms") append ["hgun_Glock19_RF"];

    _officerLoadoutData set ["sidearms", ["hgun_DEagle_RF","hgun_DEagle_bronze_RF","hgun_DEagle_classic_RF","hgun_DEagle_copper_RF","hgun_DEagle_gold_RF"]];
};

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    ["slFacewear"] call _fnc_setFacewear;

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
    ["facewear"] call _fnc_setFacewear;


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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
    ["backpacks"] call _fnc_setBackpack;

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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    [["sniHats", "helmets"] call _fnc_fallback]  call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 5] call _fnc_addMagazines;

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
    [["sniHats", "helmets"] call _fnc_fallback]  call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 6] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 3] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
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
    ["handgun", 4] call _fnc_addMagazines;
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
["other", [["Official", _squadLeaderTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;