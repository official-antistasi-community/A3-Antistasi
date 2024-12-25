//////////////////////////
//   Side Information   //
//////////////////////////

["name", "RACS"] call _fnc_saveToTemplate;
["spawnMarkerName", "RACS support corridor"] call _fnc_saveToTemplate;

["flag", "PRACS_Sahrani_Flag"] call _fnc_saveToTemplate;
["flagTexture", "\PRACS_Core\Flags\KingdomofSahrani_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "PRACS_Sahrani_Flag_mrk"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["PRACS_M1025", "PRACS_M1097_Scout", "PRACS_M998_cargo_open", "PRACS_M998_cargo_topped", "PRACS_M998_Command"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["PRACS_M1025_Mk19", "PRACS_M1151_M240", "PRACS_M1151_M2", "PRACS_M1151_Mk19", "PRACS_M1165_M134_QSB", "PRACS_M1165_M2", "PRACS_M1165_Mk19", "PRACS_BMR_ATGM_TOW", "PRACS_BMR_ATGM"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["PRACS_M250_open", "PRACS_M250", "PRACS_m548_open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["PRACS_M450", "PRACS_M250_flat_bed", "PRACS_m548"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["PRACS_m548_ammo", "PRACS_M250_Ammo", "PRACS_m548_arty_tender"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PRACS_M250_Repair", "PRACS_M88", "PRACS_M250_Salvage"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PRACS_HEMMTT_Fueler", "PRACS_m548_fuel", "PRACS_M250_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PRACS_M250_AMB", "PRACS_BMR_AMB", "PRACS_M577", "PRACS_M113_MED"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["PRACS_M577", "PRACS_M113_M240", "PRACS_BMR_M2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["PRACS_BMR_A3_GA1", "PRACS_BMR_A3_M2", "PRACS_BMR_A3_M3_SFOD", "PRACS_BMR_A3_Mk19", "PRACS_M113_mk19", "PRACS_M1117"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["PRACS_Pizarro", "PRACS_Pizarro_SLE"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["PRACS_FV107", "PRACS_FV101", "PRACS_VEC_MGS", "PRACS_VEC_M242"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["PRACS_M1A1_AIM","PRACS_M60A3","PRACS_M60S"]] call _fnc_saveToTemplate;
["vehiclesAA", ["PRACS_m48_chapparal","PRACS_M163_MACHBET","PRACS_M163_PIVADS","PRACS_M163_VADS","PRACS_M985_AD"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["PRACS_Zodiac"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["PRACS_Mk5_SOCR"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["PRACS_M113_M240", "PRACS_M113_mk19"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["PRACS_A4M", "PRACS_F16CJ", "PRACS_F16CJR", "PRACS_MirageV", "PRACS_Mohawk"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["PRACS_F16", "PRACS_MirageIII"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["PRACS_C130"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["PRACS_E2C"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["PRACS_MH6S"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["PRACS_UH1H", "PRACS_Sa330_Puma", "PRACS_CH53"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["PRACS_UH1H_CAS", "PRACS_AH6M", "PRACS_Sa330_Puma_AS"]] call _fnc_saveToTemplate; 
["vehiclesHelisAttack", ["PRACS_RAH6", "PRACS_AH1S"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["PRACS_M109A6", "PRACS_M430"]] call _fnc_saveToTemplate;        
["magazines", createHashMapFromArray [
["PRACS_M109A6", ["PRACS_155mm_HE_M109A6_x25"]],
["PRACS_M430", ["PRACS_SSM_B_MLRS_X2"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;     
["uavsPortable", ["PRACS_UAV_MP"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["PRACS_M1025_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["PRACS_M250_open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["PRACS_M998_cargo_open", "PRACS_M998_cargo_topped", "PRACS_M998_Command"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["PRACS_Infantry_M220"]] call _fnc_saveToTemplate;
["staticAA", ["PRACS_Infantry_Stinger_Pod"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem", "GreekHead_A3_05", "GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

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
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];
_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_loadoutData set ["binoculars", ["rhsusf_bino_m24"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []];    
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

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
_sfLoadoutData set ["uniforms", ["PRACS_M10_Fusilier_uniform"]];
_sfLoadoutData set ["slUniforms", ["PRACS_M10_Fusilier_SL_uniform"]];
_sfLoadoutData set ["vests", ["PRACS_CIRAS", "PRACS_CIRAS_G3_Commander", "PRACS_CIRAS_GAL_Officer"]];
_sfLoadoutData set ["mgVests", ["PRACS_CIRAS_MG"]];    
_sfLoadoutData set ["medVests", ["PRACS_CIRAS_GAL_medic", "PRACS_CIRAS_G3_medic"]];
_sfLoadoutData set ["glVests", ["PRACS_CIRAS_grenadier", "PRACS_CIRAS_grenadier_SF"]];
_sfLoadoutData set ["backpacks", ["B_Kitbag_rgr", "B_AssaultPack_rgr"]];
_sfLoadoutData set ["helmets", ["PRACS_LWH", "PRACS_LWH_ESS", "PRACS_LWH_HS"]];
_sfloadoutData set ["slHat", ["PRACS_Royal_Fusilier_beret"]];
_sfLoadoutData set ["sniHats", ["PRACS_Booniehat_HS_SDPM"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_hk416d10", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG3_USMC", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_hk416d10", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_grip1"],
["rhs_weap_hk416d10", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_tdstubby_blk"],
["rhs_weap_hk416d10_LMT", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_ELCAN_ard", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_grip2_tan"],
["rhs_weap_hk416d10_LMT", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_ELCAN_ard", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_grip2_tan"],
["rhs_weap_hk416d10_LMT", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_grip2_tan"],
["rhs_weap_hk416d10_LMT", "rhsusf_acc_rotex5_grey", "rhsusf_acc_M952V", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_grip2_tan"],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_T1_high", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_anpas13gv1", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], [], "rhsusf_acc_grip3"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG2", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_wmx", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_hk416d145_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_hk416d145_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG2_USMC", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip2_wd"],
["rhs_weap_hk416d145_wd_2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_grip1"],
["rhs_weap_hk416d145_wd_2", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552_wd", ["rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red"], [], "rhsusf_acc_kac_grip"]
]];
_sfLoadoutData set ["carbines", [
["PRACS_galil_ACE23_SF", "rhsusf_acc_nt4_black", "", "", ["PRACS_35rd_Galil_M995_mag"], [], ""],
["PRACS_galil_ACE23_SF", "rhsusf_acc_nt4_black", "", "rhsusf_acc_mrds", ["PRACS_35rd_Galil_M855A1_mag"], [], ""],
["PRACS_galil_ACE23_SF", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01_NoFilter", ["PRACS_35rd_Galil_Mk262_mag"], [], ""],
["PRACS_galil_ACE23", "rhsusf_acc_nt4_black", "", "", ["PRACS_35rd_Galil_Mk262_mag"], [], ""],
["PRACS_galil_ACE23", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["PRACS_35rd_Galil_M855A1_mag"], [], ""],
["PRACS_galil_ACE23", "rhsusf_acc_nt4_black", "", "rhsusf_acc_su230", ["PRACS_35rd_Galil_M995_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_top", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_wmx", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_Mk262_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_anpvs27", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15A", "rhsusf_acc_anpas13gv1", ["rhs_mag_30Rnd_556x45_M855A1_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["PRACS_UZI", "muzzle_snds_L", "", "rhsusf_acc_mrds", ["PRACS_35rd_9mm_UZI"], [], ""],
["PRACS_UZI", "muzzle_snds_L", "", "rhsusf_acc_mrds", ["PRACS_35rd_9mm_UZI"], [], ""],
["PRACS_UZI", "muzzle_snds_L", "", "rhsusf_acc_RM05", ["PRACS_35rd_9mm_UZI"], [], ""],
["PRACS_UZI", "muzzle_snds_L", "", "rhsusf_acc_T1_low", ["PRACS_30rd_9mm_UZI"], [], ""],
["PRACS_UZI", "muzzle_snds_L", "", "", ["PRACS_30rd_9mm_UZI"], [], ""],
["PRACS_UZI", "muzzle_snds_L", "", "", ["PRACS_30rd_9mm_UZI"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["PRACS_M60E4", "PRACS_AAC_supressor_762", "", "rhsusf_acc_su230a", ["rhsusf_50Rnd_762x51_m61_ap"], [], ""],
["PRACS_M60E4", "PRACS_AAC_supressor_762", "", "rhsusf_acc_su230a", ["rhsusf_50Rnd_762x51_m61_ap"], [], ""],
["PRACS_M60E4", "PRACS_AAC_supressor_762", "", "rhsusf_acc_T1_low", ["rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["PRACS_M60E4", "PRACS_AAC_supressor_762", "", "rhsusf_acc_T1_low", ["rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["PRACS_M60E4", "PRACS_AAC_supressor_762", "", "rhsusf_acc_g33_xps3", ["rhsusf_50Rnd_762x51_m61_ap"], [], ""],
["PRACS_Mk48_light", "PRACS_AAC_supressor_762", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["PRACS_100rd_Mk48_AP_Soft_pouch"], [], ""],
["PRACS_Mk48_light", "PRACS_AAC_supressor_762", "rhsusf_acc_anpeq16a", "rhsusf_acc_T1_low", ["PRACS_100rd_Mk48_AP_Soft_pouch"], [], ""],
["PRACS_Mk48_light", "PRACS_AAC_supressor_762", "rhsusf_acc_M952V", "rhsusf_acc_ACOG_RMR", ["PRACS_100rd_Mk48_M62T_Soft_pouch"], [], ""],
["PRACS_Mk48_light", "PRACS_AAC_supressor_762", "rhsusf_acc_anpeq15side", "rhsusf_acc_eotech_xps3", ["PRACS_100rd_Mk48_M62T_Soft_pouch"], [], ""],
["PRACS_Mk48_light", "PRACS_AAC_supressor_762", "", "rhsusf_acc_ACOG_RMR", ["PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""],
["PRACS_Mk48_Para", "PRACS_AAC_supressor_762", "", "", ["PRACS_100rd_Mk48_AP_Soft_pouch"], [], ""],
["PRACS_Mk48_Para", "PRACS_AAC_supressor_762", "", "rhsusf_acc_ACOG2", ["PRACS_100rd_Mk48_AP_Soft_pouch", "PRACS_100rd_Mk48_M62T_Soft_pouch"], [], ""],
["PRACS_Mk48_Para", "PRACS_AAC_supressor_762", "", "rhsusf_acc_ACOG3", ["PRACS_100rd_Mk48_M62T_Soft_pouch", "PRACS_100rd_Mk48_AP_Soft_pouch"], [], ""],
["PRACS_Mk48_Para", "PRACS_AAC_supressor_762", "", "rhsusf_acc_eotech_552", ["PRACS_100rd_Mk48_AP_Soft_pouch", "PRACS_100rd_Mk48_M62T_Soft_pouch"], [], ""],
["PRACS_Mk48_Para", "PRACS_AAC_supressor_762", "", "", ["PRACS_100rd_Mk48_AP_Soft_pouch", "PRACS_100rd_Mk48_M62T_Soft_pouch"], [], ""],
["PRACS_Mk48_Para", "PRACS_AAC_supressor_762", "", "", ["PRACS_100rd_Mk48_AP_Soft_pouch", "PRACS_100rd_Mk48_M62T_Soft_pouch"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541_low", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541_low", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541_low", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_wd", "", "rhsusf_acc_M8541_low_wd", ["rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_wd", "", "rhsusf_acc_M8541_low_wd", ["rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_wd", "", "rhsusf_acc_M8541_low_wd", ["rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "rhsusf_acc_m24_silencer_wd", "", "rhsusf_acc_M8541_low_wd", ["rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m14ebrri", "rhsgref_sdn6_suppressor", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsgref_sdn6_suppressor", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsgref_sdn6_suppressor", "", "rhsusf_acc_premier_low", ["rhsusf_20Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_premier_low", ["rhsusf_20Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_premier_low", ["rhsusf_20Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", [], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", [], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", [], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["ACE_10Rnd_127x99_API_Mag"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["ACE_10Rnd_127x99_API_Mag"], [], ""],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15A", "rhsusf_acc_premier_anpvs27", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_M952V", "rhsusf_acc_premier_anpvs27", ["rhsusf_5Rnd_300winmag_xm2010"], [], ""],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_M952V", "rhsusf_acc_M8541_wd", ["rhsusf_5Rnd_300winmag_xm2010"], [], ""],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "", "rhsusf_acc_M8541_wd", ["rhsusf_5Rnd_300winmag_xm2010"], [], ""],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "", "rhsusf_acc_nxs_3515x50_md", ["rhsusf_5Rnd_300winmag_xm2010"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
"rhs_weap_M136_hedp",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp"
]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_m9", "", "", "", ["rhsusf_mag_15Rnd_9x19_FMJ"], [], ""]
]];
_sfLoadoutData set ["glSidearms", [
["rhs_weap_M320", "", "", "", ["rhs_mag_M397_HET", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP"], [], ""],
["rhs_weap_M320", "", "", "", ["rhs_mag_m4009", "rhs_mag_m714_White", "rhs_mag_m716_yellow"], [], ""] 
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["PRACS_M10_3MTN_uniform"]];
_militaryLoadoutData set ["slUniforms", ["PRACS_M10_3MTN_SL_uniform"]];
_militaryLoadoutData set ["vests", ["PRACS_O_CIRAS_GAL_rifleman", "PRACS_O_CIRAS_G3_rifleman"]];
_militaryLoadoutData set ["mgVests", ["PRACS_O_CIRAS_MG"]];    
_militaryLoadoutData set ["medVests", ["PRACS_O_CIRAS_medic"]];
_militaryLoadoutData set ["slVests", ["PRACS_O_CIRAS_Officer", "PRACS_O_CIRAS_GAL_Officer", "PRACS_O_CIRAS_G3_Officer"]];
_militaryLoadoutData set ["sniVests", ["PRACS_O_CIRAS"]];
_militaryLoadoutData set ["glVests", ["PRACS_O_CIRAS_GAL_grenadier"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_Kitbag_rgr"]];
_militaryLoadoutData set ["helmets", ["PRACS_ACH_ASDPM", "PRACS_ACH_ASDPM_camo"]];
_militaryLoadoutData set ["slHat", ["PRACS_3mtn_beret"]];
_militaryLoadoutData set ["sniHats", ["PRACS_Booniehat_HS_ASDPM"]];
_militaryLoadoutData set ["binoculars", ["rhsusf_bino_m24_ARD"]];

_militaryLoadoutData set ["slRifles", [
["PRACS_g3a3", "", "", "rhsusf_acc_ACOG", ["PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], [], ""],
["PRACS_g3a3_w", "", "", "rhsusf_acc_T1_low", ["PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], [], "PRACS_G3_Bipod"],
["PRACS_g3a4t40", "", "", "rhsusf_acc_ACOG", ["PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["PRACS_g3a4t40", "", "", "", ["PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["rifles", [
["PRACS_galil_ACE23", "", "acc_flashlight", "rhsusf_acc_compm4", ["PRACS_35rd_Galil_mag", "PRACS_35rd_Galil_Mk262_mag"], [], ""],
["PRACS_galil_ARM_308", "", "", "rhsusf_acc_T1_high", ["PRACS_25rd_Galil308_mag"], [], ""],
["PRACS_FNC", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["PRACS_galil_SAR", "", "", "rhsusf_acc_mrds", ["PRACS_35rd_Galil_mag", "PRACS_35rd_Galil_M855A1_mag", "PRACS_35rd_Galil_Mk262_mag"], [], ""],
["PRACS_HK33A4", "", "", "rhsusf_acc_eotech_xps3", ["PRACS_30rd_HK33_mag", "PRACS_30rd_HK33_M855A1_mag"], [], ""],
["PRACS_HK53", "", "", "rhsusf_acc_T1_low", ["PRACS_30rd_HK33_mag", "PRACS_30rd_HK33_M855A1_mag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["PRACS_UZI", "", "", "rhsusf_acc_mrds", [], [], ""],
["PRACS_UZI", "", "", "rhsusf_acc_mrds", [], [], ""],
["PRACS_UZI", "", "", "", [], [], ""],
["PRACS_UZI", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["PRACS_g3a3t40", "", "", "rhsusf_acc_compm4", ["PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["PRACS_g3a3t40", "", "", "rhsusf_acc_eotech_xps3", ["PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["PRACS_g3a4t40", "", "", "rhsusf_acc_ACOG", ["PRACS_20rd_CETME_mag", "PRACS_20rd_G3_mag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["PRACS_HCAR_Black", "", "acc_flashlight", "rhsusf_acc_ELCAN", ["PRACS_50rd_T_HCAR_mag"], [], "rhsusf_acc_grip4"],
["PRACS_HCAR_Black", "", "", "rhsusf_acc_ELCAN_ard", ["PRACS_50rd_HCAR_mag"], [], "rhsusf_acc_harris_bipod"],
["PRACS_HCAR_Black", "", "", "rhsusf_acc_compm4", ["PRACS_30rd_HCAR_T_mag", "PRACS_50rd_HCAR_mag"], [], "rhsusf_acc_grip1"],
["PRACS_HCAR_Black", "", "", "rhsusf_acc_eotech_552", ["PRACS_30rd_HCAR_mag", "PRACS_50rd_HCAR_mag"], [], "rhsusf_acc_tdstubby_blk"],
["PRACS_Mk48", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""],
["PRACS_Mk48", "", "rhsusf_acc_M952V", "rhsusf_acc_ACOG_RMR", ["PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""],
["PRACS_Mk48_STD", "", "", "rhsusf_acc_mrds", ["PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""],
["PRACS_Mk48_STD", "", "", "rhsusf_acc_T1_low", ["PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_SCARH_STD", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr_bk", "rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk", "rhs_mag_20Rnd_SCAR_762x51_m118_special_bk"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_SCARH_STD", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr_bk", "rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk", "rhs_mag_20Rnd_SCAR_762x51_m118_special_bk"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_SCARH_STD", "", "rhsusf_acc_M952V", "rhsusf_acc_ACOG_MDO", ["rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk", "rhs_mag_20Rnd_SCAR_762x51_m118_special_bk", "rhs_mag_20Rnd_SCAR_762x51_m118_special_bk"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["lightATLaunchers", [
"rhs_weap_m72a7", "rhs_weap_m72a7", "rhs_weap_M136_hp"
]];
_militaryLoadoutData set ["ATLaunchers", [
["PRACS_SAAWS", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
["PRACS_SAAWS", "", "", "", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [""],""]
]];
_militaryLoadoutData set ["missileATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""],
["rhsusf_weap_m9", "", "", "", ["rhsusf_mag_15Rnd_9x19_FMJ", "rhsusf_mag_15Rnd_9x19_JHP"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["PRACS_Police_Uniform"]];
_policeLoadoutData set ["vests", ["PRACS_Police_Vest"]];
_policeLoadoutData set ["helmets", ["PRACS_Police_Cap"]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["PRACS_UZI", "", "", "", [], [], ""],
["PRACS_UZI", "", "", "", [], [], ""],
["PRACS_UZI", "", "", "rhsusf_acc_mrds", [], [], ""],
["PRACS_UZI", "", "", "rhsusf_acc_RM05", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["PRACS_M10_2PARA_uniform"]];
_militiaLoadoutData set ["uniforms", ["PRACS_M10_2PARA_SL_uniform"]];
_militiaLoadoutData set ["vests", ["PRACS_O_CIRAS", "PRACS_SIS_Chestrig"]];
_militiaLoadoutData set ["backpacks", ["PRACS_Assault_pack", "B_TacticalPack_oli"]];
_militiaLoadoutData set ["atBackpacks", ["B_Kitbag_rgr"]];
_militiaLoadoutData set ["helmets", ["PRACS_Patrol_ASDPM_B_Cap", "PRACS_ACH_ASDPM", "PRACS_ACH_ASDPM_olive", "H_Cap_oli", "H_Cap_oli_hs"]];
_militiaLoadoutData set ["slHat", ["PRACS_para_beret"]];
_militiaLoadoutData set ["sniHats", ["PRACS_Booniehat_ASDPM_B"]];

_militiaLoadoutData set ["rifles", [
["PRACS_CETME","","","",["PRACS_20rd_CETME_mag", "PRACS_20rd_CETME_mag", "PRACS_20rd_CETME_T_mag"],[],""],
["PRACS_CETME_FS","","","",["PRACS_20rd_CETME_mag", "PRACS_20rd_CETME_mag", "PRACS_20rd_CETME_T_mag"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["PRACS_rk62", "", "", "rhsusf_acc_T1_low", ["PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_T_mag", "PRACS_30Rnd_762x39_Rk_PS_mag"], [], ""],
["PRACS_rk62", "", "", "rhsusf_acc_T1_low", ["PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_T_mag", "PRACS_30Rnd_762x39_Rk_PS_mag"], [], ""],
["PRACS_rk62", "", "", "rhsusf_acc_T1_high", ["PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_T_mag", "PRACS_30Rnd_762x39_Rk_PS_mag"], [], ""],
["PRACS_galil_SAR","","","",["PRACS_35rd_Galil_mag", "PRACS_35rd_Galil_mag"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["PRACS_g3a4t40", "", "", "rhsusf_acc_compm4", ["PRACS_20rd_G3_mag", "PRACS_20rd_CETME_mag"], ["rhs_mag_M441_HE", "rhs_mag_m576", "rhs_mag_M585_white_cluster", "rhs_mag_m714_White"], ""],
["PRACS_g3a3t40", "", "", "rhsusf_acc_T1_low", ["PRACS_20rd_CETME_mag", "PRACS_20rd_G3_mag"], ["rhs_mag_M441_HE", "rhs_mag_m576", "rhs_mag_M585_white_cluster", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["PRACS_UZI","","","",["PRACS_30rd_9mm_UZI", "PRACS_30rd_9mm_UZI"],[],""],
["PRACS_UZI","","","rhsusf_acc_T1_low",["PRACS_30rd_9mm_UZI", "PRACS_30rd_9mm_UZI"],[],""],
["PRACS_UZI", "", "", "rhsusf_acc_mrds", ["PRACS_30rd_9mm_UZI", "PRACS_30rd_9mm_UZI"], [], ""],
["PRACS_UZI", "", "", "rhsusf_acc_RM05", ["PRACS_30rd_9mm_UZI", "PRACS_30rd_9mm_UZI"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["PRACS_HCAR_Black", "", "", "", ["PRACS_30rd_HCAR_mag", "PRACS_30rd_HCAR_T_mag"], [], ""],
["PRACS_M60A2","","","",["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["PRACS_g3a3_w", "", "", "rhsusf_acc_ACOG", ["PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag", "PRACS_20rd_G3_T_mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_M8541_low", [], [], "rhsusf_acc_harris_swivel"]
]];
_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militiaLoadoutData set ["ATLaunchers", [
["PRACS_SAAWS", "", "", "", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [""],""]
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["PRACS_Tanker_coverall"]];
_crewLoadoutData set ["vests", ["PRACS_O_CIRAS_SMG"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_helmet", "rhsusf_cvc_green_alt_helmet", "rhsusf_cvc_green_ess"]];
_crewLoadoutData set ["carbines", [
["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["PRACS_Heli_crew_RSN_uniform"]];
_pilotLoadoutData set ["helmets", ["PRACS_Attack_Heli_pilot_helmet"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

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


    ["rifles"] call _fnc_setPrimary;
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
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["backpacks"] call _fnc_setBackpack;

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
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;

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
    ["primary", 6] call _fnc_addMagazines;

    [["missileATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
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
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["handgun", 2] call _fnc_addMagazines;

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
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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
