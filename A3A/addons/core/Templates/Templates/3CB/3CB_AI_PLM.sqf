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
["vehiclesBasic", ["UK3CB_PLM_O_YAVA"]] call _fnc_saveToTemplate; 
["vehiclesLightUnarmed", ["UK3CB_PLM_O_BRDM2_UM","UK3CB_PLM_O_BTR40"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_PLM_O_BRDM2_HQ","UK3CB_PLM_O_BTR40_DSHKMS","UK3CB_PLM_O_BTR40_GMG","UK3CB_PLM_O_BTR40_MG","UK3CB_PLM_O_BTR40_METIS","UK3CB_PLM_O_BTR40_PKM"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_PLM_O_Zil131_Covered"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_PLM_O_Zil131_Flatbed"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_PLM_O_BTR40_REAMMO","UK3CB_PLM_O_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_PLM_O_BTR40_REPAIR","UK3CB_PLM_O_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_PLM_O_BTR40_REFUEL","UK3CB_PLM_O_Ural_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_PLM_O_BTR40_AMBULANCE"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_PLM_O_BRDM2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["UK3CB_PLM_O_T34"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_PLM_O_T55"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", []] call _fnc_saveToTemplate;             // Just to push up the T-72 probability at higher war levels
["vehiclesAA", ["UK3CB_PLM_O_BTR40_ZU23", "UK3CB_PLM_O_Ural_Zu23"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_CHD_O_Fishing_Boat_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_CW_SOV_O_EARLY_MIG21_AT","a3a_UK3CB_Fake_Mig"]] call _fnc_saveToTemplate;             
["vehiclesPlanesAA", ["UK3CB_CW_SOV_O_EARLY_MIG21_AA","a3a_UK3CB_Fake_Mig"]] call _fnc_saveToTemplate;              
["vehiclesPlanesTransport", ["UK3CB_CW_SOV_O_EARLY_LI2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_CW_SOV_O_EARLY_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate; //Mi24Vt has 1x 12.7mm turret, and disabled pylons
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["UK3CB_CW_SOV_O_EARLY_Mi8AMTSh","UK3CB_CW_SOV_O_EARLY_Mi8AMTSh","UK3CB_CW_SOV_O_EARLY_Mi_24P"]] call _fnc_saveToTemplate;      // Mi24P lacks a gun turret
["vehiclesHelisAttack", ["UK3CB_CW_SOV_O_EARLY_Mi_24V"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["UK3CB_PLM_O_Ural_BM21","rhs_D30_msv","rhs_D30_msv"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_PLM_O_Ural_BM21", ["rhs_mag_m21of_1"]],
["rhs_D30_msv", ["rhs_mag_3of56_10"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_PLM_O_MB4WD_LMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_PLM_O_Zil131_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_PLM_O_Datsun_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_PLM_O_MB4WD_Unarmed"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_cdf_b_DSHKM", "UK3CB_NAP_I_PKM_High"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_cdf_b_SPG9","rhsgref_cdf_b_SPG9","rhsgref_cdf_b_SPG9M"]] call _fnc_saveToTemplate;
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
["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
"ChineseMen" call _fnc_saveNames;


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
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    "rhs_weap_rpg18", 
    "rhs_weap_rpg26",
    "rhs_weap_rpg75",
    "rhs_weap_rshg2"
]];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_OG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7V_mag"], [], ""]
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

_loadoutData set ["antiTankGrenades", ["rhsgref_mag_rkg3em"]];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_f1","rhs_mag_rgd5"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white", "rhs_mag_rdg2_black"]];
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
_loadoutData set ["SLuniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["UK3CB_PLM_B_B_RD54_RIF_01", "UK3CB_PLM_B_B_FIELDPACK_RIF_01", "UK3CB_PLM_B_B_Sidor_RIF_01"]];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_loadoutData set ["aaBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["mgBackpacks", ["rhs_rd54"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

_loadoutData set ["facewear", ["UK3CB_G_Bandanna_red_check", "UK3CB_G_Bandanna_red"]];

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
_sfLoadoutData set ["uniforms", ["UK3CB_PLM_B_U_Pants_Shirt_02"]];
_sfLoadoutData set ["SLuniforms", ["UK3CB_PLM_B_U_Officer_Comm_CombatUniform_01"]];
_sfLoadoutData set ["vests", ["rhs_6b2_chicom"]];
_sfLoadoutData set ["helmets", ["UK3CB_PLM_B_H_SSh68_Covered_BLK", "UK3CB_PLM_B_H_Headband_Red"]];
_sfLoadoutData set ["facewear", []];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["lightATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_2",["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_sfLoadoutData set ["heavyATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VR_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag","rhs_rpg7_PG7VL_mag","rhs_rpg7_PG7VR_mag"], [], ""]
]];
_sfLoadoutData set ["slRifles", [
    ["rhs_weap_akms_gp25", "rhs_acc_pbs1", "", "rhs_acc_1pn93_1", ["UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VG40OP_red", "rhs_GRD40_Green", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
    ["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1pn93_2", ["UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Red", "rhs_VG40OP_white", "rhs_GRD40_White"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1pn93_2", ["UK3CB_AK47_30Rnd_Magazine"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1pn93_2", ["UK3CB_AK47_30Rnd_Magazine"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akms_gp25", "rhs_acc_pbs1", "", "rhs_acc_1pn93_1", ["UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
    ["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1pn93_2", ["UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40MD"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["rhs_weap_asval_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_1pn93_2", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk6"],
    ["rhs_weap_asval", "", "", "rhs_acc_1pn93_2", ["rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["UK3CB_RPD", "rhs_acc_pbs1", "", "", ["UK3CB_RPD_100rnd_762x39"], [], ""],
    ["UK3CB_RPKN_BLK", "rhs_acc_pbs1", "", "rhs_acc_1pn93_2", ["UK3CB_RPK_75rnd_762x39"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["UK3CB_SVD_OLD", "rhs_acc_tgpv", "", "rhs_acc_1pn34", ["UK3CB_SVD_10rnd_762x54","UK3CB_SVD_10rnd_762x54_G", "UK3CB_SVD_10rnd_762x54_GT"], [], ""],
    ["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_1pn93_1", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk6"],
    ["rhs_weap_vss", "", "", "rhs_acc_1pn93_1", ["rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["UK3CB_SVD_OLD", "rhs_acc_tgpv", "", "rhs_acc_1pn34", ["UK3CB_SVD_10rnd_762x54","UK3CB_SVD_10rnd_762x54_G", "UK3CB_SVD_10rnd_762x54_GT"], [], ""],
    ["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_1pn93_1", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk6"],
    ["rhs_weap_vss", "", "", "rhs_acc_1pn93_1", ["rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["rhs_weap_pb_6p9", "", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""],
    ["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_PLM_B_U_CombatUniform_01", "UK3CB_PLM_B_U_CombatUniform_02"]];
_militaryLoadoutData set ["SLuniforms", ["UK3CB_PLM_B_U_Officer_CombatUniform_01"]];
_militaryLoadoutData set ["vests", ["rhs_chicom","rhs_chicom_khk", "rhs_6b2","rhs_6b2_holster", "rhs_vydra_3m"]];
_militaryLoadoutData set ["helmets", ["UK3CB_PLM_B_H_SSh68","UK3CB_PLM_B_H_SSh68_Covered", "rhsgref_M56","UK3CB_PLM_B_H_Headband_Red","UK3CB_PLM_B_H_Fieldcap_Early_GRN", "UK3CB_H_CAP_PLM"]];

_militaryLoadoutData set ["slRifles", [
    ["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VG40OP_red", "rhs_GRD40_Green", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
    ["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Red", "rhs_VG40OP_white", "rhs_GRD40_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01_sling", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["rhs_weap_akm", "", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], [], ""],
    ["rhs_weap_akms", "", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
    ["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40MD"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_71rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_G","uk3cb_PPSH_35rnd_magazine_G"], [], ""],
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["UK3CB_RPD", "rhs_acc_dtkakm", "", "", ["UK3CB_RPD_100rnd_762x39_GT", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_75rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["UK3CB_SVD_10rnd_762x54","UK3CB_SVD_10rnd_762x54_G", "UK3CB_SVD_10rnd_762x54_GT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["UK3CB_SVD_10rnd_762x54","UK3CB_SVD_10rnd_762x54_G", "UK3CB_SVD_10rnd_762x54_GT"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["rhs_weap_pb_6p9", "", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""],
    "rhs_weap_tt33","rhs_weap_makarov_pm"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["UK3CB_PLM_B_U_Shorts_Uniform_07"]];
_policeLoadoutData set ["vests", ["UK3CB_V_SOV_CHICOM_GRN_TAN","UK3CB_V_SOV_CHICOM_GRN", "UK3CB_V_SOV_CHICOM_TAN_GRN","UK3CB_V_SOV_CHICOM_TAN"]];
_policeLoadoutData set ["helmets", ["UK3CB_H_CAP_PLM_BLK", "UK3CB_PLM_B_H_Fieldcap_Early_BLK", "UK3CB_PLM_B_H_SSh68_Covered_BLK", "UK3CB_PLM_B_H_SSh68_BLK"]];
_policeLoadoutData set ["facewear", ["rhsusf_shemagh2_grn", "rhs_scarf","UK3CB_G_Bandanna_red_check"]];
_policeLoadoutData set ["NVGs", []];
_policeLoadoutData set ["gpses", []];

_policeLoadoutData set ["rifles", [
    "rhs_weap_m38"
]];
_policeLoadoutData set ["carbines", [
    ["uk3cb_sks_01", "uk3cb_muzzle_sks_bayonet", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01", "uk3cb_muzzle_sks_bayonet", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "uk3cb_muzzle_sks_bayonet", "", "", ["rhs_10Rnd_762x39mm_U"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_10Rnd_762x39mm_U"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_PLM_B_U_Shorts_Uniform_06","UK3CB_PLM_B_U_Shorts_Uniform_05","UK3CB_PLM_B_U_Shorts_Uniform_04","UK3CB_PLM_B_U_Shorts_Uniform_03","UK3CB_PLM_B_U_Shorts_Uniform_02", "UK3CB_PLM_B_U_Shorts_Uniform_01"]];
_militiaLoadoutData set ["SLuniforms", ["UK3CB_PLM_B_U_Pants_Shirt_01"]];
_militiaLoadoutData set ["vests", ["UK3CB_V_SOV_CHICOM_GRN_TAN","UK3CB_V_SOV_CHICOM_GRN", "UK3CB_V_SOV_CHICOM_TAN_GRN","UK3CB_V_SOV_CHICOM_TAN"]];
_militiaLoadoutData set ["helmets", ["rhsgref_M56","rhsgref_M56","UK3CB_PLM_B_H_Headband_Red","UK3CB_PLM_B_H_Headband_Red","UK3CB_PLM_B_H_Fieldcap_Early_GRN", "UK3CB_H_CAP_PLM"]];
_militiaLoadoutData set ["NVGs", []];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_grenade_sthgr24_mag","rhs_grenade_sthgr43_mag"]];

_militiaLoadoutData set ["backpacks", ["UK3CB_PLM_B_B_RD54_RIF_02", "UK3CB_PLM_B_B_FIELDPACK_RIF_02", "UK3CB_PLM_B_B_Sidor_RIF_02"]];

_militiaLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_OG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_OG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_militiaLoadoutData set ["heavyATLaunchers", [
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VG40OP_red", "rhs_GRD40_Green", "rhs_VG40OP_white", "rhs_GRD40_White"], ""],
    ["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Red", "rhs_VG40OP_white", "rhs_GRD40_White"], ""]
]];
_militiaLoadoutData set ["rifles", [
    "rhs_weap_m38",
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01_sling", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01_sling", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01_sling", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_GM","uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["UK3CB_RPK", "", "", "", ["UK3CB_AK47_30Rnd_Magazine_GT", "UK3CB_AK47_30Rnd_Magazine_G", "UK3CB_AK47_30Rnd_Magazine"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    "rhs_weap_m38"
]];
_militiaLoadoutData set ["sniperRifles", [
    "rhs_weap_m38"
]];

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
