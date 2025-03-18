//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3_Aegis\data_f_aegis\Flags\flag_USA_51_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
private _LightUnarmed = ["B_MRAP_01_F"];
private _LightArmed = ["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"];
["vehiclesTrucks", ["B_Truck_01_covered_F", "B_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_Truck_01_cargo_F", "B_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["B_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["B_Truck_01_medical_F", "B_APC_Wheeled_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
private _APCs = ["B_APC_Wheeled_01_cannon_v2_F", "B_APC_Tracked_01_rcws_F"];
["vehiclesIFVs", ["a3a_B_APC_Wheeled_01_cannon_v2_F"]] call _fnc_saveToTemplate;
private _Tanks = ["B_MBT_01_TUSK_F", "B_MBT_01_cannon_F"];
["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["a3a_B_APC_Wheeled_01_cannon_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_Plane_Fighter_01_F", "B_Plane_Fighter_05_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_T_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate;

private _vehiclesHelisLight = ["B_Heli_Light_01_F"];
private _HelisTransport = ["B_Heli_Transport_01_F"];
private _vehiclesHelisLightAttack = ["B_Heli_Light_01_dynamicLoadout_F"];
["vehiclesHelisAttack", ["B_Heli_Attack_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]] call _fnc_saveToTemplate; //this line determines artillery vehicles -- Example: ["vehiclesArtillery", ["B_MBT_01_arty_F"]] -- Array, can contain multiple assets
["magazines", createHashMapFromArray [
    ["B_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]],
    ["B_MBT_01_mlrs_F",["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F", "B_UAV_05_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
private _vehiclesMilitiaLightArmed = ["a3a_Offroad_01_tan_armed_F", "a3a_Offroad_01_tan_AT_F"];
["vehiclesMilitiaTrucks", ["B_Truck_01_covered_F", "B_Truck_01_transport_F"]] call _fnc_saveToTemplate;
private _vehiclesMilitiaCars = ["a3a_Offroad_01_tan_F"];

private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F"];

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//If Western Sahara DLC
if ("ws" in A3A_enabledDLC) then {
    _APCs append ["B_APC_Wheeled_01_atgm_lxWS_v2", "a3a_APC_Wheeled_01_command_lxWS"];
    ["uavsPortable", ["B_UAV_01_F", "B_UAV_02_lxWS"]] call _fnc_saveToTemplate;
};
if ("enoch" in A3A_enabledDLC) then {
    _vehiclesPolice append ["B_GEN_Offroad_01_comms_F","B_GEN_Offroad_01_covered_F"];
    _vehiclesMilitiaCars append ["a3a_Offroad_01_comms_tan_F", "a3a_Offroad_01_covered_tan_F"];
};
if ("tanks" in A3A_enabledDLC) then {
    ["vehiclesLightTanks", ["a3a_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"]] call _fnc_saveToTemplate;
};
if ("expansion" in A3A_enabledDLC) then {
    _LightUnarmed append ["B_MRAP_01_F","B_LSV_01_unarmed_F"];
    _LightArmed append ["B_LSV_01_AT_F","B_LSV_01_armed_F"];
    _HelisTransport append ["B_CTRG_Heli_Transport_01_sand_F"];
};
if ("heli" in A3A_enabledDLC) then {
    _HelisTransport append ["B_Heli_Transport_03_black_F", "B_Heli_Transport_03_unarmed_F"];
};
if ("orange" in A3A_enabledDLC) then {
    _vehiclesPolice append ["B_GEN_Van_02_vehicle_F","B_GEN_Van_02_transport_F"];
};
if ("rf" in A3A_enabledDLC) then {
    _vehiclesPolice append ["a3a_police_Pickup_rf", "B_GEN_Pickup_covered_rf", "a3a_police_Pickup_comms_rf"];
    _HelisTransport append ["B_Heli_EC_04_military_RF"];
    _vehiclesHelisLight append ["B_Heli_light_03_unarmed_RF"];
    _vehiclesHelisLightAttack append ["a3a_Heli_light_03_dynamicLoadout_rf","B_Heli_EC_03_RF"];
    _vehiclesMilitiaCars append ["B_Pickup_rf"];
    _vehiclesMilitiaLightArmed append ["B_Pickup_mmg_rf"];
};

["vehiclesLightUnarmed", _LightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _LightArmed] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;
["vehiclesTanks", _Tanks] call _fnc_saveToTemplate;

["vehiclesHelisLight", _vehiclesHelisLight] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _vehiclesHelisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _HelisTransport] call _fnc_saveToTemplate;

["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;

["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

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
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", ["launch_NLAW_F"]];
_loadoutData set ["ATLaunchers", [
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
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
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_02"]];
_loadoutData set ["sniHats", ["H_Booniehat_mcamo"]];

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
_sfLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam_tshirt"]];
_sfLoadoutData set ["vests", ["V_PlateCarrier1_rgr", "V_TacVest_oli"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrier2_rgr"]];
_sfLoadoutData set ["backpacks", ["B_Kitbag_rgr", "B_Carryall_mcamo", "B_AssaultPack_rgr", "B_AssaultPackSpec_rgr", "B_TacticalPack_rgr"]];
_sfLoadoutData set ["helmets", ["H_HelmetB_light", "H_HelmetSpecB_light", "H_Watchcap_khk_hs", "H_Cap_tan_specops_US_hs"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];

_sfLoadoutData set ["slRifles", [
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ACOG_sand", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ACOG_sand", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MX_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_MXC_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MXC_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MXC_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_MXC_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SMG_01_F", "muzzle_mzls_smg_01", "", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_01_F", "muzzle_mzls_smg_01", "", "optic_Holosight_smg", [], [], ""],
["SMG_01_F", "muzzle_mzls_smg_01", "", "optic_ACO_grn_smg", [], [], ""],
["SMG_01_F", "muzzle_mzls_smg_01", "", "Aegis_optic_ICO", [], [], ""],
["SMG_01_F", "muzzle_mzls_smg_01", "", "Aegis_optic_ICO_sand", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_MRCO", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ACOG", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "Aegis_optic_ACOG_sand", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"]
]];
_sfLoadoutData set ["marksmanRifles", [
["arifle_MXM_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MXM_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MXM_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_DMS", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
["Aegis_arifle_SR25_MR_snd_F", "aegis_muzzle_snds_sr25_snd", "acc_pointer_IR", "optic_SOS", ["Aegis_20Rnd_762x51_Sand_SMAG"], [], "bipod_01_F_snd"],
["Aegis_arifle_SR25_MR_snd_F", "aegis_muzzle_snds_sr25_snd", "acc_pointer_IR", "optic_Hamr", ["Aegis_20Rnd_762x51_Sand_SMAG"], [], "bipod_01_F_snd"],
["Aegis_arifle_SR25_MR_snd_F", "aegis_muzzle_snds_sr25_snd", "acc_pointer_IR", "optic_DMS", ["Aegis_20Rnd_762x51_Sand_SMAG"], [], "bipod_01_F_snd"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_P07_F", "muzzle_snds_L", "Aegis_acc_pointer_compact_pistol_green", "", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_vest"]];
_militaryLoadoutData set ["vests", ["V_PlateCarrier1_mtp", "V_PlateCarrier2_mtp"]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrierSpec_mtp"]];
_militaryLoadoutData set ["glVests", ["V_PlateCarrierGL_mtp"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_mcamo", "B_Kitbag_mcamo", "B_AssaultPack_mcamo", "B_AssaultPackSpec_mcamo", "B_TacticalPack_mcamo"]];
_militaryLoadoutData set ["helmets", ["H_HelmetB_plain_mcamo", "H_HelmetB_camo_mcamo", "H_HelmetSpecB_mcamo"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["arifle_SCAR_L_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_F", "", "acc_pointer_IR", "optic_MRCO", [], [], ""],
["arifle_SCAR_F", "", "acc_pointer_IR", "optic_Hamr", [], [], ""],
["arifle_SCAR_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", [], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_SCAR_L_grip_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_F", "", "acc_pointer_IR", "Aegis_optic_ICO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_F", "", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "Aegis_optic_ICO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "Aegis_optic_ICO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["shotGuns", [
["sgun_KSG_F", "", "", "optic_Holosight_smg_blk_F", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""],
["sgun_KSG_F", "", "", "optic_ACO_grn_smg", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""],
["sgun_KSG_F", "", "", "optic_dcl", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""],
["sgun_KSG_F", "", "", "Aegis_optic_ICO", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_01_black_F", "", "", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_01_black_F", "", "", "optic_ACO_grn_smg", [], [], ""],
["SMG_01_black_F", "", "", "Aegis_optic_ICO", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["LMG_03_snd_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_pointer_IR", "optic_ACO_grn", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_pointer_IR", "Aegis_optic_ICO", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_pointer_IR", "Aegis_optic_ICO_sand", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["srifle_EBR_blk_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["srifle_EBR_blk_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"],
["srifle_EBR_blk_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_snd"],
["Aegis_arifle_SR25_blk_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["Aegis_arifle_SR25_blk_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
["Aegis_arifle_SR25_blk_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_P07_F", "", "Aegis_acc_pointer_compact_pistol_green", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["carbines", [
["Aegis_arifle_M4A1_short_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["Aegis_arifle_M4A1_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["sgun_KSG_F", "", "", "", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["SMG_01_black_F", "", "acc_flashlight_smg_01", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_ACPC2_black_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam_tshirt", "U_I_G_Story_Protagonist_F", "U_B_CombatUniform_mcam_vest"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_rgr", "V_BandollierB_rgr"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPackSpec_mcamo", "B_Kitbag_mcamo", "B_Carryall_mcamo"]];
_militiaLoadoutData set ["helmets", ["H_MilCap_mcamo", "H_HelmetB_light_mcamo", "H_Bandanna_mcamo_hs"]];

_militiaLoadoutData set ["rifles", [
["Aegis_arifle_M4A1_grip_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["Aegis_arifle_M4A1_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["Aegis_arifle_M4A1_short_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["Aegis_arifle_M4A1_GL_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_01_black_F", "", "acc_flashlight_smg_01", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["srifle_EBR_blk_F", "", "acc_flashlight", "optic_Hamr", [], [], "bipod_01_F_snd"]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_ACPC2_black_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam"]];
_crewLoadoutData set ["vests", ["V_PlateCarrier1_wdl"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_B"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_HeliPilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_TacVest_blk"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_B", "H_PilotHelmetHeli_B", "H_PilotHelmetHeli_B_visor_up"]];

private _traitorLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_traitorLoadoutData set ["uniforms", ["U_I_G_Story_Protagonist_F"]];
_traitorLoadoutData set ["vests", ["V_TacVest_camo"]];

private _officerLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_B_ParadeUniform_01_US_F", "U_B_ParadeUniform_01_US_decorated_F"]];
_officerLoadoutData set ["vests", ["V_Rangemaster_belt"]];
_officerLoadoutData set ["helmets", ["H_ParadeDressCap_01_US_F"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["SMGs", [
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "optic_Holosight", [], [], ""],
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "optic_ACO_grn", [], [], ""],
["arifle_SCAR_L_short_F", "", "acc_pointer_IR", "Aegis_optic_ICO_sand", [], [], ""]
]];

if ("mark" in A3A_enabledDLC) then {
    (_sfLoadoutData get "machineGuns") append [
    ["MMG_02_camo_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"], 
    ["MMG_02_camo_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_snd"]];
    (_sfLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_03_tan_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_AMS_snd", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"], 
    ["srifle_DMR_03_tan_F", "muzzle_snds_B_arid_F", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
	["Aegis_arifle_SR25_MR_snd_F", "aegis_muzzle_snds_sr25_snd", "acc_pointer_IR", "optic_AMS_snd", [], [], "bipod_01_F_snd"]];
    
    (_sfLoadoutData get "sniperRifles") append [
    ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_snd"], 
    ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_snd"]];
    
    (_militaryLoadoutData get "machineGuns") append [
    ["MMG_02_sand_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"], 
    ["MMG_02_sand_F", "", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_snd"]
    ];
    (_militaryLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_AMS_snd", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"], 
    ["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"], 
    ["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_SOS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
	["Aegis_arifle_SR25_blk_F", "", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"]];
    (_militaryLoadoutData get "sniperRifles") append [
    ["srifle_DMR_02_sniper_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_snd"],
    ["srifle_DMR_02_sniper_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_snd"]];
};
if ("rf" in A3A_enabledDLC) then {
    (_sfLoadoutData get "sidearms") append [
    ["hgun_Glock19_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""]
    ];
    (_militaryLoadoutData get "sidearms") append [
    ["hgun_Glock19_Tan_RF", "", "acc_flashlight_pistol", "", [], [], ""],
    ["hgun_Glock19_Tan_RF", "", "acc_flashlight_pistol", "", [], [], ""],
    ["hgun_Glock19_Tan_RF", "", "acc_flashlight_pistol", "", [], [], ""],
    ["hgun_Glock19_Tan_RF", "", "acc_flashlight_pistol", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "", "acc_flashlight_pistol", "", [], [], ""]
    ];
    (_policeLoadoutData get "sidearms") append ["hgun_Glock19_RF"];
    (_pilotLoadoutData get "uniforms") append ["U_B_HeliPilotCoveralls_MTP_RF"];
    (_sfLoadoutData get "SMGs") append [
    ["SMG_01_black_RF", "muzzle_snds_acp", "", "optic_Holosight", [], [], ""]
    ];
    (_militaryLoadoutData get "SMGs") append [
    ["SMG_01_black_RF", "", "", "optic_Holosight", [], [], ""],
    ["SMG_01_black_RF", "", "", "optic_Aco_smg", [], [], ""]
    ];
    (_militiaLoadoutData get "SMGs") append [
    ["SMG_01_black_RF", "", "acc_flashlight_smg_01", "", [], [], ""]
    ];
    (_policeLoadoutData get "SMGs") append [
    ["SMG_01_black_RF", "", "acc_flashlight_smg_01", "optic_Holosight", [], [], ""],
    ["SMG_01_black_RF", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""]
    ];
    (_sfLoadoutData get "helmets") append [
    "H_HelmetB_plain_sb_mtp_RF",
    "H_HelmetHeavy_Sand_RF",
    "H_HelmetHeavy_Simple_Sand_RF",
    "H_HelmetHeavy_VisorUp_Sand_RF"];
    (_militaryLoadoutData get "helmets") append ["H_HelmetB_plain_sb_mtp_RF"];
};


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
	["slHat"] call _fnc_setHelmet;
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
	[["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
["other", [["Traitor", _traitorTemplate]], _traitorLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
