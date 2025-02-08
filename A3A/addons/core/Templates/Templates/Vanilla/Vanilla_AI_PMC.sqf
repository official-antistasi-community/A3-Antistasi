//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ION"] call _fnc_saveToTemplate;
["spawnMarkerName", "ION Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_ion_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_ION"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
private _vehiclesLightUnarmed = ["B_LSV_01_unarmed_black_F","O_LSV_02_unarmed_black_F","a3a_Offroad_02_black_unarmed_F"];
private _vehiclesLightArmed = ["a3a_LSV_02_AT_black_F","a3a_LSV_01_AT_black_F","O_LSV_02_armed_black_F","B_LSV_01_armed_black_F","O_LSV_02_armed_black_F","B_LSV_01_armed_black_F"];
["vehiclesTrucks", ["a3a_Van_02_black_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["a3a_Van_02_black_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["I_E_Truck_02_Ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["a3a_Van_02_black_service_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["C_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["a3a_Van_02_black_medevac_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["B_APC_Wheeled_01_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["a3a_APC_Wheeled_03_cannon_blufor_F","a3a_B_APC_Wheeled_01_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["a3a_APC_Wheeled_03_cannon_blufor_F"]] call _fnc_saveToTemplate;
private _Tanks = ["a3a_MBT_02_cannon_black_F"];
["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F", "a3a_Boat_Armed_01_hmg_blufor_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["a3a_APC_Wheeled_03_cannon_blufor_F","a3a_B_APC_Wheeled_01_cannon_F","B_APC_Wheeled_01_cannon_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["a3a_Plane_Fighter_03_grey_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["a3a_Plane_Fighter_04_grey_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_blue_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["O_Heli_Light_02_unarmed_F", "a3a_Heli_Light_01_ION_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["a3a_ION_Heli_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["a3a_Heli_Light_01_dynamicLoadout_ION_F", "a3a_Heli_Light_02_black_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["O_Heli_Attack_02_dynamicLoadout_black_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_MBT_01_arty_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["B_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_T_UAV_03_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
private _vehiclesMilitiaLightArmed = ["a3a_Offroad_01_black_armed_F", "a3a_Offroad_01_black_armed_F","a3a_Offroad_02_LMG_black_F","a3a_Offroad_02_LMG_black_F"];
["vehiclesMilitiaTrucks", ["a3a_Van_02_black_vehicle_F"]] call _fnc_saveToTemplate;
private _vehiclesMilitiaCars = ["a3a_Offroad_01_black_F","a3a_Offroad_02_black_unarmed_F"];


private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F"];

["staticMGs", ["O_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_G_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

if ("tanks" in A3A_enabledDLC) then {
    _Tanks append ["a3a_MBT_02_cannon_black_F","a3a_MBT_02_cannon_black_F"]; 
    _Tanks append ["a3a_MBT_04_cannon_black_F","a3a_MBT_04_command_black_F"]; 
};
if ("enoch" in A3A_enabledDLC) then {
    _vehiclesPolice append ["B_GEN_Offroad_01_comms_F","B_GEN_Offroad_01_covered_F"];
    _vehiclesMilitiaCars append ["C_Offroad_01_comms_F", "C_Offroad_01_covered_F"];
};
if ("orange" in A3A_enabledDLC) then {
    _vehiclesPolice append ["B_GEN_Van_02_vehicle_F","B_GEN_Van_02_transport_F"];
};
if ("rf" in A3A_enabledDLC) then {
    _vehiclesPolice = ["B_T_Pickup_rf","a3a_police_Pickup_rf"];

    _vehiclesLightUnarmed append ["a3a_ION_Pickup_rf","a3a_ION_Pickup_rf"];
    _vehiclesLightArmed append ["a3a_ION_Pickup_hmg_rf", "a3a_ION_Pickup_mmg_rf", "a3a_ION_Pickup_hmg_rf", "a3a_ION_Pickup_mmg_rf"];

    ["vehiclesHelisLight", ["a3a_black_Heli_light_03_unarmed_rf", "a3a_Heli_Light_01_ION_F"]] call _fnc_saveToTemplate;
    ["vehiclesHelisTransport", ["a3a_ION_Heli_Transport_02_F", "a3a_ION_Heli_EC_04_military_rf"]] call _fnc_saveToTemplate;
    ["vehiclesHelisLightAttack", ["a3a_Heli_Light_01_dynamicLoadout_ION_F", "a3a_black_Heli_light_03_dynamicLoadout_rf", "a3a_ION_Heli_EC_03_rf"]] call _fnc_saveToTemplate;
    ["vehiclesHelisAttack", ["a3a_ION_Heli_EC_02_rf"]] call _fnc_saveToTemplate;
    
    ["vehiclesAirPatrol", ["a3a_Heli_Light_01_ION_F", "B_GEN_Heli_EC_01_RF"]] call _fnc_saveToTemplate;
};
if ("ef" in A3A_enabledDLC) then {
    ["vehiclesGunBoats", ["EF_B_CombatBoat_HMG_NATO", "EF_B_CombatBoat_AT_NATO"]] call _fnc_saveToTemplate;
};
["vehiclesTanks", _Tanks] call _fnc_saveToTemplate;
["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;   

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSBoundingMine", "APERSMine"]] call _fnc_saveToTemplate;

#include "Vanilla_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
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

_loadoutData set ["lightATLaunchers", [
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F","MRAWS_HEAT55_F"], [], ""],
"launch_NLAW_F",
"launch_NLAW_F",
"launch_RPG7_F", 
"launch_RPG7_F"
]];
_loadoutData set ["ATLaunchers", [
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT", "Titan_AP"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""],
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_olive_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
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
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

_loadoutData set ["slHat", ["H_MilCap_gry"]];
_loadoutData set ["sniHats", ["H_Booniehat_tan"]];
_loadoutData set ["facewear", ["G_Aviator","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Lowprofile","G_Combat","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Bandanna_beast"]];
_loadoutData set ["slFacewear", ["G_Aviator","G_Squares_Tinted","G_Tactical_Black"]];

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
_sfLoadoutData set ["uniforms", ["U_B_CTRG_2","U_I_G_Story_Protagonist_F","U_B_CombatUniform_mcam_tshirt"]];
_sfLoadoutData set ["vests", ["V_PlateCarrier1_blk","V_PlateCarrier2_blk","V_PlateCarrierGL_blk", "V_PlateCarrierSpec_blk"]];
_sfLoadoutData set ["Lvests", ["V_TacVestIR_blk"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrierGL_blk", "V_PlateCarrierSpec_blk"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_blk", "B_Carryall_blk", "B_FieldPack_blk", "B_Kitbag_tan"]];
_sfLoadoutData set ["helmets", ["H_HelmetB_sand", "H_HelmetB_black", "H_HelmetSpecB_blk", "H_HelmetSpecB_sand"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MSBS65_GL_black_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MSBS65_black_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_Hamr_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_GL_Black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_MSBS65_Mark_black_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_MSBS65_black_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "muzzle_snds_h", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MSBS65_GL_black_F", "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SMG_01_F", "muzzle_snds_acp", "", "optic_Holosight_blk_F", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "optic_Holosight_blk_F", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Aco", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F","30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F","30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Aco", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "muzzle_snds_h", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["arifle_MXM_Black_F", "muzzle_snds_h", "", "optic_SOS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_B_CTRG_2","U_I_G_Story_Protagonist_F","U_B_CombatUniform_mcam_tshirt"]];
_militaryLoadoutData set ["vests", ["V_PlateCarrier1_blk","V_PlateCarrier2_blk", "V_TacVest_blk", "V_TacVestIR_blk"]];
_militaryLoadoutData set ["Lvests", ["V_TacVest_blk", "V_TacVestIR_blk"]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrierGL_blk", "V_PlateCarrierSpec_blk"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_blk", "B_CivilianBackpack_01_Everyday_Black_F", "B_Kitbag_tan"]];
_militaryLoadoutData set ["helmets", ["H_HelmetB_sand", "H_HelmetB_black", "H_HelmetB_light_black", "H_HelmetB_light_sand","H_PASGT_basic_black_F"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator", "Binocular"]];

_militaryLoadoutData set ["slRifles", [
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Holosight_blk_F", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Holosight_blk_F", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_Aco", ["75rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["75rnd_762x39_AK12_Mag_Tracer_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["LMG_03_F", "", "acc_pointer_IR", "optic_Aco", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""],
["LMG_03_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", [], [], "bipod_01_F_blk"],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "", "optic_DMS", [], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_APDS_Mag", "5Rnd_127x108_Mag", "5Rnd_127x108_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["hgun_Pistol_heavy_01_F","hgun_ACPC2_F","hgun_Rook40_F"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////


private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_blk_ION"]];
_policeLoadoutData set ["SMGs", [
["SMG_05_F", "", "acc_flashlight", "", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "", [], [], ""],
"arifle_AKS_F",
"arifle_AKM_FL_F",
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_Pistol_01_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_B_CTRG_2","U_I_G_Story_Protagonist_F","U_B_CombatUniform_mcam_tshirt"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_blk","V_BandollierB_blk"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_blk", "V_TacVestIR_blk"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_blk"]];
_militiaLoadoutData set ["helmets", ["H_Cap_blk_ION", "H_Cap_usblack", "H_Cap_headphones", "H_HeadSet_black_F"]];

_militiaLoadoutData set ["ATLaunchers", [
"launch_NLAW_F",
"launch_NLAW_F",
"launch_RPG7_F", 
"launch_RPG7_F"
]];
_militiaLoadoutData set ["lightATLaunchers", [
"launch_NLAW_F",
"launch_NLAW_F"
]];

_militiaLoadoutData set ["rifles", [
["arifle_AK12_F", "", "acc_flashlight", "", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_flashlight", "", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
"srifle_DMR_06_hunter_F"
]];
_militiaLoadoutData set ["carbines", [
["arifle_AK12U_F", "", "acc_flashlight", "", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "", "acc_flashlight", "", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
"hgun_PDW2000_F",
"hgun_PDW2000_F",
"SMG_03C_khaki", 
"SMG_03C_black",
["SMG_05_F", "", "acc_flashlight", "", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_RPK12_F", "", "acc_flashlight", "", ["30Rnd_762x39_AK12_Mag_Tracer_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F"], [], ""],
["arifle_RPK12_F", "", "acc_flashlight", "", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["arifle_AK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", [], [], "bipod_01_F_blk"],
["arifle_AK12_F", "", "acc_flashlight", "optic_DMS", [], [], "bipod_01_F_blk"],
["srifle_DMR_06_hunter_F", "", "", "optic_KHS_old", [], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_O_R_Gorka_01_black_F"]];
_crewLoadoutData set ["vests", ["V_TacVest_blk"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];
_crewLoadoutData set ["facewear", ["G_Balaclava_combat","G_Balaclava_lowprofile"]];
_crewLoadoutData set ["SMGs", [
["SMG_03C_TR_black", "", "acc_flashlight", "optic_ACO_grn_smg", [], [], ""],
["SMG_03C_TR_khaki", "", "acc_flashlight", "optic_ACO_grn_smg", [], [], ""],
"SMG_03C_khaki", "SMG_03C_black"
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_Competitor"]];
_pilotLoadoutData set ["vests", ["V_TacVest_blk"]];
_pilotLoadoutData set ["helmets", ["H_Cap_headphones", "H_Cap_headphones", "H_HeadSet_black_F"]];
_pilotLoadoutData set ["facewear", ["G_Aviator","G_Aviator","G_Squares_Tinted","G_Tactical_Black"]];
_pilotLoadoutData set ["SMGs", [
["hgun_PDW2000_F", "", "", "", [], [], ""],
["hgun_PDW2000_F", "", "", "", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "", [], [], ""],
["SMG_05_F", "", "acc_flashlight", "", [], [], ""]
]];

private _officerLoadoutData = _pilotLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_C_FormalSuit_01_tshirt_black_F", "U_Marshal"]];
_officerLoadoutData set ["vests", ["V_TacVest_blk", "V_LegStrapBag_black_F"]];
_officerLoadoutData set ["helmets", ["H_Cap_blk_ION", "H_Cap_blk_ION", "H_WirelessEarpiece_F"]];
_officerLoadoutData set ["facewear", ["G_Aviator","G_Squares_Tinted","G_WirelessEarpiece_F"]];

if ("orange" in A3A_enabledDLC) then {
    _militiaLoadoutData set ["backpacks", ["B_Messenger_Black_F", "B_LegStrapBag_black_F"]];
    (_militiaLoadoutData get "vests") append ["V_Pocketed_black_F","V_LegStrapBag_black_F"];
};
if ("rf" in A3A_enabledDLC) then {
    (_sfLoadoutData get "helmets") append [
        "H_HelmetHeavy_Black_RF", "H_HelmetHeavy_Simple_Black_RF", "H_HelmetHeavy_VisorUp_Black_RF"
    ];
    (_sfLoadoutData get "sidearms") append [
    ["hgun_DEagle_RF", "", "", "optic_VRCO_pistol_RF", [], [], ""],
    ["hgun_Glock19_RF", "muzzle_snds_L", "acc_pointer_IR_pistol_RF", "optic_MRD_black", [], [], ""],
    ["hgun_Glock19_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_black", [], [], ""]
    ];
    
    (_militaryLoadoutData get "Hvests") append ["V_PlateCarrierLite_black_noFlag_RF"];
    (_militaryLoadoutData get "backpacks") append ["B_DuffleBag_Black_RF","B_DuffleBag_Black_NoLogo_RF"];
    (_militaryLoadoutData get "sidearms") append ["hgun_DEagle_RF","hgun_Glock19_Tan_RF","hgun_Glock19_RF"];
    (_militaryLoadoutData get "marksmanRifles") append [
    ["arifle_SPAR_01_blk_F", "", "acc_flashlight", "optic_DMS", ["20Rnd_556x45_AP_Stanag_red_RF"], [], "bipod_01_F_blk"]
    ];
    
    (_militiaLoadoutData get "Hvests") append ["V_TacVest_rig_blk_RF"];
    (_militiaLoadoutData get "marksmanRifles") append [
    ["srifle_h6_blk_rf", "", "acc_flashlight", "optic_DMS", ["10Rnd_556x45_AP_Stanag_RF"], [], "bipod_01_F_blk"]
    ];
    
    _officerLoadoutData set ["sidearms", ["hgun_DEagle_classic_RF"]];
};
if ("mark" in A3A_enabledDLC) then {
    (_sfLoadoutData get "machineGuns") append [
    ["MMG_02_black_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"], 
    ["MMG_02_black_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_blk"]];
    (_sfLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_03_F", "muzzle_snds_B", "acc_pointer_IR", "optic_AMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"], 
    ["srifle_DMR_03_F", "muzzle_snds_B", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]];
    (_sfLoadoutData get "sniperRifles") append [
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"], 
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"]];
    
    (_militaryLoadoutData get "machineGuns") append [
    ["MMG_02_black_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"], 
    ["MMG_02_black_F", "", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_blk"]
    ];
    (_militaryLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_AMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"], 
    ["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"], 
    ["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_SOS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]];
    (_militaryLoadoutData get "sniperRifles") append [
    ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"],
    ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"]];
};
if ("ef" in A3A_enabledDLC) then {
    (_sfLoadoutData get "slRifles") append [
    ["ef_arifle_mxar_black", "ef_snds_mxar", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["ef_arifle_mxar_gl_black", "ef_snds_mxar", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
    ];
    (_sfLoadoutData get "rifles") append [
    ["ef_arifle_mxar_black", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
    ];
    (_sfLoadoutData get "grenadeLaunchers") append [
    ["ef_arifle_mxar_gl_black", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
    ];

    (_sfLoadoutData get "marksmanRifles") append [
    ["arifle_MXM_Black_F", "ef_snds_mxar", "", "ef_optic_mbs", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "muzzle_snds_B", "", "ef_optic_mbs", [], [], "bipod_01_F_blk"]
    ];
    (_sfLoadoutData get "sniperRifles") append [
    ["srifle_LRR_F", "", "", "ef_optic_mbs", [], [], ""],
    ["srifle_DMR_02_camo_F", "muzzle_snds_338_green", "", "ef_optic_mbs_khk", [], [], "bipod_01_F_mtp"]
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
    ["slHat"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["Hvests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [ selectRandom [["slRifles", "rifles"] call _fnc_fallback,"grenadeLaunchers", "rifles", "carbines"]] call _fnc_setPrimary;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
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
    ["facewear"] call _fnc_setFacewear;
    [[selectRandom ["Lvests", "vests"], "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
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
    ["Hvests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;


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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
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
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    [["Lvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    [["Lvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["facewear"] call _fnc_setFacewear;
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
