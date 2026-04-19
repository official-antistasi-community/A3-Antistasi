//////////////////////////
//   Side Information   //
//////////////////////////

["name", "VDV"] call _fnc_saveToTemplate;
["spawnMarkerName", "VDV Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_rus_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Russia"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_O_Tigr_233011_GREEN_RU","CUP_O_Tigr_233014_GREEN_RU","CUP_O_Tigr_233014_RU","CUP_O_Tigr_M_233114_GREEN_RU","CUP_O_Tigr_M_233114_RU"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_O_Tigr_M_233114_GREEN_KORD_RU","CUP_O_Tigr_M_233114_GREEN_PK_RU","CUP_O_Tigr_M_233114_KORD_RU","CUP_O_Tigr_M_233114_PK_RU"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["CUP_O_Ural_Open_RU","CUP_O_Ural_RU"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CUP_O_Ural_Open_RU"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_O_Kamaz_Reammo_RU","CUP_O_Ural_Reammo_RU"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_O_Kamaz_Repair_RU","CUP_O_Ural_Repair_RU"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_O_Kamaz_Refuel_RU","CUP_O_Ural_Refuel_RU"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_O_Kamaz_6396_medical_RUS_M"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CUP_O_BRDM2_RUS","CUP_O_MTLB_pk_Green_RU","CUP_O_MTLB_pk_WDL_RU"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["CUP_O_BRDM2_RUS","CUP_O_BTR80_CAMO_RU","CUP_O_BTR80A_CAMO_RU"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", []] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesLightTanks", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_O_T90M_CAMO_RU","CUP_O_T90M_RU"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", []] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_O_UAZ_AA_RU","CUP_O_ZSU23_SLA"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["CUP_O_BRDM2_RUS","CUP_O_BTR80_CAMO_RU","CUP_O_BTR80A_CAMO_RU"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_O_Su25_Dyn_RU"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["CUP_O_SU34_RU"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["CUP_O_MI6T_RU"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["CUP_O_Mi8_VIV_RU"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["O_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["CUP_O_Mi8AMT_RU"]] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["CUP_O_Ka60_Grey_RU"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["CUP_O_Ka50_DL_RU","CUP_O_Ka52_RU"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["CUP_O_BM21_RU"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["CUP_O_BM21_RU", ["CUP_40Rnd_GRAD_HE"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["O_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["CUP_O_Pchela1T_RU"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["CUP_O_UAZ_AGS30_RU","CUP_O_UAZ_METIS_RU","CUP_O_UAZ_MG_RU","CUP_O_UAZ_SPG9_RU"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_O_Ural_RU"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_O_UAZ_Open_RU","CUP_O_UAZ_Unarmed_RU"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_O_KORD_high_RUS_M_Summer"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_O_Kornet_RUS_M_Summer","CUP_O_Metis_RUS_M_Summer","CUP_O_SPG9_TK_INS"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_Igla_AA_pod_RUS_M_Summer","CUP_O_ZU23_RUS_M_Summer"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_O_2b14_82mm_RUS_M_Summer"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white_illumination"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", []] call _fnc_saveToTemplate;
["minefieldAPERS", []] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9","RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
"CUP_Names_RussianMen" call _fnc_saveNames;

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
["CUP_launch_RPG18","","","",["CBA_FakeLauncherMagazine"],[],""],
["CUP_launch_RPG26","","","",["CBA_FakeLauncherMagazine"],[],""],
["CUP_launch_RShG2","","","",["CBA_FakeLauncherMagazine"],[],""]
]];
_loadoutData set ["ATLaunchers", [
["CUP_launch_RPG7V","","","CUP_optic_PGO7V3",["CUP_PG7VL_M"],[],""],
["CUP_launch_RPG7V","","","CUP_optic_PGO7V3",["CUP_PG7VM_M"],[],""],
["CUP_launch_RPG7V","","","CUP_optic_PGO7V3",["CUP_PG7VR_M"],[],""]
]];
_loadoutData set ["missileATLaunchers", [
["CUP_launch_Metis","","","",["CUP_AT13_M"],[],""]
]];
_loadoutData set ["AALaunchers", [
["CUP_launch_Igla","","","",["CBA_FakeLauncherMagazine"],[],""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["CUP_MineE_M"]];
_loadoutData set ["APMines", ["APERSTripMine_Wire_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag","CUP_PipeBomb_M"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGD5","CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellRed","SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_HMNVS"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Laserdesignator"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

_loadoutData set ["facewear", []];

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
_sfLoadoutData set ["uniforms", ["CUP_U_O_RUS_Soldier_Gorka_A_Tacs_2"]];
_sfLoadoutData set ["vests", ["CUP_V_O_RUS_6B45_AK_Light_Summer","CUP_V_O_RUS_6B45_AK_Med_Light_Summer","CUP_V_O_RUS_6B45_AK_Med_Radio_Summer"]];
_sfLoadoutData set ["backpacks", ["CUP_B_Raid_bag_SSO_Ataka_2_Swamp","CUP_B_RUS_Raid_bag_Summer","CUP_B_RUS_Backpack"]];
_sfLoadoutData set ["helmets", ["CUP_H_RUS_6B47_SF","CUP_H_RUS_6B47_SF_headset"]];
_sfLoadoutData set ["facewear", ["CUP_G_RUS_Ratnik_Balaclava_EMR_Summer_1"]];
_sfLoadoutData set ["slRifles", [
["CUP_arifle_AS_VAL_VFG","","","CUP_optic_PSO_1_1_open",["CUP_20Rnd_9x39_SP5_VSS_M"],[],""],
["CUP_arifle_AK15_GP34_lush","CUP_muzzle_Bizon","","CUP_optic_1P87_RIS",["CUP_30Rnd_762x39_AK15_Tan_M"],[],""],
["CUP_arifle_AK15_GP34_lush","CUP_muzzle_Bizon","","CUP_optic_CWS_NV",["CUP_30Rnd_762x39_AK15_Tan_M"],[],""],
["CUP_arifle_AK15_lush","CUP_muzzle_Bizon","","CUP_optic_1P87_RIS_woodland",["CUP_30Rnd_762x39_AK15_Tan_M"],[],""]
]];
_sfLoadoutData set ["rifles", [
["CUP_arifle_AK15_lush","CUP_muzzle_Bizon","","CUP_optic_1P87_RIS_woodland",["CUP_30Rnd_762x39_AK15_Tan_M"],[],""],
["CUP_arifle_AK12_wood","CUP_muzzle_TGPA_woodland","","CUP_optic_OKP_7_w_rail",["CUP_30Rnd_545x39_AK12_Green_M"],[],""]
]];
_sfLoadoutData set ["carbines", [
["CUP_arifle_AK107_railed","CUP_muzzle_PBS4","","CUP_optic_MRad",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"],[],""],
["CUP_arifle_AS_VAL_VFG","","","CUP_optic_OKP_7",["CUP_20Rnd_9x39_SP5_VSS_M"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_AK12_GP34_black","CUP_muzzle_snds_KZRZP_AK545","","CUP_optic_OKP_7_rail",["CUP_30Rnd_545x39_AK12_M"],["CUP_1Rnd_HE_GP25_M","CUP_1Rnd_SMOKE_GP25_M","CUP_IlumFlareWhite_GP25_M"],""],
["CUP_arifle_AK15_GP34_black","CUP_muzzle_Bizon","","CUP_optic_OKP_7_rail",["CUP_30Rnd_762x39_AK15_M"],["CUP_1Rnd_HE_GP25_M","CUP_1Rnd_SMOKE_GP25_M","CUP_IlumFlareWhite_GP25_M"],""]
]];
_sfLoadoutData set ["SMGs", [
["CUP_arifle_OTS14_GROZA","CUP_muzzle_snds_groza","","",["CUP_20Rnd_9x39_SP5_GROZA_M"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
["CUP_arifle_RPK74M","CUP_muzzle_TGPA_woodland","","CUP_optic_PSO_1_AK",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"],[],""],
["CUP_lmg_Pecheneg_top_rail_B50_vfg","CUP_muzzle_snds_KZRZP_PK","","CUP_optic_1P87_RIS",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
["CUP_srifle_SVD","CUP_muzzle_snds_KZRZP_SVD","","CUP_optic_GOSHAWK",["CUP_10Rnd_762x54_SVD_M"],[],""],
["CUP_srifle_SVD","CUP_muzzle_snds_KZRZP_SVD","","CUP_optic_PSO_3_open",["CUP_10Rnd_762x54_SVD_M"],[],""]
]];
_sfLoadoutData set ["sniperRifles", [
["CUP_srifle_SVD","CUP_muzzle_snds_KZRZP_SVD","","CUP_optic_PSO_3_open",["CUP_10Rnd_762x54_SVD_M"],[],""],
["CUP_srifle_ksvk","","","CUP_optic_PSO_3",["CUP_5Rnd_127x108_KSVK_M"],[],""]
]];
_sfLoadoutData set ["sidearms", [
["CUP_hgun_PB6P9","CUP_muzzle_PB6P9","","",["CUP_8Rnd_9x18_MakarovSD_M"],[],""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_U_O_RUS_EMR_VDV_gloves_pads"]];
_militaryLoadoutData set ["vests", ["CUP_V_O_RUS_6B45_6Sh117_SPP_AK_Summer","CUP_V_O_RUS_6B45_6Sh117_PKP_Radio_Summer","CUP_V_O_RUS_6B45_6Sh117_AK_Med_Radio_Summer","CUP_V_O_RUS_6B45_6Sh117_VOG_Med_Radio_Light_Summer","CUP_V_O_RUS_6B45_6Sh117_VOG_Radio_Summer"]];
_militaryLoadoutData set ["backpacks", ["CUP_B_RUS_Patrol_bag_Summer","CUP_B_RUS_Patrol_bag_6E5_Summer","CUP_B_RPGPack_Khaki"]];
_militaryLoadoutData set ["helmets", ["CUP_H_RUS_6B47_NV_6M21_6B34U_Summer","CUP_H_RUS_6B47_NV_6M21_Summer","CUP_H_RUS_6B47_NV_6M21_6B34D_Summer","CUP_H_RUS_6B47_NV_6M2_6B34C_Summer","CUP_H_RUS_6B47_6M21_6B34U_Summer","CUP_H_RUS_6B47_6B34C_Summer"]];
_militaryLoadoutData set ["facewear", ["CUP_G_RUS_Ratnik_Balaclava_Green_1"]];
_militaryLoadoutData set ["slRifles", [
["CUP_arifle_AK12_black","","","CUP_optic_1P87_RIS",["CUP_30Rnd_545x39_AK12_M"],[],""],
["CUP_arifle_AK12_black","","","CUP_optic_OKP_7_rail",["CUP_30Rnd_545x39_AK12_M"],[],""],
["CUP_arifle_AK15_black","","","CUP_optic_OKP_7_rail",["CUP_30Rnd_762x39_AK15_M"],[],""],
["CUP_arifle_AK15_black","","","CUP_optic_1P87_RIS",["CUP_30Rnd_762x39_AK15_M"],[],""]
]];
_militaryLoadoutData set ["rifles", [
["CUP_arifle_AK12_black","","","CUP_optic_1P87_RIS",["CUP_30Rnd_545x39_AK12_M"],[],""],
["CUP_arifle_AK12_black","","","CUP_optic_OKP_7_rail",["CUP_30Rnd_545x39_AK12_M"],[],""],
["CUP_arifle_AK12_black","","","",["CUP_30Rnd_545x39_AK12_M"],[],""],
["CUP_arifle_AK74M_railed_afg","","","CUP_optic_OKP_7_rail",["CUP_30Rnd_545x39_AK74M_M"],[],""],
["CUP_arifle_AK74M","","","CUP_optic_ekp_8_02",["CUP_30Rnd_545x39_AK74M_M"],[],""],
["CUP_arifle_AK74M","","","CUP_optic_1p63",["CUP_30Rnd_545x39_AK74M_M"],[],""],
["CUP_arifle_AK74M","","","CUP_optic_PechenegScope",["CUP_30Rnd_545x39_AK74M_M"],[],""]
]];
_militaryLoadoutData set ["carbines", [
["CUP_arifle_AK12_AFG_black","","","",["CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_AK12_GP34_black","","","",["CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M"],["CUP_1Rnd_HE_GP25_M","CUP_1Rnd_SMOKE_GP25_M","CUP_IlumFlareWhite_GP25_M"],""],
["CUP_arifle_AK12_GP34_black","","","CUP_optic_1P87_RIS",["CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M"],["CUP_1Rnd_HE_GP25_M","CUP_1Rnd_SMOKE_GP25_M","CUP_IlumFlareWhite_GP25_M"],""],
["CUP_arifle_AK74M_GL","","CUP_acc_LLM01_L","CUP_optic_Kobra",["CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M"],["CUP_1Rnd_HE_GP25_M","CUP_1Rnd_SMOKE_GP25_M","CUP_IlumFlareWhite_GP25_M"],""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U_railed","CUP_muzzle_PBS4","","",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
["CUP_arifle_RPK74M_railed","","","",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"],[],""],
["CUP_lmg_Pecheneg_B50_vfg","","","",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],[],""],
["CUP_lmg_Pecheneg_B50_vfg","","","CUP_optic_Kobra",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],[],""],
["CUP_lmg_PKM_B50_vfg","","","",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],[],""],
["CUP_lmg_PKM_front_rail_B50_vfg","","","CUP_optic_1P87_RIS",["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["CUP_srifle_SVD","","","CUP_optic_PSO_1",["CUP_10Rnd_762x54_SVD_M"],[],""]
]];
_militaryLoadoutData set ["sniperRifles", [
["CUP_srifle_SVD_wdl","","CUP_SVD_camo_g_half","CUP_optic_PSO_3",["CUP_10Rnd_762x54_SVD_M"],[],""],
["CUP_srifle_ksvk","","","CUP_optic_PSO_3",["CUP_5Rnd_127x108_KSVK_M"],[],""]
]];
_militaryLoadoutData set ["sidearms", [
["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M"],[],""]
]];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["CUP_U_C_Policeman_01"]];
_policeLoadoutData set ["vests", ["CUP_V_C_Police_Holster"]];
_policeLoadoutData set ["helmets", ["CUP_H_C_Policecap_01"]];
_policeLoadoutData set ["SMGs", [
["CUP_smg_bizon","","","",["CUP_64Rnd_9x19_Bizon_M"],[],""],
["CUP_smg_vityaz_vfg","","","",["CUP_30Rnd_9x19AP_Vityaz"],[],""]
]];
_policeLoadoutData set ["sidearms", [
["CUP_hgun_PMM","","","",["CUP_12Rnd_9x18_PMM_M"],[],""]
]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["CUP_U_O_RUS_Flora_1"]];
_militiaLoadoutData set ["vests", ["CUP_V_RUS_6B3_1","CUP_V_RUS_6B3_Flora_2"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_oli","B_AssaultPack_sgg","CUP_B_RPGPack_Khaki"]];
_militiaLoadoutData set ["helmets", ["CUP_H_RUS_6B27","CUP_H_RUS_6B27_goggles","CUP_H_RUS_6B27_headset_goggles","CUP_H_RUS_6B27_headset","CUP_H_RUS_6B27_NVG"]];
_militiaLoadoutData set ["slRifles", [
["CUP_arifle_AK74M_GL","","","CUP_optic_Kobra",["CUP_30Rnd_545x39_AK74M_M"],["CUP_1Rnd_HE_GP25_M"],""],
["CUP_arifle_AK74M","","","CUP_optic_Kobra",["CUP_30Rnd_545x39_AK74M_M"],[],""]
]];
_militiaLoadoutData set ["rifles", [
["CUP_arifle_AK74M","","","",["CUP_30Rnd_545x39_AK74M_M"],[],""],
["CUP_arifle_AK74_Early","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["CUP_arifle_AKS74","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_AK74M_GL","","","",["CUP_30Rnd_545x39_AK74M_M"],["CUP_1Rnd_HE_GP25_M","CUP_1Rnd_SMOKE_GP25_M","CUP_IlumFlareWhite_GP25_M"],""]
]];
_militiaLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
["CUP_arifle_RPK74","","","",["CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["CUP_srifle_SVD_wdl","","CUP_SVD_camo_g","CUP_optic_PSO_1",["CUP_10Rnd_762x54_SVD_M"],[],""]
]];
_militiaLoadoutData set ["sniperRifles", [
["CUP_srifle_ksvk","","","CUP_optic_PSO_3",["CUP_5Rnd_127x108_KSVK_M"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
["CUP_hgun_Makarov","","","",["CUP_8Rnd_9x18_Makarov_M"],[],""]
]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_1"]];
_crewLoadoutData set ["vests", ["CUP_V_O_RUS_6B45_AK_Light_Summer"]];
_crewLoadoutData set ["helmets", ["CUP_H_SLA_TankerHelmet"]];
_crewLoadoutData set ["carbines", [
["CUP_arifle_AKS74_semiauto","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];
_crewLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_O_RUS_EMR_gloves_pads"]];
_pilotLoadoutData set ["vests", ["CUP_V_CDF_CrewBelt"]];
_pilotLoadoutData set ["helmets", ["CUP_H_RUS_ZSH_Shield_Up","CUP_H_RUS_ZSH_Shield_Down"]];
_pilotLoadoutData set ["carbines", [
["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];
_pilotLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
]];


private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["uniforms", ["CUP_U_O_RUS_EMR_1"]];
_officerLoadoutData set ["vests", ["CUP_V_RUS_6B3_2"]];
_officerLoadoutData set ["helmets", ["CUP_H_RUS_Beret_Spetsnaz"]];
_officerLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U","","","",["CUP_30Rnd_545x39_AK74_plum_M"],[],""]
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
