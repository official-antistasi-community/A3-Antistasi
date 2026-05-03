//////////////////////////
//   Side Information   //
//////////////////////////

["name", "PLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "PLA support corridor"] call _fnc_saveToTemplate;

["flag", "PLA_Flag_PRC_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\CSAT_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CSAT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F", "VME_JH600_PLARF", "VME_JH600B_PLARF"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["VME_PLA_BJ2022", "VME_CSVP4", "VME_CSK181", "VME_PLA_EQ2050", "VME_PLA_EQ2050_FO", "VME_PLA_EQ2050_HQ"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["VME_PLA_EQ2050_MG", "VME_PLA_EQ2050_GL", "VME_PLA_EQ2050_AT", "VME_PLA_EQ2050_reconMG", "VME_PLA_EQ2050_reconGL"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["VME_VP22"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["VME_PLA_SX2190flatbed"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["VME_PLA_SX2190Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["VME_PLA_SX2190Repair", "vme_wzENG"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["VME_PLA_SX2190Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["VME_PLA_EQ2050_MED", "vme_wzAMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["vme_ZSL92A", "vme_WZ551", "vme_ZSL92B"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["VME_PLA_ZBL09", "VME_PLA_ZBD03"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["VME_PLA_ZBD04", "VME_PLA_ZBD08"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["VME_PLA_ZTL11", "vme_PTL02", "VME_QN506", "VME_PLAN_ZTS63"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["VME_PLA_ZTZ96A", "VME_PLA_ZTZ99", "VME_PLA_ZTZ99A"]] call _fnc_saveToTemplate;
["vehiclesAA", ["VME_PLA_EQ2050_AA", "VME_PLA_HQ7", "VME_PLA_PGZ04", "VME_PLA_PGZ07"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["VME_PLA_JH7", "VME_PLA_J10B", "VME_PLA_J11", "VME_PLA_J16"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["VME_PLA_J20", "VME_PLA_J10B", "VME_PLA_J11", "VME_PLA_J16"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["VME_PLA_AN178", "VME_PLA_Y7", "VME_PLA_Y7A", "VME_PLA_Y9"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["VME_PLA_z9_base"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["VME_PLA_Mi17", "PLA_Z18", "VME_Z20"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["VME_PLA_z9_CAS", "VME_PLA_Mi171", "VME_PLA_z19"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["VME_WZ10_FOR", "VME_WZ10"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["VME_PLA_PLZ05", "vme_PLL05"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["VME_PLA_PLZ05", ["VME_Type86_30rndHE"]],
["vme_PLL05", ["VME_Mortar120mm_30rndHE"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["vme_CH4B"]] call _fnc_saveToTemplate;
["uavsPortable", ["PLA_UAV_01"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["VME_PLA_BJ2022patrol"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["VME_PLA_SX2190"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["VME_PLA_BJ2022"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["VME_Type85_Static_AA", "VME_PLA_QJZ89A", "VME_QJY88_Static_AA"]] call _fnc_saveToTemplate;
["staticAT", ["VME_PLA_HJ11", "VME_PLA_HJ73_static", "VME_PLA_HJ8", "VME_PLA_HJ9A", "VME_PLA_PF98_Tripod"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_ZU23_RU", "CUP_O_Igla_AA_pod_RU"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_O_2b14_82mm_RU"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "VME_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
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

_loadoutData set ["lightATLaunchers", ["vme_pla_PF89", "vme_pla_PF89A_AST", "vme_pla_PF89A", "vme_pla_PF89B", "vme_pla_WPF89_2", "vme_pla_PF97"]];

_loadoutData set ["missileATLaunchers", [
    ["vme_pla_HJ12", "", "", "", ["VME_HJ12_AT", "VME_HJ12_AP"], [], ""],
    ["vme_pla_HJ12_DES", "", "", "", ["VME_HJ12_AT", "VME_HJ12_AP"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["vme_pla_FN6", "", "", "", ["vme_pla_FN6_Rocket"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["vme_pla_PF98", "", "", "VME_PF98_Scope_FCS", ["vme_pla_PF98_AT_Rocket", "vme_pla_PF98_MP_Rocket"], [], ""],
["vme_pla_PF98", "", "", "", ["vme_pla_PF98_AT_Rocket", "vme_pla_PF98_MP_Rocket"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGD5"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["CUP_LRTV"]];

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
_loadoutData set ["slHat", ["VME_PLAAF_RadioHat"]];
_loadoutData set ["sniHats", ["VME_Booniehat_PLAAF_Radio"]];


//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = ["CUP_optic_AN_PVS_10_black"];

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
_sfLoadoutData set ["uniforms", ["PLA_Uniform_PLAFOR", "PLA_Uniform_PLAFOR2"]];
_sfLoadoutData set ["vests", ["PLAFOR_Vest", "PLAFOR_Vest2"]];
_sfLoadoutData set ["backpacks", ["PLA_AssaultPack_Fix", "PLAFOR_FieldPack_Medic"]];
_sfLoadoutData set ["atBackpacks", ["PLAFOR_QLU11_Pack"]];
_sfLoadoutData set ["helmets", ["VME_PLAFOR2_Helmet", "VME_PLAFOR_Helmet"]];
_sfLoadoutData set ["slHat", ["VME_PLARF2_RadioHat"]];
_sfLoadoutData set ["sniHats", ["VME_Booniehat_PLARF2_Radio"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_green"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["vme_pla_qbz03", "VME_QBZ95_1_Silencer", "", "VME_95_1_PST", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qbz03", "VME_QBZ95_1_Silencer", "", "VME_95_1_PNV", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qbz95_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_IR", "VME_Eotech553", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qbz95_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_IR_flashlight", "VME_Eotech_557_Magnifier_DOWN", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["vme_pla_qbz95_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_IR", "VME_Eotech553", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qbz95_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_IR_flashlight", "VME_Eotech_557_Magnifier_DOWN", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qbz03", "VME_QBZ95_1_Silencer", "", "VME_Eotech553", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], "VME_QBZ03_rail"],
    ["vme_pla_qbz95_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_RED_flashlight", "VME_LR4_Scope", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["vme_pla_qbz95B_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_IR_flashlight", "VME_Eotech553", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qbz95B_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_RED_flashlight", "", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["vme_pla_qbz95_1GL", "VME_QBZ95_1_Silencer", "", "VME_Eotech553", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], ["VME_1Rnd_HE_GL", "VME_1Rnd_Smoke_GL", "UGL_FlareWhite_Illumination_F"], ""],
    ["vme_pla_qbz95_1GL", "VME_QBZ95_1_Silencer", "", "VME_Eotech_557_Magnifier_DOWN", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], ["VME_1Rnd_HE_GL", "VME_1Rnd_Smoke_GL", "UGL_FlareWhite_Illumination_F"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["vme_pla_qcw05", "VME_QCW05_Silencer", "", "VME_Eotech553", ["VME_QCW05_50Rnd_DCV05", "VME_QCW05_50Rnd_DAP92"], [], "VME_qcw05_rail_scopes"],
    ["vme_pla_qcw05", "VME_QCW05_Silencer", "", "", ["VME_QCW05_50Rnd_DAP92", "VME_QCW05_50Rnd_DCV05"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["vme_pla_qjb95_1", "VME_QBZ95_1_Silencer", "VME_QBZ95_laser_IR", "VME_QBU88_Scope", ["VME_QJB95_1_75Rnd_DBP87", "VME_QJB95_1_75Rnd_DBP10_Tracer_Green"], [], ""],
    ["VME_PLA_QJY88", "", "", "VME_QJY88_Scope", ["VME_QJY88_200Rnd_DBP10", "VME_QJY88_200Rnd_DVP88_Heavy", "VME_QJY88_200Rnd_DBP10_Tracer_Green", "VME_QJY88_200Rnd_DBP10_Red"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["vme_pla_qbu88", "VME_QBZ95_1_Silencer", "", "VME_QBU88_Scope", ["VME_QBU88_10Rnd_DVP88_Sniper", "VME_QBU88_10Rnd_DBP10_Tracer_Green"], [], "VME_qbu88_bipod"],
    ["vme_pla_LR4", "VME_LR4_Silencer", "", "VME_LR4_Scope", ["VME_LR4_5Rnd_M61_AP", "VME_LR4_5Rnd_M62_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["VME_M99_Base", "VME_M99_Suppressor", "", "VME_LR4_Scope", ["VME_M99_5Rnd_M33_FMJ_Mag", "VME_M99_5Rnd_MK263_AP_Mag", "VME_M99_5Rnd_MK211_HEIAP_Mag"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["vme_pla_PF89B", "", "", "", ["vme_pla_PF89B_Rocket"], [], ""],
    ["vme_pla_PF89A", "", "", "", ["vme_pla_PF89A_Rocket"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["vme_pla_qsz92", "", "", "", ["VME_QSZ92_20Rnd_DAP92"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["PLA_CombatUniform_SBCB", "PLA_CombatUniform_SB"]];
_militaryLoadoutData set ["slUniforms", ["PLA_CombatUniform_SW"]];
_militaryLoadoutData set ["vests", ["PLA_B04_RF", "PLA_T15Vest_RF"]];
_militaryLoadoutData set ["mgVests", ["PLA_B04_MG"]];
_militaryLoadoutData set ["slVests", ["PLA_T15Vest_RD"]];
_militaryLoadoutData set ["backpacks", ["PLA_AssaultPack_Fix", "PLA_AssaultPack_Base"]];
_militaryLoadoutData set ["atBackpacks", ["PLAAF_CarryAll_Base"]];
_militaryLoadoutData set ["helmets", ["VME_PLA_Helmet", "VME_PLA_Helmet_G", "VME_PLA_Helmet_R_O", "VME_PLA_Helmet_R"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["vme_pla_qbz95_1", "", "", "", ["VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], [], ""],
    ["vme_pla_qbz03", "", "", "", ["VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], [], ""],
    ["vme_pla_qbz95_1", "", "", "VME_95_1_PST", ["VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["vme_pla_qbz95_1", "", "", "", ["VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], [], ""],
    ["vme_pla_qbz95B_1", "", "", "", ["VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["vme_pla_qcw05", "", "", "", ["VME_QCW05_50Rnd_DCV05", "VME_QCW05_50Rnd_DAP92"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["vme_pla_qbz95_1GL", "", "", "VME_95_1_PST", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], ["VME_1Rnd_HE_GL", "VME_1Rnd_Smoke_GL"], ""],
     ["vme_pla_qbz95_1GL", "", "", "", ["VME_QBZ95_1_30Rnd_DBP10", "VME_QBZ95_1_30Rnd_DBP87", "VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], ["VME_1Rnd_HE_GL", "VME_1Rnd_Smoke_GL"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["vme_pla_qcw85", "", "", "", ["VME_QCW85_30Rnd_762x25_Subsonic"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["VME_PLA_QJY88", "", "", "VME_QJY88_Scope", ["VME_QJY88_200Rnd_DVP88_Heavy", "VME_QJY88_200Rnd_DBP10_Tracer_Green"], [], ""],
    ["VME_PLA_QJY88", "", "", "", ["VME_QJY88_200Rnd_DVP88_Heavy", "VME_QJY88_200Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qjb95_1", "", "", "VME_QJY88_Scope", ["VME_QJB95_1_75Rnd_DBP10", "VME_QJB95_1_75Rnd_DBP87", "VME_QJB95_1_75Rnd_DBP10_Tracer_Green"], [], ""],
    ["vme_pla_qjb95_1", "", "", "", ["VME_QJB95_1_75Rnd_DBP10", "VME_QJB95_1_75Rnd_DBP87", "VME_QJB95_1_75Rnd_DBP10_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["vme_pla_qbu88", "", "", "VME_QBU88_Scope", ["VME_QBU88_10Rnd_DVP88_Sniper"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["vme_pla_LR4", "", "", "VME_LR4_Scope", ["VME_LR4_5Rnd_M80"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["vme_pla_PF89", "", "", "", ["vme_pla_PF89_Rocket"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["vme_pla_qsw06", "", "", "", ["VME_QSZ92_20Rnd_DAP92"], [], ""],
    ["vme_pla_qsz92", "", "", "", ["VME_QSW06_20Rnd_DCV05"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["PLA_Uniform_PLAN"]];
_policeLoadoutData set ["vests", ["PLAN_Vest"]];
_policeLoadoutData set ["helmets", ["VME_PLAN_RadioHat"]];

_policeLoadoutData set ["SMGs", [
["vme_pla_qcw85", "", "", "", ["VME_QCW85_30Rnd_762x25_Subsonic"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["vme_pla_qsz92", "", "", "", ["VME_QSW06_20Rnd_DCV05"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["PLA_Uniform_PLAFOR"]];
_militiaLoadoutData set ["vests", ["PLAFOR_Vest", "PLAFOR_Vest2"]];
_militiaLoadoutData set ["backpacks", ["PLAAF_FieldPack_Medic", "PLAAF_CarryAll_Base"]];
_militiaLoadoutData set ["atBackpacks", ["PLAFOR_QLU11_Pack"]];
_militiaLoadoutData set ["helmets", ["VME_PLAFOR2_Helmet", "VME_PLAFOR_Helmet", "VME_PLAFOR_Hat", "VME_PLAFOR2_Hat", "VME_PLARF2_RadioHat"]];
_militiaLoadoutData set ["slHat", ["VME_PLAFOR2_Hat"]];
_militiaLoadoutData set ["sniHats", ["VME_Booniehat_PLARF_Radio"]];

_militiaLoadoutData set ["rifles", [
    ["vme_pla_qbz95_1", "", "", "", ["VME_QBZ95_1_30Rnd_DBP10"], [], ""],
    ["vme_pla_qbz95B_1", "", "", "", ["VME_QBZ95_1_30Rnd_DBP10_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["vme_pla_qbz95B_1", "", "", "", ["VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["vme_pla_qbz95_1GL", "", "", "", ["VME_QBZ95_1_30Rnd_DBP10_Tracer_Green"], ["VME_1Rnd_HE_GL", "VME_1Rnd_Smoke_GL"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["vme_pla_qcw85", "", "", "", ["VME_QCW85_30Rnd_762x25_Subsonic"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["vme_pla_qjb95_1", "", "", "", ["VME_QJB95_1_75Rnd_DBP10_Tracer_Green", "VME_QJB95_1_75Rnd_DBP87", "VME_QJB95_1_75Rnd_DBP10"], [], ""],
    ["VME_PLA_QJY88", "", "", "", ["VME_QJY88_200Rnd_DBP10_Red"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["vme_pla_qbu88", "", "", "VME_QBU88_Scope", ["VME_QBU88_10Rnd_DBP10"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["vme_pla_LR4", "", "", "VME_LR4_Scope", ["VME_LR4_5Rnd_M118_Special"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["vme_pla_PF89A", "", "", "", ["vme_pla_PF89A_Rocket"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["vme_pla_qsz92", "", "", "", ["VME_QSW06_20Rnd_DCV05",7], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["PLA_Uniform_PLAFOR"]];
_crewLoadoutData set ["vests", ["V_BandollierB_oli"]];
_crewLoadoutData set ["helmets", ["VME_CREW_Cap"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PLA_Pilot_Green_Coveralls"]];
_pilotLoadoutData set ["vests", ["V_BandollierB_oli"]];
_pilotLoadoutData set ["helmets", ["VME_Pilot_Heli_Helmet", "VME_Pilot_Helmet"]];


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
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
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