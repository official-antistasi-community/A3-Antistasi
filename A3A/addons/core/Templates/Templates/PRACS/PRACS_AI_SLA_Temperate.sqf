//////////////////////////
//   Side Information   //
//////////////////////////

["name", "SLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "SLA support corridor"] call _fnc_saveToTemplate;

["flag", "PRACS_SLA_Flag"] call _fnc_saveToTemplate;
["flagTexture", "\PRACS_SLA_Core\Flags\flag_north_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "PRACS_SLA_Flag_mrk"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["PRACS_SLA_UAZ_open", "PRACS_SLA_UAZ", "PRACS_SLA_BTR40", "PRACS_SLA_BTR40"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["PRACS_SLA_UAZ_DSHKM", "PRACS_SLA_UAZ_AGS", "PRACS_SLA_UAZ_AT", "PRACS_SLA_UAZ_SPG9", "PRACS_SLA_Tigr", "PRACS_SLA_BTR40_NSV", "PRACS_SLA_BTR40_AGS", "PRACS_SLA_BRDM", "PRACS_SLA_BRDM_HQ_PKT", "PRACS_SLA_BTR40_AT", "PRACS_SLA_URAL_Zu23", "PRACS_SLA_Ural_S60", "PRACS_SLA_Ural_ZPU4"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["PRACS_SLA_URAL_Open", "PRACS_SLA_URAL", "PRACS_SLA_MTLB"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["PRACS_SLA_Ural_flat_bed"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["PRACS_SLA_Ural_Ammo", "PRACS_SLA_MTLB_AMMO"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PRACS_SLA_URAL_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PRACS_SLA_URAL_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PRACS_SLA_Ural_AMB", "PRACS_SLA_MTLB_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["PRACS_SLA_Type63", "PRACS_SLA_Type63_AGS", "PRACS_SLA_BTR60", "PRACS_SLA_MTLB_S60", "PRACS_SLA_MTLB_ZU23", "PRACS_SLA_Type63_ADA", "PRACS_SLA_BRDM_ATGM", "PRACS_SLA_Type63_AT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["PRACS_SLA_BMP1"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["PRACS_SLA_BMP2"]] call _fnc_saveToTemplate;
["vehicleslightTanks", ["PRACS_SLA_BMD1"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["PRACS_SLA_T72B", "PRACS_SLA_T72BV"]] call _fnc_saveToTemplate;
["vehiclesAA", ["PRACS_SLA_SA13", "PRACS_SLA_SA17", "PRACS_SLA_SA8", "PRACS_SLA_SA9", "PRACS_SLA_ZSU23"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["PRACS_SLA_GoFast"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["PRACS_SLA_GoFast_gun"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["PRACS_SLA_BMP1", "PRACS_SLA_BRDM"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["PRACS_SLA_MiG27", "PRACS_SLA_SU22", "PRACS_SLA_Su25"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["PRACS_SLA_MiG21", "PRACS_SLA_MiG23", "PRACS_SLA_MIG28", "PRACS_SLA_MiG29"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["PRACS_AN12B"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["PRACS_SLA_Z11W"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["PRACS_SLA_Z11W_B", "PRACS_SLA_Z11W_B2", "PRACS_SLA_Z11W"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["PRACS_SLA_Z11W", "PRACS_SLA_Mi8amt"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["PRACS_SLA_Z11W_ATK", "PRACS_SLA_Z11W_ATK2", "PRACS_SLA_Mi17Sh", "PRACS_SLA_Mi17Sh_UPK"]] call _fnc_saveToTemplate; 
["vehiclesHelisAttack", ["PRACS_SLA_Mi24D", "PRACS_SLA_Mi24V_UPK"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["PRACS_SLA_2s1", "PRACS_SLA_2S3"]] call _fnc_saveToTemplate;        
["magazines", createHashMapFromArray [
["PRACS_SLA_2s1", ["rhs_mag_3of56_35"]],
["PRACS_SLA_2S3", ["rhs_mag_HE_2a33"]]
]] call _fnc_saveToTemplate;

// "PRACS_SLA_2B14", "PRACS_RM70", "PRACS_SLA_M46"

["uavsAttack", ["O_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;     
["uavsPortable", ["O_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["PRACS_SLA_UAZ_DSHKM", "PRACS_SLA_UAZ_SPG9", "PRACS_SLA_BRDM_HQ_PKT"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["PRACS_SLA_URAL_Open", "PRACS_SLA_MTLB"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["PRACS_SLA_UAZ"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["PRACS_SLA_UAZ_open_Border_guard", "PRACS_SLA_URAL_BG", "PRACS_SLA_BTR40_BG"]] call _fnc_saveToTemplate;

["staticMGs", ["PRACS_SLA_DShK"]] call _fnc_saveToTemplate;
["staticAT", ["PRACS_SLA_9k115", "PRACS_SLA_SPG9M_tripod", "PRACS_SLA_SPG9_tripod"]] call _fnc_saveToTemplate;
["staticAA", ["PRACS_SLA_Igla_pod", "PRACS_SLA_ZPU4", "PRACS_SLA_ZU23", "PRACS_SLA_S60"]] call _fnc_saveToTemplate;
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
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];
_loadoutData set ["ATMines", ["rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_LoadoutData set ["lightATLaunchers", [
"rhs_weap_rpg18",
"rhs_weap_rpg26",
"rhs_weap_rpg75"
]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange"]];

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
_loadoutData set ["mgVests", []];    
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["rhs_rpg_6b2"]];
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
_sfLoadoutData set ["uniforms", ["PRACS_SLA_M88_Especas_uniform"]];
_sfLoadoutData set ["vests", ["PRACS_SLA_6B23_6sh92_L_Radio", "PRACS_SLA_6B23_6sh92_L_Headset"]];    
_sfLoadoutData set ["medVests", ["PRACS_SLA_6B23"]];
_sfLoadoutData set ["sniVests", ["PRACS_SLA_6B23_6sh92"]];
_sfLoadoutData set ["glVests", ["PRACS_SLA_6B23_6sh92_VOG"]];
_sfLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54", "rhs_tortila_olive"]];
_sfLoadoutData set ["helmets", ["PRACS_SLA_6B27M_ess", "PRACS_SLA_6B27M", "rhs_altyn_visordown"]];
_sfloadoutData set ["slHat", ["PRACS_SLA_Especas_Beret"]];
_sfLoadoutData set ["sniHats", ["PRACS_SLA_Booniehat"]];
_sfLoadoutData set ["NVGs", ["rhs_1PN138"]];
_sfLoadoutData set ["binoculars", ["rhs_pdu4"]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_ak74m_gp25_npz","rhs_acc_dtk4short","","rhsusf_acc_g33_xps3",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK"],["rhs_VG40TB", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"],""],
["rhs_weap_ak74m_gp25_npz","rhs_acc_tgpa","","rhsusf_acc_g33_xps3",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK"],["rhs_VG40TB", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"],""],
["rhs_weap_ak105_npz","rhs_acc_tgpa","rhs_acc_perst1ik","rhsusf_acc_g33_xps3",["rhs_60Rnd_545X39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"],[],""],
["rhs_weap_ak105_npz","rhs_acc_dtk4short","rhs_acc_perst1ik","rhsusf_acc_g33_xps3",["rhs_60Rnd_545X39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"],[],""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_ak105_npz","rhs_acc_dtk4short","rhs_acc_perst1ik","rhs_acc_ekp8_18",["rhs_60Rnd_545X39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"],[],""],
["rhs_weap_ak105_npz","rhs_acc_dtk4short","rhs_acc_perst1ik","rhs_acc_okp7_picatinny",["rhs_60Rnd_545X39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"],[],""],
["rhs_weap_ak105_npz","rhs_acc_tgpa","rhs_acc_perst1ik","rhs_acc_ekp8_18",["rhs_60Rnd_545X39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_npz","rhs_acc_tgpa","rhs_acc_perst1ik","rhs_acc_okp7_picatinny",["rhs_60Rnd_545X39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_npz","rhs_acc_tgpa","rhs_acc_perst1ik","rhsusf_acc_g33_xps3",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"],[],""],
["rhs_weap_ak105_npz","rhs_acc_dtk4short","rhs_acc_perst1ik","rhsusf_acc_g33_xps3",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK"],[],""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_asval_grip_npz", "", "rhs_acc_2dpZenit_ris", "rhs_acc_ekp8_18", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_grip_npz", "", "", "rhs_acc_ekp8_18", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_grip_npz", "", "rhs_acc_2dpZenit_ris", "rhs_acc_okp7_picatinny", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_grip_npz", "", "", "rhs_acc_okp7_picatinny", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25_npz","rhs_acc_dtk4short","","rhs_acc_okp7_picatinny",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK"],["rhs_VG40TB", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"],""],
["rhs_weap_ak74m_gp25_npz","rhs_acc_tgpa","","rhs_acc_okp7_picatinny",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK"],["rhs_VG40TB", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"],""],
["rhs_weap_ak74m_gp25_npz","rhs_acc_dtk4short","","rhs_acc_ekp8_18",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK"],["rhs_VG40TB", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"],""],
["rhs_weap_ak74m_gp25_npz","rhs_acc_tgpa","","rhs_acc_ekp8_18",["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK"],["rhs_VG40TB", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_GDM40"],""]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_asval_grip_npz", "", "rhs_acc_2dpZenit_ris", "rhs_acc_ekp8_18", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_grip_npz", "", "", "rhs_acc_ekp8_18", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_grip_npz", "", "rhs_acc_2dpZenit_ris", "rhs_acc_okp7_picatinny", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_asval_grip_npz", "", "", "rhs_acc_okp7_picatinny", ["rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP6", "rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_pkp","","","rhs_acc_1p78",["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR_green"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_npz", "rhs_acc_tgpv", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_type69_airburst_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_6p53", "", "", "", ["rhs_18rnd_9x21mm_7N29"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["PRACS_SLA_M88_uniform"]];
_militaryLoadoutData set ["slUniforms", ["PRACS_SLA_M88_SL_uniform"]];
_militaryLoadoutData set ["vests", ["PRACS_SLA_6b2", "PRACS_SLA_6sh92"]];
_militaryLoadoutData set ["glVests", ["PRACS_SLA_6sh92_VOG", "PRACS_SLA_6b2_chicom"]];
_militaryLoadoutData set ["slVests", ["PRACS_SLA_6sh92_R", "PRACS_SLA_6b2_Holster"]];
_militaryLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54", "PRACS_SLA_bandolier"]];
_militaryLoadoutData set ["helmets", ["PRACS_SLA_ssh68_cover", "PRACS_SLA_ssh68_cover"]];
_militaryloadoutData set ["slHat", ["PRACS_SLA_Guards_Beret"]];
_militaryLoadoutData set ["sniHats", ["PRACS_SLA_Booniehat"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak74n_gp25","rhs_acc_dtk1983","","rhs_acc_1p78",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_1p78",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_akmn_gp25","rhs_acc_dtkakm","","rhs_acc_1p78",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_aks74n_gp25","rhs_acc_dtk1983","","rhs_acc_1p78",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_1p78",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_ak74n","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_akmn","rhs_acc_dtkakm","rhs_acc_2dpZenit","",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_akmn","rhs_acc_dtkakm","","rhs_acc_pkas",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_akmn","rhs_acc_dtkakm","","rhs_acc_okp7_dovetail",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_aks74un","rhs_acc_pgs64_74un","","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74un","rhs_acc_pgs64_74un","","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74un","rhs_acc_pgs64_74un","","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];
_militaryLoadoutData set ["SMGs", [
["rhs_weap_aks74un","rhs_acc_pgs64_74un","","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74un","rhs_acc_pgs64_74un","","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74un","rhs_acc_pgs64_74un","","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_ak74n_gp25","rhs_acc_dtk1983","","rhs_acc_pkas",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"], ""],
["rhs_weap_ak74n_gp25","rhs_acc_dtk1983","","rhs_acc_okp7_dovetail",["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_rpk74m","rhs_acc_dtkrpk","","",["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"],[],""],
["rhs_weap_rpk74m","rhs_acc_dtkrpk","","rhs_acc_pkas",["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"],[],""],
["rhs_weap_pkm","","","",["rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_svdp_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_type69_airburst_mag", "rhs_rpg7_PG7VL_mag"], [""],""]
]];
_militaryLoadoutData set ["missileATLaunchers", [
["PRACS_SLA_Saeghe", "", "", "", ["PRACS_Saeghe_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["rhs_weap_makarov_pm", "", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""],
["rhs_weap_pp2000_folded", "", "", "", ["rhs_mag_9x19mm_7n31_44", "rhs_mag_9x19mm_7n21_44"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["PRACS_SLA_Border_Guard_uniform"]];
_policeLoadoutData set ["vests", ["rhs_belt_AK", "rhs_belt_AK_back"]];
_policeLoadoutData set ["helmets", ["PRACS_SLA_Border_Guard_Cap"]];

_policeLoadoutData set ["SMGs", [
    ["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
    ["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n31_20"], [], ""]
]];

_policeLoadoutData set ["sidearms", [
    ["rhs_weap_tt33", "", "", "", ["rhs_mag_762x25_8"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["PRACS_SLA_M88_uniform"]];
_militiaLoadoutData set ["vests", ["PRACS_SLA_6sh92"]];
_militiaLoadoutData set ["glVests", ["PRACS_SLA_6sh92_VOG_SF"]];
_militiaLoadoutData set ["slVests", ["PRACS_SLA_6sh92_R_SF"]];
_militiaLoadoutData set ["backpacks", ["PRACS_SLA_bandolier"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_6b2"]];
_militiaLoadoutData set ["helmets", ["PRACS_SLA_Soft_Cap", "PRACS_SLA_ssh68"]];
_militialoadoutData set ["slHat", ["PRACS_SLA_Guards_Beret"]];
_militiaLoadoutData set ["sniHats", ["PRACS_SLA_Booniehat"]];

_militiaLoadoutData set ["slRifles", [
["rhs_weap_ak74n","rhs_acc_dtk1983","","rhs_acc_1p78",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_ak74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_1p78",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_akmn","rhs_acc_dtkakm","rhs_acc_2dpZenit","rhs_acc_1p78",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_akmn","rhs_acc_dtkakm","","rhs_acc_1p78",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","","rhs_acc_1p78",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","rhs_acc_2dpZenit","rhs_acc_1p78",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74n","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74","rhs_acc_dtk1983","rhs_acc_2dpZenit","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_aks74n","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_akmn","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_akm","rhs_acc_dtkakm","rhs_acc_2dpZenit","",["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"],[],""],
["rhs_weap_ak74_3","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N6M_green_AK", "rhs_30Rnd_545x39_7N6_AK"],[],""],
["rhs_weap_ak74","rhs_acc_dtk1983","rhs_acc_2dpZenit","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""],
["rhs_weap_ak74_3","rhs_acc_dtk1983","rhs_acc_2dpZenit","",["rhs_30Rnd_545x39_7N6M_green_AK", "rhs_30Rnd_545x39_7N6_AK"],[],""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74u","rhs_acc_pgs64_74un","","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74_gp25","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_ak74n_gp25","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"],""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white", "rhs_VG40OP_red", "rhs_GDM40"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_aks74u","rhs_acc_pgs64_74un","","",["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6M_green_AK"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_pkm","","","",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"],[],""],
["rhs_weap_pm63","rhs_acc_dtkakm","","",["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_m38_rail","","","rhs_acc_okp7_picatinny",["rhsgref_5Rnd_762x54_m38"],[],""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_svdp","","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1"],[],""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_OG7V_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["PRACS_SLA_M88_Tanker_uniform"]];
_crewLoadoutData set ["vests", ["PRACS_SLA_6sh92_R"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_bala", "rhs_tsh4_ess_bala"]];
_crewLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PRACS_SLA_M88_Heli_pilot_uniform"]];
_pilotLoadoutData set ["vests", ["rhs_vest_pistol_holster"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["PRACS_SLA_Dress_uniform"]];
_officerLoadoutData set ["slVests", ["rhs_vest_commander", "rhs_gear_OFF"]];
_officerLoadoutData set ["slHat", ["PRACS_SLA_Generals_Cap"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["facewear", ["G_Squares"]];

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
["other", [["Official", _squadLeaderTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
