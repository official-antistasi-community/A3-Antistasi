//////////////////////////
//   Side Information   //
//////////////////////////

["name", "IAF"] call _fnc_saveToTemplate;                         //this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", "IAF support corridor"] call _fnc_saveToTemplate;             //this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION

["flag", "Flag_BI_F"] call _fnc_saveToTemplate;                         //this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\A3\ui_f\data\map\markers\flags\Italy_ca.paa"] call _fnc_saveToTemplate;                 //this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_Italy"] call _fnc_saveToTemplate;             //this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["ASZ_LR110_CCpara", "ASZ_LR110_AM", "ASZ_LR90_EI", "ASZ_VM90_EI"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["ASZ_LR110_CCpara_MG3", "ASZ_LR90_M2", "ASZ_LR90_MK19", "ASZ_LR90_TOW", "ASZ_VM90_EI_P", "ASZ_VM90_EI_M2", "ASZ_Cougar_6x6", "ASZ_VTML_hitrole", "ASZ_VTML_hitrole_LR", "ASZ_VTML_M2", "ASZ_VTML_M2_Protect"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["ASZ_ACTL4x4_EI"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["ASZ_ACTL4x4_EI"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["ASZ_VM90_EI_rep", "ASZ_ACTL6x6_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["ASZ_ACTL6x6_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["ASZ_VCC2_EI_amb", "ASZ_VM90_EI_amb"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["ASZ_PUMA4x4CC_MG3", "ASZ_PUMA4x4_M2", "ASZ_PUMA4x4_TOW", "ASZ_PUMA6x6_AT", "ASZ_PUMA6x6CC_MG3", "ASZ_PUMA6x6_hitrole", "ASZ_PUMA6x6_M2", "ASZ_VCC1_EI", "ASZ_VCC1_EI_plus", "ASZ_VCC2_EI"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["ASZ_AAV_EI_camo", "ASZ_SuperAV_EI_Command", "ASZ_SuperAV_EI", "ASZ_SuperAV_EI_battlefield", "ASZ_Freccia"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["ASZ_Freccia_AT", "ASZ_Dardo"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["ASZ_Centauro_B1"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["ASZ_Ariete_camo", "ASZ_Ariete_camo_plus"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_M163_Vulcan_USA", "CUP_B_nM1097_AVENGER_USA_WDL"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_B_Zodiac_USMC"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["ASZ_AV8B"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["ASZ_EFA", "ASZ_AV8B"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["DDL_C27J_AM"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["ASZ_AH6_EI_reos"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["ASZ_AB212_AM", "ASZ_AB412_EI", "ASZ_AB412_EI_reos", "ASZ_CH47_EI", "ASZ_NH90_EI"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["ASZ_AB212_EI_FFAR", "ASZ_AB212_EI_M21", "ASZ_AB412_EI_ffar", "ASZ_AB412_EI_M21"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["ASZ_A129", "ASZ_A129d"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M119_US"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M119_US", ["CUP_30Rnd_105mmHE_M119_M"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["ASZ_VM90_EI_P"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["ASZ_ACTL4x4_EI"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["ASZ_LR110_CCpara"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["ASZ_LR110_CC"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_GER"]] call _fnc_saveToTemplate;
["staticAT", ["asz_spikeLR_tripode"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSBoundingMine"]] call _fnc_saveToTemplate;

#include "PED_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4",
"LivonianHead_5","LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9",
"WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_05","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;
"CUP_Names_CzechMen" call _fnc_saveNames;

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

_loadoutData set ["lightATLaunchers", [["ASZ_PzF3_Loaded", "", "", "", [""], [], ""]]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["ASZ_SpikeSR_Loaded", "", "", "", [""], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["ASZ_Launch_Stinger", "", "", "", ["ASZ_Stinger_Mag"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["mum_wide_WP", "mum_wide"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["ASZ_Vector"]];

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
_loadoutData set ["slHat", ["ASZ_Basco_EI"]];
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
private _sfmmItems = ["CUP_optic_AN_PAS_13c2","CUP_optic_AN_PVS_10_black"];

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
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["ASZ_SOF_Uniform_CBT"]];
_sfLoadoutData set ["vests", ["ASZ_NC4_09", "ASZ_NC4_09_TL"]];
_sfLoadoutData set ["mgVests", ["ASZ_NC4_09_MG"]];
_sfLoadoutData set ["medVests", ["ASZ_NC4_09_Medic"]];
_sfLoadoutData set ["glVests", ["ASZ_NC4_09_GL"]];
_sfLoadoutData set ["backpacks", ["ASZ_BackPack_30lt_CBT", "ASZ_BackPack_40lt_CBT", "asz_bergen_cbt"]];
_sfLoadoutData set ["slBackpacks", ["minimap_CBT", "BackPanel_CBT"]];
_sfLoadoutData set ["atBackpacks", ["ASZ_BackPack_50lt_CBT", "ASZ_BackPack_75lt_CBT"]];
_sfLoadoutData set ["helmets", ["ASZ_MACH3_cbt", "ASZ_OPSCORE_CBT", "ASZ_OPSCORE_CBT_net"]];
_sfLoadoutData set ["slHat", ["ASZ_Basco_EI"]];
_sfLoadoutData set ["sniHats", ["ASZ_BoonieHat_CBT"]];
_sfLoadoutData set ["NVGs", ["mum_wide_WP"]];
_sfLoadoutData set ["binoculars", ["ASZ_Vector"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["ASZ_ARX160", "ASZ_Silencer_556_blk", "ASZ_Pointer_blk", "ASZ_Acog", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["APD_ARX200", "ASZ_Silencer_762_blk", "", "ASZ_Leupold_MK4_CQT", ["ASZ_20Rnd_762x51_Mag_AP"], [], ""],
    ["ASZ_ARX160_GLS", "ASZ_Silencer_556_blk", "ASZ_Pointer_blk", "ASZ_Acog", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["ASZ_ARX160", "ASZ_Silencer_556_blk", "", "ASZ_Acog", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
    ["ASZ_ARX160", "ASZ_Silencer_556_blk", "", "ASZ_Aimpoint_COMPM4S", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
    ["ASZ_ARX160_tan", "ASZ_Silencer_556_des", "", "ASZ_Aimpoint_PRO_des", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
    ["ASZ_ARX160_tan", "ASZ_Silencer_556_des", "", "ASZ_Eotech_des", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["ASZ_M4A1", "ASZ_Silencer_M4A1", "", "ASZ_Acog", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
    ["ASZ_M4A1", "ASZ_Silencer_M4A1", "", "ASZ_Eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["ASZ_ARX160_GLS", "ASZ_Silencer_556_blk", "", "ASZ_Aimpoint_PRO_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["ASZ_ARX160_GLS", "ASZ_Silencer_556_blk", "", "ASZ_Eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["ASZ_ARX160_GLS_tan", "ASZ_Silencer_556_des", "", "ASZ_Aimpoint_PRO_des", ["30Rnd_556x45_Stanag_SD_ASZ"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["ASZ_ARX160_GLS_tan", "ASZ_Silencer_556_des", "", "ASZ_Eotech_des", ["30Rnd_556x45_Stanag_SD_ASZ"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP7", "CUP_muzzle_snds_MP7", "", "CUP_optic_MicroT1", ["CUP_40Rnd_46x30_MP7_Red_Tracer","CUP_40Rnd_46x30_MP7"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["ASZ_M249_base", "", "", "ASZ_Eotech_blk", ["200Rnd_M249mag"], [], ""],
    ["ASZ_M249mk1_base", "", "", "", ["200Rnd_M249mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["APD_ARX200", "ASZ_Silencer_762_blk", "ASZ_Pointer_blk", "ASZ_Tasco_Pronghorn", ["ASZ_20Rnd_762x51_Mag_AP"], [], "ASZ_Bipod_ARX_blk"],
    ["APD_ARX200", "ASZ_Silencer_762_blk", "ASZ_Pointer_blk", "ASZ_Schmidt_Bender_LP", ["ASZ_20Rnd_762x51_Mag_SD"], [], "ASZ_Bipod_ARX_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["ASZ_M107_Blk", "", "", "ASZ_Leupold_MK4_MRT_black", ["ASZ_5x127_Mag"], [], "ASZ_Bipod_M107"],
    ["ASZ_M107_des", "", "", "ASZ_Leupold_MK4_MRT_des", ["ASZ_5x127_Mag"], [], "ASZ_Bipod_M107"]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["ASZ_PzF3_Loaded", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["ASZ_glock17", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["ASZ_Uniforme_EI_CBT", "ASZ_Uniforme_EI_LS_CBT"]];
_militaryLoadoutData set ["vests", ["ASZ_NC4_09_naja", "ASZ_NC4_09"]];
_militaryLoadoutData set ["mgVests", ["ASZ_NC4_09_MG"]];
_militaryLoadoutData set ["medVests", ["ASZ_NC4_09_Medic", "ASZ_NC4_09_base"]];
_militaryLoadoutData set ["slVests", ["ASZ_NC4_09_TL"]];
_militaryLoadoutData set ["glVests", ["ASZ_NC4_09_GL"]];
_militaryLoadoutData set ["engVests", ["ASZ_NC4_09_GL"]];
_militaryLoadoutData set ["backpacks", ["BlackHawkIBlackHawkI_CBT", "ASZ_BackPack_30lt_CBT", "ASZ_BackPack_40lt_CBT"]];
_militaryLoadoutData set ["slBackpacks", ["BackPanel_CBT"]];
_militaryLoadoutData set ["atBackpacks", ["ASZ_BackPack_75lt_CBT", "ASZ_BackPack_50lt_CBT"]];
_militaryLoadoutData set ["medBackpacks", ["ASZ_BackPack_TSSI_M9_Med_Green"]];
_militaryLoadoutData set ["helmets", ["ASZ_Mich_CBT", "ASZ_Mich_CBT_alp", "ASZ_Mich_CBT_bers", "ASZ_Mich_ARC_CBT"]];
_militaryLoadoutData set ["sniHats", ["ASZ_BoonieHat_CBT"]];
_militaryLoadoutData set ["binoculars", ["ASZ_Vector"]];

_militaryLoadoutData set ["slRifles", [
    ["ASZ_ARX160", "", "", "ASZ_Acog", ["CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["ASZ_ARX160_tan", "", "", "ASZ_Acog", ["CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["ASZ_AR7090", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["ASZ_AR7090", "", "", "ASZ_Eotech_blk", ["CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["ASZ_AR7090", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["ASZ_SC90", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["ASZ_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["ASZ_ARX160", "", "", "ASZ_Eotech_blk", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["ASZ_ARX160", "", "", "ASZ_Aimpoint_PRO_blk", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["ASZ_ARX160_tan", "", "", "ASZ_Eotech_des", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["ASZ_SCS90", "", "", "ASZ_Aimpoint_PRO_blk", ["CUP_30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["ASZ_SCS90", "", "", "ASZ_Aimpoint_COMPM4S", ["CUP_30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["ASZ_AR7090_gl", "", "", "ASZ_Aimpoint_PRO_blk", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["ASZ_ARX160_GLS", "", "", "ASZ_Acog", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["ASZ_AR7090_gl", "", "", "ASZ_Eotech_blk", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["ASZ_ARX160_GLS_tan", "", "", "ASZ_Acog", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_EVO", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_9x19_EVO"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_9x19_EVO"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["ASZ_M249_base", "", "", "", ["100Rnd_556x45_M249"], [], "ASZ_Bipod_M249"],
    ["ASZ_M249mk1_base", "", "", "ASZ_Eotech_blk", ["100Rnd_556x45_M249"], [], "ASZ_Bipod_M249"]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["ASZ_SakoTRG42", "", "", "ASZ_Leupold_MK4_MRT_black", ["10Rnd_762x51_Mag_ASZ"], [], ""],
    ["APD_ARX200", "", "", "ASZ_Leupold_VXR_Patrol", ["ASZ_20Rnd_762x51_Mag_Tracer_Dim"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["ASZ_M40A3_Green_ghillie", "", "", "ASZ_Leupold_MK4_MRT_black", ["5Rnd_762x51_Mag_ASZ"], [], "ASZ_Bipod_M40A3"],
    ["ASZ_M40A3_Des_ghillie", "", "", "ASZ_Leupold_MK4_MRT_des", ["5Rnd_762x51_Mag_ASZ"], [], "ASZ_Bipod_M40A3"]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["ASZ_PzF3_Loaded", "", "", "", [""], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["ASZ_M84", "", "", "", ["15Rnd_9x19_M9_ASZ"], [], ""],
    ["ASZ_M92", "", "", "", ["15Rnd_9x19_M9_ASZ"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["ASZ_SOD_DC_CC"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["ASZ_GIS_UP", "ASZ_GIS_DN"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_M1014", "", "", "", ["CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["ASZ_M84", "", "", "", ["15Rnd_9x19_M9_ASZ"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["ASZ_Parka_mistocbt", "ASZ_Parka_mistovegecam", "ASZ_woodland"]];
_militiaLoadoutData set ["vests", ["CUP_V_I_RACS_Carrier_Rig_wdl_2"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_I_RACS_Carrier_Rig_wdl_3"]];
_militiaLoadoutData set ["backpacks", ["marsupio_OD", "camelbak", "marsupio_tan", "ASZ_BackPack_30lt_Green"]];
_militiaLoadoutData set ["slBackpacks", ["BackPanel_Coy"]];
_militiaLoadoutData set ["atBackpacks", ["ASZ_BackPack_75lt_Green"]];
_militiaLoadoutData set ["helmets", ["SEPT2_Woodland", "ASZ_Protec_half", "SEPT2_PLUS_cbt"]];
_militiaLoadoutData set ["sniHats", ["ASZ_BoonieHat_CBT"]];

_militiaLoadoutData set ["rifles", [
    ["ASZ_AR7090", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], [], ""],
    ["CUP_arifle_M16A2", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""],
    ["CUP_arifle_M16A1E1", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["ASZ_SCS90", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], [], ""],
    ["ASZ_SCS90", "", "", "ASZ_Aimpoint_PRO_blk", ["20Rnd_556x45_Stanag_ASZ"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["ASZ_Mk13", "", "", "", ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_EVO", "", "", "", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M60", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["ASZ_M40A3_Green", "", "", "ASZ_AMS", ["5Rnd_762x51_Mag_ASZ"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["ASZ_SakoTRG42", "", "", "ASZ_Tasco_Pronghorn", ["10Rnd_762x51_Mag_ASZ"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["ASZ_PzF3_Loaded", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["ATLaunchers", [
    ["ASZ_SpikeSR_Loaded", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["ASZ_M84", "", "", "", ["15Rnd_9x19_M9_ASZ"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["ASZ_Uniforme_Tracked_Crew"]];
_crewLoadoutData set ["vests", ["ASZ_NC4_09_base"]];
_crewLoadoutData set ["helmets", ["ASZ_Helmet_Crew_Wheel", "ASZ_Helmet_Crew_Traked"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["ASZ_uniform_Pilot_GSuit_MM"]];
_pilotLoadoutData set ["vests", ["ASZ_GearHelyPilot", "ASZ_GearHelyPilot_MM", "ASZ_GearAirPilot_MM"]];
_pilotLoadoutData set ["helmets", ["ASZ_Helm_HeliPilot_AM", "ASZ_Helm_HeliPilot_CC", "ASZ_Helm_HeliPilot_MM"]];


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