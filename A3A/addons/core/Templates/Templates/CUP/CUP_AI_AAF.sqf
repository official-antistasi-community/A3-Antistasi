//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "AAF Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_aaf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_AAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["O_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_I_LR_Transport_AAF", "I_MRAP_03_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "CUP_I_LR_MG_AAF", "CUP_I_LR_SF_GMG_AAF", "CUP_I_LR_SF_HMG_AAF", "I_LT_01_cannon_F", "I_LT_01_AT_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["I_Truck_02_transport_F", "I_Truck_02_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["I_Truck_02_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["I_Truck_02_box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["I_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["I_Truck_02_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CUP_I_M113A3_HQ_AAF", "CUP_I_M113A3_AAF"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_B_FV510_GB_W", "CUP_B_MCV80_GB_W"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["a3a_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_Leopard_1A3GRN_GER", "CUP_B_Leopard2A6_GER"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_ZSU23_AAF", "CUP_I_M163_Vulcan_AAF", "CUP_I_ZSU23_Afghan_AAF"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_B_RHIB_USMC"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_I_L39_AAF", "CUP_I_SU34_AAF", "CUP_I_AV8B_DYN_AAF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["I_Plane_Fighter_04_F", "CUP_I_SU34_AAF", "CUP_I_AV8B_DYN_AAF"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_I_C130J_AAF"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_I_412_Mil_Transport_AAF"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_I_Wildcat_Unarmed_Digital_AAF", "CUP_I_Wildcat_Unarmed_Green_AAF", "CUP_I_412_Military_Radar_AAF", "I_Heli_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["I_Heli_light_03_dynamicLoadout_F", "CUP_I_Wildcat_Digital_AAF", "CUP_I_Ka60_Digi_AAF", "CUP_I_Ka60_GL_Digi_AAF"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_I_AH1Z_Dynamic_AAF", "CUP_I_Mi24_Mk3_AAF", "CUP_I_Mi24_D_Dynamic_AAF", "CUP_I_Mi24_Mk4_AAF"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_I_M270_HE_AAF"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_I_M270_HE_AAF", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["I_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_I_LR_MG_AAF"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["I_Truck_02_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_I_LR_Transport_AAF"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "CUP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","Ioannou","Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;
"GreekMen" call _fnc_saveNames;

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

