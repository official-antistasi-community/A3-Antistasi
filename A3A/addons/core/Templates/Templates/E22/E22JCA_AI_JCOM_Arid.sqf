//////////////////////////
//   Side Information   //
//////////////////////////

["name", "JointCom"] call _fnc_saveToTemplate;
["spawnMarkerName", "JointCom Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "data_f_levi\Logos\arma3_levi_logoOver_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3ae_tp_flag_jointcom"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["E22_B_JTF_D_LSV_02_unarmed_F","E22_B_JTF_D_MRAP_01_F","E22_B_JTF_D_MRAP_03_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["E22_B_JTF_D_MRAP_01_gmg_F","E22_B_JTF_D_MRAP_01_hmg_F","E22_B_JTF_D_MRAP_01_hmg_F","E22_B_JTF_D_MRAP_01_hmg_F","E22_B_JTF_D_MRAP_03_hmg_F","E22_B_JTF_D_MRAP_03_hmg_F","E22_B_JTF_D_MRAP_03_hmg_F","E22_B_JTF_D_MRAP_03_hmg_F"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["E22_B_JTF_D_APC_Wheeled_03_unarmed_F","E22_B_JTF_D_Truck_01_covered_F","E22_B_JTF_D_Truck_01_covered_F","E22_B_JTF_D_Truck_01_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["E22_B_JTF_D_Truck_01_cargo_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["E22_B_JTF_D_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["E22_B_JTF_D_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["E22_B_JTF_D_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["E22_B_JTF_D_Truck_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["E22_B_JTF_D_APC_Wheeled_03_cannon_AA_F","E22_B_JTF_D_APC_Wheeled_03_cannon_F","E22_B_JTF_D_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", []] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesLightTanks", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["E22_B_JTF_D_MBT_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["E22_B_JTF_D_MBT_03_cannon_UP_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["E22_B_JTF_D_APC_Wheeled_03_cannon_AA_F"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored

["vehiclesTransportBoats", ["E22_B_JTF_D_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["E22_B_JTF_D_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["E22_B_JTF_D_APC_Wheeled_03_cannon_AA_F","E22_B_JTF_D_APC_Wheeled_03_cannon_F","E22_B_JTF_D_MRAP_03_hmg_F","E22_B_JTF_D_MRAP_03_hmg_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["E22_B_JTF_D_Plane_Fighter_01_F"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["E22_B_JTF_D_VTOL_01_infantry_F"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["B_Heli_Light_01_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["B_Heli_Light_01_F"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["E22_B_JTF_D_Heli_Transport_01_F","E22_B_JTF_D_Heli_Transport_01_F","E22_B_JTF_D_Heli_Transport_01_F","E22_B_JTF_D_Heli_Transport_01_F","E22_B_JTF_D_Heli_Transport_03_F","E22_B_JTF_D_Heli_Transport_03_unarmed_F"]] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["B_Heli_Light_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["E22_B_JTF_D_Heli_Attack_03_F"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["B_MBT_01_arty_F", ["32Rnd_155mm_Mo_shells"]],
["B_MBT_01_mlrs_F", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["E22_B_JTF_UAV_05_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["E22_B_JTF_D_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["E22_B_JTF_D_LSV_01_AT_F","E22_B_JTF_D_LSV_02_armed_F","E22_B_JTF_D_LSV_02_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["E22_B_JTF_D_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["E22_B_JTF_D_LSV_01_unarmed_F","E22_B_JTF_D_LSV_02_unarmed_F","E22_B_JTF_D_MRAP_03_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["E22_B_JTF_D_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["E22_B_JTF_D_Mortar_01_F"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white_illumination"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","LatinoHead_A3_01","LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_7","LivonianHead_8","LivonianHead_9","RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21","WhiteHead_23","WhiteHead_24","WhiteHead_25","WhiteHead_26","WhiteHead_27","WhiteHead_28","WhiteHead_29","WhiteHead_30","WhiteHead_31","WhiteHead_32","WhiteHead_33"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGB","Male02ENGB","Male03ENGB","Male04ENGB","Male05ENGB"]] call _fnc_saveToTemplate;
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
"JCA_launch_M72_sand_F"
]];
_loadoutData set ["ATLaunchers", [
["JCA_launch_Mk153_sand_F","","","",["JCA_MK153_HEAT_F", "JCA_MK153_HEAT_F", "JCA_MK153_HE_F"],[],""],
["JCA_launch_Mk153_sand_F","","","JCA_optic_AICO_sand",["JCA_MK153_HEAT_F", "JCA_MK153_HEAT_F", "JCA_MK153_HE_F"],[],""],
["JCA_launch_Mk153_PWS_sand_F","","","",["JCA_MK153_HEAT_F", "JCA_MK153_HEAT_F", "JCA_MK153_HE_F"],[],""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_B_Titan_short_F","","","",["Titan_AT"],[],""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_F","","","",["Titan_AA"],[],""]
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
_loadoutData set ["binoculars", ["E22_DigitalBinoculars_01_sand_F"]];
_loadoutData set ["rangefinders", ["Laserdesignator"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["E22_B_RadioBag_01_desert_F"]];
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
_sfLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_Shirt_F","E22_U_CombatUniform_desert_tee_F","E22_U_CombatUniform_desert_Shirt_F"]];
_sfLoadoutData set ["vests", ["E22_V_CarrierRigKBT_01_recon_desert_F","E22_V_CarrierRigKBT_01_light_desert_F","E22_V_CarrierRigKBT_01_CQB_desert_F"]];
_sfLoadoutData set ["backpacks", ["E22_B_CombatPack_desert","E22_B_Kitbag_desert","E22_B_CombatPack_desert","E22_B_CombatPack_desert"]];
_sfLoadoutData set ["helmets", ["E22_H_Cap_desert_Patch_F","E22_H_Cap_desert_F","E22_H_HelmetHBK_desert_F","E22_H_Booniehat_desert_F","E22_H_HelmetHBK_desert_F","E22_H_HelmetHBK_desert_F"]];
_sfLoadoutData set ["facewear", ["E22_G_Shemagh_light_Headset_desert_F","E22_G_Shemagh_light_desert_F","E22_G_Shemagh_Headset_desert_F","E22_G_Shemagh_desert_F","JCA_G_shemagh_01_headset_glasses_sand_F","JCA_G_shemagh_01_glasses_sand_F"]];
_sfLoadoutData set ["slRifles", [
["JCA_arifle_HK433_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_SR10_VFG_sand_F","JCA_muzzle_snds_762_tactical_sand","JCA_acc_DualMount_sand_Pointer","JCA_optic_MRCS_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],""],
["JCA_arifle_HK433_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_HK433_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""]
]];
_sfLoadoutData set ["rifles", [
["JCA_arifle_HK433_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_HK433_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_HK433_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand_magnifier",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_HK437_AFG_sand_F","JCA_muzzle_snds_300_Enhanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_300BLK_Red_sand_EMAG"],[],""],
["JCA_arifle_M4A4_AFG_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_sfLoadoutData set ["carbines", [
["JCA_arifle_HK437_VFG_sand_F","JCA_muzzle_snds_300_Enhanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_300BLK_Red_sand_EMAG"],[],""],
["JCA_arifle_HK437_VFG_sand_F","JCA_muzzle_snds_300_Enhanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_300BLK_Red_sand_EMAG"],[],""],
["JCA_arifle_HK433_short_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_HK433_short_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand_magnifier",["JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Red_sand_EMAG", "JCA_30Rnd_556x45_Tracer_Red_sand_EMAG"],[],""],
["JCA_arifle_M4A1_short_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["JCA_arifle_M4A4_GL_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A4_GL_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A4_GL_sand_F","JCA_muzzle_snds_556_advanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""]
]];
_sfLoadoutData set ["SMGs", [
["JCA_smg_UMP_VFG_sand_F","JCA_muzzle_snds_45_tactical_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_25Rnd_45ACP_UMP_Sand_Mag"],[],""],
["JCA_smg_MP5_VFG_sand_F","JCA_muzzle_snds_9MM_enhanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_9x21_MP5_Sand_Mag"],[],""],
["JCA_smg_MP5_AFG_sand_F","JCA_muzzle_snds_9MM_enhanced_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_9x21_MP5_Sand_Mag"],[],""],
["JCA_smg_UMP_AFG_sand_F","JCA_muzzle_snds_45_tactical_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_25Rnd_45ACP_UMP_Sand_Mag"],[],""],
["JCA_smg_UMP_VFG_sand_F","JCA_muzzle_snds_45_tactical_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_25Rnd_45ACP_UMP_Sand_Mag"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
["MMG_02_sand_F","muzzle_snds_338_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["130Rnd_338_Mag"],[],"JCA_bipod_04_sand"],
["E22_LMG_04_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand_magnifier",["E22_120Rnd_M30JLSW_Box_Red_F"],[],"JCA_bipod_04_sand"]
]];
_sfLoadoutData set ["marksmanRifles", [
["JCA_arifle_SR10_VFG_sand_F","JCA_muzzle_snds_762_tactical_sand","JCA_acc_DualMount_sand_Pointer","JCA_optic_MRCS_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],"JCA_bipod_04_sand"],
["JCA_arifle_SR10_AFG_sand_F","JCA_muzzle_snds_762_tactical_sand","JCA_acc_DualMount_sand_Pointer","JCA_optic_MRCS_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],"JCA_bipod_04_sand"]
]];
_sfLoadoutData set ["sniperRifles", [
["JCA_srifle_M107_sand_F","JCA_muzzle_snds_M107_sand","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRPS_sand",["JCA_10Rnd_127x99_M107_Sand_Mag"],[],"JCA_bipod_M107_sand"],
["JCA_srifle_AWM_sand_F","JCA_muzzle_snds_AWM_sand","","JCA_optic_MRPS_sand",["JCA_5Rnd_338LM_AWM_Mag"],[],"JCA_bipod_AWM_01_black"]
]];
_sfLoadoutData set ["sidearms", [
["JCA_hgun_Mk23_black_F","JCA_muzzle_snds_45_tactical_black","JCA_acc_LaserModule_Mk23_black_Pointer","",["JCA_12Rnd_45ACP_Mk23_Mag"],[],""],
["JCA_hgun_P320_black_F","JCA_muzzle_snds_9MM_enhanced_black","JCA_acc_LightModule_Pistol_black","JCA_optic_PRO_black",["JCA_17Rnd_9x21_P320_Mag"],[],""],
["JCA_hgun_P226_black_F","JCA_muzzle_snds_9MM_enhanced_black","JCA_acc_LightModule_Pistol_black","JCA_optic_MPO_black",["JCA_15Rnd_9x21_P226_Mag"],[],""],
["JCA_hgun_P226_black_F","JCA_muzzle_snds_9MM_enhanced_black","JCA_acc_LightModule_Pistol_black","JCA_optic_MPO_black",["JCA_15Rnd_9x21_P226_Mag"],[],""],
["JCA_hgun_P226_black_F","JCA_muzzle_snds_9MM_enhanced_black","JCA_acc_LightModule_Pistol_black","",["JCA_15Rnd_9x21_P226_Mag"],[],""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_shortsleeve_F","E22_U_CombatUniform_desert_F"]];
_militaryLoadoutData set ["vests", ["E22_V_CarrierRigKBT_01_command_desert_F","E22_V_CarrierRigKBT_01_CQB_desert_F","E22_V_CarrierRigKBT_01_heavy_desert_F","E22_V_CarrierRigKBT_01_combat_desert_F","E22_V_CarrierRigKBT_01_combat_desert_F","E22_V_CarrierRigKBT_01_combat_desert_F","E22_V_CarrierRigKBT_01_combat_desert_F"]];
_militaryLoadoutData set ["backpacks", ["E22_B_Kitbag_desert","E22_B_CombatPack_desert","E22_B_HighCap_desert","E22_B_Kitbag_desert","E22_B_CombatPack_desert"]];
_militaryLoadoutData set ["helmets", ["E22_RAF_H_HelmetHBK_arid_F","E22_RAF_H_HelmetHBK_arid_F","E22_RAF_H_HelmetHBK_arid_F","E22_RAF_H_HelmetHBK_ear_arid_F","E22_RAF_H_HelmetHBK_headset_arid_F"]];
_militaryLoadoutData set ["facewear", ["E22_G_Shemagh_desert_F","E22_G_Shemagh_light_desert_F", "", "", "", "", "", ""]];
_militaryLoadoutData set ["slRifles", [
["JCA_arifle_HK433_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_HK433_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand_magnifier",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_HK433_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_SR10_AFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_MRCS_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],""]
]];
_militaryLoadoutData set ["rifles", [
["JCA_arifle_M4A4_VFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A4_AFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A4_AFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A4_VFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand_magnifier",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_ACOG_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_militaryLoadoutData set ["carbines", [
["JCA_arifle_HK433_short_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_HK437_AFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_30Rnd_300BLK_Red_sand_EMAG"],[],""],
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand_magnifier",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["JCA_arifle_M4A4_GL_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A4_GL_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A4_GL_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A4_GL_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A1_GL_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""]
]];
_militaryLoadoutData set ["SMGs", [
["JCA_smg_UMP_VFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_25Rnd_45ACP_UMP_Sand_Mag"],[],""],
["JCA_smg_UMP_VFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AHO_sand",["JCA_25Rnd_45ACP_UMP_Sand_Mag"],[],""],
["JCA_smg_UMP_AFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["JCA_25Rnd_45ACP_UMP_Sand_Mag"],[],""],
["JCA_smg_MP5_VFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["JCA_30Rnd_9x21_MP5_Sand_Mag"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
["E22_LMG_04_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["E22_120Rnd_M30JLSW_Box_Red_F"],[],""],
["E22_LMG_04_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_IHO_sand",["E22_120Rnd_M30JLSW_Box_Red_F"],[],""],
["E22_LMG_04_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["E22_120Rnd_M30JLSW_Box_Red_F"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["JCA_arifle_SR10_AFG_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],"JCA_bipod_04_sand"],
["JCA_arifle_SR25_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_AICO_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],"JCA_bipod_04_sand"],
["JCA_arifle_SR25_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_CRBS_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],"JCA_bipod_04_sand"],
["JCA_arifle_SR25_sand_F","","JCA_acc_LaserModule_sand_Pointer","JCA_optic_ACOG_sand",["JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Sand_PMAG", "JCA_20Rnd_762x51_Tracer_Red_Sand_PMAG"],[],"JCA_bipod_04_sand"]
]];
_militaryLoadoutData set ["sniperRifles", [
["JCA_srifle_AWM_sand_F","","","JCA_optic_CRBS_sand",["JCA_5Rnd_338LM_AWM_Mag"],[],"JCA_bipod_AWM_01_black"],
["JCA_srifle_AWM_sand_F","","","JCA_optic_MRPS_sand",["JCA_5Rnd_338LM_AWM_Mag"],[],"JCA_bipod_AWM_01_black"],
["JCA_srifle_AWM_sand_F","","","JCA_optic_MRPS_sand",["JCA_5Rnd_338LM_AWM_Mag"],[],"JCA_bipod_AWM_01_black"]
]];
_militaryLoadoutData set ["sidearms", [
["JCA_hgun_P226_sand_F","","JCA_acc_LightMount_Pistol_sand","",["JCA_15Rnd_9x21_P226_Mag"],[],""],
["JCA_hgun_P226_sand_F","","JCA_acc_LightMount_Pistol_sand","",["JCA_15Rnd_9x21_P226_Mag"],[],""],
["JCA_hgun_P226_sand_F","","JCA_acc_LightMount_Pistol_sand","",["JCA_15Rnd_9x21_P226_Mag"],[],""],
["JCA_hgun_P226_sand_F","","JCA_acc_LightMount_Pistol_sand","",["JCA_15Rnd_9x21_P226_Mag"],[],""],
["JCA_hgun_M9A1_sand_F","","","",["JCA_15Rnd_9x21_M9A1_Mag"],[],""]
]];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];
_policeLoadoutData set ["SMGs", [
["JCA_smg_UMP_black_F","","","JCA_optic_IHO_black",["JCA_25Rnd_45ACP_UMP_Mag"],[],""],
["JCA_smg_MP5_FL_black_F","","","",["JCA_30Rnd_9x21_MP5_Mag"],[],""],
["JCA_arifle_M4A1_black_F","","","",["30Rnd_556x45_Stanag_red"],[],""]
]];
_policeLoadoutData set ["sidearms", ["JCA_hgun_P320_black_F"]];

////////////////////////////////30Rnd_556x45_Stanag_Sand_Tracer_Red
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_shortsleeve_F","E22_U_CombatUniform_desert_F","E22_U_CombatUniform_desert_F","E22_U_CombatUniform_desert_F"]];
_militiaLoadoutData set ["vests", ["E22_V_CarrierRigKBT_01_light_desert_F"]];
_militiaLoadoutData set ["backpacks", ["E22_B_Kitbag_desert","E22_B_CombatPack_desert"]];
_militiaLoadoutData set ["helmets", ["E22_H_Cap_desert_F","E22_H_Cap_Military_desert_F","E22_H_HelmetHBK_desert_F","E22_H_HelmetHBK_desert_F","E22_H_HelmetHBK_desert_F"]];
_militiaLoadoutData set ["facewear", ["E22_G_Shemagh_desert_F","E22_G_Shemagh_light_desert_F", "", "", "", "", "", ""]];
_militiaLoadoutData set ["slRifles", [
["JCA_arifle_M4A4_AFG_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_AHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A4_AFG_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_ACOG_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_SR25_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_ACOG_sand",["JCA_20Rnd_762x51_Sand_SMAG"],[],""],
["JCA_arifle_M4A4_AFG_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_militiaLoadoutData set ["rifles", [
["JCA_arifle_M4A1_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand_magnifier",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M16A4_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M16A4_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_ACOG_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""],
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["JCA_arifle_M4A1_GL_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M4A1_GL_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M16A4_GL_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""],
["JCA_arifle_M16A4_GL_sand_F","","JCA_acc_flashlight_tactical_sand","",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"],""]
]];
_militiaLoadoutData set ["SMGs", [
["JCA_smg_MP5_FL_sand_F","","JCA_acc_flashlight_MP5_black","",["JCA_30Rnd_9x21_MP5_Sand_Mag"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
["E22_LMG_04_sand_F","","JCA_acc_flashlight_tactical_sand","",["E22_120Rnd_M30JLSW_Box_Red_F"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["JCA_arifle_SR25_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_ACOG_sand",["JCA_20Rnd_762x51_Sand_SMAG"],[],""]
]];
_militiaLoadoutData set ["sniperRifles", [
["JCA_srifle_AWM_sand_F","","","JCA_optic_CRBS_sand",["JCA_5Rnd_338LM_AWM_Mag"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
["JCA_hgun_M9A1_sand_F","","","",["JCA_15Rnd_9x21_M9A1_Mag"],[],""]
]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["E22_U_Coveralls_desert_F"]];
_crewLoadoutData set ["vests", ["E22_V_CarrierRigKBT_01_crew_desert_F"]];
_crewLoadoutData set ["helmets", ["E22_H_Helmet_Crew_desert_F"]];
_crewLoadoutData set ["carbines", [
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_crewLoadoutData set ["SMGs", [
["JCA_smg_MP5_AFG_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["JCA_30Rnd_9x21_MP5_Sand_Mag"],[],""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["E22_U_Coveralls_desert_F"]];
_pilotLoadoutData set ["vests", ["E22_V_CarrierRigKBT_01_compact_desert_F"]];
_pilotLoadoutData set ["helmets", ["E22_H_Helmet_Heli_JTF_crew_desert_F","E22_H_Helmet_Heli_JTF_desert_F"]];
_pilotLoadoutData set ["carbines", [
["JCA_arifle_M4A1_short_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_Tracer_Red"],[],""]
]];
_pilotLoadoutData set ["SMGs", [
["JCA_smg_MP5_AFG_sand_F","","JCA_acc_flashlight_tactical_sand","JCA_optic_IHO_sand",["JCA_30Rnd_9x21_MP5_Sand_Mag"],[],""]
]];


private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["uniforms", ["E22_U_Coveralls_desert_F"]];
_officerLoadoutData set ["vests", ["E22_V_CarrierRigKBT_01_holster_desert_F"]];
_officerLoadoutData set ["helmets", ["E22_H_Beret_01_JTF_red_F"]];
_officerLoadoutData set ["SMGs", [
["JCA_smg_UMP_AFG_black_F","","","JCA_optic_IHO_black",["JCA_25Rnd_45ACP_UMP_Mag"],[],""]
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
