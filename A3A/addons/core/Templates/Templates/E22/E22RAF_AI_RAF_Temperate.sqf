//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Russia"] call _fnc_saveToTemplate;
["spawnMarkerName", "Russian Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\a3\UI_F_Enoch\Data\CfgMarkers\Russia_CA.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Russia"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
private _vehiclesLightUnarmed = ["E22_O_RAF_APC_Wheeled_02_unarmed_F","E22_O_RAF_MRAP_02_F"];
private _vehiclesLightArmed = ["E22_O_RAF_MRAP_02_gmg_F","E22_O_RAF_MRAP_02_hmg_F","E22_O_RAF_MRAP_02_hmg_F"];
["vehiclesTrucks", ["E22_O_RAF_Truck_03_covered_F","E22_O_RAF_Truck_03_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["E22_O_RAF_Truck_03_transport_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["E22_O_RAF_Truck_02_ammo_F","E22_O_RAF_Truck_03_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["E22_O_RAF_Truck_02_box_F","E22_O_RAF_Truck_03_repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["E22_O_RAF_Truck_02_fuel_F","E22_O_RAF_Truck_03_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["E22_O_RAF_APC_Tracked_02_medical_F","E22_O_RAF_APC_Wheeled_02_medical_F","E22_O_RAF_Truck_02_medical_F","E22_O_RAF_Truck_03_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["E22_O_RAF_APC_Wheeled_02_rcws_F"]] call _fnc_saveToTemplate;
_vehiclesIFVs = ["E22_O_RAF_APC_Tracked_02_cannon_AT_F"];
["vehiclesLightTanks", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["E22_O_RAF_MBT_02_cannon_F"]] call _fnc_saveToTemplate;
private _vehiclesHeavyTanks = [];
private _vehiclesAA = ["E22_O_RAF_APC_Tracked_02_AA_F"];

["vehiclesTransportBoats", ["E22_O_RAF_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["E22_O_RAF_APC_Wheeled_02_rcws_F"]] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["E22_O_RAF_Plane_CAS_02_dynamicLoadout_F"];
private _vehiclesPlanesAA = ["E22_O_RAF_Plane_Fighter_02_F"];
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["E22_O_RAF_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["E22_O_RAF_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["E22_O_RAF_Heli_Transport_04_bench_F","E22_O_RAF_Heli_Transport_04_covered_F"]] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["E22_O_RAF_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
private _vehiclesHelisAttack = ["E22_O_RAF_Heli_Attack_02_dynamicLoadout_F"];

private _vehiclesArtillery = ["E22_O_RAF_MBT_02_arty_F","E22_O_RAF_Truck_02_MRL_F"];
["magazines", createHashMapFromArray [
["E22_O_RAF_MBT_02_arty_F", ["32Rnd_155mm_Mo_shells_O"]],
["E22_O_RAF_Truck_02_MRL_F", ["12Rnd_230mm_rockets"]],
["min_rf_2b26", ["40Rnd_min_rf_122mm_grad"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["E22_O_RAF_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["E22_O_RAF_UAV_01_F"];

//Config special vehicles
["vehiclesMilitiaLightArmed", ["E22_O_RAF_LSV_02_armed_F","E22_O_RAF_LSV_02_armed_F","E22_O_RAF_LSV_02_AT_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["E22_O_RAF_Truck_02_covered_F","E22_O_RAF_Truck_02_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["E22_O_RAF_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;

private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F"];

["staticMGs", ["O_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["E22_O_RAF_Mortar_01_F"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white_illumination"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

if ("tanks" in A3A_enabledDLC) then {
	_vehiclesHeavyTanks = ["O_R_MBT_04_cannon_F", "O_R_MBT_04_command_F"];
};
if ("rf" in A3A_enabledDLC) then {
    _vehiclesPolice append ["a3a_police_Pickup_rf", "B_GEN_Pickup_covered_rf", "a3a_police_Pickup_comms_rf"];
};

if (isClass (configFile >> "CfgVehicles" >> "min_rf_t_15")) then {
    _vehiclesLightUnarmed append ["min_rf_gaz_2330", "min_rf_gaz_2330", "min_rf_gaz_2330"];
    _vehiclesLightArmed append ["min_rf_gaz_2330_HMG", "min_rf_gaz_2330_HMG", "min_rf_gaz_2330_HMG"];
    _vehiclesIFVs append ["min_rf_t_15"];
    _vehiclesHeavyTanks = ["min_rf_t_14"];
    _vehiclesAA append ["min_rf_sa_22", "E22_O_RAF_APC_Tracked_02_AA_F"];
    _vehiclesPlanesCAS append ["min_rf_su_34"];
    _vehiclesPlanesAA append ["min_rf_su_34"];
    _vehiclesHelisAttack append ["min_rf_ka_52"];
    _vehiclesArtillery append ["min_rf_2b26", "E22_O_RAF_MBT_02_arty_F"];
    _uavsPortable append ["min_rf_pchela_1t"];
};


["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesIFVs", _vehiclesIFVs] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", _vehiclesHeavyTanks] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _vehiclesHelisAttack] call _fnc_saveToTemplate;
["vehiclesArtillery", _vehiclesArtillery] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;

#include "E22RAF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_7","LivonianHead_8","LivonianHead_9","RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

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
["launch_RPG7_F","","","",["RPG7_F"],[],""]
]];
_loadoutData set ["ATLaunchers", [
["E22_RAF_launch_RPG32_black_F","","","",["RPG32_F", "RPG32_HE_F"],[],""]
]];
_loadoutData set ["missileATLaunchers", [
["E22_RAF_launch_Vorona_black_F","","","",["Vorona_HEAT","Vorona_HE"],[],""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_olive_F","","","",["Titan_AA"],[],""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellRed","SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["E22_RAF_NVG_green_F"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["E22_RAF_B_RadioBag_lesnoy"]];
_loadoutData set ["helmets", []];

_loadoutData set ["facewear", [""]];

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
_sfLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_lesnoy_shortsleeve_F","E22_RAF_U_CombatUniform_01_shirt_lesnoy_F","E22_RAF_U_CombatUniform_01_tanktop_lesnoy_F"]];
_sfLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_tactical_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_recon_lesnoy_F"]];
_sfLoadoutData set ["backpacks", ["E22_RAF_B_CombatPack_lesnoy","E22_RAF_B_TacticalPack_lesnoy"]];
_sfLoadoutData set ["helmets", ["E22_RAF_H_HelmetHBK_lesnoy_F","E22_RAF_H_HelmetHBK_lesnoy_F","E22_RAF_H_HelmetHBK_chops_lesnoy_F","E22_RAF_H_HelmetHBK_ear_lesnoy_F","E22_RAF_H_HelmetHBK_headset_lesnoy_F"]];
_sfLoadoutData set ["facewear", ["G_Bandanna_oli","G_Bandanna_blk","G_Aviator","G_Lowprofile"]];
_sfLoadoutData set ["slRifles", [
["E22_RAF_arifle_AK12_GL_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"],""],
["arifle_AK12_GL_F","muzzle_snds_B","acc_pointer_IR","optic_MRCO",["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F", "30Rnd_762x39_AK12_Mag_Tracer_F"],["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"],""],
["E22_RAF_arifle_AK12_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["arifle_AK12_F","muzzle_snds_B","acc_pointer_IR","optic_MRCO",["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F", "30Rnd_762x39_AK12_Mag_Tracer_F"],[],""]
]];
_sfLoadoutData set ["rifles", [
["E22_RAF_arifle_AK12_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["arifle_AK12_F","muzzle_snds_B","acc_pointer_IR","optic_MRCO",["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"],[],""]
]];
_sfLoadoutData set ["carbines", [
["E22_RAF_arifle_AK12_U_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_U_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_U_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["arifle_AK12U_F","muzzle_snds_B","acc_pointer_IR","optic_ACO_grn",["30Rnd_762x39_AK12_Mag_F"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["E22_RAF_arifle_AK12_GL_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["E22_RAF_arifle_AK12_GL_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["E22_RAF_arifle_AK12_GL_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["arifle_AK12_GL_F","muzzle_snds_B","acc_pointer_IR","optic_ACO_grn",["30Rnd_762x39_AK12_Mag_F"],["1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],""]
]];
_sfLoadoutData set ["SMGs", [
["SMG_02_F","muzzle_snds_L","acc_pointer_IR","optic_ACO_grn",["30Rnd_9x21_Mag_SMG_02"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
["E22_RAF_arifle_RPK12_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_RPK12_black_F","E22_RAF_muzzle_snds_545_black","acc_pointer_IR","optic_MRCO",["E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Tracer_Green_F"],[],""],
["arifle_RPK12_F","muzzle_snds_B","acc_pointer_IR","optic_MRCO",["75rnd_762x39_AK12_Mag_F"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
["E22_RAF_srifle_DMR_01_black_F","muzzle_snds_B","acc_pointer_IR","optic_SOS",["E22_RAF_10Rnd_762x54_VS121_Mag_black_F", "E22_RAF_10Rnd_762x54_VS121_Mag_black_Tracer_Green_F"],[],"bipod_02_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["E22_RAF_srifle_SVD12_black_F","muzzle_snds_B","","optic_KHS_blk",["E22_RAF_16Rnd_762x54_SVD12_Mag_black_Green_F", "E22_RAF_16Rnd_762x54_SVD12_Mag_black_Green_F","E22_RAF_16Rnd_762x54_SVD12_Mag_black_Tracer_Green_F"],[],""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Rook40_F","","","",["16Rnd_9x21_Mag"],[],""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

// 30Rnd_762x39_AK12_Mag_Tracer_F, E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F, E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F
// 1Rnd_Smoke_Grenade_shell, 1Rnd_SmokeRed_Grenade_shell, 1Rnd_SmokeBlue_Grenade_shell
// E22_RAF_75Rnd_545x39_RPK12_Mag_black_Tracer_Green_F, E22_RAF_16Rnd_762x54_SVD12_Mag_black_Tracer_Green_F, E22_RAF_10Rnd_762x54_VS121_Mag_black_Tracer_Green_F

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_lesnoy_F","E22_RAF_U_CombatUniform_01_lesnoy_F","E22_RAF_U_CombatUniform_01_lesnoy_F","E22_RAF_U_CombatUniform_01_sweater_lesnoy_F","E22_RAF_U_CombatUniform_01_lesnoy_shortsleeve_F"]];
_militaryLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_light_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_heavy_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_CQB_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_command_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_combat_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_combat_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_combat_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_combat_lesnoy_F","E22_RAF_V_CarrierRigKBT_01_combat_lesnoy_F"]];
_militaryLoadoutData set ["backpacks", ["E22_RAF_B_Kitbag_lesnoy","E22_RAF_B_CombatPack_lesnoy","E22_RAF_B_Carryall_lesnoy"]];
_militaryLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Sparrow_enhanced_lesnoy_F","E22_RAF_H_Helmet_Sparrow_headset_lesnoy_cover_F","E22_RAF_H_Helmet_Sparrow_enhanced_lesnoy_cover_F","E22_RAF_H_Helmet_Sparrow_standard_lesnoy_cover_F","E22_RAF_H_Helmet_Sparrow_standard_lesnoy_cover_F","E22_RAF_H_Helmet_Sparrow_standard_lesnoy_cover_F"]];
_militaryLoadoutData set ["slRifles", [
["E22_RAF_arifle_AK12_black_F","","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_black_F","","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_GL_black_F","","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"],""],
["arifle_AK12_F","","","optic_ACO_grn",["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F", "30Rnd_762x39_AK12_Mag_Tracer_F"],[],""]
]];
_militaryLoadoutData set ["rifles", [
["E22_RAF_arifle_AK12_black_F","","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_black_F","","acc_pointer_IR","optic_MRCO",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""]
]];
_militaryLoadoutData set ["carbines", [
["E22_RAF_arifle_AK12_U_black_F","","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_U_black_F","","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["E22_RAF_arifle_AK12_U_black_F","","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_Tracer_Green_F"],[],""],
["arifle_AK12U_F","","","optic_ACO_grn",["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["E22_RAF_arifle_AK12_GL_black_F","","acc_pointer_IR","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_02_F","","","",["30Rnd_9x21_Mag_SMG_02"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
["E22_RAF_arifle_RPK12_black_F","","acc_pointer_IR","optic_MRCO",["E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Tracer_Green_F"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["E22_RAF_srifle_DMR_01_black_F","","acc_pointer_IR","optic_SOS",["E22_RAF_10Rnd_762x54_VS121_Mag_black_F", "E22_RAF_10Rnd_762x54_VS121_Mag_black_F", "E22_RAF_10Rnd_762x54_VS121_Mag_black_Tracer_Green_F"],[],"bipod_02_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["E22_RAF_srifle_SVD12_black_F","","acc_pointer_IR","optic_KHS_blk",["E22_RAF_16Rnd_762x54_SVD12_Mag_black_Green_F"],[],""],
["E22_RAF_srifle_SVD12_black_F","","acc_pointer_IR","optic_SOS",["E22_RAF_16Rnd_762x54_SVD12_Mag_black_Green_F"],[],""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_Rook40_F","","","",["16Rnd_9x21_Mag"],[],""],
["hgun_Rook40_F","","","",["16Rnd_9x21_Mag"],[],""],
["hgun_Rook40_F","","","",["16Rnd_9x21_Mag"],[],""],
["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag"],[],""]
]];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_MilCap_gen_F"]];
_policeLoadoutData set ["SMGs", [
["SMG_05_F","","","",["30Rnd_9x21_Mag_SMG_02"],[],""]
]];
_policeLoadoutData set ["sidearms", [
["hgun_P07_F","","","",["16Rnd_9x21_Mag"],[],""]
]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_shirt_lesnoy_F","E22_RAF_U_CombatUniform_01_shirt_lesnoy_F","E22_RAF_U_CombatUniform_01_sweater_lesnoy_shortsleeve_F","E22_RAF_U_CombatUniform_01_sweater_lesnoy_F","E22_RAF_U_CombatUniform_01_lesnoy_F"]];
_militiaLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_compact_lesnoy_F"]];
_militiaLoadoutData set ["backpacks", ["E22_RAF_B_CombatPack_lesnoy","E22_RAF_B_Kitbag_lesnoy"]];
_militiaLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Sparrow_headset_lesnoy_F","E22_RAF_H_Helmet_Sparrow_standard_lesnoy_F","E22_RAF_H_Helmet_Sparrow_standard_lesnoy_F","E22_RAF_H_Helmet_Sparrow_standard_lesnoy_F","E22_RAF_H_Cap_Military_lesnoy_F","E22_RAF_H_Cap_Military_lesnoy_F"]];
_militiaLoadoutData set ["slRifles", [
["E22_RAF_arifle_AK12_black_F","","","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],[],""]
]];
_militiaLoadoutData set ["rifles", [
["arifle_AK12_F","","","",["30Rnd_762x39_AK12_Mag_F"],[],""],
["arifle_AK12_F","","","optic_ACO_grn",["30Rnd_762x39_AK12_Mag_F"],[],""],
["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F"],[],""],
["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F"],[],""],
["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["arifle_AK12U_F","","","",["30Rnd_762x39_AK12_Mag_F"],[],""],
["arifle_AKS_F","","","",["30Rnd_545x39_Mag_F"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F","","","",["30Rnd_762x39_AK12_Mag_F"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_02_F","","","",["30Rnd_9x21_Mag_SMG_02"],[],""],
["SMG_02_F","","","",["30Rnd_9x21_Mag_SMG_02"],[],""],
["arifle_AKS_F","","","",["30Rnd_545x39_Mag_F"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_RPK12_F","","","",["75rnd_762x39_AK12_Mag_F"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["E22_RAF_srifle_DMR_01_black_F","","","optic_MRCO",["E22_RAF_10Rnd_762x54_VS121_Mag_black_Green_F"],[],"bipod_02_F_blk"],
["arifle_AK12_F","","","optic_MRCO",["30Rnd_762x39_AK12_Mag_F"],[],"bipod_02_F_blk"]
]];
_militiaLoadoutData set ["sniperRifles", [
["E22_RAF_srifle_DMR_01_black_F","","","optic_MRCO",["E22_RAF_10Rnd_762x54_VS121_Mag_black_Green_F"],[],"bipod_02_F_blk"],
["E22_RAF_srifle_SVD12_black_F","","","optic_SOS",["E22_RAF_16Rnd_762x54_SVD12_Mag_black_Green_F"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
["hgun_Rook40_F","","","",["16Rnd_9x21_Mag"],[],""],
["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag"],[],""],
["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag"],[],""],
["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag"],[],""]
]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_lesnoy_shortsleeve_F"]];
_crewLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_crew_lesnoy_F"]];
_crewLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Crew_soft_F"]];
_crewLoadoutData set ["carbines", [
["E22_RAF_arifle_AK12_U_black_F","","","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],[],""],
["E22_RAF_arifle_AK12_U_black_F","","","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],[],""],
["E22_RAF_arifle_AK12_U_black_F","","","",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],[],""],
["arifle_AK12U_F","","","",["30Rnd_762x39_AK12_Mag_F"],[],""]
]];
_crewLoadoutData set ["SMGs", [
["SMG_02_F","","","optic_ACO_grn",["30Rnd_9x21_Mag_SMG_02"],[],""],
["SMG_02_F","","","",["30Rnd_9x21_Mag_SMG_02"],[],""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["E22_RAF_U_coveralls_blue_F"]];
_pilotLoadoutData set ["vests", ["E22_RAF_V_PilotVest_white_F"]];
_pilotLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Heli_VisorUp_white_F","E22_RAF_H_Helmet_Heli_white_F","E22_RAF_H_Helmet_Heli_crew_white_F","E22_RAF_H_Helmet_Heli_crew_white_F"]];
_pilotLoadoutData set ["carbines", [
["E22_RAF_arifle_AK12_U_black_F","","","optic_ACO_grn",["E22_RAF_30Rnd_545x39_AK12_Mag_black_Green_F"],[],""]
]];
_pilotLoadoutData set ["SMGs", [
["SMG_02_F","","","optic_ACO_grn",["30Rnd_9x21_Mag_SMG_02"],[],""]
]];


private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_lesnoy_F"]];
_officerLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_holster_lesnoy_F"]];
_officerLoadoutData set ["helmets", ["E22_RAF_H_Beret_01_red_F"]];
_officerLoadoutData set ["SMGs", [
["arifle_AKS_F","","","",["30Rnd_545x39_Mag_F"],[],""]
]];


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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
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
    ["vests"] call _fnc_setVest;
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
    ["vests"] call _fnc_setVest;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["SquadLeader", _squadLeaderTemplate],
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