_loadoutData set ["lightATLaunchers", ["CUP_launch_M72A6_Special"]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_NLAW", "", "", "", ["CUP_NLAW_M"], [], ""],
    ["CUP_launch_APILAS", "", "", "", ["CUP_APILAS_M"], [], ""],
    ["CUP_launch_HCPF3", "", "", "", ["CUP_PTFHC_M"], [], ""],
    ["CUP_launch_BF3", "", "", "", ["CUP_PTFHE_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", ["CUP_Stinger_M"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["CUP_Mine_M"]];
_loadoutData set ["APMines", ["APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["CUP_PipeBomb_M", "CUP_TimeBomb_M", "SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_L109A2_HE"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue", "I_IR_Grenade"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["CUP_SOFLAM"]];

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
_loadoutData set ["slHat", ["H_MilCap_dgtl"]];
_loadoutData set ["sniHats", []];

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
_sfLoadoutData set ["uniforms", ["CUP_U_B_BDUv2_gloves_Tigerstripe"]];
_sfLoadoutData set ["vests", ["CUP_V_CPC_Fastbelt_rngr"]];
_sfLoadoutData set ["mgVests", ["CUP_V_CPC_weaponsbelt_rngr"]];
_sfLoadoutData set ["medVests", ["CUP_V_CPC_medicalbelt_rngr"]];
_sfLoadoutData set ["glVests", ["CUP_V_CPC_communicationsbelt_rngr"]];
_sfLoadoutData set ["backpacks", ["CUP_B_ACRPara_m95", "CUP_B_ACRScout_m95", "CUP_B_Kombat_Olive"]];
_sfLoadoutData set ["slBackpacks", ["CUP_B_UAVTerminal_Black"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_USMC_AssaultPack"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Covered_AAF_NoHS", "CUP_H_OpsCore_Covered_AAF", "CUP_H_OpsCore_Covered_AAF_SF"]];
_sfLoadoutData set ["slHat", ["H_Cap_blk_Raven"]];
_sfLoadoutData set ["sniHats", ["H_Booniehat_dgtl"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_green"]];
_sfLoadoutData set ["binoculars", ["CUP_LRTV"]];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16_camo", "CUP_acc_LLM_od", "CUP_optic_MicroT1_OD", ["CUP_30Rnd_556x45_PMAG_OD_RPL", "CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Green", "CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK417_12_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Top_Flashlight_OD_L", "CUP_optic_AN_PVS_10_od", ["CUP_20Rnd_762x51_HK417_Camo_Wood"], [], ""],
    ["CUP_arifle_XM8_Carbine_Rail_Green", "CUP_muzzle_snds_XM8", "CUP_acc_ANPEQ_15_OD", "CUP_optic_ACOG_TA01NSN_OD", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Flashlight_OD_L", "CUP_optic_SB_11_4x20_PM_od", ["CUP_20Rnd_762x51_B_SCAR_wdl"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["CUP_arifle_HK416_CQB_Wood", "CUP_muzzle_snds_M16_camo", "CUP_acc_ANPEQ_15_Flashlight_OD_L", "CUP_optic_SB_11_4x20_PM_od", ["CUP_30Rnd_556x45_PMAG_OD_RPL", "CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Green", "CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_XM8_Carbine_FG_Green", "CUP_muzzle_snds_XM8", "", "CUP_optic_ISM_PCAP_green", ["CUP_30Rnd_556x45_XM8"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["arifle_Mk20_F", "muzzle_snds_M", "CUP_acc_ANPEQ_2_camo", "CUP_optic_G33_HWS_OD", ["CUP_30Rnd_556x45_EMAG_Olive"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16_camo", "CUP_acc_ANPEQ_2_OD_Top", "CUP_optic_CompM2_OD", ["CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarFlare_White_M203"], ""],
    ["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16_camo", "CUP_acc_LLM_od", "CUP_optic_AIMM_MARS_OD", ["CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_AC11704_Black", ["CUP_30Rnd_Subsonic_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_Mk48_nohg_od", "muzzle_snds_H_MG", "", "CUP_optic_ACOG_TA648_308_RDS_od", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_minimipara", "CUP_muzzle_snds_XM8", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1"], [], ""],
    ["CUP_arifle_HK416_CQB_Wood", "CUP_muzzle_snds_M16_camo", "", "CUP_optic_ACOG_TA648_308_RDS_Wdl", ["CUP_100Rnd_556x45_BetaCMag_ar15"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_RSASS_Jungle", "CUP_muzzle_snds_socom762rc", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_20Rnd_762x51_B_M110"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["CUP_srifle_M2010_wdl", "muzzle_snds_B", "", "CUP_optic_Leupold_VX3", ["CUP_5Rnd_762x67_M2010_M"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_P30L_Match_od", "", "", "", ["CUP_17Rnd_9x19_P30L"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_I_CombatUniform", "U_I_CombatUniform_tshirt"]];
_militaryLoadoutData set ["slUniforms", ["U_I_OfficerUniform"]];
_militaryLoadoutData set ["vests", ["CUP_V_CZ_NPP2006_nk_vz95"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_CZ_NPP2006_ok_vz95"]];
_militaryLoadoutData set ["glVests", ["CUP_V_CZ_NPP2006_co_vz95"]];
_militaryLoadoutData set ["engVests", ["CUP_V_CZ_NPP2006_light_vz95"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_khk", "B_Carryall_oli", "B_Kitbag_sgg", "I_Fieldpack_oli_AA"]];
_militaryLoadoutData set ["slBackpacks", ["CUP_B_Kombat_Radio_Olive"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_RUS_Backpack"]];
_militaryLoadoutData set ["facewear", ["CUP_G_ESS_BLK_Scarf_Grn_GPS_Beard_Blonde", "CUP_G_PMC_Facewrap_Black_Glasses_Ember", "CUP_G_White_Scarf_Shades_GPS_Beard", "CUP_G_Grn_Scarf_GPS_Beard"]];
_militaryLoadoutData set ["helmets", ["H_HelmetIA", "CUP_H_RUS_6B27_NVG", "CUP_H_RUS_6B27_headset", "CUP_H_RUS_6B27_headset_goggles", "CUP_H_RUS_6B27_goggles"]];
_militaryLoadoutData set ["sniHats", ["H_Booniehat_dgtl"]];
_militaryLoadoutData set ["binoculars", ["CUP_SOFLAM"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_X95", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], [], ""],
    ["CUP_arifle_X95_Grippod", "", "", "CUP_optic_Eotech533Grey", ["CUP_30Rnd_556x45_Emag"], [], ""],
    ["CUP_arifle_ACR_DMR_blk_68", "", "", "CUP_optic_CompM2_Black", ["CUP_30Rnd_680x43_Stanag"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_ACR_DMR_blk_556", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_X95", "CUP_30Rnd_556x45_X95_Tracer_Yellow", "CUP_30Rnd_556x45_X95_Tracer_Red", "CUP_30Rnd_556x45_X95_Tracer_Green"], [], ""],
    ["CUP_arifle_ACRC_blk_68", "", "", "CUP_optic_RCO", ["CUP_30Rnd_556x45_X95", "CUP_30Rnd_556x45_X95_Tracer_Yellow", "CUP_30Rnd_556x45_X95_Tracer_Red", "CUP_30Rnd_556x45_X95_Tracer_Green"], [], ""],
    ["CUP_arifle_HK_M27_VFG", "", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green", "CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_xm29_ke_blk", "", "", "CUP_optic_G36Optics_RDS_3D", ["CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], [], ""],
    ["CUP_arifle_ACRC_blk_68", "", "", "CUP_optic_MARS", ["CUP_30Rnd_680x43_Stanag_Tracer_Red", "CUP_30Rnd_680x43_Stanag_Tracer_Yellow", "CUP_30Rnd_680x43_Stanag_Tracer_Green", "CUP_30Rnd_680x43_Stanag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_ACR_EGLM_blk_556", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarFlare_White_M203"], ""],
    ["CUP_glaunch_Mk13", "", "", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarFlare_White_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_SmokeGreen_M203"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_sgun_AA12", "", "", "", ["CUP_20Rnd_B_AA12_Buck_00", "CUP_20Rnd_B_AA12_Slug", "CUP_20Rnd_B_AA12_Buck_4"], [], ""],
    ["CUP_smg_Mac10", "", "", "", ["CUP_30Rnd_45ACP_MAC10_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_MG3", "", "", "", ["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_minimi", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249_Pouch"], [], ""],
    ["CUP_arifle_XM8_SAW_Rail_Shark", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_556x45_BetaCMag"], [], ""],
    ["CUP_lmg_Mk48_nohg", "", "", "CUP_optic_ACOG_TA648_308_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_RSASS_Black", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110"], [], ""],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_86x70_L115A1"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_P30L_od", "", "", "", ["CUP_17Rnd_9x19_P30L"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_MilCap_gen_F"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_smg_PS90_olive", "", "", "", ["CUP_50Rnd_570x28_Green_Tracer_P90_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_SWM327MP", "", "", "", ["CUP_8Rnd_357SW_M"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_oli", "V_TacVest_oli", "CUP_V_B_PASGT_no_bags_OD"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_O_RUS_RPS_Smersh_SVD_ModernOlive"]];
_militiaLoadoutData set ["backpacks", ["I_Fieldpack_oli_LAT2"]];
_militiaLoadoutData set ["slBackpacks", ["B_RadioBag_01_digi_F"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_Kombat_Olive"]];
_militiaLoadoutData set ["helmets", ["H_Cap_blk_Raven", "H_Watchcap_camo", "CUP_H_PMC_Beanie_Headphones_Khaki"]];
_militiaLoadoutData set ["sniHats", ["H_Booniehat_dgtl"]];

_militiaLoadoutData set ["rifles", [
    ["arifle_Mk20_F", "", "", "CUP_optic_Eotech553_OD", ["CUP_20Rnd_556x45_Stanag"], [], ""],
    ["arifle_Mk20C_F", "", "", "CUP_optic_AC11704_OD", ["CUP_20Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["arifle_TRG20_F", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["arifle_TRG21_GL_F", "", "", "CUP_optic_MRad", ["CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], ["CUP_1Rnd_StarFlare_Red_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimipara", "", "", "", ["CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_I_CombatUniform"]];
_crewLoadoutData set ["vests", ["V_BandollierB_oli"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_I_HeliPilotCoveralls"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_PilotVest"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_I", "H_PilotHelmetHeli_I"]];


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
