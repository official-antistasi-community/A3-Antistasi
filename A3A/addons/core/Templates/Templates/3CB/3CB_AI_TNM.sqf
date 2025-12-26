//////////////////////////
//   Side Information   //
//////////////////////////
["name", "TNM"] call _fnc_saveToTemplate;
["spawnMarkerName", "TNM Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_CW_SOV_ARMY"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_TNM\Flag\TNM_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_TNM"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////


["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["UK3CB_TNM_B_TT650"]] call _fnc_saveToTemplate; 
["vehiclesLightUnarmed", ["UK3CB_TNM_B_Hilux_Open","UK3CB_TNM_B_Hilux_Closed", "UK3CB_FIA_B_LR_SF_WMIK_FFV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_B_M939_Guntruck_HIDF","UK3CB_FIA_B_LR_SF_WMIK_M2_M240","UK3CB_FIA_B_LR_SF_WMIK_M2_M240","UK3CB_FIA_B_LR_SF_WMIK_MILAN_M240","UK3CB_FIA_B_LR_SF_WMIK_MK19_M240"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_TNM_B_LR_Softtop_Transport_Closed", "UK3CB_B_M939_Open_HIDF"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_TNM_B_Van_transport"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_TNM_B_LR_Softtop_Reammo_Closed","UK3CB_TNM_B_LR_Softtop_Reammo_Open","UK3CB_TNM_B_LR_Opentop_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_TNM_B_LR_Softtop_Repair_Closed","UK3CB_TNM_B_LR_Softtop_Repair_Open","UK3CB_TNM_B_LR_Opentop_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_TNM_B_LR_Softtop_Refuel_Closed","UK3CB_TNM_B_LR_Softtop_Refuel_Open","UK3CB_TNM_B_LR_Opentop_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_TNM_B_LR_Softtop_Reammo_Closed","UK3CB_TNM_B_LR_Softtop_Reammo_Open","UK3CB_TNM_B_LR_Opentop_Reammo"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["a3a_rhs_m113_hidf_M240", "rhsgref_hidf_m113a3_m2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_B_LAV25_HIDF"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_B_M60A3_HIDF", "UK3CB_B_M60A1_HIDF", "UK3CB_TNM_B_T55"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", []] call _fnc_saveToTemplate;             // Just to push up the T-72 probability at higher war levels
["vehiclesAA", ["a3a_green_M270_Avenger"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["UK3CB_MDF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHSGREF_A29B_HIDF", "UK3CB_B_T28Trojan_HIDF_CAS"]] call _fnc_saveToTemplate;      // "UK3CB_B_Mystere_HIDF_CAS1" -> commented for testing of A29 & T28
["vehiclesPlanesAA", ["UK3CB_B_Mystere_HIDF_AA1"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_B_C47_Late_HIDF"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["rhs_uh1h_hidf_unarmed"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["rhs_uh1h_hidf"]] call _fnc_saveToTemplate; //Mi24Vt has 1x 12.7mm turret, and disabled pylons
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["rhs_uh1h_hidf_gunship"]] call _fnc_saveToTemplate;      // Mi24P lacks a gun turret
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesAirPatrol", ["rhs_uh1h_hidf", "UK3CB_B_Cessna_T41_HIDF"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["RHS_M119_WD"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["RHS_M119_WD", ["RHS_mag_m1_he_12"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_FIA_B_LR_SF_WMIK_M240_M240", "UK3CB_FIA_B_LR_WMIK_DSHKM", "UK3CB_FIA_B_LR_WMIK_M2", "UK3CB_FIA_B_LR_WMIK_M240"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_TNM_B_LR_Softtop_Transport_Open", "UK3CB_B_M939_Closed_HIDF"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_TNM_B_Datsun_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_TNM_B_Pickup"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD", "RHS_M2StaticMG_WD", "UK3CB_B_Static_M240_High_HIDF"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_D"]] call _fnc_saveToTemplate;
["staticMortars", ["a3a_RHS_M252"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_mk2_pressure", "rhs_mine_Mk2_tripwire", "rhsusf_mine_m49a1_6m"]] call _fnc_saveToTemplate;

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
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag"], [], ""],
    "rhs_weap_m72a7", 
    "uk3cb_m72a1_law_loaded"
]];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws",["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [], ""],
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws",["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
    ["rhs_weap_maaws", "", "", "",["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [], ""],
    ["rhs_weap_maaws", "", "", "",["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
    ["rhs_weap_maaws", "", "", "",["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_loadoutData set ["heavyATLaunchers", [
    "uk3cb_m47"
]];
_loadoutData set ["AALaunchers", ["UK3CB_Blowpipe", "rhs_weap_fim92"]];
_loadoutData set ["sidearms", ["UK3CB_BHP","rhsusf_weap_m1911a1"]];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhs_mine_m2a3b_trip_mag","rhs_mine_m2a3b_press_mag", "rhs_mine_M3_tripwire_mag","rhs_mine_m3_pressure_mag","rhs_mine_Mk2_tripwire_mag","rhs_mine_mk2_pressure_mag","rhsusf_mine_m49a1_3m_mag","rhsusf_mine_m49a1_6m_mag","rhsusf_mine_m49a1_10m_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_mk3a2"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc", "rhs_grenade_anm8_mag", "rhs_grenade_m15_mag"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


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

_loadoutData set ["uniforms", ["UK3CB_TNM_B_U_CombatUniform_01", "UK3CB_TNM_B_U_CombatUniform_02"]];
_loadoutData set ["SLuniforms", ["UK3CB_TNM_B_U_Officer_CombatUniform_01"]];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["UK3CB_PLM_B_B_RD54_RIF_01", "UK3CB_PLM_B_B_FIELDPACK_RIF_01", "UK3CB_PLM_B_B_Sidor_RIF_01"]];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_loadoutData set ["aaBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["mgBackpacks", ["rhs_rd54"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", ["UK3CB_TNM_B_H_Cap_KHK","UK3CB_TNM_B_H_Cap_CAC", "UK3CB_TNM_B_H_BoonieHat_KHK","UK3CB_TNM_B_H_BoonieHat_CAC","UK3CB_TNM_B_H_Bandanna_KHK", "UK3CB_TNM_B_H_Bandanna_CAC"]];
_loadoutData set ["slHelmets", ["UK3CB_TNM_B_H_Patrolcap_Mic_CAC_Patch", "UK3CB_TNM_B_H_Infantry_Beret"]];
_loadoutData set ["sinHelmets", ["UK3CB_TNM_B_H_BoonieHat_CAC"]];

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
_sfLoadoutData set ["uniforms", ["UK3CB_TNM_B_U_SF_CombatUniform_01"]];
_sfLoadoutData set ["SLuniforms", ["UK3CB_TNM_B_U_SF_CombatUniform_01"]];
_sfLoadoutData set ["vests", ["UK3CB_ADA_B_V_TacVest_BLK"]];
_sfLoadoutData set ["helmets", ["UK3CB_TNM_B_H_Bandanna_CAC_BLK", "UK3CB_TNM_B_H_Patrolcap_Mic_CAC_BLK", "UK3CB_TNM_B_H_BoonieHat_CAC_BLK"]];
_sfLoadoutData set ["slHelmets", ["UK3CB_TNM_B_H_SF_Beret", "UK3CB_TNM_B_H_Patrolcap_Mic_CAC_BLK_Patch"]];
_sfLoadoutData set ["sinHelmets", ["UK3CB_TNM_B_H_BoonieHat_CAC_BLK"]];
_sfLoadoutData set ["facewear", []];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["UK3CB_M16A2_UGL", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White", "rhs_mag_m713_Red", "rhs_mag_m662_red", "rhs_mag_m661_green"], ""],
    ["UK3CB_M16A3_UGL", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White", "rhs_mag_m713_Red", "rhs_mag_m662_red", "rhs_mag_m661_green"], ""]
]];
_sfLoadoutData set ["rifles", [    
    ["UK3CB_AR10_Porto_Carbine_Sup_OD", "uk3cb_muzzle_snds_M14", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""],
    ["UK3CB_M14", "uk3cb_muzzle_snds_M14", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51"], [], ""],
    ["uk3cb_ar18", "rhsusf_acc_rotex5_grey", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["uk3cb_ar18_shorty", "", "", "", ["UK3CB_M16_30rnd_556x45", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
    ["uk3cb_ar18_carbine", "rhsusf_acc_rotex5_grey", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""],
    ["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["UK3CB_M16A2_UGL", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP", "rhs_mag_m714_White", "rhs_mag_m662_red"], ""],
    ["rhs_weap_m79", "", "", "", ["rhs_mag_M433_HEDP"], ["rhs_mag_M433_HEDP", "rhs_mag_m714_White", "rhs_mag_m662_red"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["uk3cb_ar18_shorty", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""],
    ["rhs_weap_m3a1_specops", "", "", "", ["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_30rnd_1143x23_M1T_2mag_SMG","rhsgref_30rnd_1143x23_M1911B_2mag_SMG"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_RM", "UK3CB_M60_100rnd_762x51"], [], ""],
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_RT", "UK3CB_M60_100rnd_762x51"], [], ""],
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["UK3CB_M14", "uk3cb_muzzle_snds_M14", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
    ["UK3CB_M14", "uk3cb_muzzle_snds_M14", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["rhs_weap_pb_6p9", "", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""],
    ["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["vests", ["rhsgref_alice_webbing", "rhsgref_chestrig", "UK3CB_ADA_B_V_TacVest_WDL", "UK3CB_MDF_B_V_TacVest_LIZ"]];
_militaryLoadoutData set ["helmets", ["UK3CB_TNM_B_H_Cap_CAC", "UK3CB_TNM_B_H_BoonieHat_CAC", "UK3CB_TNM_B_H_Bandanna_CAC", "UK3CB_H_M1_Helmet_Net_OLI", "UK3CB_H_M1_Helmet_Covered_Band_OLI", "UK3CB_H_M1_Helmet_Covered_OLI", "UK3CB_H_M1_Helmet"]];

_militaryLoadoutData set ["slRifles", [
    ["UK3CB_AR10_Porto_Carbine", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["UK3CB_AR10_Porto_Carbine", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["UK3CB_AR10_Porto_Carbine", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["uk3cb_ar18_shorty", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["UK3CB_AR10_OD", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""],
    ["UK3CB_AR10_OD", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["uk3cb_m2carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["uk3cb_m2a1_carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["UK3CB_AR10_Porto_Carbine_Sup_OD", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""],
    ["UK3CB_AR10_Porto_Carbine_Sup_OD", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""],
    ["UK3CB_AR10_Porto_Carbine_Sup_OD", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""],
    ["uk3cb_ar18", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""],
    ["uk3cb_ar18_carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["UK3CB_AR10_Porto", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["UK3CB_AR10_Porto", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["UK3CB_AR10_Porto", "", "", "", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP", "rhs_mag_m714_White", "rhs_mag_m662_red"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["uk3cb_m2carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["uk3cb_m2a1_carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_30rnd_1143x23_M1T_2mag_SMG","rhsgref_30rnd_1143x23_M1911B_2mag_SMG"], [], ""],
    ["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_30rnd_1143x23_M1T_2mag_SMG","rhsgref_30rnd_1143x23_M1911B_2mag_SMG"], [], ""],
    ["uk3cb_thompson_m1a1", "", "", "", ["UK3CB_Thompson_30rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_30rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_30rnd_1143x23_M1911B_Magazine", "UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine"], [], ""],
    ["uk3cb_thompson_m1a1", "", "", "", ["UK3CB_Thompson_30rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_30rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_30rnd_1143x23_M1911B_Magazine", "UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_RM", "UK3CB_M60_100rnd_762x51"], [], ""],
    ["UK3CB_M1919A6_Browning", "", "", "", ["UK3CB_M1919_50Rnd_3006_Magazine_RT", "UK3CB_M1919_50Rnd_3006_Magazine_RM", "UK3CB_M1919_50Rnd_3006_Magazine_R", "UK3CB_M1919_50Rnd_3006_Magazine"], [], ""],
    ["UK3CB_M1919A6_Browning", "", "", "", ["UK3CB_M1919_50Rnd_3006_Magazine_RT", "UK3CB_M1919_50Rnd_3006_Magazine_RM", "UK3CB_M1919_50Rnd_3006_Magazine_R", "UK3CB_M1919_50Rnd_3006_Magazine"], [], ""],
    ["UK3CB_M1919A6_Browning", "", "", "", ["UK3CB_M1919_50Rnd_3006_Magazine_RT", "UK3CB_M1919_50Rnd_3006_Magazine_RM", "UK3CB_M1919_50Rnd_3006_Magazine_R", "UK3CB_M1919_50Rnd_3006_Magazine"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["UK3CB_AR10_Porto_Marksman_Sup_ALU", "", "", "uk3cb_optic_ar_delft3x25", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""],
    ["UK3CB_AR10_Porto_Marksman_Sup_ALU", "", "", "uk3cb_optic_ar_delft3x25_3d", ["UK3CB_AR10_20rnd_762x51_RT", "UK3CB_AR10_20rnd_762x51_R", "UK3CB_AR10_20rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["UK3CB_M1903A1_unertl", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""],
    ["UK3CB_M1903A1_unertl", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""],
    ["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_R", "UK3CB_M14_20rnd_762x51_RT"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1", "", ""]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["UK3CB_TNM_B_U_Navy_CombatUniform_01"]];
_policeLoadoutData set ["vests", ["rhsgref_alice_webbing", "rhsgref_chestrig"]];
_policeLoadoutData set ["helmets", ["UK3CB_TNM_B_H_Cap_CAC_NAVY", "UK3CB_TNM_B_H_BoonieHat_CAC_NAVY", "UK3CB_TNM_B_H_Navy_Beret", "UK3CB_TNM_B_H_Bandanna_CAC_NAVY"]];
_policeLoadoutData set ["facewear", []];
_policeLoadoutData set ["NVGs", []];
_policeLoadoutData set ["gpses", []];

_policeLoadoutData set ["rifles", [
    ["uk3cb_m1_advisor_carbine", "", "", "", ["UK3CB_M1_30Rnd_30Carbine_Magazine_W", "UK3CB_M1_15Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine_R"], [], ""],
    ["UK3CB_M1903A1", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""],
    ["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_Slug", "rhsusf_8Rnd_Slug", "rhsusf_8Rnd_Slug", "rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_00Buck"], [], ""]
]];
_policeLoadoutData set ["carbines", [
    ["uk3cb_m1carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["UK3CB_M1903A1", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""],
    ["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["uk3cb_thompson_m1928a1", "", "", "", ["UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["vests", ["rhsgref_alice_webbing", "rhsgref_chestrig"]];
_militiaLoadoutData set ["helmets", ["UK3CB_TNM_B_H_Cap_KHK","UK3CB_TNM_B_H_Cap_CAC", "UK3CB_TNM_B_H_BoonieHat_KHK","UK3CB_TNM_B_H_BoonieHat_CAC","UK3CB_TNM_B_H_Bandanna_KHK", "UK3CB_TNM_B_H_Bandanna_CAC"]];

_militiaLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""],
    "rhs_weap_m72a7", 
    "uk3cb_m72a1_law_loaded"
]];
_militiaLoadoutData set ["heavyATLaunchers", [
    ["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_type69_airburst_mag"], [], ""],
    "rhs_weap_m72a7", 
    "uk3cb_m72a1_law_loaded"
]];

_militiaLoadoutData set ["slRifles", [
    ["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""],
    ["uk3cb_m2a1_carbine", "", "", "", ["UK3CB_M1_30Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], ["uk3cb_1rnd_riflegrenade_mas_ap", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""],
    ["uk3cb_m2carbine", "", "", "", ["UK3CB_M1_30Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["uk3cb_m1carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["UK3CB_M1903A1", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""],
    ["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""],
    ["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""],
    ["uk3cb_m2carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle", "rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""],
    ["uk3cb_m2a1_carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["uk3cb_m1a1_carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["uk3cb_m1carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], ["uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_dp", "uk3cb_1rnd_riflegrenade_mas_wp", "uk3cb_1rnd_riflegrenade_mas_flare"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["uk3cb_m2a1_carbine", "", "", "", ["UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_30rnd_1143x23_M1T_2mag_SMG","rhsgref_30rnd_1143x23_M1911B_2mag_SMG"], [], ""],
    ["uk3cb_thompson_m1a1", "", "", "", ["UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine"], [], ""],
    ["uk3cb_thompson_m1928a1", "", "", "", ["UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_RT","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine_R","UK3CB_Thompson_20rnd_1143x23_M1911B_Magazine"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["UK3CB_M1919A4_Browning", "", "", "", ["UK3CB_M1919_50Rnd_3006_Magazine_RT", "UK3CB_M1919_50Rnd_3006_Magazine_RM", "UK3CB_M1919_50Rnd_3006_Magazine_R", "UK3CB_M1919_50Rnd_3006_Magazine"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["uk3cb_m1a1_carbine", "uk3cb_muzzle_m1_flash_hider", "", "uk3cb_scope_m1_m84", ["UK3CB_M1_15Rnd_30Carbine_Magazine_R", "UK3CB_M1_15Rnd_30Carbine_Magazine", "UK3CB_M1_15Rnd_30Carbine_Magazine"], [], ""],
    ["UK3CB_M1903A1_unertl", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["UK3CB_M1903A1_unertl", "", "", "", ["UK3CB_M1903A1_3006_5rnd_Magazine", "UK3CB_M1903A1_3006_5rnd_Magazine_RT", "UK3CB_M1903A1_3006_5rnd_Magazine_R"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1", "", ""]];

_militiaLoadoutData set ["traitorRifle", [
    "uk3cb_m1carbine", "UK3CB_M1903A1"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["UK3CB_TNM_B_U_SF_CombatUniform_01"]];
_crewLoadoutData set ["vests", ["rhsgref_alice_webbing"]];
_crewLoadoutData set ["facewear", ["rhs_balaclava1_olive","rhs_balaclava","",""]];
_crewLoadoutData set ["helmets", ["UK3CB_TNM_B_H_Radio_Cap_CAC_BLK"]];

_crewLoadoutData set ["SMGs", [
    "rhs_weap_m3a1", 
    "rhs_weap_m3a1", 
    "rhs_weap_m3a1",
    "uk3cb_m1_advisor_carbine",
    "uk3cb_m1_advisor_carbine",
    "uk3cb_m1_advisor_carbine", 
    "uk3cb_ar18_carbine",
    "uk3cb_ar18_shorty"
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_TNM_B_U_Airforce_CombatUniform_01"]];
_pilotLoadoutData set ["vests", ["rhsgref_alice_webbing", "UK3CB_V_Pilot_Vest_Black"]];
_pilotLoadoutData set ["facewear", ["G_Aviator"]];
_pilotLoadoutData set ["helmets", ["UK3CB_TNM_B_H_Radio_Cap_CAC_AIR", "UK3CB_TNM_B_H_Patrolcap_Mic_CAC_AIR_Patch", "UK3CB_TNM_B_H_BoonieHat_CAC_AIR", "UK3CB_TNM_B_H_Bandanna_CAC_AIR"]];

_pilotLoadoutData set ["SMGs", [
    "rhs_weap_m3a1", 
    "rhs_weap_m3a1", 
    "rhs_weap_m3a1",
    "uk3cb_m1_advisor_carbine",
    "uk3cb_m1_advisor_carbine",
    "uk3cb_m1_advisor_carbine", 
    "uk3cb_ar18_carbine",
    "uk3cb_ar18_shorty"
]];

private _officialLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officialLoadoutData set ["uniforms", ["UK3CB_TNM_B_U_Commander_CombatUniform_01"]];
_officialLoadoutData set ["rifles", ["UK3CB_AR10_Porto_Carbine_Sup"]];
_officialLoadoutData set ["carbines", ["uk3cb_ar18_carbine"]];
_officialLoadoutData set ["vests", ["rhs_gear_OFF"]];
_officialLoadoutData set ["facewear", ["rhs_googles_black", "G_Squares_Tinted","G_Aviator","G_Aviator"]];
_officialLoadoutData set ["slHelmets", ["UK3CB_TNM_B_H_Patrolcap_Mic_CAC_COM_Patch", "UK3CB_TNM_B_H_Comm_Beret"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHelmets"] call _fnc_setHelmet;
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
