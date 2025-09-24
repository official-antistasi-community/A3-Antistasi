//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ChDKZ"] call _fnc_saveToTemplate;
["spawnMarkerName", "ChDKZ support corridor"] call _fnc_saveToTemplate;

["flag", "rhs_Flag_Russia_F"] call _fnc_saveToTemplate;
["flagTexture", "rhsgref\addons\rhsgref_main\data\flag_chdkz_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_chdkz"] call _fnc_saveToTemplate;
/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
"WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11",
"WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
"WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["RHS_Male01RUS", "RHS_Male02RUS", "RHS_Male03RUS", "RHS_Male04RUS", "RHS_Male05RUS"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["I_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_ins_uaz", "rhsgref_ins_uaz_open", "rhsgref_ins_uaz_open", "rhsgref_BRDM2UM_ins"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["rhsgref_ins_uaz_spg9","rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_ags", "rhsgref_BRDM2_HQ_ins","rhsgref_ins_gaz66_zu23","rhsgref_ins_ural_Zu23"]] call _fnc_saveToTemplate;
["vehiclesTrucks", [
"rhsgref_ins_gaz66","rhsgref_ins_gaz66o",
"rhsgref_ins_ural","rhsgref_ins_ural_open",
"rhsgref_BRDM2UM_ins", "rhsgref_BRDM2_HQ_ins"
]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", [
"rhsgref_ins_gaz66o_flat","rhsgref_ins_gaz66_flat",
"rhsgref_ins_zil131_flatbed_cover","rhsgref_ins_zil131_flatbed"
]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhsgref_ins_gaz66_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["rhsgref_ins_gaz66_repair","rhsgref_ins_ural_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["RHS_Ural_Fuel_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhsgref_ins_gaz66_ap2"]] call _fnc_saveToTemplate;

["vehiclesLightAPCs", ["rhsgref_BRDM2_ins"]] call _fnc_saveToTemplate;            //this line determines light APCs
["vehiclesAPCs", ["rhsgref_ins_btr60","rhsgref_ins_btr60","rhsgref_ins_btr60","rhsgref_ins_btr60","rhsgref_ins_btr70","rhsgref_ins_btr70","rhsgref_ins_bmd2","rhsgref_ins_bmd1p","rhsgref_ins_bmd1"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["rhsgref_ins_bmp2k","rhsgref_ins_bmp2d","rhsgref_ins_bmp2e","rhsgref_ins_bmp2","rhsgref_ins_bmp1p","rhsgref_ins_bmp1k","rhsgref_ins_bmp1d","rhsgref_ins_bmp1"]] call _fnc_saveToTemplate;                //this line determines IFVs
["vehiclesTanks", ["a3a_rhs_chdkz_72a","a3a_rhs_chdkz_72a","a3a_rhs_chdkz_72b","a3a_rhs_chdkz_72c"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhsgref_ins_zsu234"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["O_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["rhsgref_ins_btr60","rhsgref_ins_btr70", "rhsgref_BRDM2_ins","rhsgref_BRDM2_ins", "rhsgref_ins_bmp2","rhsgref_ins_bmp1"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHS_Su25SM_vvsc"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_mig29s_vvs","rhs_mig29sm_vvs"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["a3a_rhs_Mi8mt_chdkz"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["a3a_rhs_Mi8T_chdkz"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["a3a_rhs_Mi8mt_chdkz","a3a_rhs_Mi8mt_chdkz", "RHS_Mi24Vt_vvsc"]] call _fnc_saveToTemplate; //Mi8mt has pk's, Mi24Vt has 12.7 turret only
["vehiclesHelisLightAttack", ["RHS_Mi24P_vvsc", "a3a_rhs_Mi8MTV3_chdkz","a3a_rhs_Mi8MTV3_heavy_chdkz","a3a_rhs_Mi8AMTSh_chdkz"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_Mi24V_vvsc"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsgref_ins_2s1","rhsgref_ins_d30","rhsgref_ins_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhsgref_ins_2s1",["rhs_mag_3of56_35"]],
["rhsgref_ins_d30",["rhs_mag_3of56_10"]],
["rhsgref_ins_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["rhsgref_ins_uaz_dshkm"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhsgref_ins_ural_work","rhsgref_ins_ural_work_open","rhsgref_ins_zil131_open","rhsgref_ins_zil131"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_ins_uaz", "rhsgref_ins_uaz_open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["rhsgref_ins_gaz66","rhsgref_ins_uaz", "rhsgref_ins_uaz_open"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_ins_DSHKM"]] call _fnc_saveToTemplate; 
["staticAT", ["rhsgref_ins_SPG9","rhsgref_ins_SPG9M"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_ins_ZU23","rhsgref_ins_Igla_AA_pod"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_ins_2b14"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"
//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["saboteurCarbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["rhs_weap_rpg26", "rhs_weap_rpg26", "rhs_weap_rshg2"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_OG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_loadoutData set ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag"], [], ""]
]];

_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", ["rhs_weap_makarov_pm","rhs_weap_tt33","rhs_weap_rsp30_red","rhs_weap_savz61_folded"]];

_loadoutData set ["ATMines", ["rhs_mag_mine_ptm1", "rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_ozm72_a_mag", "rhs_mine_ozm72_b_mag", "rhs_mine_ozm72_c_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag","rhs_mag_f1","rhs_mag_f1","rhs_mag_f1"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
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
_loadoutData set ["backpacks", ["rhs_sidor"]];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_vl"]];
_loadoutData set ["aaBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["mgBackpacks", ["rhs_sidor"]];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

_loadoutData set ["sniHats", ["H_Booniehat_oli"]];
_loadoutData set ["facewear", ["rhs_balaclava1_olive", "rhs_balaclava", "G_Balaclava_oli","G_Balaclava_blk",""]];

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
//Russian Spetznas getting involved

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["rhs_uniform_6sh122_gloves_v1"]];
_sfLoadoutData set ["vests", ["rhs_6b23_digi_6sh92_Spetsnaz", "rhs_6b23_digi_6sh92_spetsnaz2"]];
_sfLoadoutData set ["slVests", ["rhs_6b23_digi_6sh92_headset_spetsnaz", "rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz"]];
_sfLoadoutData set ["glVests", ["rhs_6b23_digi_6sh92_Vog_Spetsnaz", "rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz"]];
_sfLoadoutData set ["backpacks", ["rhs_assault_umbts", "B_Kitbag_sgg", "rhs_sidor"]];
_sfLoadoutData set ["helmets", ["rhs_Booniehat_digi", "rhs_altyn", "rhs_altyn_novisor", "rhs_altyn_novisor_ess", "rhs_gssh18"]];
_sfLoadoutData set ["slHat", ["rhs_beret_mvd"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_03"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15", "rhs_1PN138"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo"]];

_sfLoadoutData set ["facewear", ["rhs_balaclava1_olive", "rhs_balaclava", "G_Balaclava_oli","G_Balaclava_blk",""]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk4screws", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk4short", "", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhs_acc_rakursPM", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_pp2000", "", "", "rhs_acc_1p87", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_rakursPM", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_ekp8_18", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n31_44"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_aks74un", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7U1_AK","rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7U1_AK","rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pkas", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_60Rnd_545X39_7N22_AK", "rhs_60Rnd_545X39_AK_Green"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk3", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_60Rnd_545X39_7N22_AK", "rhs_60Rnd_545X39_AK_Green"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk3", "rhs_acc_perst3_2dp_h", "rhs_acc_1p78", ["rhs_60Rnd_545X39_7N22_AK", "rhs_60Rnd_545X39_AK_Green"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk3", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_60Rnd_545X39_7N22_AK", "rhs_60Rnd_545X39_AK_Green"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk1", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_75Rnd_762x39mm_89", "rhs_75Rnd_762x39mm_tracer"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk1", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_75Rnd_762x39mm_89", "rhs_75Rnd_762x39mm_tracer"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk1", "rhs_acc_perst3_2dp_h", "rhs_acc_1p78", ["rhs_75Rnd_762x39mm_89", "rhs_75Rnd_762x39mm_tracer"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk1", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_75Rnd_762x39mm_89", "rhs_75Rnd_762x39mm_tracer"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_pkp", "", "", "rhs_acc_1p29", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p78", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_pkas", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""],
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""],
["rhs_weap_pp2000_folded", "", "", "rhs_acc_ekp8_18", ["rhs_mag_9x19mm_7n31_44"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["rhsgref_uniform_reed"]];
_militaryLoadoutData set ["vests", ["rhs_6b3_AK_3","rhs_6b3_AK_2","rhs_6b3_AK","rhs_6b3","rhs_6b2_AK","rhs_6b2_chicom","rhs_6b2_lifchik","rhs_6b2_RPK","rhs_6b2_SVD","rhs_6sh92_digi","rhs_6sh92_digi_radio","rhs_6sh92","rhs_6sh92_radio","V_TacVest_blk","V_BandollierB_rgr","V_Chestrig_rgr"]];
_militaryLoadoutData set ["glVests", ["rhs_6sh92_digi_vog","rhs_6sh92_vog","rhs_6b3_VOG","rhs_6b3_VOG_2"]];
_militaryLoadoutData set ["slVests", ["rhs_6sh92_digi_vog_headset","rhs_6sh92_vog_headset","rhs_6b3_VOG","rhs_6b3_VOG_2"]];
_militaryLoadoutData set ["helmets", [
"rhs_ssh60","rhs_ssh68_2", "rhs_ssh60","rhs_ssh68_2", 
"rhs_6b47_bare", "rhs_6b28_green", "rhs_6b27m_green", "rhs_6b26_green", //RU supplied
"rhsgref_6b27m_ttsko_digi","rhsgref_6b27m_ttsko_forest","rhsgref_6b27m_ttsko_mouintain","rhsgref_6b27m_ttsko_urban", //Stolen from CDF
"", "", ""
]];
_militaryLoadoutData set ["slHat", ["H_Beret_blk"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak103", "rhs_acc_dtk", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak103", "rhs_acc_dtk", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_ak105", "rhs_acc_pgs64", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militaryLoadoutData set ["saboteurCarbines", [
["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7U1_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7U1_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7U1_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7U1_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pbs4", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7U1_AK"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["SMGs", ["rhs_weap_savz61"]];
_militaryLoadoutData set ["machineGuns", [
"rhs_weap_pkm","rhs_weap_pkm","rhs_weap_pkm",
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_1p78", ["rhs_75Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_75Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_1p78", ["rhs_45Rnd_545X39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_45Rnd_545X39_AK_Green", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_1p78", ["rhs_60Rnd_545X39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_60Rnd_545X39_AK_Green", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m21", ["rhsgref_10Rnd_792x57_m76"], [], ""],
["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk", "rhs_acc_2dpZenit", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["rhs_uniform_omon"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police", "H_PASGT_basic_blue_F", "rhs_omon_cap"]];
_policeLoadoutData set ["NVGs", []];
_policeLoadoutData set ["facewear", []];

_policeLoadoutData set ["SMGs", ["rhs_weap_savz61","rhs_weap_savz61",
"rhs_weap_pp2000",["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n31_44"], [], ""]]];

_policeLoadoutData set ["rifles", ["rhs_weap_m38","rhs_weap_m38",
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_10Rnd_762x39mm_U"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_10Rnd_762x39mm_U"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_Izh18", "", "", "", ["rhsgref_1Rnd_Slug", "rhsgref_1Rnd_00Buck"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm","rhs_weap_tt33"]];



////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;

_militiaLoadoutData set ["uniforms", ["rhsgref_uniform_reed"]];
_militiaLoadoutData set ["vests", ["rhs_6b2","rhs_6sh92_digi","rhs_6sh92_digi_radio","rhs_6sh92","rhs_6sh92_radio","V_TacVest_blk","V_BandollierB_rgr","V_Chestrig_rgr"]];
_militiaLoadoutData set ["glVests", ["rhs_6sh92_digi_vog","rhs_6sh92_vog"]];
_militiaLoadoutData set ["helmets", ["rhs_ssh60","rhs_ssh68_2", "", ""]];
_militiaLoadoutData set ["NVGs", []];
_militiaLoadoutData set ["slHat", ["rhsgref_patrolcap_specter"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag"], [], ""]]];
_militiaLoadoutData set ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "",["rhs_rpg7_PG7VL_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["rifles", [
["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_3", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_green_AK","rhs_30Rnd_545x39_7N6M_green_AK"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_pm63", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_aks74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["saboteurCarbines", [
["rhs_weap_aks74u", "", "", "", ["rhs_30Rnd_545x39_7U1_AK"], [], ""],
["rhs_weap_akms", "", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm_U"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x39mm_tracer"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm","rhs_weap_tt33","rhs_weap_rsp30_red"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["rhs_uniform_gorka_r_g_gloves", "rhs_uniform_gorka_r_y_gloves"]];
_crewLoadoutData set ["vests", ["rhs_6b3_holster"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_ess"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["rhs_uniform_df15","rhs_uniform_df15_tan"]];
_pilotLoadoutData set ["vests", ["rhs_vest_commander", "rhs_gear_OFF"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["rhsgref_uniform_reed"]];
_officerLoadoutData set ["slVests", ["rhs_vest_commander", "rhs_gear_OFF"]];
_officerLoadoutData set ["slHat", ["rhs_beret_mvd"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["facewear", ["G_Squares_Tinted","G_Aviator"]];

_officerLoadoutData set ["slRifles", [
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms_folded", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un_folded", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];

////////////////////////////////
//    Additional uniforms     //
////////////////////////////////


if (isClass (configFile >> "CfgPatches" >> "UK3CB_Factions_CHD_O")) then {

    private _uniforms3cb = [];
    private _uniformsmilitia3cb = [];
    switch (A3A_climate) do 
    {
        case "tropical": {
            _uniformsmilitia3cb = ["UK3CB_CHD_B_U_H_Pilot_Uniform_03", "UK3CB_CHD_B_U_CombatUniform_04","UK3CB_CHD_B_U_CombatUniform_07"];
            _uniforms3cb = _uniformsmilitia3cb + ["UK3CB_CHD_B_U_CombatSmock_09", "UK3CB_CHD_B_U_CombatSmock_03", "UK3CB_CHD_B_U_CombatSmock_07"];
        };
        case "arid":{
            _uniformsmilitia3cb = ["UK3CB_CHD_B_U_H_Pilot_Uniform_03", "UK3CB_CHD_B_U_H_Pilot_Uniform_02","UK3CB_CHD_B_U_H_Pilot_Uniform_01"];
            _uniforms3cb = _uniformsmilitia3cb + ["UK3CB_CHD_B_U_CombatSmock_06"];
        };
        case "arctic":   {
            _uniforms3cb = ["UK3CB_CHD_B_U_CombatSmock_01", "UK3CB_CHD_B_U_CombatSmock_02","UK3CB_CHD_W_B_U_CombatSmock_06","UK3CB_CHD_B_U_CombatSmock_11","UK3CB_CHD_W_B_U_CombatSmock_04"];
            _uniformsmilitia3cb = _uniforms3cb;
        };
        default          {  //Unknown or temperate
            _uniforms3cb = ["UK3CB_CHD_B_U_CombatUniform_01", "UK3CB_CHD_B_U_CombatUniform_02","UK3CB_CHD_B_U_CombatUniform_03"];
            _uniformsmilitia3cb = _uniforms3cb;
        };
    };
    _militiaLoadoutData set ["uniforms", _uniformsmilitia3cb];
    _militaryLoadoutData set ["uniforms", _uniforms3cb];
    
    _officerLoadoutData set ["uniforms", ["UK3CB_CHD_B_U_CombatUniform_09"]];
    _officerLoadoutData set ["slHat", ["UK3CB_H_Civ_Beret"]];

    private _militiaPPSH = [
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_35rnd_magazine", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""],
    ["uk3cb_ppsh41", "", "", "", ["uk3cb_PPSH_71rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_G", "uk3cb_PPSH_35rnd_magazine_GM", "uk3cb_PPSH_35rnd_magazine_GT"], [], ""]
    ];
    
    (_militaryLoadoutData get "SMGs") append _militiaPPSH;
    (_militaryLoadoutData get "marksmanRifles") append [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
    ];
    (_militaryLoadoutData get "sniperRifles") append [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
    ];
    (_militaryLoadoutData get "machineGuns") append [
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_GT"], [], ""],
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_GT"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT"], [], ""]
    ];

    (_militiaLoadoutData get "rifles") append [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer"], [], ""]
    ];
    (_militiaLoadoutData get "SMGs") append _militiaPPSH;
    (_militiaLoadoutData get "carbines") append _militiaPPSH;
    (_militiaLoadoutData get "saboteurCarbines") append _militiaPPSH;
    (_militiaLoadoutData get "machineGuns") append [
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_GT"], [], ""],
    ["UK3CB_RPD", "", "", "", ["UK3CB_RPD_100rnd_762x39", "UK3CB_RPD_100rnd_762x39_G", "UK3CB_RPD_100rnd_762x39_GM", "UK3CB_RPD_100rnd_762x39_GT"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT"], [], ""],
    ["UK3CB_RPK", "", "", "", ["UK3CB_RPK_40rnd_762x39", "UK3CB_RPK_40rnd_762x39_G", "UK3CB_RPK_40rnd_762x39_GM", "UK3CB_RPK_40rnd_762x39_GT"], [], ""]
    ];
    (_militiaLoadoutData get "sniperRifles") append [
    ["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
    ];

    (_policeLoadoutData get "rifles") append [
    ["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_G", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
    ["uk3cb_sks_02", "", "", "", ["rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer"], [], ""]
    ];
    (_policeLoadoutData get "SMGs") append _militiaPPSH;
    (_policeLoadoutData get "SMGs") append _militiaPPSH; //Twice for twice the ppshs, police have more other SMGs than the others
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
	[["slHat","helmets"] call _fnc_fallback]call _fnc_setHelmet;
    [["slVests","glVests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;
    ["medBackpacks"] call _fnc_setBackpack;
	["carbines"] call _fnc_setPrimary;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
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
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;
    ["aaBackpacks"] call _fnc_setBackpack;

    [["saboteurCarbines", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;
    ["aaBackpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
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
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
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
    ["vests"] call _fnc_setVest;
    ["facewear"] call _fnc_setFacewear;
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
    ["sniHats"] call _fnc_setHelmet;
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
    ["sniHats"] call _fnc_setHelmet;
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
    ["facewear"] call _fnc_setFacewear;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted["SMGs",2, "rifles",2, "shotGuns",1]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
    ["handgun", 8] call _fnc_addMagazines;
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
["other", [["Official", _squadLeaderTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
