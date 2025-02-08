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

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["I_E_Quadbike_01_F"]] call _fnc_saveToTemplate;
private _LightUnarmed = ["I_E_Offroad_01_F", "I_E_Offroad_01_comms_F", "I_E_Offroad_01_covered_F"];
private _LightArmed = ["a3a_Offroad_01_ldf_armed_F", "a3a_Offroad_01_ldf_AT_F"];
["vehiclesTrucks", ["I_E_Truck_02_transport_F", "I_E_Truck_02_F"]] call _fnc_saveToTemplate;
private _cargoTrucks = ["I_E_Truck_02_transport_F", "I_E_Truck_02_F"];
["vehiclesAmmoTrucks", ["I_E_Truck_02_Ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["I_E_Truck_02_Box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["I_E_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["I_E_Truck_02_Medical_F", "Aegis_I_E_APC_Wheeled_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
private _APCs = ["Aegis_I_E_APC_Wheeled_01_cannon_v2_F", "a3a_Aegis_I_E_APC_Wheeled_01_cannon_v2_F", "I_E_APC_tracked_03_cannon_v2_F"];
["vehiclesIFVs", ["a3a_I_E_APC_tracked_03_cannon_v2_F"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["Aegis_I_E_MBT_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["B_W_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["Aegis_I_E_APC_Wheeled_01_cannon_v2_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["I_E_Plane_Fighter_04_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["I_E_Plane_Fighter_04_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_T_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate;

private _vehiclesHelisLight = ["I_E_Heli_light_03_unarmed_F"];
private _HelisTransport = ["I_E_Heli_light_03_unarmed_F"];
private _vehiclesHelisLightAttack = ["I_E_Heli_light_03_dynamicLoadout_F"];
private _vehiclesHelisAttack = ["Aegis_I_EAF_Heli_Attack_04_F"];

["vehiclesArtillery", ["B_W_MBT_01_arty_F", "I_E_Truck_02_MRL_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["B_W_MBT_01_arty_F", ["32Rnd_155mm_Mo_shells"]],
["I_E_Truck_02_MRL_F", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_W_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["I_E_UAV_01_F"]] call _fnc_saveToTemplate;

private _vehiclesMilitiaLightArmed = ["a3a_Offroad_01_ldf_armed_F", "a3a_Offroad_01_ldf_AT_F"];
private _vehiclesMilitiaTrucks = ["I_E_Truck_02_F"];
private _vehiclesMilitiaCars = ["I_E_Offroad_01_F", "I_E_Offroad_01_comms_F", "I_E_Offroad_01_covered_F"];

private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F","B_GEN_Offroad_01_comms_F","B_GEN_Offroad_01_covered_F"];

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_E_Static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["I_E_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//If DLC
if ("ws" in A3A_enabledDLC) then {
    _cargoTrucks append ["I_E_Truck_02_cargo_lxWS","I_E_Truck_02_flatbed_lxWS"];
	_APCs append ["Aegis_I_E_APC_Wheeled_01_atgm_v2"];
    ["uavsPortable", ["I_E_UAV_01_F", "I_UAV_02_lxWS"]] call _fnc_saveToTemplate;
};
if ("orange" in A3A_enabledDLC) then {
    _vehiclesPolice append ["I_E_Van_02_transport_MP_F"];
    _vehiclesMilitiaTrucks append ["I_E_Van_02_transport_F", "I_E_Van_02_vehicle_F"];
};
if ("rf" in A3A_enabledDLC) then {
    _LightUnarmed append ["I_E_Pickup_rf"];
    _LightArmed append ["a3a_LDF_Pickup_mmg_rf"];
	_vehiclesPolice append ["a3a_police_Pickup_rf", "B_GEN_Pickup_covered_rf", "a3a_police_Pickup_comms_rf"];
    _HelisTransport append ["I_E_Heli_EC_01A_military_RF"];
    _vehiclesHelisLight append ["I_E_Heli_light_03_unarmed_RF"];
    _vehiclesHelisLightAttack append ["a3a_LDF_Heli_light_03_dynamicLoadout_rf"];
    _vehiclesHelisAttack append ["a3a_LDF_Heli_EC_02_rf"];
    _vehiclesMilitiaCars append ["I_E_Pickup_rf"];
    _vehiclesMilitiaLightArmed append ["a3a_LDF_Pickup_mmg_rf"];
};

["vehiclesHelisTransport", _HelisTransport] call _fnc_saveToTemplate;
["vehiclesHelisLight", _vehiclesHelisLight] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _vehiclesHelisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _vehiclesHelisAttack] call _fnc_saveToTemplate;

["vehiclesLightUnarmed", _LightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _LightArmed] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;

["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _vehiclesMilitiaTrucks] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_6","LivonianHead_9","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01pol","Male02pol","Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

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
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_I_Titan_eaf_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

//Basically all the clothing which the units use.
//don't fill these lines - this is only to set the variables.
_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_EAF_01_F"]];
_loadoutData set ["sniHats", ["H_Booniehat_eaf"]];

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
_sfLoadoutData set ["uniforms", ["U_I_E_Uniform_01_F", "U_I_E_Uniform_01_shortsleeve_F", "U_I_E_Uniform_01_tanktop_F", "U_I_E_Uniform_01_sweater_F"]];
_sfLoadoutData set ["vests", ["Aegis_V_CarrierRigKBT_01_recon_EAF_F", "V_TacVest_camo"]];
_sfLoadoutData set ["Hvests", ["Aegis_V_CarrierRigKBT_01_cqb_EAF_F"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_eaf_F", "B_Carryall_eaf_F", "B_Kitbag_eaf_F", "B_FieldPack_green_F", "B_TacticalPack_eaf_F"]];
_sfLoadoutData set ["helmets", ["H_HelmetHBK_headset_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F", "H_HelmetHBK_F", "H_Cap_eaf_hs_F", "H_Watchcap_camo_hs"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_sfLoadoutData set ["slRifles", [
["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", [], [], ""],
["arifle_SCAR_short_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", [], [], ""],
["arifle_SCAR_GL_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", [], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "Aegis_optic_ACOG", [], [], ""],
["arifle_SCAR_short_black_F", "muzzle_snds_B", "acc_pointer_IR", "Aegis_optic_ACOG", [], [], ""],
["arifle_SCAR_GL_black_F", "muzzle_snds_B", "acc_pointer_IR", "Aegis_optic_ACOG", [], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "Aegis_optic_ICO", [], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_SCAR_short_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["arifle_SCAR_short_black_F", "muzzle_snds_B", "acc_pointer_IR", "Aegis_optic_ICO", [], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_SCAR_GL_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", [], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_GL_black_F", "muzzle_snds_B", "acc_pointer_IR", "Aegis_optic_ICO", [], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SMG_03C_black", "muzzle_snds_570", "", "", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "Aegis_optic_ACOG", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "Aegis_optic_ICO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_MRCO", [], [], "bipod_01_F_blk"],
["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "muzzle_snds_acp", "Aegis_acc_pointer_compact_pistol_red", "optic_MRD_black", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_I_E_Uniform_01_F", "U_I_E_Uniform_01_shortsleeve_F", "U_I_E_Uniform_01_tanktop_F"]];
_militaryLoadoutData set ["slUniforms", ["U_I_E_Uniform_01_officer_F"]];
_militaryLoadoutData set ["vests", ["V_CarrierRigKBT_01_light_EAF_F", "Aegis_V_CarrierRigKBT_01_cqb_EAF_F"]];
_militaryLoadoutData set ["Hvests", ["V_CarrierRigKBT_01_heavy_EAF_F", "Aegis_V_CarrierRigKBT_01_tac_olive_F"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_eaf_F", "B_Carryall_eaf_F", "B_Kitbag_eaf_F", "B_FieldPack_green_F", "B_TacticalPack_eaf_F"]];
_militaryLoadoutData set ["helmets", ["H_HelmetHBK_headset_F", "H_HelmetHBK_F"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_militaryLoadoutData set ["slRifles", [
["arifle_MSBS65_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_F", "", "acc_pointer_IR", "optic_Hamr_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_UBS_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"], ""],
["arifle_MSBS65_UBS_F", "", "acc_pointer_IR", "optic_Hamr_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"], ""],
["arifle_MSBS65_UBS_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_MSBS65_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_F", "", "acc_pointer_IR", "optic_ico_01_f", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_MSBS65_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_F", "", "acc_pointer_IR", "optic_ico_01_f", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_MSBS65_GL_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MSBS65_GL_F", "", "acc_pointer_IR", "optic_ico_01_f", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_03C_black", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_Hamr", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", [], [], "bipod_01_F_blk"],["arifle_MSBS65_Mark_F", "", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_F", "", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_F", "", "acc_pointer_IR", "optic_DMS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_I_E_Uniform_01_sweater_F"]];
_policeLoadoutData set ["vests", ["V_CarrierRigKBT_01_EAF_F"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["rifles", [
["arifle_MSBS65_F", "","acc_flashlight", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["SMG_03C_black", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_ACPC2_black_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_I_E_Uniform_01_tanktop_F", "U_I_E_Uniform_01_shortsleeve_F", "U_I_E_Uniform_01_F"]];
_militiaLoadoutData set ["vests", ["V_BandollierB_oli", "V_Chestrig_oli", "V_ChestrigF_oli"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_grn"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_eaf_F", "B_Carryall_eaf_F", "B_Kitbag_eaf_F", "B_FieldPack_green_F", "B_TacticalPack_eaf_F"]];
_militiaLoadoutData set ["helmets", ["H_MilCap_eaf"]];

_militiaLoadoutData set ["rifles", [
["Aegis_arifle_AK74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["Aegis_arifle_AK74_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["Aegis_arifle_AKS74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["Aegis_arifle_AKS74_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""],
["arifle_AKS_alt_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["Aegis_arifle_AK74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["Aegis_arifle_AK74_GL_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_03C_black", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_RPK_F", "", "acc_flashlight_pistol", "", ["75Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["srifle_DMR_01_black_F", "", "acc_flashlight", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_Pistol_heavy_01_green_F", "hgun_ACPC2_black_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_I_E_Uniform_01_shortsleeve_F"]];
_crewLoadoutData set ["vests", ["V_CarrierRigKBT_01_EAF_F"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_I_E_Uniform_01_coveralls_F"]];
_pilotLoadoutData set ["vests", ["V_CarrierRigKBT_01_EAF_F"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_I_E", "H_PilotHelmetHeli_I_E", "H_PilotHelmetHeli_I_E_visor_up"]];

private _traitorLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_traitorLoadoutData set ["uniforms", ["U_I_L_Uniform_01_camo_F"]];
_traitorLoadoutData set ["vests", ["V_TacVest_camo"]];

private _officerLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_I_E_ParadeUniform_01_LDF_F", "U_I_E_ParadeUniform_01_LDF_decorated_F"]];
_officerLoadoutData set ["vests", ["Aegis_V_CarrierRigKBT_01_holster_olive_F"]];
_officerLoadoutData set ["helmets", ["H_ParadeDressCap_01_LDF_F"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["SMGs", [
["Aegis_arifle_AKS74_gold_F", "", "", "", [], [], ""],
["Aegis_arifle_AK74_gold_F", "", "", "", [], [], ""]
]];

if ("mark" in A3A_enabledDLC) then {
    (_sfLoadoutData get "machineGuns") append [
    ["MMG_02_black_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"], 
    ["MMG_02_black_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_blk"],
    ["MMG_02_black_F", "muzzle_snds_338_black", "acc_pointer_IR", "Aegis_optic_ACOG", [], [], "bipod_01_F_blk"]];
    (_sfLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_03_F", "muzzle_snds_B_lush_F", "acc_pointer_IR", "optic_AMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]];
    (_sfLoadoutData get "sniperRifles") append [
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"], 
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"]];

    (_militaryLoadoutData get "machineGuns") append [
    ["MMG_02_black_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"], 
    ["MMG_02_black_F", "", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_blk"],
    ["MMG_02_black_F", "", "acc_pointer_IR", "Aegis_optic_ACOG", [], [], "bipod_01_F_blk"]];
    (_militaryLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_AMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]];
    (_militaryLoadoutData get "sniperRifles") append [
    ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"],
    ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"]];
    
    (_militiaLoadoutData get "marksmanRifles") append [
    ["srifle_DMR_06_olive_F", "", "", "optic_MRCO", ["10Rnd_Mk14_762x51_Mag"], [], ""]];
    (_militiaLoadoutData get "sniperRifles") append [
    ["srifle_DMR_06_olive_F", "", "", "optic_KHS_old", ["10Rnd_Mk14_762x51_Mag"], [], "bipod_01_F_blk"],
    ["srifle_DMR_06_olive_F", "", "", "optic_KHS_blk", ["10Rnd_Mk14_762x51_Mag"], [], ""]];    
};
if ("rf" in A3A_enabledDLC) then {
    _sfLoadoutData set ["sidearms",[
    ["hgun_Glock19_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""],
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", [], [], ""]
    ]];
    (_policeLoadoutData get "sidearms") append ["hgun_Glock19_RF"];
    (_sfLoadoutData get "SMGs") append [
    ["SMG_01_black_RF", "muzzle_snds_acp", "", "optic_Holosight", [], [], ""],
    ["SMG_01_black_RF", "muzzle_snds_acp", "", "optic_Aco_smg", [], [], ""]
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
    "H_HelmetB_plain_sb_geo_RF",
    "H_HelmetHeavy_Olive_RF",
    "H_HelmetHeavy_Simple_Olive_RF",
    "H_HelmetHeavy_VisorUp_Olive_RF"];
    (_militaryLoadoutData get "helmets") append ["H_HelmetB_plain_sb_geo_RF"];
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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

    [["rifles", "SMGs"] call _fnc_fallback] call _fnc_setPrimary;
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
	["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
