
//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSAT Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_a_regiment_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CSAT_Arid"] call _fnc_saveToTemplate;

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_CSAT_A_O_M1030"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_CSAT_A_O_Tigr_FFV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_CSAT_A_O_Tigr_STS","UK3CB_CSAT_A_O_GAZ_Vodnik_Cannon"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CSAT_A_O_Marid_Unarmed_Cage","UK3CB_CSAT_A_O_GAZ_Vodnik","UK3CB_CSAT_A_O_MAZ_Transport_Open","UK3CB_CSAT_A_O_MAZ_Transport_Closed","UK3CB_CSAT_A_O_Kamaz_Open","UK3CB_CSAT_A_O_Kamaz_Covered","UK3CB_CSAT_A_O_Ural_Open","UK3CB_CSAT_A_O_Ural","UK3CB_CSAT_A_O_Marid_Unarmed_Cage","UK3CB_CSAT_A_O_GAZ_Vodnik"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CSAT_A_O_MAZ_543_Recovery","UK3CB_CSAT_A_O_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CSAT_A_O_MAZ_543_Reammo","UK3CB_CSAT_A_O_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CSAT_A_O_MAZ_543_Repair","UK3CB_CSAT_A_O_Ural_Repair","UK3CB_CSAT_A_O_Kamaz_Repair","UK3CB_CSAT_A_O_Kamaz_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CSAT_A_O_MAZ_543_Refuel","UK3CB_CSAT_A_O_Ural_Fuel","UK3CB_CSAT_A_O_Kamaz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CSAT_A_O_Gaz66_Med","UK3CB_CSAT_A_O_GAZ_Vodnik_MedEvac","UK3CB_CSAT_A_O_Marid_Amb"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CSAT_A_O_Marid","UK3CB_CSAT_A_O_BTR80a","UK3CB_CSAT_A_O_BTR80a","UK3CB_CSAT_A_O_BMD2"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_CSAT_A_O_BMP3MERA","UK3CB_CSAT_A_O_BMP3M","UK3CB_CSAT_A_O_BMP3LATE"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_CSAT_A_O_T80A","UK3CB_CSAT_A_O_T80BV","UK3CB_CSAT_A_O_T80BVK","UK3CB_CSAT_A_O_T80U","UK3CB_CSAT_A_O_T80UK"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_CSAT_A_O_ZsuTank","UK3CB_CSAT_A_O_ZSU39"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_CSAT_F_O_Rubber_Rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_CSAT_F_O_Armed_Boat_HMG_Minigun","UK3CB_CSAT_F_O_Armed_Boat_GMG_Minigun","UK3CB_CSAT_F_O_Seafox_GMG","UK3CB_CSAT_F_O_Seafox_HMG","UK3CB_CSAT_F_O_Armed_Boat_HMG_Minigun","UK3CB_CSAT_F_O_Seafox_HMG"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_CSAT_A_O_Marid","UK3CB_CSAT_A_O_BTR80a","UK3CB_CSAT_A_O_BTR80a","UK3CB_CSAT_A_O_BMD2","UK3CB_CSAT_A_O_BMP3MERA","UK3CB_CSAT_A_O_BMP3M","UK3CB_CSAT_A_O_BMP3LATE"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_CSAT_A_O_Su25SM"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_CSAT_A_O_MIG29SM"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_AAF_B_C130J_G"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_CSAT_A_O_Orca","UK3CB_CSAT_A_O_Bell412_Utility"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_CSAT_A_O_Taru_covered","UK3CB_CSAT_A_O_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_CSAT_A_O_Orca_Armed_MULTI","UK3CB_CSAT_A_O_Bell412_Armed","UK3CB_CSAT_A_O_Bell412_Armed_AT"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CSAT_A_O_Kajman","UK3CB_CSAT_A_O_Mi_24G"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_CSAT_A_O_BM21","UK3CB_CSAT_A_O_2S3","UK3CB_CSAT_A_O_2S1","UK3CB_CSAT_A_O_D30"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CSAT_A_O_2S1", ["rhs_mag_3of56_35","rhs_mag_bk13_5"]],
["UK3CB_CSAT_A_O_2S3",["rhs_mag_HE_2a33", "rhs_mag_WP_2a33"]],
["UK3CB_CSAT_A_O_BM21", ["rhs_mag_m21of_1"]],
["UK3CB_CSAT_A_O_D30", ["rhs_mag_3of56_10","rhs_mag_d462_2","rhs_mag_s463_2","rhs_mag_3of69m_2"]]
]] call _fnc_saveToTemplate;


