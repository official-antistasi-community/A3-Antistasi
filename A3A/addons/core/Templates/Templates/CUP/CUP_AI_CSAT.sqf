//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSAT Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_CSAT_F"] call _fnc_saveToTemplate;
["flagTexture", "A3\Data_F\Flags\Flag_CSAT_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CSAT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["O_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["O_LSV_02_unarmed_F", "CUP_O_UAZ_Open_CSAT", "CUP_O_UAZ_Unarmed_CSAT", "CUP_O_Tigr_M_233114_CSAT", "O_MRAP_02_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["O_LSV_02_armed_F", "O_LSV_02_AT_F", "CUP_O_Tigr_M_233114_PK_CSAT", "CUP_O_Tigr_M_233114_KORD_CSAT", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["O_Truck_03_transport_F", "O_Truck_03_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["O_Truck_03_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_Truck_03_repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_Truck_03_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_Truck_03_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CUP_O_BRDM2_HQ_CSAT", "CUP_O_BRDM2_ATGM_CSAT", "CUP_O_BRDM2_CSAT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_O_BTR60_CSAT", "CUP_O_BTR80_CSAT", "CUP_O_BTR80A_CSAT", "CUP_O_BMP2_ZU_CSAT", "O_APC_Wheeled_02_rcws_v2_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["CUP_O_BMP1_CSAT", "CUP_O_BMP1P_CSAT", "CUP_O_BMP2_CSAT"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_O_T55_CSAT", "CUP_O_T72_CSAT", "CUP_O_T90MS_CSAT"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_O_ZSU23_Afghan_CSAT", "CUP_O_ZSU23_CSAT"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F", "CUP_O_SU34_CSAT", "CUP_O_Su25_Dyn_CSAT_T"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_O_SU34_CSAT"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_Heli_Transport_04_bench_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["O_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_bench_F", "CUP_O_MI6T_CSAT_T"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["CUP_O_Ka60_Hex_CSAT", "CUP_O_Ka60_GL_Hex_CSAT", "CUP_O_Mi24_P_Dynamic_CSAT_T"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_O_Mi24_D_Dynamic_CSAT_T", "CUP_O_Mi24_V_Dynamic_CSAT_T", "CUP_O_Mi24_Mk3_CSAT_T", "CUP_O_Mi24_Mk4_CSAT_T"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_T_MBT_02_arty_ghex_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["O_T_MBT_02_arty_ghex_F", ["32Rnd_155mm_Mo_shells_O"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["O_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_O_UAZ_MG_CSAT", "CUP_O_UAZ_AGS30_CSAT", "CUP_O_UAZ_METIS_CSAT", "CUP_O_UAZ_SPG9_CSAT", "CUP_O_UAZ_AA_CSAT"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_Truck_02_transport_F", "O_Truck_02_covered_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_O_UAZ_Unarmed_CSAT"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_O_KORD_high_RU"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_O_Kornet_RU"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_Igla_AA_pod_RU", "CUP_O_ZU23_RUS_M_Winter"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_O_2b14_82mm_RU"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_MineE_M"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "CUP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
"ChineseMen" call _fnc_saveNames;

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

_loadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_TBG7V_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V2", ["CUP_PG7VR_M", "CUP_OG7_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V", ["CUP_PG7VM_M", "CUP_OG7_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "", ["CUP_OG7_M", "CUP_TBG7V_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_Igla", "", "", "", ["CUP_Igla_M"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["CUP_MineE_M"]];
_loadoutData set ["APMines", ["APERSTripMine_Wire_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["CUP_TimeBomb_M"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue", "I_IR_Grenade"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS15_tan"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Laserdesignator_02"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_MilCap_ocamo"]];
_loadoutData set ["sniHats", ["H_Booniehat_tan"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["U_O_V_Soldier_Viper_hex_F"]];
_sfLoadoutData set ["vests", ["CUP_V_I_RACS_Carrier_Vest_2", "CUP_V_I_RACS_Carrier_Vest_3", "CUP_V_I_RACS_Carrier_Vest"]];
_sfLoadoutData set ["backpacks", ["B_ViperLightHarness_hex_F", "B_ViperHarness_hex_F", "B_AssaultPack_ocamo"]];
_sfLoadoutData set ["slBackpacks", ["B_RadioBag_01_hex_F"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_sfLoadoutData set ["helmets", ["H_HelmetO_ViperSP_hex_F"]];
_sfLoadoutData set ["NVGs", []];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02"]];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_AK15_bicolor", "CUP_muzzle_snds_KZRZP_AK762_desert", "CUP_acc_ANPEQ_15", "CUP_optic_OKP_7_d_rail", ["CUP_30Rnd_762x39_AK15_Tan_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK15_Tan_M"], [], ""],
    ["CUP_arifle_AK15_VG_bicolor", "CUP_muzzle_snds_KZRZP_AK762_desert", "", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_762x39_AK15_Tan_M"], [], ""],
    ["arifle_Katiba_F", "muzzle_snds_H", "CUP_acc_LLM_black", "CUP_optic_TrijiconRx01_kf_black", ["30Rnd_65x39_caseless_green"], [], ""],
    ["arifle_Katiba_C_F", "muzzle_snds_H", "", "CUP_optic_ZeissZPoint", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["CUP_arifle_AK15_VG_bicolor", "CUP_muzzle_snds_KZRZP_AK762_desert", "", "CUP_optic_MEPRO_moa_clear", ["CUP_30Rnd_762x39_AK15_Tan_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK15_Tan_M"], [], ""],
    ["arifle_Katiba_C_F", "muzzle_snds_H", "", "CUP_optic_AN_PAS_13c1", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["CUP_srifle_VSSVintorez_VFG_top_rail", "", "", "CUP_optic_LeupoldMk4_CQ_T", ["CUP_30Rnd_9x39_SP5_VIKHR_M"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK15_GP34_bicolor", "CUP_muzzle_snds_KZRZP_AK762_desert", "", "CUP_optic_CompM2_Black", ["CUP_30Rnd_762x39_AK15_Tan_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_IlumFlareWhite_GP25_M"], ""],
    ["arifle_Katiba_GL_F", "muzzle_snds_H", "CUP_acc_ANPEQ_2_grey", "CUP_optic_OKP_7_rail", ["30Rnd_65x39_caseless_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_StarCluster_White_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_bizon", "CUP_muzzle_Bizon", "", "", ["CUP_64Rnd_9x19_Bizon_M"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_PKM_B50_vfg", "CUP_muzzle_snds_KZRZP_PK_woodland", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"], [], ""],
    ["CUP_arifle_RPK74", "CUP_muzzle_Bizon", "", "", ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD_wdl_top_rail", "CUP_muzzle_snds_KZRZP_SVD_woodland", "", "CUP_optic_LeupoldM3LR", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["CUP_srifle_ksvk", "", "", "CUP_optic_PSO_3", ["CUP_5Rnd_127x108_KSVK_M"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_PMM", "", "", "", ["CUP_12Rnd_9x18_PMM_M"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_O_SpecopsUniform_ocamo", "U_O_CombatUniform_ocamo"]];
_militaryLoadoutData set ["slUniforms", ["U_O_OfficerUniform_ocamo"]];
_militaryLoadoutData set ["vests", ["CUP_V_O_RUS_RPS_Smersh_AK_Coyote"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_O_RUS_RPS_Smersh_PKP_Coyote"]];
_militaryLoadoutData set ["glVests", ["CUP_V_O_RUS_RPS_Smersh_VOG_SPP_Coyote"]];
_militaryLoadoutData set ["engVests", ["CUP_V_O_RUS_RPS_Smersh_VOG_Coyote"]];
_militaryLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_AssaultPack_ocamo", "B_FieldPack_ocamo"]];
_militaryLoadoutData set ["slBackpacks", ["B_RadioBag_01_hex_F"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_militaryLoadoutData set ["helmets", ["H_HelmetO_ocamo", "H_HelmetLeaderO_ocamo", "H_HelmetSpecO_ocamo", "CUP_H_SLA_Helmet_DES", "CUP_H_SLA_Helmet_DES_worn"]];
_militaryLoadoutData set ["sniHats", ["H_Booniehat_khk"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_02"]];

_militaryLoadoutData set ["slRifles", [
    ["arifle_Katiba_F", "", "", "CUP_optic_MicroT1", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
    ["CUP_arifle_AK15_VG_black", "", "", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_762x39_AK15_M"], [], ""],
    ["CUP_arifle_AK74M_railed_afg", "", "", "CUP_optic_ZeissZPoint_hex", ["CUP_30Rnd_545x39_AK74M_M"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_AK15_VG_black", "", "", "CUP_optic_ZeissZPoint", ["CUP_30Rnd_762x39_AK15_M", "CUP_30Rnd_Subsonic_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK74M_railed", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["arifle_Katiba_C_F", "", "", "CUP_optic_MEPRO", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["arifle_Katiba_C_F", "", "", "CUP_optic_AIMM_M68_BLK", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
    ["CUP_arifle_AKS74U_railed", "", "", "CUP_optic_MRad", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74_plum_M", "CUP_30Rnd_545x39_AK74M_camo_M"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["arifle_Katiba_GL_F", "", "", "CUP_optic_OKP_7_rail", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_AK15_GP34_black", "", "", "", ["CUP_30Rnd_762x39_AK15_M", "CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_bakelite_AK103_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_bizon", "", "", "", ["CUP_64Rnd_Red_Tracer_9x19_Bizon_M", "CUP_64Rnd_9x19_Bizon_M", "CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_Pecheneg_top_rail_B50_vfg", "", "", "CUP_optic_SUSAT", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"], [], ""],
    ["CUP_lmg_Pecheneg", "", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"], [], ""],
    ["CUP_arifle_RPK74", "", "", "CUP_optic_1p63", ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], [], ""],
    ["arifle_CTARS_blk_F", "", "", "CUP_optic_Elcan_reflex", ["100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""],
    ["srifle_DMR_01_F", "", "", "CUP_optic_LeupoldM3LR", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AS50", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_127x99_as50_M"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Makarov", "", "", "", ["CUP_8Rnd_9x18_Makarov_M"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_MilCap_gen_F"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_10Rnd_762x39_SaigaMk03_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_TT", "", "", "", ["CUP_8Rnd_762x25_TT"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["CUP_U_O_RUS_M88_MSV", "CUP_U_O_RUS_M88_MSV_rolled_up"]];
_militiaLoadoutData set ["vests", ["V_TacVest_khk", "V_HarnessO_brn"]];
_militiaLoadoutData set ["sniVests", ["V_HarnessOGL_brn"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_ocamo"]];
_militiaLoadoutData set ["slBackpacks", ["B_RadioBag_01_hex_F"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_militiaLoadoutData set ["helmets", ["CUP_H_SLA_Helmet_DES", "CUP_H_SLA_Helmet_DES_worn", "H_Beret_CSAT_01_F"]];
_militiaLoadoutData set ["sniHats", ["H_Booniehat_khk"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_TYPE_56_2", "", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_762x39_AK47_M"], [], ""],
    ["CUP_arifle_TYPE_56_2_top_rail", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_762x39_AK47_M"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_SKS", "", "", "", ["CUP_10Rnd_762x39_SKS_M"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["arifle_Katiba_GL_F", "", "", "", ["30Rnd_65x39_caseless_green"], ["CUP_1Rnd_HE_M203", "CUP_FlareWhite_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_vityaz", "", "", "", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_Sa58_Klec", "", "", "", ["CUP_45Rnd_Sa58_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_01_F", "", "", "CUP_optic_SB_11_4x20_PM_tan", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_Mosin_Nagant", "", "", "CUP_optic_PEM", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_TT", "", "", "", ["CUP_8Rnd_762x25_TT"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_O_SpecopsUniform_ocamo"]];
_crewLoadoutData set ["vests", ["V_BandollierB_cbr"]];
_crewLoadoutData set ["helmets", ["CUP_H_TK_TankerHelmet"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_O_PilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_Rangemaster_belt"]];
_pilotLoadoutData set ["helmets", ["CUP_H_RUS_ZSH_Shield_Up", "CUP_H_RUS_ZSH_Shield_Down"]];


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
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
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


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
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
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
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
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
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
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
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
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
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
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

    ["SMGs"] call _fnc_setPrimary;
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
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
