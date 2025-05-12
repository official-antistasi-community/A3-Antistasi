//////////////////////////
//   Side Information   //
//////////////////////////

["name", "NVA"] call _fnc_saveToTemplate;
["spawnMarkerName", "NVA support Corridor"] call _fnc_saveToTemplate;

["flag", "gm_flag_GC"] call _fnc_saveToTemplate;
["flagTexture", "\gm\gm_core\data\flags\gm_flag_gc_co"] call _fnc_saveToTemplate;
["flagMarkerType", "gm_marker_flag_GC"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["gm_gc_army_p601"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["gm_gc_army_uaz469_cargo_des", "gm_gc_army_uaz469_cargo_des", "gm_gc_army_btr60pu12_des", "gm_gc_army_brdm2um_des"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["gm_gc_army_uaz469_dshkm_des", "gm_gc_army_brdm2_des", "gm_gc_army_uaz469_dshkm_des", "CUP_O_GAZ_Vodnik_BPPU_RU", 
    "CUP_O_GAZ_Vodnik_KPVT_RU", "gm_gc_army_brdm2rkh_des"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["gm_gc_army_ural4320_cargo_des", "gm_gc_army_ural375d_cargo_des", "gm_gc_army_btr60pa_des"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["gm_gc_army_ural4320_cargo_des", "gm_gc_army_ural44202_des", "gm_gc_army_ural375d_cargo_des"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["gm_gc_army_ural4320_reammo_des"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["gm_gc_army_ural4320_repair_des"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["gm_gc_army_ural375d_refuel_des"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["gm_gc_army_ural375d_medic_des"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["gm_gc_army_btr60pb_des", "gm_gc_army_btr60pb_des", "CUP_O_GAZ_Vodnik_Unarmed_RU", "CUP_O_GAZ_Vodnik_PK_RU", "CUP_O_GAZ_Vodnik_AGS_RU",
    "gm_gc_army_btr60pa_dshkm_des"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["gm_pl_army_ot64a_oli", "CUP_O_BTR80_DESERT_RU", "CUP_O_BTR80A_DESERT_RU", "gm_gc_army_bmp1sp2_des"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["gm_gc_army_bmp1sp2_des", "CUP_O_BMP2_RU", "CUP_O_BMP3_RU"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["gm_gc_army_pt76b_des", "gm_gc_army_t55_des", "gm_gc_army_t55a_des", "gm_gc_army_t55ak_des", "gm_gc_army_t55am2_des", "gm_gc_army_t55am2b_des"]] call _fnc_saveToTemplate;
["vehiclesAA", ["gm_gc_army_zsu234v1_des", "CUP_O_Ural_ZU23_RU"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["gm_gc_army_bmp1sp2_des", "CUP_O_BMP2_RU", "CUP_O_BMP3_RU", "CUP_O_BTR80_DESERT_RU","gm_gc_army_brdm2um_des", "gm_gc_army_btr60pa_des", 
    "gm_gc_army_btr60pu12", "CUP_O_GAZ_Vodnik_Unarmed_RU"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_O_Su25_Dyn_RU"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_O_SU34_RU"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["gm_gc_airforce_l410t"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["gm_gc_airforce_mi2p", "gm_pl_airforce_mi2ch"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["gm_gc_airforce_mi2t", "gm_pl_airforce_mi2t", "CUP_O_Mi8AMT_RU"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_O_Mi24_P_Dynamic_RU"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["gm_gc_airforce_mi2urn", "gm_gc_airforce_mi2us", "gm_pl_airforce_mi2urp", "gm_pl_airforce_mi2urpg", "CUP_O_Mi8_RU"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["gm_gc_army_ural375d_mlrs_des", "gm_gc_army_2s1_des"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["gm_gc_army_ural375d_mlrs_des", ["gm_40Rnd_mlrs_122mm_he_9m22u","gm_40Rnd_mlrs_122mm_icm_9m218","gm_40Rnd_mlrs_122mm_mine_9m28k","gm_40Rnd_mlrs_122mm_mine_9m22k"]],
    ["gm_gc_army_2s1_des", ["gm_28Rnd_122x447mm_he_of462","gm_28Rnd_122x447mm_he_3of56","gm_28Rnd_122x447mm_heat_bk6m","gm_28Rnd_122x447mm_heat_t_bk13"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["gm_pl_army_uaz469_dshkm_oli"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["gm_pl_army_ural4320_cargo_oli"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["gm_pl_army_uaz469_cargo_oli"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["gm_gc_pol_p601"]] call _fnc_saveToTemplate;

["staticMGs", ["gm_pl_army_dshkm_aatripod", "gm_gc_army_dshkm_aatripod"]] call _fnc_saveToTemplate;
["staticAT", ["gm_gc_army_spg9_tripod", "gm_gc_army_fagot_launcher_tripod", "gm_pl_army_fagot_launcher_tripod", "gm_pl_army_spg9_tripod"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_Igla_AA_pod_RU", "CUP_O_ZU23_RU"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_O_2b14_82mm_RU"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["gm_minestatic_at_tm46"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["gm_minestatic_ap_pfm1"]] call _fnc_saveToTemplate;

#include "GM_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["gm_voice_male_deu_08","gm_voice_male_deu_09", "gm_voice_male_deu_03","gm_voice_male_deu_04"]] call _fnc_saveToTemplate;
["faces", ["gm_face_whiteHead_01","gm_face_whiteHead_02", "WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["sfFaces", ["gm_WhiteHead_01_camo_02", "gm_WhiteHead_02_camo_02", "gm_WhiteHead_03_camo_02",
    "gm_WhiteHead_04_camo_02","gm_WhiteHead_05_camo_02","gm_WhiteHead_06_camo_02",
    "gm_WhiteHead_07_camo_02","gm_WhiteHead_08_camo_02","gm_WhiteHead_09_camo_02",
    "gm_WhiteHead_10_camo_02","gm_WhiteHead_11_camo_02","gm_WhiteHead_12_camo_02",
    "gm_WhiteHead_13_camo_02","gm_WhiteHead_14_camo_02","gm_WhiteHead_15_camo_02",
    "gm_WhiteHead_16_camo_02","gm_WhiteHead_17_camo_02","gm_WhiteHead_18_camo_02",
    "gm_WhiteHead_19_camo_02","gm_WhiteHead_20_camo_02","gm_WhiteHead_21_camo_02" ]] call _fnc_saveToTemplate;

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
    ["gm_rpg7_wud", "", "", "", ["gm_1Rnd_40mm_heat_pg7v_rpg7"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["gm_rpg7_wud", "", "", "gm_pgo7v_blk", ["gm_1Rnd_40mm_heat_pg7v_rpg7", "gm_1Rnd_40mm_heat_pg7vl_rpg7"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["gm_rpg7_prp", "", "", "gm_pgo7v_blk", ["gm_1Rnd_40mm_heat_pg7vl_rpg7"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["gm_9k32m_oli", "", "", "", ["gm_1Rnd_72mm_he_9m32m"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["gm_mine_at_tm46"]];
_loadoutData set ["APMines", ["gm_mine_ap_pfm1"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["gm_explosive_plnp_charge"]];

_loadoutData set ["antiInfantryGrenades", ["gm_handgrenade_frag_rgd5"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["gm_smokeshell_wht_gc"]];
_loadoutData set ["signalsmokeGrenades", ["gm_smokeshell_yel_gc", "gm_smokeshell_red_gc", "gm_smokeshell_org_gc", "gm_smokeshell_grn_gc", "gm_smokeshell_blu_gc", "gm_smokeshell_blk_gc"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["maVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["mgBackpacks", []];
_loadoutData set ["glBackpacks", []];
_loadoutData set ["slBackpacks", ["gm_gc_backpack_r105m_brn"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["gm_gc_headgear_beret_str"]];
_loadoutData set ["sniHats", ["gm_gc_army_headgear_hat_80_grn"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["gm_repairkit_01", "MineDetector"];
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
_sfLoadoutData set ["uniforms", ["gm_gc_army_uniform_soldier_80_str", "gm_gc_army_uniform_soldier_gloves_80_str"]];
_sfLoadoutData set ["vests", ["gm_gc_army_vest_80_rifleman_str", "gm_gc_vest_combatvest3_str"]];
_sfLoadoutData set ["glVests", ["gm_gc_army_vest_80_at_str"]];
_sfLoadoutData set ["mgVests", ["gm_gc_army_vest_80_lmg_str"]];
_sfLoadoutData set ["slVests", ["gm_gc_army_vest_80_leader_str"]];
_sfLoadoutData set ["backpacks", ["gm_gc_army_backpack_80_assaultpack_empty_str"]];
_sfLoadoutData set ["mgBackpacks", ["gm_gc_army_backpack_80_assaultpack_lmg_str", "gm_gc_army_backpack_80_lmg_str"]];
_sfLoadoutData set ["glBackpacks", ["gm_gc_army_backpack_80_at_str"]];
_sfLoadoutData set ["helmets", ["gm_gc_army_headgear_m56_cover_str"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02_ghex_F"]];

//SF Weapons
_sfLoadoutData set ["slRifles", [
    ["gm_akmn_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_brk_akhandguard_dino", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akml_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_brk_akhandguard_dino", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_ak74n_wud", "gm_suppressor_pbs4_545mm_blk", "gm_flashlightp2_wht_ak74handguard_blu", "gm_zvn64_ak", ["gm_30Rnd_545x39mm_B_7N6_ak74_blk", "gm_30Rnd_545x39mm_B_T_7T3_ak74_blk"], [], ""],
    ["gm_akm_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_brk_akhandguard_dino", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akm_pallad_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["gm_ak74n_wud", "gm_suppressor_pbs4_545mm_blk", "gm_flashlightp2_wht_ak74handguard_blu", "gm_zvn64_ak", ["gm_30Rnd_545x39mm_B_7N6_ak74_blk", "gm_30Rnd_545x39mm_B_T_7T3_ak74_blk"], [], ""],
    ["gm_akm_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_brk_akhandguard_dino", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akml_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_brk_akhandguard_dino", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["gm_mpiak74n_prp", "gm_suppressor_pbs4_545mm_blk", "", "gm_zvn64_ak", ["gm_30Rnd_545x39mm_B_7N6_ak74_prp", "gm_30Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""],
    ["gm_akms_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_wht_akhandguard_blu", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akmsl_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_wht_akhandguard_blu", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akmsn_wud", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_wht_akhandguard_blu", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["gm_akm_pallad_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], ["1Rnd_HE_Grenade_shell"], ""],
    ["gm_pallad_d_brn", "", "", "", ["1Rnd_HE_Grenade_shell"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["gm_pm63_blk", "gm_suppressor_safloryt_blk", "", "", ["gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""],
    ["gm_mpikms72ksd_brn", "", "gm_flashlightp2_wht_akkhandguard_blu", "gm_zvn64_akk", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_mpiaks74n_brn", "gm_suppressor_pbs4_545mm_blk", "", "gm_zvn64_ak", ["gm_30Rnd_545x39mm_B_7N6_ak74_prp", "gm_30Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["gm_rpk_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_rpk", ["gm_75Rnd_762x39mm_B_M43_ak47_blk", "gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], [], ""],
    ["gm_rpkn_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_rpk", ["gm_75Rnd_762x39mm_B_M43_ak47_blk", "gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], [], ""],
    ["gm_lmgrpk_brn", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_rpk", ["gm_75Rnd_762x39mm_B_M43_ak47_blk", "gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], [], ""],
    ["gm_lmgrpk74n_brn", "gm_suppressor_pbs4_545mm_blk", "", "gm_zvn64_rpk", ["gm_45Rnd_545x39mm_B_7N6_ak74_prp", "gm_45Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""],
    ["gm_hmgpkm_prp", "", "", "", ["gm_100Rnd_762x54mmR_B_T_7t2_pk_grn", "gm_100Rnd_762x54mmR_API_7bz3_pk_grn"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
    ["gm_svd_wud", "gm_suppressor_tgpv_762mm_blk", "", "gm_pso1_gry", ["gm_10Rnd_762x54mmR_B_T_7t2_svd_blk", "gm_10Rnd_762x54mmR_API_7bz3_svd_blk", "gm_10Rnd_762x54mmR_AP_7N1_svd_blk"], [], ""],
    ["gm_akmn_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zfk4x25_blk", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];

_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_Mosin_Nagant", "", "", "CUP_optic_PEM", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["gm_pimb_blk", "gm_suppressor_kacnavysd_9mm_blk", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["gm_gc_army_uniform_soldier_80_str", "gm_gc_army_uniform_soldier_gloves_80_str"]];
_militaryLoadoutData set ["vests", ["gm_gc_army_vest_80_rifleman_str", "gm_gc_vest_combatvest3_str"]];
_militaryLoadoutData set ["glVests", ["gm_gc_army_vest_80_at_str"]];
_militaryLoadoutData set ["mgVests", ["gm_gc_army_vest_80_lmg_str"]];
_militaryLoadoutData set ["slVests", ["gm_gc_army_vest_80_leader_str"]];
_militaryLoadoutData set ["backpacks", ["gm_gc_army_backpack_80_assaultpack_empty_str"]];
_militaryLoadoutData set ["mgBackpacks", ["gm_gc_army_backpack_80_assaultpack_lmg_str", "gm_gc_army_backpack_80_lmg_str"]];
_militaryLoadoutData set ["glBackpacks", ["gm_gc_army_backpack_80_at_str"]];
_militaryLoadoutData set ["helmets", ["gm_gc_army_headgear_m56_cover_str", "gm_gc_army_headgear_m56_net", "gm_gc_army_headgear_m56"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_02_ghex_F"]];

_militaryLoadoutData set ["slRifles", [
    ["gm_akmn_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akm_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akml_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akm_pallad_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["gm_akm_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akml_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["gm_akms_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akmsl_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_akmsn_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["gm_akm_pallad_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], ["1Rnd_HE_Grenade_shell"], ""],
    ["gm_pallad_d_brn", "", "", "", ["1Rnd_HE_Grenade_shell"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["gm_pm63_blk", "", "", "", ["gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""],
    ["gm_mpiaks74n_brn", "", "", "", ["gm_30Rnd_545x39mm_B_7N6_ak74_prp", "gm_30Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["gm_rpk_wud", "", "", "", ["gm_75Rnd_762x39mm_B_M43_ak47_blk", "gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], [], ""],
    ["gm_rpkn_wud", "", "", "", ["gm_75Rnd_762x39mm_B_M43_ak47_blk", "gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], [], ""],
    ["gm_lmgrpk_brn", "", "", "", ["gm_75Rnd_762x39mm_B_M43_ak47_blk", "gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], [], ""],
    ["gm_lmgrpk74n_brn", "", "", "", ["gm_45Rnd_545x39mm_B_7N6_ak74_prp", "gm_45Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""],
    ["gm_hmgpkm_prp", "", "", "", ["gm_100Rnd_762x54mmR_B_T_7t2_pk_grn", "gm_100Rnd_762x54mmR_API_7bz3_pk_grn"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["gm_svd_wud", "", "", "gm_pso1_gry", ["gm_10Rnd_762x54mmR_B_T_7t2_svd_blk", "gm_10Rnd_762x54mmR_API_7bz3_svd_blk", "gm_10Rnd_762x54mmR_AP_7N1_svd_blk"], [], ""],
    ["gm_akmn_wud", "", "", "gm_zfk4x25_blk", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_Mosin_Nagant", "", "", "CUP_optic_PEM", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["gm_gc_pol_uniform_dress_80_blu"]];
_policeLoadoutData set ["vests", ["gm_gc_army_vest_80_belt_str"]];
_policeLoadoutData set ["helmets", ["gm_gc_pol_headgear_cap_80_blu"]];
_policeLoadoutData set ["SMGs", [
    ["gm_pm63_blk", "", "", "", ["gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""] 
]];
_policeLoadoutData set ["sidearms", [
    ["gm_pm_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
    ["gm_pim_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["gm_pl_army_uniform_soldier_80_moro", "gm_pl_army_uniform_soldier_autumn_80_moro", "gm_pl_army_uniform_soldier_rolled_80_moro"]];
_militiaLoadoutData set ["vests", ["gm_pl_army_vest_80_rifleman_gry", "gm_pl_army_vest_80_rifleman_smg_gry"]];
_militiaLoadoutData set ["glVests", ["gm_pl_army_vest_80_at_gry"]];
_militiaLoadoutData set ["mgVests", ["gm_pl_army_vest_80_mg_gry"]];
_militiaLoadoutData set ["slVests", ["gm_pl_army_vest_80_leader_gry"]];
_militiaLoadoutData set ["maVests", ["gm_pl_army_vest_80_marksman_gry"]];
_militiaLoadoutData set ["backpacks", ["gm_pl_army_backpack_80_oli"]];
_militiaLoadoutData set ["glBackpacks", ["gm_pl_army_backpack_at_80_gry"]];
_militiaLoadoutData set ["helmets", ["gm_pl_army_headgear_wz67_oli", "gm_pl_army_headgear_wz67_net_oli"]];

_militiaLoadoutData set ["rifles", [
    ["gm_mpikm72_prp", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["gm_mpikm72_brn", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["gm_akm_pallad_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], ["1Rnd_HE_Grenade_shell"], ""],
    ["gm_pallad_d_brn", "", "", "", ["1Rnd_HE_Grenade_shell"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["gm_mpikms72_brn", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
    ["gm_mpikms72_prp", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["gm_lmgrpk74n_brn", "", "", "", ["gm_45Rnd_545x39mm_B_7N6_ak74_prp", "gm_45Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["gm_svd_wud", "gm_bayonet_6x3_blk", "", "gm_pso1_gry", ["gm_10Rnd_762x54mmR_B_T_7t2_svd_blk", "gm_10Rnd_762x54mmR_API_7bz3_svd_blk", "gm_10Rnd_762x54mmR_AP_7N1_svd_blk"], [], ""],
    ["gm_akmn_wud", "gm_bayonet_6x3_blk", "", "gm_zfk4x25_blk", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_Mosin_Nagant", "", "", "CUP_optic_PEM", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["gm_pm_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
    ["gm_pim_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
    ["gm_pm63_handgun_blk", "", "", "", ["gm_15Rnd_9x18mm_B_pst_pm63_blk"], [], ""]
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["gm_gc_army_uniform_soldier_gloves_80_str"]];
_crewLoadoutData set ["vests", ["gm_pl_army_vest_80_crew_gry"]];
_crewLoadoutData set ["helmets", ["gm_pl_army_headgear_wz63_oli"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["gm_gc_airforce_uniform_pilot_80_blu"]];
_pilotLoadoutData set ["vests", ["gm_pl_army_vest_80_crew_gry"]];
_pilotLoadoutData set ["helmets", ["gm_gc_headgear_zsh3_wht"]];





/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
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
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;

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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["mgBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
    [["maVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["maVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
