//////////////////////////
//   Side Information   //
//////////////////////////

["name", "TLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "TLA support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_Blue_F"] call _fnc_saveToTemplate;
["flagTexture", "\rhsafrf\addons\rhs_main\data\Flag_trn_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "rhs_flag_trn"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_T_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_BRDM2UM_msv"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["rhsgref_BRDM2_msv"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["rhs_gaz66_msv","rhs_gaz66_msv","rhsgref_BRDM2_HQ_msv","rhsgref_BRDM2UM_msv"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["rhs_gaz66_flat_msv"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhs_gaz66_ammo_msv"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["RHS_Ural_Repair_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["RHS_Ural_Fuel_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhs_gaz66_ap2_msv"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;            //this line determines light APCs
["vehiclesAPCs", ["rhsgref_tla_btr60"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["rhs_bmp1_msv", "rhs_bmp1k_msv", "rhs_bmp1p_msv", "rhs_bmp1d_msv"]] call _fnc_saveToTemplate;                //this line determines IFVs
["vehiclesTanks", ["rhs_t72ba_tv"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhs_zsu234_aa"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["rhsgref_hidf_rhib","B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["rhsgref_tla_btr60","rhs_bmp1_msv", "rhs_bmp1k_msv", "rhs_bmp1p_msv","rhsgref_BRDM2_HQ_msv","rhsgref_BRDM2UM_msv","rhsgref_BRDM2_msv"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHSGREF_A29B_HIDF", "RHS_Su25SM_vvsc"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_l159_cdf_b_CDF_CAP"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["RHS_Mi8t_vv"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["RHS_Mi8mt_vv"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["a3a_rhs_Mi8AMTSh_tla", "a3a_rhs_Mi8MTV3_heavy_tla", "a3a_rhs_Mi8MTV3_tla"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_Mi24V_vvsc"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsgref_ins_d30", "RHS_BM21_VV_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhs_2s1_tv", ["rhs_mag_3of56_35"]],
["rhsgref_ins_d30",["rhs_mag_3of56_10"]],
["RHS_BM21_VV_01", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;    
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhs_zil131_msv"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhs_uaz_open_MSV_01", "RHS_UAZ_MSV_01"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["rhsgref_cdf_b_reg_uaz_open", "rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD", "rhsgref_ins_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_tla_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_ZU23_MSV"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04",
"TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE"]] call _fnc_saveToTemplate;
["sfFaces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
"TanoanMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["gltube", [["rhs_weap_m79", "", "", "",["rhs_mag_M441_HE","rhs_mag_m714_White","rhs_mag_m662_red"], [], ""]]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["rhs_weap_rpg18", "rhs_weap_rpg26", "rhs_weap_rshg2"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_loadoutData set ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VR_mag","rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VS_mag","rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_TBG7V_mag","rhs_rpg7_PG7VM_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", ["rhsusf_weap_m1911a1", "rhs_weap_makarov_pm", "rhs_weap_makarov_pm"]];

_loadoutData set ["ATMines", ["rhs_mag_mine_ptm1", "rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_ozm72_a_mag", "rhs_mine_ozm72_b_mag", "rhs_mine_ozm72_c_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_f1", "rhs_grenade_sthgr24_mag"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white", "rhs_grenade_nbhgr39_mag"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Hat_Safari_olive_F"]];
_loadoutData set ["sniHats", ["H_Hat_Safari_olive_F"]];


//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadleader_extras", []];
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
_sfLoadoutData set ["uniforms", ["rhs_uniform_mflora_patchless"]];
_sfLoadoutData set ["vests", ["rhs_6b23_ML_6sh92", "rhs_6b23_ML_vydra_3m"]];
_sfLoadoutData set ["backpacks", ["rhs_rd54_vest","rhs_tortila_khaki"]];
_sfLoadoutData set ["helmets", ["rhs_6b27m_ml","rhs_6b27m_ml_ess"]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];
_sfLoadoutData set ["slHat", ["rhs_fieldcap_helm_ml", "rhs_fieldcap_ml"]];
_sfLoadoutData set ["NVGs", ["rhs_1PN138"]];

_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7", "rhs_weap_rshg2"]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_U"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_aks74n", "rhs_acc_dtk4short", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7U1_AK", "rhs_30Rnd_545x39_7U1_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7U1_AK", "rhs_30Rnd_545x39_7U1_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_m92", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_aks74n_gp25", "rhs_acc_dtk4short", "", "rhs_acc_ekp8_02", 	["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White", "rhs_VG40OP_red"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk4short", "", "rhs_acc_ekp8_02", 	["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P", "rhs_VOG25P", "rhs_GRD40_White", "rhs_VG40OP_red"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_ekp8_02", 	["rhs_30Rnd_762x39mm_U"], ["rhs_VG40TB", "rhs_VG40TB", "rhs_GRD40_White", "rhs_VG40OP_red"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_m3a1_specops", "", "", "rhs_acc_okp7_picatinny", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_rpk74m", "rhs_acc_dtk4short", "", "rhs_acc_1p29", ["rhs_45Rnd_545X39_7U1_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "rhs_acc_tgpv", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
//_sfLoadoutData set ["sidearms", []];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["rhsgref_uniform_TLA_1"]];
_militaryLoadoutData set ["vests", ["rhs_lifchik","rhs_lifchik_light","rhs_6b2_lifchik","rhs_6b2_lifchik"]];
_militaryLoadoutData set ["backpacks", ["rhs_sidor", "rhs_sidor", "rhs_rd54_flora2"]];
_militaryLoadoutData set ["helmets", ["rhsgref_helmet_pasgt_olive","rhsgref_M56","rhs_headband"]];
_militaryLoadoutData set ["NVGs", ["rhs_1PN138"]];

_militaryLoadoutData set ["rifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_m92", "", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White", "rhs_VG40OP_red"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White", "rhs_VG40OP_red"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_SF3P556", "", "",["rhs_mag_20Rnd_556x45_M193_2MAG_Stanag","rhs_mag_20Rnd_556x45_M193_2MAG_Stanag","rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red"], ["rhs_mag_M433_HEDP","rhs_mag_m714_White","rhs_mag_m662_red"], ""]
]];
_militaryLoadoutData set ["SMGs", [
"rhs_weap_m3a1"
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_fnmag", "", "", "",["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_mg42", "", "", "",["rhsgref_50Rnd_792x57_SmE_drum", "rhsgref_50Rnd_792x57_SmE_drum", "rhsgref_50Rnd_792x57_SmE_notracers_drum"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_m76", "", "", "rhs_acc_pso1m2",[], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m38_rail", "", "", "rhsusf_acc_LEUPOLDMK4",[], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["rhsgref_uniform_TLA_2"]];
_policeLoadoutData set ["vests", ["rhsgref_chestrig"]];
_policeLoadoutData set ["helmets", ["H_Hat_Safari_olive_F"]];
_policeLoadoutData set ["SMGs", [
"rhs_weap_m3a1"
]];
_policeLoadoutData set ["carbines", [
"rhs_weap_m1garand_sa43"
]];
_policeLoadoutData set ["shotguns", [
"rhs_weap_M590_5RD"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["rhsgref_uniform_TLA_2"]];
_militiaLoadoutData set ["vests", ["rhs_lifchik","rhs_lifchik_light"]];
_militiaLoadoutData set ["backpacks", ["rhs_sidor"]];
_militiaLoadoutData set ["helmets", ["rhs_headband","rhsgref_M56","rhsgref_helmet_M1_painted_alt01"]];
_militiaLoadoutData set ["NVGs", []];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_OG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_militiaLoadoutData set ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_pm63", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_m92", "", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White", "rhs_VG40OP_red"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White", "rhs_VG40OP_red"], ""]
]];
_militiaLoadoutData set ["SMGs", [
"rhs_weap_m3a1"
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_fnmag", "", "", "",["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
"rhs_weap_m1garand_sa43"
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_pso1m2", 	["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
"rhs_weap_m1garand_sa43"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["rhsgref_TacVest_ERDL"]];
_crewLoadoutData set ["carbines", ["rhs_weap_m1garand_sa43"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4","rhs_tsh4_ess"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["rhsgref_TacVest_ERDL"]];
_pilotLoadoutData set ["SMGs", ["rhs_weap_m3a1"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

if (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_CHD_O")) then {
    (_militaryLoadoutData get "rifles") append [
    ["UK3CB_M16A2", "", "", "", ["rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
    ];
    (_militaryLoadoutData get "carbines") append [
    ["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
    ];
    (_militaryLoadoutData get "grenadeLaunchers") append [
    ["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
    ];
    (_militaryLoadoutData get "SMGs") append [
    "rhs_weap_m3a1",
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""],
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_71rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
    ];
    (_militaryLoadoutData get "machineGuns") append [
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_GT"], [], ""],
    ["UK3CB_RPK", "", "", "", ["rhs_75Rnd_762x39mm", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT"], [], ""],
    ["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_RM", "UK3CB_M60_100rnd_762x51_RT"], [], ""]
    ];
    (_militaryLoadoutData get "marksmanRifles") append [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
    ];
    (_militaryLoadoutData get "sniperRifles") append [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn93_1", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
    ];

    (_militiaLoadoutData get "rifles") append [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
    ];
    (_militiaLoadoutData get "carbines") append [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
    ];
    (_militiaLoadoutData get "SMGs") append [
    "rhs_weap_m3a1",
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""],
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_71rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
    ];
    (_militiaLoadoutData get "machineGuns") append [
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_GT"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT"], [], ""]
    ];
    (_militiaLoadoutData get "sniperRifles") append [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
    ];

    (_policeLoadoutData get "rifles") append [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""]
    ];
    (_policeLoadoutData get "SMGs") append [
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["grenadeLaunchers", 1, "rifles",2]] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted ["rifles", 3, "carbines", 1]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
	["SMGs"] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;
    ["antiInfantryGrenades", 2] call _fnc_addItem;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom["ATLaunchers", "heavyATLaunchers"]] call _fnc_setLauncher;
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

    [selectRandomWeighted ["carbines", 1, "SMGs",2, "shotguns", 1]] call _fnc_setPrimary;
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

    [selectRandomWeighted ["carbines", 1, "SMGs",2]] call _fnc_setPrimary;
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
private _pilotTemplate = {
    ["helmets"] call _fnc_setHelmet;
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
["other", [["Pilot", _pilotTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
