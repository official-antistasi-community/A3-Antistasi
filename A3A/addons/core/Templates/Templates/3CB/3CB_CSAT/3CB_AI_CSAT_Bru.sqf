
//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSAT Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_w_regiment_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CSAT_Woodland"] call _fnc_saveToTemplate;
["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesTransportBoats", ["UK3CB_CSAT_F_O_Rubber_Rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_CSAT_F_O_Armed_Boat_HMG_Minigun","UK3CB_CSAT_F_O_Armed_Boat_GMG_Minigun","UK3CB_CSAT_F_O_Seafox_GMG","UK3CB_CSAT_F_O_Seafox_HMG","UK3CB_CSAT_F_O_Armed_Boat_HMG_Minigun","UK3CB_CSAT_F_O_Seafox_HMG"]] call _fnc_saveToTemplate;

["vehiclesPlanesTransport", ["UK3CB_AAF_B_C130J_G"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_CSAT_B_O_M2_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_CSAT_B_O_Kornet"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

private _uniforms = [];
private _slUniforms = [];
private _sfUniforms = [];

private _tankUniforms = [];
private _pilotUniforms = [];
private _officerUniforms = [];

private _vests = [];
private _Hvests = [];
private _glVests = [];
private _milVests = [];

private _medicVests = [];
private _crewVests = [];
private _sfVests = [];

private _backpacks = [];

private _helmets = [];
private _sfHelmets = [];
private _slHat = [];
private _sniHats = [];

private _milHelmets = [];
private _milMedicHelmets = [];

switch (A3A_climate) do 
{
    case "arid":{
        //Urban
        #include "3CB_AI_CSAT_Bru_U.sqf"
    };
    case "arctic":   {
        //Winter
        #include "3CB_AI_CSAT_Bru_S.sqf"
    };
    case "temperate";
    case "tropical": {
        //europe
        #include "3CB_AI_CSAT_Bru_W.sqf"
    };
    default          {
        //europe
        #include "3CB_AI_CSAT_Bru_W.sqf"
    };
};

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04",
"AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07", "LivonianHead_6", "Sturrock",
"WhiteHead_02", "WhiteHead_03", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07",
"WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_12", "WhiteHead_13",
"WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_18", "WhiteHead_19",
"WhiteHead_20"]] call _fnc_saveToTemplate;
["voices", ["RHS_Male01RUS", "RHS_Male02RUS", "RHS_Male03RUS", "RHS_Male04RUS", "RHS_Male05RUS"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

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
_loadoutData set ["helmets", []];
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
_sfLoadoutData set ["helmets", _sfHelmets];
_sfLoadoutData set ["glVests", _sfVests];
_sfLoadoutData set ["Hvests", _sfVests];
_sfLoadoutData set ["slHat", _sfHelmets];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02"]];
//SF Weapons
_sfLoadoutData set ["slRifles", [
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_tgpa", "rhs_acc_perst3_top", "rhsusf_acc_ACOG", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_rk6"],
["rhs_weap_ak74mr", "rhs_acc_tgpa", "rhs_acc_perst3_top", "rhsusf_acc_su230_mrds", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr_gp25", "rhs_acc_tgpa", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25P","rhs_VG40TB","rhs_GRD40_White"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_tgpa", "rhs_acc_perst3", "rhsusf_acc_ACOG_RMR", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25P","rhs_VG40TB","rhs_GRD40_White"], ""],
["rhs_weap_vss_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230a_mrds", ["rhs_20rnd_9x39mm_SP6","rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk6"],
["rhs_weap_asval_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230a_mrds", ["rhs_20rnd_9x39mm_SP6","rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk6"]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_ak74mr", "rhs_acc_tgpa", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr", "rhs_acc_tgpa", "rhs_acc_perst3", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_tgpa", "rhs_acc_perst3", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_tgpa", "rhs_acc_perst3", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_20rnd_9x39mm_SP6","rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk2"],
["rhs_weap_asval_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhs_acc_ekp8_18", ["rhs_20rnd_9x39mm_SP6","rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk2"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74mr_gp25", "rhs_acc_tgpa", "rhs_acc_perst3", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P","rhs_VG40TB","rhs_GRD40_White"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_tgpa", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VG40TB","rhs_VOG25P","rhs_GRD40_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_aks74un", "rhs_acc_tgpa", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7U1_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_tgpa", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_asval_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_20rnd_9x39mm_SP6","rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk2"],
["rhs_weap_asval_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhs_acc_ekp8_18", ["rhs_20rnd_9x39mm_SP6","rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_rk2"]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_rpk74m_npz", "rhs_acc_tgpa", "rhs_acc_perst1ik", "rhsusf_acc_ELCAN", ["rhs_60Rnd_545X39_7N22_AK"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svds_npz", "rhs_acc_tgpv2", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""],
["rhs_weap_svds_npz", "rhs_acc_tgpv2", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""],
["rhs_weap_asval_grip1", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", ["rhs_10rnd_9x39mm_SP6","rhs_10rnd_9x39mm_SP5"], [], "rhsusf_acc_grip1"],
["rhs_weap_asval_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230a_mrds", ["rhs_10rnd_9x39mm_SP6","rhs_10rnd_9x39mm_SP5"], [], "rhsusf_acc_grip1"],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", ["rhs_10rnd_9x39mm_SP6","rhs_10rnd_9x39mm_SP5"], [], "rhsusf_acc_grip1"],
["rhs_weap_vss_npz_grip1", "", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230a_mrds", ["rhs_10rnd_9x39mm_SP6","rhs_10rnd_9x39mm_SP5"], [], "rhsusf_acc_grip1"]
]];
_sfLoadoutData set ["sniperRifles", [
["uk3cb_HS50", "", "", "rhs_acc_dh520x56", [], [], ""],
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_PC9_ZOAF", "rhsusf_acc_omega9k", "", "", [], [], ""],
["rhs_weap_pp2000_folded", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n31_44","rhs_mag_9x19mm_7n31_20"], [], ""],
["rhs_weap_6p53", "", "", "", ["rhs_18rnd_9x21mm_7N28", "rhs_18rnd_9x21mm_7N29", "rhs_18rnd_9x21mm_7BT3"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["vests", _vests];
_militaryLoadoutData set ["glVests", _glVests];
_militaryLoadoutData set ["helmets", _helmets];
_militaryLoadoutData set ["Hvests", _Hvests];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_02"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_uuk", "rhs_acc_perst3_top", "rhsusf_acc_ACOG", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], "rhs_acc_grip_rk2"],
["rhs_weap_ak74mr", "rhs_acc_uuk", "rhs_acc_perst3_top", "rhsusf_acc_su230_mrds", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], "rhs_acc_grip_rk2"],
["rhs_weap_ak74mr_gp25", "rhs_acc_uuk", "rhs_acc_perst3_top", "rhsusf_acc_su230", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P","rhs_VOG25P","rhs_GRD40_White"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_uuk", "", "rhsusf_acc_ACOG_RMR", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P","rhs_VOG25P","rhs_GRD40_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_ak74m_npz", "rhs_acc_uuk", "rhs_acc_perst1ik", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_uuk", "rhs_acc_perst3_top", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], "rhs_acc_grip_ffg2"]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_ak105_npz", "rhs_acc_uuk", "rhs_acc_perst1ik", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_uuk", "rhs_acc_perst1ik_ris", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], "rhs_acc_grip_ffg2"]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74mr_gp25", "rhs_acc_uuk", "rhs_acc_perst3", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P","rhs_VOG25","rhs_GRD40_White"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_uuk", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P","rhs_VOG25","rhs_GRD40_White"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_rakursPM", ["rhs_mag_9x19mm_7n21_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_rakursPM", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkp", "", "", "rhs_acc_nita", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_rpk74m_npz", "rhs_acc_ak5", "rhs_acc_perst1ik", "rhs_acc_ekp8_18", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GM", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_npz", "", "", "rhsusf_acc_M8541_low", [], [], ""],
["rhs_weap_svds_npz", "", "", "rhsusf_acc_M8541_low", [], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["rhs_weap_pya"]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["UK3CB_TKP_B_V_TacVest_Blk"]];
_policeLoadoutData set ["helmets", ["UK3CB_H_Cap_APD", "UK3CB_H_Cap_Headset_APD"]];

_policeLoadoutData set ["SMGs", [
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
"rhs_weap_makarov_pm","rhs_weap_pya"
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
["rhs_weap_ak74n_npz", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n_npz", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74n_npz", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_npz", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25_npz", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25","rhs_VOG25","rhs_GRD40_White"], ""],
["rhs_weap_aks74n_gp25_npz", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25","rhs_VOG25","rhs_GRD40_White"], ""],
["UK3CB_MP5N_UGL", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], ["rhs_mag_M433_HEDP","rhs_mag_M433_HEDP","rhs_mag_m662_red","rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_aks74un", "rhs_acc_uuk", "", "", [], [], ""],
["rhs_weap_aks74un", "rhs_acc_uuk", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_rpk74m_npz", "rhs_acc_uuk", "rhs_acc_2dpZenit", "", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_ak74n", "rhs_acc_uuk", "rhs_acc_2dpZenit", "rhs_acc_pso1m21", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_AK_green"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m21", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD_NPZ", "", "", "rhsusf_acc_M8541_low", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
"rhs_weap_makarov_pm"
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", _tankUniforms];
_crewLoadoutData set ["vests", _crewVests];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_bala", "rhs_tsh4_ess", "rhs_tsh4_ess_bala"]];

_crewLoadoutData set ["carbines", [
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["UK3CB_MP5K_PDW", "", "", "rhs_acc_okp7_picatinny", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", _pilotUniforms];
_pilotLoadoutData set ["vests", _crewVests];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

_pilotLoadoutData set ["carbines", [
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""],
["UK3CB_MP5K_PDW", "", "", "rhs_acc_okp7_picatinny", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], [], ""],
["UK3CB_MP5K_PDW", "", "", "rhs_acc_okp7_picatinny", ["UK3CB_MP5_30Rnd_9x19_Magazine_G"], [], ""]
]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", _officerUniforms];
_officerLoadoutData set ["Hvests", _vests];
_officerLoadoutData set ["helmets", ["UK3CB_CSAT_BEL_H_Beret"]];

_officerLoadoutData set ["slRifles", [
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_aks74un", "rhs_acc_uuk", "", "rhs_acc_okp7_dovetail", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", [], [], ""]
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

    ["carbines"] call _fnc_setPrimary;
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
