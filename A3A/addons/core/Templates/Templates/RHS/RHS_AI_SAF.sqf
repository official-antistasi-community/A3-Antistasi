//////////////////////////
//   Side Information   //
//////////////////////////

["name", "SAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "SAF Support Corridor"] call _fnc_saveToTemplate;

["flag", "rhssaf_flag_serbia"] call _fnc_saveToTemplate;
["flagTexture", "rhssaf\addons\rhssaf_main\data\flags\flag_serbia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_serbia"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhssaf_army_o_m1025_olive", "rhssaf_army_o_m1152_tcv_olive", "rhssaf_army_o_m998_olive_2dr_fulltop"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["rhssaf_army_o_m1025_olive_m2", "rhssaf_army_o_m1151_olive_pkm", "rhs_tigr_sts_vmf", "rhs_tigr_sts_3camo_vmf", "RHS_Ural_Zu23_VMF_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["rhssaf_army_o_ural_open", "rhssaf_army_o_ural", "rhs_kamaz5350_open_vmf", "rhs_kamaz5350_vmf"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["RHS_Ural_Open_Flat_VMF_01", "RHS_Ural_Flat_VMF_01", "rhs_kamaz5350_flatbed_cover_vmf", "rhs_kamaz5350_flatbed_vmf"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhs_gaz66_ammo_vmf", "rhs_kamaz5350_ammo_vmf"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["RHS_Ural_Repair_VMF_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["rhssaf_army_o_ural_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhs_gaz66_ap2_msv"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["rhsgref_cdf_btr60", "rhsgref_cdf_btr70", "rhsgref_cdf_btr80", "rhsgref_BRDM2_HQ", "rhsgref_BRDM2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["rhs_bmp1d_vmf", "rhs_bmp1k_vmf", "rhs_bmp1p_vmf", "rhs_bmp2e_vmf"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhssaf_army_o_t72s", "rhssaf_army_o_t72s", "rhs_t72be_tv", "rhs_t72be_tv", "rhs_t72bb_tv", "rhs_t72bb_tv"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhs_zsu234_aa"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["rhsgref_cdf_btr80", "rhs_tigr_sts_vmf", "rhs_bmp2k_vmf"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["rhsgref_cdf_su25", "rhssaf_airforce_l_18"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhssaf_airforce_o_l_18_101"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["rhssaf_airforce_o_ht40"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["rhssaf_airforce_o_ht40", "rhssaf_airforce_o_ht48"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_Mi8MTV3_vvsc", "RHS_Mi8MTV3_heavy_vvsc", "RHS_Mi24Vt_vvsc", "rhsgref_cdf_reg_Mi17Sh"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["rhsgref_cdf_Mi24D", "rhsgref_cdf_Mi35", "rhsgref_mi24g_CAS"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhs_2s1_tv", "rhs_2s3_tv", "RHS_BM21_VV_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhs_2s1_tv", ["rhs_mag_3of56_35"]],
["rhs_2s3_tv",["rhs_mag_HE_2a33", "rhs_mag_WP_2a33"]],
["RHS_BM21_VV_01", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;     
["uavsPortable", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["rhs_tigr_sts_3camo_vmf", "rhs_tigr_sts_vmf"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhs_zil131_vmf", "RHS_Ural_VMF_01", "RHS_Ural_Open_VMF_01", "rhs_zil131_open_vmf", "rhs_zil131_flatbed_vmf"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhs_uaz_vmf", "rhs_uaz_open_vmf", "rhs_tigr_m_vmf", "rhs_tigr_m_3camo_vmf"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["rhs_tigr_vmf", "rhs_uaz_open_vmf"]] call _fnc_saveToTemplate;

["staticMGs", ["rhs_KORD_high_MSV"]] call _fnc_saveToTemplate;
["staticAT", ["rhs_Kornet_9M133_2_msv"]] call _fnc_saveToTemplate;
["staticAA", ["rhs_Igla_AA_pod_msv", "RHS_ZU23_MSV"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["RHS_LivonianHead_1", "RHS_LivonianHead_10", "RHS_LivonianHead_2", "RHS_LivonianHead_3", "RHS_LivonianHead_4", "RHS_LivonianHead_5", "RHS_LivonianHead_6", "RHS_LivonianHead_7", "RHS_RussianHead_1", "RHS_WhiteHead_01", "RHS_WhiteHead_04", "RHS_WhiteHead_05", "RHS_WhiteHead_06", "RHS_WhiteHead_07", "RHS_WhiteHead_08", "RHS_WhiteHead_09", "RHS_WhiteHead_10", "RHS_WhiteHead_11", "RHS_WhiteHead_14", "RHS_WhiteHead_15", "RHS_WhiteHead_16", "RHS_WhiteHead_25", "RHS_WhiteHead_27", "RHS_WhiteHead_28", "RHS_WhiteHead_32"]] call _fnc_saveToTemplate;
["voices", ["male01gre","male02gre","male03gre","male04gre","male05gre","male06gre"]] call _fnc_saveToTemplate;
"SerbianMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
//     "Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", ["rhs_weap_m80"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_M136_hp"],
["rhs_weap_M136_hedp"],
["rhs_weap_M136"]
]];
_loadoutData set ["heavyATLaunchers", [
["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA"], ["rhs_mag_smaw_SR"], ""],
["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw",["rhs_mag_smaw_SR"], ["rhs_mag_smaw_SR"], ""],
["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA"], ["rhs_mag_smaw_SR"], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", [
"rhs_weap_cz99", "rhs_weap_pya", "rhs_weap_6p53"]];

_loadoutData set ["ATMines", ["rhssaf_mine_tma4_mag", "rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhssaf_mine_mrud_a_mag", "rhssaf_mine_mrud_b_mag", "rhssaf_mine_mrud_c_mag", "rhssaf_mine_mrud_d_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhssaf_mag_br_m84", "rhssaf_mag_br_m75"]];
_loadoutData set ["smokeGrenades", ["rhssaf_mag_brd_m83_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhssaf_mag_brd_m83_green", "rhssaf_mag_brd_m83_blue", "rhssaf_mag_brd_m83_red", "rhssaf_mag_brd_m83_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", ["rhs_tortila_olive"]];
_loadoutData set ["aaBackpacks", ["rhssaf_alice_md2camo"]];
_loadoutData set ["engBackpacks", ["rhs_rk_sht_30_olive_engineer_empty"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["rhs_beret_vdv1", "rhs_beret_vdv2", "rhs_beret_vdv3"]];
_loadoutData set ["sniHats", ["rhssaf_booniehat_digital"]];


//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
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
_sfLoadoutData set ["uniforms", ["rhssaf_uniform_m10_digital"]];
_sfLoadoutData set ["vests", ["rhs_6b45_rifleman", "rhs_6b45_rifleman_2"]];
_sfLoadoutData set ["slVests", ["rhs_6b45_off"]];
_sfLoadoutData set ["glVests", ["rhs_6b45_grn"]];
_sfLoadoutData set ["backpacks", ["rhssaf_kitbag_digital", "rhs_tortila_emr", "B_TacticalPack_rgr"]];
_sfLoadoutData set ["helmets", ["rhs_Booniehat_digi", "rhsusf_opscore_fg", "rhsusf_opscore_fg_pelt", "rhsusf_opscore_fg_pelt_cam", "rhsusf_opscore_fg_pelt_nsw"]];
_sfLoadoutData set ["slHat", ["rhssaf_beret_red"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_SCARH_LB", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_20Rnd_SCAR_762x51_m118_special_bk", "rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk", "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk"], [], "rhsusf_acc_grip2"],
["rhs_weap_SCARH_LB", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_20Rnd_SCAR_762x51_m118_special_bk", "rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk", "rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_m4a1_blockII_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], "rhsusf_acc_grip_m203_blk"],
["rhs_weap_m4a1_blockII_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], "rhsusf_acc_grip_m203_blk"],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_m4a1_m320", "rhsusf_acc_nt4_black", "", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_su230a_mrds", ["rhs_mag_20Rnd_SCAR_762x51_m118_special"], [], "rhsusf_acc_grip3"],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ACOG_RMR", ["rhs_mag_20Rnd_SCAR_762x51_m118_special"], [], "rhsusf_acc_grip2"]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_SCARH_LB", "rhsusf_acc_aac_scarh_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_SCARH_LB", "rhsusf_acc_aac_scarh_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball"], [], "rhsusf_acc_grip3"],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_su230a", ["rhs_mag_20Rnd_SCAR_762x51_m118_special"], [], "rhsusf_acc_grip3"],
["rhs_weap_SCARH_STD", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_SCAR_762x51_m118_special"], [], "rhsusf_acc_grip2"],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36"], [], "rhsusf_acc_grip3"],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36"], [], "rhsusf_acc_grip2"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], "rhsusf_acc_grip_m203_blk"],
["rhs_weap_m4a1_m203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], "rhsusf_acc_grip_m203_blk"],
["rhs_weap_m4a1_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_wmx", "rhsusf_acc_T1_high", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_wmx", "rhsusf_acc_g33_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_SCARH_CQC", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_wmx", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk", "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr_bk"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_SCARH_CQC", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_g33_T1", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk", "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr_bk"], [], "rhsusf_acc_grip3"],
["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "rhsusf_acc_grip3"],
["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_wmx", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "rhsusf_acc_grip3"],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_wmx_bk", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhsusf_200rnd_556x45_M855_mixed_box", "rhsusf_200rnd_556x45_M855_box"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_m249_pip_S_para", "rhsusf_acc_nt4_black", "rhsusf_acc_wmx_bk", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip_S_para", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_minimi_para_railed", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN",["rhsusf_200rnd_556x45_M855_mixed_box", "rhsusf_200rnd_556x45_M855_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_minimi_para_railed", "rhsusf_acc_nt4_black", "", "rhsusf_acc_g33_xps3",["rhsusf_200rnd_556x45_M855_mixed_box", "rhsusf_200rnd_556x45_M855_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_minimi_para_railed", "rhsusf_acc_nt4_black", "", "",["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_npz", "rhs_acc_tgpv2", "", "rhsusf_acc_su230a_mrds", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_m76", "rhs_acc_pbs1", "", "rhs_acc_pso1m21", ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010", "rhsusf_acc_M2010S_wd", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010", "rhsusf_acc_M2010S_wd", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier", [], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP", "rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["rhssaf_uniform_m10_digital_summer"]];
_militaryLoadoutData set ["vests", ["rhs_6b23_6sh92", "rhs_6b23_rifleman"]];
_militaryLoadoutData set ["slVests", ["rhs_6b23_6sh92_headset_mapcase"]];
_militaryLoadoutData set ["glVests", ["rhs_6b23_6sh92_vog"]];
_militaryLoadoutData set ["backpacks", ["rhs_assault_umbts", "rhssaf_alice_md2camo", "rhs_assault_umbts_engineer_empty"]];
_militaryLoadoutData set ["helmets", ["rhssaf_helmet_m97_woodland", "rhssaf_helmet_m97_woodland_black_ess", "rhssaf_helmet_m97_woodland_black_ess_bare","rhssaf_helmet_m97_olive_nocamo"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_g36kv", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik_ris", "rhs_acc_rakursPM", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_m21a_pr", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21a_pr", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik", "rhsusf_acc_eotech_xps3", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21a_pr_pbg40", "", "", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_m21a_pr_pbg40", "", "", "rhs_acc_rakursPM", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_g36kv", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik_ris", "rhs_acc_rakursPM", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik_ris", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_m21a_pr", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21a_pr", "rhsusf_acc_SFMB556", "rhs_acc_perst1ik", "rhs_acc_rakursPM", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_m21s_pr", "rhsusf_acc_SFMB556", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21s_pr", "rhsusf_acc_SFMB556", "rhs_acc_2dpZenit", "rhs_acc_ekp8_18", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21s", "rhsusf_acc_SFMB556", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21s", "rhsusf_acc_SFMB556", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_SFMB556", "rhs_acc_2dpZenit_ris", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_SFMB556", "rhs_acc_2dpZenit_ris", "rhs_acc_ekp8_18", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [

["rhs_weap_g36kv_ag36", "", "", "rhs_acc_rakursPM", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "", "rhs_acc_ekp8_18", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_m70b3n_pbg40", "rhs_acc_dtk1l", "", "rhs_acc_1p63", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_m70b3n_pbg40", "rhs_acc_dtk1l", "", "rhs_acc_pkas", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_m21a_pbg40", "rhsusf_acc_SFMB556", "", "rhs_acc_pkas", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_m21a_pbg40", "rhsusf_acc_SFMB556", "", "rhs_acc_1p63", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["SMGs", ["rhs_weap_scorpion"]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m84", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_minimi_para_railed", "", "", "rhsusf_acc_eotech_xps3",["rhsusf_200rnd_556x45_mixed_box", "rhsusf_200Rnd_556x45_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_minimi_para_railed", "", "", "rhsusf_acc_compm4",["rhsusf_200rnd_556x45_mixed_box", "rhsusf_200Rnd_556x45_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_minimi_para_railed", "", "", "",["rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m21", ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
["rhs_weap_svdp_wd", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010", "", "", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010", "", "", "rhsusf_acc_premier", [], [], "rhsusf_acc_harris_bipod"]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////
private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["rhs_uniform_omon"]];
_policeLoadoutData set ["vests", ["V_TacVest_oli"]];
_policeLoadoutData set ["helmets", ["rhssaf_beret_black", "rhs_omon_cap"]];
_policeLoadoutData set ["rifles", [
["rhs_weap_savz58v", "rhsgref_acc_zendl", "", "", ["rhs_30Rnd_762x39mm_Savz58"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", ["rhs_weap_pp2000"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["rhssaf_uniform_m93_oakleaf"]];
_militiaLoadoutData set ["vests", ["V_TacVest_oli"]];
_militiaLoadoutData set ["slVests", ["V_TacVest_oli", "V_Chestrig_oli"]];
_militiaLoadoutData set ["glVests", ["V_BandollierB_oli"]];
_militiaLoadoutData set ["backpacks", ["B_TacticalPack_oli"]];
_militiaLoadoutData set ["helmets", ["rhs_fieldcap_vsr", "rhssaf_bandana_oakleaf", "rhssaf_helmet_m59_85_nocamo"]];
_militiaLoadoutData set ["sniHats", ["rhssaf_booniehat_md2camo"]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_savz58p", "rhsgref_acc_zendl", "", "", ["rhs_30Rnd_762x39mm_Savz58"], [], ""],
["rhs_weap_m70b3n", "rhs_acc_dtk1l", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["rhs_weap_savz58v", "rhsgref_acc_zendl", "", "", ["rhs_30Rnd_762x39mm_Savz58"], [], ""],
["rhs_weap_m21a", "rhsusf_acc_SFMB556", "", "", ["rhsgref_30rnd_556x45_m21"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_m92", "rhs_acc_dtk1l", "", "", ["rhssaf_30Rnd_762x39mm_M67"], [], ""],
["rhs_weap_m21s", "rhsusf_acc_SFMB556", "", "", ["rhsgref_30rnd_556x45_m21"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_m70b3n_pbg40", "rhs_acc_dtk1l", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_m21a_pbg40", "rhsusf_acc_SFMB556", "", "", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["SMGs", ["rhs_weap_scorpion"]];
_militiaLoadoutData set ["machineGuns", ["rhs_weap_m84"]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_m76", "", "", "rhs_acc_pso1m21", ["rhsgref_10Rnd_792x57_m76"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", ["rhs_weap_m38"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["rhs_uniform_afghanka_grey"]];
_crewLoadoutData set ["vests", ["rhsgref_otv_khaki"]];
_crewLoadoutData set ["helmets", ["rhssaf_helmet_m97_olive_nocamo"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["rhssaf_uniform_mig29_pilot"]];
_pilotLoadoutData set ["vests", ["rhsgref_chestrig"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    ["primary", 3] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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


    ["rifles"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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
    ["primary", 4] call _fnc_addMagazines;
    ["primary", 6] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 3] call _fnc_addItem;
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
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
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
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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

    ["rifles"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
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
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    [selectRandom ["lightATLaunchers", "heavyATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    [["aaBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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


    [selectRandom ["SMGs", "rifles", "shotGuns"]] call _fnc_setPrimary;
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

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
