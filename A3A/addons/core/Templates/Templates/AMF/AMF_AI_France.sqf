//////////////////////////
//   Side Information   //
//////////////////////////

["name", "French Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "French Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_AMF_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\France_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_France"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["O_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["B_AMF_VAB_ULTIMA_X8_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["amf_VBAE_01_CE_f", "amf_VBAE_02_CE_f", "amf_VBAE_03_CE_f", "AMF_VBMR_L_CE_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["AMF_GBC180_PERS_02"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["AMF_GBC180_ViV_02", "AMF_GBC180_PLATEAU_02"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["AMF_GBC180_AmmoTruck_02"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["AMF_GBC180_MECA_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_MTVR_Refuel_USA"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["AMF_VBMR_SAN_CE"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["AMF_VBMR_ARX30_CE", "AMF_VBMR_MMP_CE"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["AMF_VBCI_CE_01_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["B_AMF_AMX10_RCR_01_F", "B_AMF_AMX10_RCR_SEPAR_01_F", "AMF_EBRC_CE_01"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["B_AMF_TANK_01", "B_AMF_TANK_CE_02_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["AMF_VBMR_MISTRAL_CE"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB_USMC", "CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["AMF_RAFALE_M_01_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_AMF_PLANE_FIGHTER_02_F", "AMF_RAFALE_M_01_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_AMF_PLANE_TRANSPORT_01_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["AMF_gazelle_afte_f"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["amf_cougar", "AMF_panther_FRA", "amf_nh90_tth_transport", "B_AMF_Heli_Transport_4RHFS_01_F", "B_AMF_Heli_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["AMF_gazelle_minigun_f"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["AMF_TIGRE_01"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M119_US"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M119_US", ["CUP_30Rnd_105mmHE_M119_M"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["I_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["amf_pvp_01_top_CE_f"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["AMF_GBC180_PERS_01"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["amf_pvp_01_mag_CE_f"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["AMF_WiredGuided_mmp_F", "AMF_TVGuided_mmp_F"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US", "CUP_B_RBS70_ACR"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSBoundingMine"]] call _fnc_saveToTemplate;

#include "AMF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","Ioannou","Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

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

_loadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_loadoutData set ["ATLaunchers", [
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["AMF_Eryx", "", "", "", ["Eryx_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["SLAMDirectionalMine_Wire_Mag"]];
_loadoutData set ["APMines", ["APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow", "B_IR_Grenade"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["Anafi_UAV_Terminal"]];
_loadoutData set ["NVGs", ["AMF_BINYX_BLK_NVG"]];
_loadoutData set ["binoculars", ["AMF_APX_M241"]];
_loadoutData set ["rangefinders", ["AMF_OB72_SOPHIE"]];

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
_loadoutData set ["slHat", ["AMF_BERET_FRANCO_ALLEMAND"]];
_loadoutData set ["sniHats", ["AMF_BERET_LEGION_1REC"]];

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
_sfLoadoutData set ["uniforms", ["amf_uniform_04_MTP"]];
_sfLoadoutData set ["vests", ["AMF_CRY_JPC_V1_MTC"]];
_sfLoadoutData set ["mgVests", ["AMF_CRY_JPC_V3_MG_MTC"]];
_sfLoadoutData set ["medVests", ["AMF_CRY_JPC_V2_TAN"]];
_sfLoadoutData set ["backpacks", ["AMF_rush24_MTC", "AMF_rush24_RG"]];
_sfLoadoutData set ["slBackpacks", ["AMF_Quadrocopter_Backpack_F"]];
_sfLoadoutData set ["atBackpacks", ["B_AMF_A_E_B_bag_F"]];
_sfLoadoutData set ["helmets", ["AMF_OPSCORE2_BLACK", "AMF_OPSCORE2_BLACK_2"]];
_sfLoadoutData set ["slHat", ["AMF_BERET_TRANSMISSION"]];
_sfLoadoutData set ["sniHats", ["H_Booniehat_mcamo"]];
_sfLoadoutData set ["NVGs", ["AMF_ONYX_NVG"]];
_sfLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

_sfLoadoutData set ["slRifles", [
    ["AMF_614_short_FS4_TAN", "AMF_ROTEX_V", "", "AMF_specter_tan", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS_TAN2", "AMF_ROTEX_V", "", "AMF_schmidt_benderx4", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS_TAN", "AMF_ROTEX_V", "AMF_WMX200_TAN", "AMF_exps3_magnifier_side_painted", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS_TAN", "AMF_ROTEX_V", "AMF_AN_PEQ_15_painted", "AMF_exps3_painted", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], "amf_acc_614_grip4"]
]];
_sfLoadoutData set ["rifles", [  
    ["AMF_SCAR_L_02_F", "muzzle_snds_M", "AMF_AN_PEQ_15_black", "AMF_exps3", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], ""],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_III", "AMF_AN_PEQ_15_black", "AMF_Aimpoint_CompM5", ["30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["amf_sig552", "AMF_ROTEX_V", "AMF_AN_PEQ_15_black", "AMF_EOTECH_553", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["AMF_614_long_HK269_01_F", "", "", "AMF_exps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "", "AMF_schmidt_benderx4", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["amf_hk_mp5_01_f", "muzzle_snds_L", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["FN_Minimi_MK3", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_OD"], [], "Minimi_Grip_MK2"]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["AMF_SCAR_H_01_F", "muzzle_snds_B", "", "AMF_specter_tan", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["AMF_PGM_Hecate_II_Poly_RIS", "", "", "AMF_SB_PM2_P4FL", ["AMF_7Rnd_127x99_HECATE2_CBC_770GR_BSS"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["AMF_Glock_17_Gen4", "muzzle_snds_L", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["amf_uniform_01_CE_MD", "amf_uniform_01_NG_CE_MD"]];
_militaryLoadoutData set ["vests", ["amf_SMB_AUXSAN_FAMAS", "amf_SMB_AUXSAN"]];
_militaryLoadoutData set ["mgVests", ["amf_SMB_ART"]];
_militaryLoadoutData set ["glVests", ["amf_SMB_GRE"]];
_militaryLoadoutData set ["engVests", ["amf_SMB"]];
_militaryLoadoutData set ["backpacks", ["AMF_rush24_RG", "AMF_FELIN_BACKPACK", "AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_militaryLoadoutData set ["atBackpacks", ["AMF_Bergen_F2"]];
_militaryLoadoutData set ["helmets", ["AMF_FELIN_05_CE", "AMF_FELIN_L05_CE", "AMF_FELIN_06_CE", "AMF_FELIN_L06_CE", "AMF_FELIN_03_CE"]];
_militaryLoadoutData set ["sniHats", ["AMF_BERET_LEGION_1REC"]];
_militaryLoadoutData set ["binoculars", ["AMF_APX_M241"]];

_militaryLoadoutData set ["slRifles", [
    ["AMF_614_short_01_F", "", "", "AMF_AIMPOINT_MICRO_T1", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], "amf_acc_614_grip2"],
    ["Famas_G2", "", "", "AMF_exps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
    ["AMF_HK417_Short", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_IMI_175GR"], [], "amf_acc_714_long_grip3"]
]];
_militaryLoadoutData set ["rifles", [
    ["Famas_F1_PGMP", "", "", "", ["AMF_25Rnd_BO_BT_MEN_M193", "AMF_25Rnd_BO_BT_MEN_SS109"], [], ""],
    ["Famas_FELIN", "", "", "", ["AMF_25Rnd_BO_BT_MEN_M193", "AMF_25Rnd_BO_BT_MEN_SS109"], [], ""],
    ["Famas_G2", "", "", "", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M193_Stanag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["Famas_Valo", "", "", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_M193", "AMF_25Rnd_BO_BT_MEN_SS109"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_BT_MEN_M193", "AMF_25Rnd_BO_BT_MEN_SS109"], ["AMF_RFG_AC58", "AMF_RFG_APAV40"], ""],
    ["AMF_614_long_HK269_01_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["AMF_30Rnd_556x45_M193_Stanag", "AMF_30Rnd_556x45_M196_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["amf_hk_mp5_02_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["amf_aanf1_01_f", "", "", "", ["AMF_100Rnd_762x51_AANF1_BO_F3"], [], ""],
    ["amf_mag58_01_f", "", "", "", ["AMF_75Rnd_762x51_MAG58_BO_F3"], [], ""],
    ["FN_Minimi_FELIN", "", "", "", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Handguard_Grip"]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["AMF_20Rnd_308WIN_SCAR_TAN_CBC_168GR_HPBT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["AMF_PGM_ULTIMA_RATIO_F", "", "", "AMF_SB_PM2_P3L", ["AMF_10Rnd_762x51_UR_IMI_175GR"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["amf_classique_f_NG"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_MilCap_blue"]];

_policeLoadoutData set ["SMGs", [
    ["amf_hk_mp5_02_f", "", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["amf_uniform_01_RE_NG_SE_MD", "amf_uniform_01_RE_SE_MD"]];
_militiaLoadoutData set ["vests", ["amf_Belt", "V_TacVest_oli", "V_BandollierB_rgr"]];
_militiaLoadoutData set ["backpacks", ["amf_tecpack_30L"]];
_militiaLoadoutData set ["atBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_militiaLoadoutData set ["helmets", ["AMF_kepi_legio_01", "AMF_kepi_legio_03", "AMF_kepi_legio_02", "AMF_TCNVG", "AMF_SPECTRA", "AMF_SPECTRA_CE"]];

_militiaLoadoutData set ["rifles", [
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_MEN_M193"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["Famas_Valo", "", "", "", ["AMF_25Rnd_BO_MEN_SS109"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["Famas_F1_PGMP", "", "", "", ["AMF_25Rnd_BO_BT_MEN_M193"], ["AMF_RFG_AC58"], ""],
    ["Famas_F1_PGMP", "", "", "", ["AMF_25Rnd_BO_BT_MEN_M193"], ["AMF_RFG_APAV40"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["amf_aanf1_01_f", "", "", "", ["AMF_100Rnd_762x51_AANF1_BO_F3"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["AMF_RFF2_01_F", "", "", "ScromeJ8_NoCover", ["AMF_10Rnd_762x51_IMI_175GR"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["AMF_PGM_ULTIMA_RATIO_F", "", "", "AMF_SB_PM2_P3L", ["AMF_10Rnd_762x51_UR_IMI_175GR"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["amf_uniform_01_RE_NG_OD_MD"]];
_crewLoadoutData set ["vests", ["amf_S3_01_CE"]];
_crewLoadoutData set ["helmets", ["AMF_ELNO_DH_586", "AMF_ELNO_DH_586_TAN"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["amf_pilot_01_f"]];
_pilotLoadoutData set ["vests", ["AMF_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["AMF_topowl", "AMF_LA100", "AMF_ALPHA900", "AMF_ALPHA900_02"]];


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
