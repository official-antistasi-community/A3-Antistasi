//////////////////////////
//   Side Information   //
//////////////////////////
//Tanoan Liberation Army, natural enemies of the HIDF, CW US, US, and SDK
["name", "TLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "TLA Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_CW_SOV_ARMY"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CW_SOV_ARMY"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////


["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general
["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["UK3CB_ARD_O_YAVA"]] call _fnc_saveToTemplate; 
["vehiclesLightUnarmed", ["UK3CB_ARD_O_Hilux_Open","UK3CB_ARD_O_Hilux_Closed","UK3CB_CW_SOV_O_EARLY_BRDM2_UM","UK3CB_CW_SOV_O_EARLY_BTR40","UK3CB_CW_SOV_O_EARLY_UAZ_Closed","UK3CB_CW_SOV_O_EARLY_UAZ_Open"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_ARD_O_Hilux_Dshkm","UK3CB_ARD_O_Hilux_M2","UK3CB_ARD_O_Hilux_GMG","UK3CB_ARD_O_Hilux_Spg9","UK3CB_ARD_O_Hilux_Metis",
"UK3CB_CW_SOV_O_EARLY_BRDM2_HQ","UK3CB_CW_SOV_O_EARLY_BTR40_MG",
"UK3CB_CW_SOV_O_EARLY_Gaz66_ZU23"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Covered","UK3CB_CW_SOV_O_EARLY_Gaz66_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Covered_Flatbed","UK3CB_CW_SOV_O_EARLY_Gaz66_Open_Flatbed","UK3CB_CW_SOV_O_EARLY_Zil131_Covered"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Repair","UK3CB_CW_SOV_O_EARLY_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CW_SOV_O_EARLY_Ural_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Med"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_CW_SOV_O_EARLY_BRDM2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CW_SOV_O_EARLY_BTR60","UK3CB_CW_SOV_O_EARLY_BTR70"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_CW_SOV_O_EARLY_BMP1","UK3CB_CW_SOV_O_EARLY_BMP2","UK3CB_CW_SOV_O_EARLY_BMP2K"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["UK3CB_ARD_O_T34"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_CW_SOV_O_EARLY_T72A","UK3CB_CW_SOV_O_EARLY_T55","UK3CB_CW_SOV_O_EARLY_T55","UK3CB_ARD_O_T34"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["UK3CB_CW_SOV_O_EARLY_T72A"]] call _fnc_saveToTemplate;             // Just to push up the T-72 probability at higher war levels
["vehiclesAA", ["UK3CB_CW_SOV_O_EARLY_ZsuTank"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_CHD_O_Fishing_Boat_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_CW_SOV_O_EARLY_MTLB_PKT","UK3CB_CW_SOV_O_EARLY_MTLB_KPVT","UK3CB_CW_SOV_O_EARLY_MTLB_BMP"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_CW_SOV_O_EARLY_MIG21_AT","a3a_UK3CB_Fake_Mig"]] call _fnc_saveToTemplate;             
["vehiclesPlanesAA", ["UK3CB_CW_SOV_O_EARLY_MIG21_AA","a3a_UK3CB_Fake_Mig"]] call _fnc_saveToTemplate;              
["vehiclesPlanesTransport", ["UK3CB_CW_SOV_O_EARLY_LI2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_CW_SOV_O_EARLY_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["RHS_Mi24Vt_vvsc","UK3CB_CW_SOV_O_EARLY_Mi8","UK3CB_CW_SOV_O_EARLY_Mi8","UK3CB_CW_SOV_O_EARLY_Mi8","UK3CB_CW_SOV_O_EARLY_Mi8"]] call _fnc_saveToTemplate; //Mi24Vt has 1x 12.7mm turret, and disabled pylons
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["UK3CB_CW_SOV_O_EARLY_Mi8AMTSh","UK3CB_CW_SOV_O_EARLY_Mi8AMTSh","UK3CB_CW_SOV_O_EARLY_Mi_24P"]] call _fnc_saveToTemplate;      // Mi24P lacks a gun turret
["vehiclesHelisAttack", ["UK3CB_CW_SOV_O_EARLY_Mi_24V"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["UK3CB_CW_SOV_O_EARLY_BM21","rhs_D30_msv","rhs_D30_msv"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CW_SOV_O_EARLY_BM21", ["rhs_mag_m21of_1"]],
["rhs_D30_msv", ["rhs_mag_3of56_10"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_CW_SOV_O_EARLY_UAZ_MG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CW_SOV_O_EARLY_Zil131_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CW_SOV_O_EARLY_UAZ_Closed","UK3CB_CW_SOV_O_EARLY_UAZ_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_ARD_O_Hilux_Open", "UK3CB_ARD_O_Hilux_Pkm"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_cdf_b_DSHKM","RHS_M2StaticMG_D", "UK3CB_NAP_I_PKM_High"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_cdf_b_SPG9","rhsgref_cdf_b_SPG9M"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_ZU23_MSV","rhs_Igla_AA_pod_msv"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;             //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;         //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "3CBFactions_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04",
"TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE"]] call _fnc_saveToTemplate;
"TanoanMen" call _fnc_saveNames;


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
    "rhs_weap_m72a7", 
    "rhs_weap_rpg18",
    "rhs_weap_rpg26",
    "rhs_weap_rpg75",
    "rhs_weap_rshg2"
]];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_loadoutData set ["heavyATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VS_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", ["rhs_weap_tt33","rhs_weap_makarov_pm"]];

_loadoutData set ["ATMines", ["rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_f1","rhs_mag_rgd5","rhs_mag_rgo","rhs_mag_rgn","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["rhsusf_bino_m24"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_m24"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["B_FieldPack_cbr","rhs_assault_umbts","rhs_sidor","UK3CB_UN_B_B_ASS"]];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_loadoutData set ["aaBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["mgBackpacks", ["rhs_rd54"]];
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
_sfLoadoutData set ["uniforms", ["UK3CB_CHD_B_U_CombatUniform_08"]];
_sfLoadoutData set ["vests", ["UK3CB_V_Belt_Rig_KHK","UK3CB_MDF_B_V_TacVest_LIZ","UK3CB_MD99_VEST_Rifleman_KHK","UK3CB_MD12_VEST_Rifleman_OLI"]];
_sfLoadoutData set ["helmets", ["rhs_headband", "rhs_6b27m_ml", "rhsgref_6b27m_ttsko_mountain"]];
_sfLoadoutData set ["facewear", ["rhsusf_shemagh2_grn", "rhsusf_shemagh2_od", "rhsusf_shemagh2_tan", "rhsusf_shemagh2_white","UK3CB_G_KLR_BLK","UK3CB_G_KLR_Oli","UK3CB_G_KLR_TAN"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["lightATLaunchers", [
    "rhs_weap_m72a7", 
    "rhs_weap_rshg2",
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VS_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_sfLoadoutData set ["heavyATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VR_mag"], [], ""]
]];
_sfLoadoutData set ["slRifles", [
    ["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_m92", "rhs_acc_pbs1", "", "", ["UK3CB_AK47_45Rnd_Magazine_GT", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine","rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
    ["rhs_weap_ak74n_gp25", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["UK3CB_M16A2_UGL", "", "", "", ["UK3CB_M16_30rnd_556x45","UK3CB_M16_30rnd_556x45_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["UK3CB_M16A1", "", "", "", ["UK3CB_M16_30rnd_556x45","UK3CB_M16_30rnd_556x45_G"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["rhs_weap_l1a1_wood", "rhsgref_sdn6_suppressor", "", "", 	["UK3CB_FNFAL_30rnd_762x51_G","UK3CB_FNFAL_30rnd_762x51_GT"], [], ""],
    ["rhs_weap_ak74n", "rhs_acc_dtk", "rhs_acc_perst1ik", 	"rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_ak74n", "rhs_acc_dtk4short", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_aks74n", "rhs_acc_dtk", "rhs_acc_perst1ik", 	"rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_aks74n", "rhs_acc_dtk4short", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_rpk74m", "rhs_acc_tgpa", "rhs_acc_perst1ik", "rhs_acc_ekp1", 	["rhs_30Rnd_545x39_7U1_AK"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["UK3CB_M16A1", "", "", "", ["UK3CB_M16_30rnd_556x45","UK3CB_M16_30rnd_556x45_G"], [], ""],
    ["rhs_weap_aks74un", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
    ["rhs_weap_m92", "rhs_acc_pbs1", "", "", ["UK3CB_AK47_45Rnd_Magazine_GT", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine","rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
    ["rhs_weap_m92", "rhs_acc_pbs1", "", "", ["UK3CB_AK47_45Rnd_Magazine_GT", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine","rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["rhs_weap_ak74n_gp25", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["UK3CB_M16A2_UGL", "", "", "", ["UK3CB_M16_30rnd_556x45","UK3CB_M16_30rnd_556x45_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_asval", "", "", "rhs_acc_okp7_dovetail", ["rhs_20rnd_9x39mm_SP5","rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_rpk74m", "rhs_acc_tgpa", "rhs_acc_perst1ik", "rhs_acc_ekp1", 	["rhs_45Rnd_545X39_7U1_AK"], [], ""],
    ["UK3CB_RPK_74N_BLK", "", "", "rhs_acc_1p29", 	["UK3CB_RPK74_60rnd_545x39_GM", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
    ["UK3CB_RPD", "rhs_acc_pbs1", "", "", 	["UK3CB_RPD_100rnd_762x39"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["UK3CB_SVD_OLD", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["rhs_weap_l1a1_wood", "rhsgref_sdn6_suppressor", "", "rhsgref_acc_l1a1_l2a2", 	["UK3CB_FNFAL_20rnd_762x51_G","UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
    ["rhs_weap_asval_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", 	["rhs_10rnd_9x39mm_SP5","rhs_10rnd_9x39mm_SP6"], [], "rhs_acc_grip_rk6"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["UK3CB_SVD_OLD", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["rhs_weap_asval_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", 	["rhs_10rnd_9x39mm_SP5","rhs_10rnd_9x39mm_SP6"], [], "rhs_acc_grip_rk6"]
]];
_sfLoadoutData set ["sidearms", [
    ["rhs_weap_pb_6p9", "", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""],
    ["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_CHD_B_U_CombatUniform_08"]];
_militaryLoadoutData set ["vests", ["rhs_6b2_RPK","rhs_6b2_lifchik","rhs_6b2_chicom","rhs_6b2_AK","rhs_lifchik","rhsgref_chicom"]];
_militaryLoadoutData set ["helmets", ["H_Bandanna_khk", "rhs_ssh60","rhs_ssh68","rhs_ssh68_2", "rhsgref_M56","H_Booniehat_oli","H_Hat_Safari_olive_F"]];

_militaryLoadoutData set ["slRifles", [
    ["UK3CB_FNFAL_FOREGRIP", "", "", "", 	["UK3CB_FNFAL_20rnd_762x51_G","UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
    ["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
    ["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
    ["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["UK3CB_M16A1", "", "", "", ["UK3CB_M16_20rnd_556x45","UK3CB_M16_20rnd_556x45_G"], [], ""],
    ["UK3CB_M16A2", "", "", "", ["UK3CB_M16_20rnd_556x45","UK3CB_M16_20rnd_556x45_G"], [], ""],
    ["UK3CB_M16A2_UGL", "", "", "", ["UK3CB_M16_20rnd_556x45","UK3CB_M16_20rnd_556x45_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["UK3CB_FNFAL_20rnd_762x51_G","UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
    ["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["rhs_weap_aks74un", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""],
    ["rhs_weap_m92", "", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m79", "", "", "", ["rhs_mag_M433_HEDP", "rhs_mag_M441_HE"], ["rhs_mag_M433_HEDP","rhs_mag_M441_HE","rhs_mag_m576","rhs_mag_m662_red","rhs_mag_m713_Red","rhs_mag_m714_White"], ""],
    ["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["rhs_weap_aks74n_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["rhs_weap_ak74n_gp25_npz", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["rhs_weap_m3a1",  "", "", "", ["rhsgref_30rnd_1143x23_M1T_2mag_SMG", "rhsgref_30rnd_1143x23_M1911B_2mag_SMG", "rhsgref_30rnd_1143x23_M1T_SMG", "rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""],
    ["uk3cb_mat49", "", "", "", ["UK3CB_MAT49_32Rnd_9x19_Magazine_G", "UK3CB_MAT49_32Rnd_9x19_Magazine_GT", "UK3CB_MAT49_32Rnd_9x19_Magazine"], [], ""],
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_71rnd_magazine_GM","uk3cb_PPSH_71rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_G"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["UK3CB_FNLAR", "", "", "", 	["UK3CB_FNFAL_30rnd_762x51_GT", "UK3CB_FNFAL_30rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT", "UK3CB_FNFAL_20rnd_762x51_G"], [], ""],
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_GM","UK3CB_M60_100rnd_762x51_GT"], [], ""],
    ["rhs_weap_mg42", "", "", "", 	["rhsgref_50Rnd_792x57_SmE_drum","rhsgref_50Rnd_792x57_SmE_drum","rhsgref_50Rnd_792x57_SmK_drum"], [], ""],
    ["rhs_weap_pkm", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_GM"], [], ""],
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_GM"], [], ""],
    ["UK3CB_RPK", "", "", "", ["rhs_75Rnd_762x39mm_89", "UK3CB_RPK_40rnd_762x39_GM"], [], ""],
    ["UK3CB_RPK_74N", "", "", "rhs_acc_1p29", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", 	["UK3CB_FNFAL_20rnd_762x51_G","UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
    ["rhs_weap_ak74n", "rhs_acc_dtk", "rhs_acc_2dpZenit", "rhs_acc_pso1m21", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""],
    ["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_pso1m21", ["rhs_30Rnd_762x39mm_tracer", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
    ["uk3cb_enfield_no4t_walnut", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_enfield_no4t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["uk3cb_enfield_no4t_walnut", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_enfield_no4t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["rhs_weap_tt33","rhs_weap_makarov_pm"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_Early_U_Tank_Crew_Uniform_02_BLK"]];
_policeLoadoutData set ["vests", ["UK3CB_ADA_B_V_TacVest_BLK"]];
_policeLoadoutData set ["helmets", ["H_Hat_Safari_sand_F", "H_Hat_Safari_olive_F", "UK3CB_H_Safari_Hat_Brown"]];
_policeLoadoutData set ["facewear", ["rhsusf_shemagh2_grn", "rhs_scarf","UK3CB_G_Bandanna_red_check"]];
_policeLoadoutData set ["NVGs", []];
_policeLoadoutData set ["gpses", []];

_policeLoadoutData set ["rifles", [
    ["uk3cb_enfield_no3", "", "", "", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""]
]];
_policeLoadoutData set ["carbines", [
    ["uk3cb_sks_01", "uk3cb_muzzle_sks_bayonet", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "uk3cb_muzzle_sks_bayonet", "", "", ["rhs_10Rnd_762x39mm_U"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_10Rnd_762x39mm_U"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["rhs_weap_m3a1",  "", "", "", ["rhsgref_30rnd_1143x23_M1T_2mag_SMG", "rhsgref_30rnd_1143x23_M1911B_2mag_SMG", "rhsgref_30rnd_1143x23_M1T_SMG", "rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""],
    ["uk3cb_mat49", "", "", "", ["UK3CB_MAT49_32Rnd_9x19_Magazine_G", "UK3CB_MAT49_32Rnd_9x19_Magazine_GT", "UK3CB_MAT49_32Rnd_9x19_Magazine"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_ADM_B_U_Shirt_Pants_01_BRN_WDL", "UK3CB_ADM_B_U_Shirt_Pants_01_BRN_WDL_ALT", "UK3CB_ADC_C_Shorts_U_02"]];
_militiaLoadoutData set ["vests", ["rhsgref_alice_webbing","rhsgref_chestrig","rhsgref_chicom", "UK3CB_V_Belt_Rig_KHK","UK3CB_V_Chicom_Brown","UK3CB_TKA_I_V_vydra_3m_Tan","V_BandollierB_oli"]];
_militiaLoadoutData set ["helmets", ["H_Hat_Safari_sand_F", "H_Hat_Safari_olive_F", "UK3CB_H_Safari_Hat_Brown"]];
_militiaLoadoutData set ["NVGs", []];
_militiaLoadoutData set ["gpses", []];

_militiaLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_militiaLoadoutData set ["heavyATLaunchers", [
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VS_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""],
    ["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["UK3CB_FNFAL_20rnd_762x51_G","UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
    ["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
    ["uk3cb_mat49", "", "", "", ["UK3CB_MAT49_32Rnd_9x19_Magazine_G", "UK3CB_MAT49_32Rnd_9x19_Magazine_GT", "UK3CB_MAT49_32Rnd_9x19_Magazine"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["uk3cb_enfield_no3", "", "", "", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", 	["UK3CB_FNFAL_20rnd_762x51_G","UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
    ["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
    ["uk3cb_enfield_no4", "", "", "", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], ["uk3cb_1rnd_riflegrenade_mas_ap", "uk3cb_1rnd_riflegrenade_mas_ap", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["uk3cb_enfield_no4_walnut", "", "", "", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], ["uk3cb_1rnd_riflegrenade_mas_ap", "uk3cb_1rnd_riflegrenade_mas_ap", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["uk3cb_enfield_no4", "", "", "", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], ["uk3cb_1rnd_riflegrenade_mas_at_l", "uk3cb_1rnd_riflegrenade_mas_at_s", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["rhs_weap_m79", "", "", "", ["rhs_mag_M433_HEDP", "rhs_mag_M441_HE"], ["rhs_mag_M433_HEDP","rhs_mag_M441_HE","rhs_mag_m576","rhs_mag_m662_red","rhs_mag_m713_Red","rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["rhs_weap_m3a1",  "", "", "", ["rhsgref_30rnd_1143x23_M1T_2mag_SMG", "rhsgref_30rnd_1143x23_M1911B_2mag_SMG", "rhsgref_30rnd_1143x23_M1T_SMG", "rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""],
    ["uk3cb_mat49", "", "", "", ["UK3CB_MAT49_32Rnd_9x19_Magazine_G", "UK3CB_MAT49_32Rnd_9x19_Magazine_GT", "UK3CB_MAT49_32Rnd_9x19_Magazine"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["UK3CB_Bren_303", "", "", "", ["UK3CB_Bren_30Rnd_303_Magazine", "UK3CB_Bren_30Rnd_303_Magazine", "UK3CB_Bren_30Rnd_303_Magazine_GT"], [], ""],
    ["UK3CB_Bren_303", "", "", "", ["UK3CB_Bren_30Rnd_303_Magazine", "UK3CB_Bren_30Rnd_303_Magazine", "UK3CB_Bren_30Rnd_303_Magazine_GT"], [], ""],
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39_GM"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GM"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["uk3cb_enfield_no3t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_enfield_no3t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_enfield_no4t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["uk3cb_enfield_no3t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_enfield_no3t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""],
    ["uk3cb_enfield_no4t", "", "", "uk3cb_optic_no32", ["uk3cb_no4_enfield_303_10Rnd_magazine_G","uk3cb_no4_enfield_303_10Rnd_magazine_GT"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

_militiaLoadoutData set ["traitorRifle", [
    "rhs_weap_m38"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["rhs_uniform_afghanka"]];
_crewLoadoutData set ["vests", ["rhs_vest_pistol_holster","rhs_vest_commander"]];
_crewLoadoutData set ["facewear", ["rhs_balaclava1_olive","rhs_balaclava","",""]];
_crewLoadoutData set ["helmets", ["rhs_tsh4","rhs_tsh4_ess"]];

_crewLoadoutData set ["SMGs", [
    "rhs_weap_m3a1", 
    ["uk3cb_mat49", "", "", "", ["UK3CB_MAT49_32Rnd_9x19_Magazine_G", "UK3CB_MAT49_32Rnd_9x19_Magazine_GT", "UK3CB_MAT49_32Rnd_9x19_Magazine"], [], ""],
    "uk3cb_ppsh41",
    "rhs_weap_m92"
]];
_crewLoadoutData set ["sidearms", ["rhs_weap_tt33"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["rhs_uniform_afghanka_grey"]];
_pilotLoadoutData set ["vests", ["rhs_vest_pistol_holster","rhs_vest_commander"]];
_pilotLoadoutData set ["facewear", ["G_Aviator"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

_pilotLoadoutData set ["SMGs", [
    "rhs_weap_m3a1", 
    ["uk3cb_mat49", "", "", "", ["UK3CB_MAT49_32Rnd_9x19_Magazine_G", "UK3CB_MAT49_32Rnd_9x19_Magazine_GT", "UK3CB_MAT49_32Rnd_9x19_Magazine"], [], ""]
]];
_pilotLoadoutData set ["sidearms", ["rhs_weap_tt33"]];

private _officialLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officialLoadoutData set ["uniforms", ["UK3CB_TKP_I_U_CombatUniform_BLK"]];
_officialLoadoutData set ["rifles", ["rhs_weap_akms_folded"]];
_officialLoadoutData set ["carbines", ["rhs_weap_aks74un_folded"]];
_officialLoadoutData set ["vests", ["rhs_gear_OFF"]];
_officialLoadoutData set ["facewear", ["rhs_googles_black", "G_Squares_Tinted","G_Aviator","G_Aviator"]];
_officialLoadoutData set ["helmets", ["UK3CB_H_MilCap_VEG"]];

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

    ["slRifles"] call _fnc_setPrimary;
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

    [selectRandom ["rifles", "rifles", "carbines"]] call _fnc_setPrimary;
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
    ["atBackpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["lightATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
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
    ["atBackpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom["ATLaunchers","heavyATLaunchers"]] call _fnc_setLauncher;
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
    ["aaBackpacks"] call _fnc_setBackpack;

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
    ["mgBackpacks"] call _fnc_setBackpack;

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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _policeSlTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["SMGs", "carbines"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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
    ["handgun", 4] call _fnc_addMagazines;

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
    ["traitorRifle"] call _fnc_setPrimary;
    ["primary", 2] call _fnc_addMagazines;

    ["facewear"] call _fnc_setFacewear;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 5] call _fnc_addMagazines;
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
    ["SquadLeader", _squadLeaderTemplate, nil, 8],
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
    ["SquadLeader", _policeSlTemplate],
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
["other", [["Official", _policeTemplate, nil, 2]], _officialLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