["uavsAttack", ["UK3CB_CSAT_A_O_Ababil_AT","UK3CB_CSAT_A_O_Fenghuang"]] call _fnc_saveToTemplate;
["uavsPortable", ["UK3CB_CSAT_A_O_Darter"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_CSAT_A_O_Offroad_HMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CSAT_A_O_Gaz66_Open","UK3CB_CSAT_A_O_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CSAT_A_O_Offroad_Unarmed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_ADP_O_LandRover_Closed","UK3CB_ADP_O_LandRover_Open","UK3CB_ADP_O_Hilux_Closed","UK3CB_ADP_O_Hilux_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_CSAT_A_O_M2_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_CSAT_A_O_Kornet"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_CSAT_A_O_Igla_AA_pod","UK3CB_CSAT_A_O_RBS70"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE", "Male02FRE", "Male03FRE"]] call _fnc_saveToTemplate;
"AfricanDesertMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
/////////////////////////

private _uniforms = ["UK3CB_CSAT_A_O_U_CombatUniform_Shortsleeve", "UK3CB_CSAT_A_O_U_CombatUniform", "UK3CB_CSAT_A_O_U_Tanktop"];
private _slUniforms = ["UK3CB_CSAT_A_O_U_JumperUniform"];
private _sfUniforms = ["UK3CB_CSAT_A_O_U_SF_CombatUniform", "UK3CB_CSAT_A_O_U_SF_CombatUniform_Shortsleeve"];

private _tankUniforms = ["UK3CB_CSAT_A_O_U_Tank_Uniform"];
private _pilotUniforms = ["UK3CB_CSAT_A_O_U_H_Pilot"];
private _officerUniforms = ["UK3CB_CSAT_A_O_U_Officer"];

private _vests = ["UK3CB_CSAT_A_O_V_TacVest", "UK3CB_CSAT_A_O_V_Carrier_Rig_Light","UK3CB_CSAT_A_O_V_Carrier_Rig_Compact"];
private _glVests = ["UK3CB_CSAT_A_O_V_Carrier_Rig_Heavy"];
private _Hvests = ["UK3CB_CSAT_A_O_V_Carrier_Rig_CQB","UK3CB_CSAT_A_O_V_Carrier_Rig", "UK3CB_CSAT_A_O_V_Carrier_Rig_Tactical"];

private _milVests = ["UK3CB_CSAT_A_O_V_TacVest", "UK3CB_TKA_I_V_6Sh92_Oli","UK3CB_TKA_I_V_6Sh92_Radio_Oli","UK3CB_TKA_I_V_6Sh92_vog_Oli"];

private _medicVests = ["UK3CB_CSAT_A_O_V_Carrier_Rig_Heavy_Med","UK3CB_CSAT_A_O_V_Carrier_Rig_Light_Med"];
private _crewVests = ["UK3CB_CSAT_A_O_V_Carrier_Rig_Crew"];
private _sfVests = ["UK3CB_CSAT_A_O_V_Carrier_Rig_Tactical_TAN","UK3CB_CSAT_A_O_V_Carrier_Rig_Recon_TAN","UK3CB_CSAT_A_O_V_Carrier_Rig_CQB_TAN","UK3CB_CSAT_A_O_V_Carrier_Rig_Light_Tan","UK3CB_CSAT_A_O_V_Carrier_Rig_Heavy_Tan"];

private _backpacks = ["UK3CB_CSAT_A_O_B_FIELDPACK","UK3CB_CSAT_A_O_B_RIF"];

private _helmets = ["UK3CB_CSAT_A_H_PASGT", "UK3CB_CSAT_A_H_PASGT_RHINO"];
private _slHat = ["UK3CB_CSAT_A_O_H_Patrolcap_Mic"];
private _sniHats = ["UK3CB_CSAT_A_O_H_BoonieHat"];

private _milHelmets = ["UK3CB_CSAT_A_O_H_Patrolcap", "UK3CB_CSAT_A_O_H_SSh68_Covered"];
private _milMedicHelmets = ["UK3CB_CSAT_A_O_H_SSh68_Covered_Medic"];

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_OG7V_mag"], [], ""],
"rhs_weap_rpg26",
"rhs_weap_rpg26",
"rhs_weap_rpg26",
"rhs_weap_rshg2",
"rhs_weap_rshg2"
]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_TBG7V_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
"uk3cb_saeghe2"
]];
_loadoutData set ["AALaunchers", [
"rhs_weap_igla"
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5","rhs_mag_rgn","rhs_mag_rgo"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["slUniforms", _slUniforms];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", _backpacks];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["medicHelmets", []];
_loadoutData set ["slHat", _slHat];
_loadoutData set ["sniHats", _sniHats];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries"];
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
_sfLoadoutData set ["uniforms", _sfUniforms];
_sfLoadoutData set ["slUniforms", _sfUniforms];
_sfLoadoutData set ["vests", _sfVests];
_sfLoadoutData set ["glVests", _sfVests];
_sfLoadoutData set ["Hvests", _sfVests];
_sfLoadoutData set ["helmets", ["UK3CB_CSAT_A_O_H_6b27m_Alt", "UK3CB_CSAT_A_O_H_6b27m_ESS_Alt"]];
_sfLoadoutData set ["slHat", _helmets];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02"]];
//SF Weapons
_sfLoadoutData set ["slRifles", [
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst1ik_ris", "rhsusf_acc_ACOG", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst3", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst3", "rhsusf_acc_ACOG_RMR", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M397_HET","rhs_mag_M433_HEDP","rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["rifles", [
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst3", "rhs_acc_ekp8_18", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_ak74mr", "rhs_acc_tgpa", "rhsusf_acc_wmx_bk", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK"], [], "rhs_acc_grip_rk6"],
["rhs_weap_ak74mr", "rhs_acc_tgpa", "rhsusf_acc_wmx_bk", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK"], [], "rhs_acc_grip_rk6"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst3", "rhs_acc_ekp8_18", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M397_HET","rhs_mag_M433_HEDP","rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["UK3CB_MP5SD5", "", "", "rhs_acc_1p87", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhs_acc_rakursPM", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD6", "", "", "rhs_acc_1p87", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD6", "", "", "rhs_acc_rakursPM", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst3", "rhs_acc_1p87", ["UK3CB_FNFAL_30rnd_762x51_G","UK3CB_FNFAL_30rnd_762x51_G","UK3CB_FNFAL_30rnd_762x51_GT"], [], "rhs_acc_harris_swivel"],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhs_acc_perst3", "rhs_acc_1p87", ["UK3CB_FNFAL_30rnd_762x51_G","UK3CB_FNFAL_30rnd_762x51_G","UK3CB_FNFAL_30rnd_762x51_GT"], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_G3KA4", "uk3cb_muzzle_snds_g3", "rhs_acc_perst1ik_ris", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhs_acc_harris_swivel"],
["rhs_weap_svds_npz", "rhs_acc_tgpv2", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["uk3cb_HS50", "", "", "rhs_acc_dh520x56", [], [], ""],
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_PC9_ZOAF", "rhsusf_acc_omega9k", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["vests", _vests];
_militaryLoadoutData set ["glVests", _glVests];
_militaryLoadoutData set ["Hvests", _Hvests];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_02"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_FNFAL_OSW", "", "rhs_acc_perst1ik_ris", "rhsusf_acc_ACOG", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhs_acc_perst3", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhs_acc_perst3", "rhsusf_acc_ACOG_RMR", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M397_HET","rhs_mag_M433_HEDP","rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_FNFAL_OSW", "", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhs_acc_perst3", "rhs_acc_ekp8_18", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_ak74mr", "rhs_acc_uuk", "rhsusf_acc_wmx_bk", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK"], [], "rhs_acc_grip_rk6"]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhs_acc_perst3", "rhs_acc_ekp8_18", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M397_HET","rhs_mag_M433_HEDP","rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP5N", "", "rhs_acc_perst1ik_ris", "rhs_acc_okp7_picatinny", [], [], ""],
["UK3CB_MP5A3", "", "uk3cb_acc_surefiregrip", "rhs_acc_okp7_picatinny", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n21_20"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_fnmag", "", "", "rhsusf_acc_ELCAN", ["rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "rhs_acc_1p87", ["rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "rhs_acc_1p87", ["rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m62_tracer"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_FNFAL_OSW", "", "rhs_acc_perst3", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], "rhs_acc_harris_swivel"],
["UK3CB_FNFAL_OSW", "", "rhs_acc_perst3", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_FNFAL_20rnd_762x51", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], "rhs_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["UK3CB_PC9_ZOAF"]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["UK3CB_TKP_B_V_TacVest_Blk"]];
_policeLoadoutData set ["helmets", ["UK3CB_H_Cap_APD", "UK3CB_H_Cap_Headset_APD"]];

_policeLoadoutData set ["SMGs", [
["rhs_weap_akmn_npz", "rhs_acc_dtkakm", "", "rhs_acc_okp7_picatinny", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n21_20"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["UK3CB_PC9_ZOAF", "", "acc_flashlight_pistol", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["vests", _milVests];
_militiaLoadoutData set ["glVests", _milVests];
_militiaLoadoutData set ["Hvests", _milVests];
_militiaLoadoutData set ["helmets", _milHelmets];
_militiaLoadoutData set ["medicHelmets", _milMedicHelmets];

_militiaLoadoutData set ["rifles", [
["UK3CB_FNFAL_FOREGRIP", "", "", "", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_FULL_RAILS", "", "", "", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["UK3CB_FNFAL_PARA_RAILS", "", "", "", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "", "", "", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP","rhs_mag_M441_HE","rhs_mag_m714_White"], ""],
["UK3CB_MP5N_UGL", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], ["rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_m662_red","rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n21_20"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_FNLAR", "", "", "", ["UK3CB_Bren_30Rnd_762x51_Magazine_G", "UK3CB_Bren_30Rnd_762x51_Magazine_G", "UK3CB_Bren_30Rnd_762x51_Magazine_GT"], [], ""],
["rhs_weap_fnmag", "", "", "", ["UK3CB_MG3_50rnd_762x51_G", "UK3CB_MG3_50rnd_762x51_GM","UK3CB_MG3_50rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_FNFAL_FOREGRIP", "", "", "rhsgref_acc_l1a1_l2a2", ["UK3CB_FNFAL_20rnd_762x51", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_PARA_RAILS", "", "", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["UK3CB_FNFAL_FULL_RAILS", "", "", "rhsusf_acc_su230a", ["UK3CB_FNFAL_20rnd_762x51", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], "rhsusf_acc_harris_swivel"]
]];
_militiaLoadoutData set ["sidearms", [
["UK3CB_PC9_ZOAF", "", "acc_flashlight_pistol", "", [], [], ""]
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", _tankUniforms];
_crewLoadoutData set ["vests", _crewVests];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_bala", "rhs_tsh4_ess", "rhs_tsh4_ess_bala"]];

_crewLoadoutData set ["carbines", [
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_uuk", "rhsusf_acc_wmx_bk", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["UK3CB_MP5K_PDW", "", "", "rhs_acc_okp7_picatinny", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", _pilotUniforms];
_pilotLoadoutData set ["vests", _crewVests];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

_pilotLoadoutData set ["carbines", [
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n21_20"], [], ""],
["UK3CB_MP5K_PDW", "", "", "rhs_acc_okp7_picatinny", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], [], ""]
]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", _officerUniforms];
_officerLoadoutData set ["Hvests", _vests];
_officerLoadoutData set ["helmets", ["UK3CB_CSAT_IRAN_H_Beret"]];

_officerLoadoutData set ["slRifles", [
["UK3CB_FNFAL_PARA", "", "", "", ["UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_G", "UK3CB_FNFAL_20rnd_762x51_GT"], [], ""],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_uuk", "rhsusf_acc_wmx_bk", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];

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
    [["medicHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
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
    ["primary", 6] call _fnc_addMagazines;

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
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
