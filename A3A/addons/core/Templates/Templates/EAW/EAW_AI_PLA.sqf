//////////////////////////
//   Side Information   //
//////////////////////////

["name", "PLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "PLA Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Flags\ifa_sov.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_SOV"] call _fnc_saveToTemplate;

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general
["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports
["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports
["placeIntel_itemLarge", ["Intel_File2_F",-155,false]] call _fnc_saveToTemplate;


//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["a3a_LIB_Willys_MB_M1919"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["EAW_Dodge1936_Pickup_Military_ROC"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US6_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_Zis6_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_Zis5v_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_Med"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", ["LIB_UniversalCarrier", "LIB_DAK_SdKfz251"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["EAW_T26_NRA", "EAW_T26_NRA", "EAW_Vickers6Ton"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["EAW_ChiHa", "EAW_ChiHa_Kai"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["LIB_T34_76"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["EAW_Daihatsu_LC_IJA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_UK_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["EAW_AVG_P40", "EAW_HawkIII"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["EAW_AVG_P40_AI", "EAW_i16_AI", "EAW_HawkIII_AI"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["LIB_Li2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["LIB_US6_BM13","EAW_NRA_Type99_10cm_Gun_Arty"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_US6_BM13", ["LIB_16Rnd_BM13"]],
["EAW_NRA_Type99_10cm_Gun_Arty", ["EAW_Type91_105mm_Arty_Magazine"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["a3a_LIB_Willys_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["EAW_Dodge1936_Pickup_Military_IJA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["EAW_Dodge1936_Pickup_Military_IJA"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_Kfz1_Hood_sernyt"]] call _fnc_saveToTemplate;

["staticMGs", ["EAW_Type24_MG"]] call _fnc_saveToTemplate;
["staticAT", ["EAW_Type1_47mm_J", "EAW_ROC_Pak36"]] call _fnc_saveToTemplate;
["staticAA", ["EAW_T98_20mm_AA", "EAW_T98_20mm_AA", "EAW_IJA_Type99_88_AA_1941", "LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["EAW_IJA_Type97_Mortar_1941J"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "EAW_Type97_81mm_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;
["mortarMagazineFlare", "EAW_Type97_81mm_Flare"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", []] call _fnc_saveToTemplate;
["minefieldAPERS", []] call _fnc_saveToTemplate;

#include "..\IFA\IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;

"ChineseMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeDischarger", ["EAW_Type89_Discharger"]];
_loadoutData set ["grenadeLaunchers", [
["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", [], ["LIB_1Rnd_G_DYAKONOV"], ""]
]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", [
"LIB_DP28",
["EAW_FN30_Base", "", "", "", [], [], "EAW_FN30_Bipod"],
["EAW_ZB26_Base", "", "", "", [], [], "EAW_ZB26_Bipod"]
]];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", ["LIB_PTRD"]];

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", ["LIB_M1A1_Bazooka"]];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", ["EAW_C96", "LIB_M1895"]];
_loadoutData set ["slSidearms", ["EAW_Dao"]];

_loadoutData set ["ATMines", []];
_loadoutData set ["APMines", []];
_loadoutData set ["lightExplosives", []];
_loadoutData set ["heavyExplosives", []];

_loadoutData set ["antiTankGrenades", ["EAW_Type3_Grenade_Mag", "EAW_Chinese_Grenade_Bundle_Mag"]];
_loadoutData set ["antiInfantryGrenades", ["EAW_Chinese_Grenade_Mag"]];
_loadoutData set ["smokeGrenades", ["LIB_NB39"]];
_loadoutData set ["signalsmokeGrenades", []];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", ["EAW_NanjingBand"]];
_loadoutData set ["binoculars", ["LIB_Binocular_SU"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_SU"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", ["EAW_C96_Vest", "EAW_NRALeatherCan_1", "EAW_Chinese_Bandolier2_Rifle"]];
_loadoutData set ["MGVests", ["EAW_ZB_Bandolier"]];
_loadoutData set ["SMGVests", ["EAW_Chinese_MP28_Kit"]];
_loadoutData set ["MedVests", ["EAW_Chinese_Medic_Bag"]];
_loadoutData set ["GrenVests", ["EAW_Chinese_Bandolier_Rifle_Grenade"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", ["H_LIB_SOV_RA_PrivateCap", "H_LIB_SOV_Ushanka", "H_LIB_SOV_Ushanka2", "H_LIB_SOV_RA_PrivateCap", "H_LIB_SOV_Ushanka", "H_LIB_SOV_Ushanka2", "EAW_SunHat"]];
_loadoutData set ["slHelmets", ["H_LIB_SOV_RA_OfficerCap"]];
_loadoutData set ["sniHelmets", ["EAW_M35_Camo_1"]];

_loadoutData set ["facewear", []];
_loadoutData set ["sniFacewear", ["EAW_CamoVest_2", "EAW_CamoVest_3", "EAW_CamoVest_4", "EAW_CamoVest_5", "EAW_CamoVest_6"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["EAW_Chinese_Uniform_Training_Private"]];
_sfLoadoutData set ["backpacks", ["EAW_Jyuban_GrenadierBag", "EAW_Jyuban_GrenadierBag", "EAW_Jyuban_GrenadierBag", "EAW_Chinese_Backpack_1_Camo", "EAW_Chinese_Backpack_4_Camo"]];
_sfLoadoutData set ["helmets", ["EAW_M35_Camo_1"]];
_sfLoadoutData set ["slHelmets", ["EAW_M35_Camo_1"]];
_sfLoadoutData set ["sniHelmets", ["EAW_M35_Camo_1"]];
_sfLoadoutData set ["facewear", ["EAW_CamoVest_2", "EAW_CamoVest_3", "EAW_CamoVest_4", "EAW_CamoVest_5", "EAW_CamoVest_6"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["LIB_PPSh41_m", "", "", "", [], ["LIB_71Rnd_762x25", "LIB_71Rnd_762x25", "LIB_71Rnd_762x25", "LIB_71Rnd_762x25_t", "LIB_71Rnd_762x25_t2", "LIB_71Rnd_762x25_ap"], ""],
    ["LIB_SVT_40", "", "", "", [], ["LIB_10Rnd_762x54", "LIB_10Rnd_762x54", "LIB_10Rnd_762x54_t46", "LIB_10Rnd_762x54_t30", "LIB_10Rnd_762x54_t462", "LIB_10Rnd_762x54_t302", "LIB_10Rnd_762x54_d", "LIB_10Rnd_762x54_b30"], ""],
    ["a3a_lib_AVT_40", "", "", "", [], ["LIB_10Rnd_762x54", "LIB_10Rnd_762x54", "LIB_10Rnd_762x54_t46", "LIB_10Rnd_762x54_t30", "LIB_10Rnd_762x54_t462", "LIB_10Rnd_762x54_t302", "LIB_10Rnd_762x54_d", "LIB_10Rnd_762x54_b30"], ""],
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], ""],
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], ""],
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], ""]
]];
_sfLoadoutData set ["carbines", [
    ["LIB_SVT_40", "", "", "", [], ["LIB_10Rnd_762x54", "LIB_10Rnd_762x54", "LIB_10Rnd_762x54_t46", "LIB_10Rnd_762x54_t30", "LIB_10Rnd_762x54_t462", "LIB_10Rnd_762x54_t302", "LIB_10Rnd_762x54_d", "LIB_10Rnd_762x54_b30"], ""],
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], ""],
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], ""]
]];
_sfLoadoutData set ["SMGs", [
    "EAW_C96_Auto_Carbine",
    "EAW_C96_Auto_Carbine",
    ["LIB_PPSh41_m", "", "", "", [], ["LIB_71Rnd_762x25", "LIB_71Rnd_762x25", "LIB_71Rnd_762x25", "LIB_71Rnd_762x25_t", "LIB_71Rnd_762x25_t2", "LIB_71Rnd_762x25_ap"], ""],
    ["LIB_PPSh41_m", "", "", "", [], ["LIB_35Rnd_762x25", "LIB_35Rnd_762x25", "LIB_35Rnd_762x25_t", "LIB_35Rnd_762x25_t2", "LIB_35Rnd_762x25_ap"], ""],
    ["LIB_PPSh41_m", "", "", "", [], ["LIB_35Rnd_762x25", "LIB_35Rnd_762x25", "LIB_35Rnd_762x25_t", "LIB_35Rnd_762x25_t2", "LIB_35Rnd_762x25_ap"], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], [], ""],
    ["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46", "LIB_5Rnd_762x54_t30", "LIB_5Rnd_762x54_D", "LIB_5Rnd_762x54_b30"], [], ""],
    ["EAW_Type97_Sniper", "", "", "EAW_Type97_Sniper_Scope", [], [], ""],
    ["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]
]];
_sfLoadoutData set ["slSidearms", ["EAW_C96"]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["EAW_Chinese_Uniform_Training_Private"]];
_militaryLoadoutData set ["backpacks", ["EAW_Chinese_Backpack_1", "EAW_Chinese_Backpack_German", "EAW_Bedroll_Brown", "EAW_Bedroll_Brown"]];

_militaryLoadoutData set ["rifles", [
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t30"], ""],
    ["EAW_Type24_Rifle_Base", "EAW_Type24_Bayonet_Attach", "", "", [], [], ""],
    ["EAW_Hanyang88_Base", "EAW_Hanyang_Bayonet_Attach", "", "", [], [], ""],
    ["EAW_Type38_NoCover", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t46"], ""],
    ["EAW_Type24_Rifle_Base", "EAW_Type24_Bayonet_Attach", "", "", [], [], ""],
    ["EAW_Type38_Carbine_NoCover", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
    "EAW_C96_Carbine"
]];
_militaryLoadoutData set ["SMGs", [
    "EAW_C96_Carbine",
    "EAW_C96_Carbine",
    "EAW_C96_Auto_Carbine",
    "EAW_C96_Auto_Carbine",
    ["LIB_PPSh41_m", "", "", "", [], ["LIB_35Rnd_762x25", "LIB_35Rnd_762x25", "LIB_35Rnd_762x25_t", "LIB_35Rnd_762x25_t2"], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["EAW_Type97_Sniper", "", "", "EAW_Type97_Sniper_Scope", [], [], ""],
    ["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54", "LIB_5Rnd_762x54", "LIB_5Rnd_762x54_t30"], [], ""],
    ["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["EAW_Chinese_Uniform_Training_Private"]];
_policeLoadoutData set ["vests", ["EAW_C96_Vest_Dao"]];

_policeLoadoutData set ["carbines", [
    ["EAW_Type24_Rifle_Base", "EAW_Type24_Bayonet_Attach", "", "", [], [], ""],
    ["EAW_Hanyang88_Base", "EAW_Hanyang_Bayonet_Attach", "", "", [], [], ""],
    "EAW_C96_Carbine"
]];
_policeLoadoutData set ["sidearms", ["EAW_Dao"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["EAW_Chinese_Uniform_Training_Private"]];
_militiaLoadoutData set ["backpacks", ["EAW_Bedroll_Tan"]];
_militiaLoadoutData set ["NVGs", []];


_militiaLoadoutData set ["rifles", [
    ["EAW_Type24_Rifle_Base", "EAW_Type24_Bayonet_Attach", "", "", [], [], ""],
    ["EAW_Hanyang88_Base", "", "", "", [], [], ""],
    "EAW_C96_Carbine"
]];
_militiaLoadoutData set ["carbines", [
    ["EAW_Hanyang88_Base", "EAW_Hanyang_Bayonet_Attach", "", "", [], [], ""],
    "EAW_C96_Carbine"
]];
_militiaLoadoutData set ["grenadeLaunchers", []];
_militiaLoadoutData set ["SMGs", [
    ["EAW_Hanyang88_Base", "", "", "", [], [], ""],
    "EAW_C96_Carbine",
    "EAW_C96_Auto_Carbine"
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["EAW_Type24_Rifle_Base", "", "", "", [], [], ""],
    ["EAW_Hanyang88_Base", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["EAW_Hanyang_Bayonet"]];
_militiaLoadoutData set ["slSidearms", ["EAW_Dao"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_LIB_SOV_Tank_ryadovoi"]];
//_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", ["H_LIB_SOV_TankHelmet"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
//_pilotLoadoutData set ["uniforms", []];
//_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["H_LIB_SOV_PilotHelmet"]];



/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHelmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["SMGVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["SMGs", "rifles"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["slSidearms"] call _fnc_setHandgun;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["MedVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
	[selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    _grenade = [selectRandom ["carbines", "grenadeLaunchers"], selectRandom ["carbines", "rifles"]] call _fnc_fallback;
    [_grenade] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", selectRandom [3,4,5]] call _fnc_addAdditionalMuzzleMagazines;
    
    if (_grenade isNotEqualTo "grenadeLaunchers") then {
        ["grenadeDischarger"] call _fnc_setLauncher;
        ["launcher", 2] call _fnc_addMagazines;
    };


    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 3] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", round(random 2.2)] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    call selectRandom[_latTemplate, _atTemplate, _grenadierTemplate];
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["MGVests"] call _fnc_setVest;
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

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHelmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHelmets"] call _fnc_setHelmet;
    ["sniFacewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["marksmanRifles", "marksmanRifles", "sniperRifles"]] call _fnc_setPrimary;
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
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
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
    ["SquadLeader", _squadLeaderTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Rifleman", _riflemanTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Medic", _medicTemplate, [["medic", true]], nil, "B_soldier_Melee_Hybrid"],
    ["Engineer", _engineerTemplate, [["engineer", true]], nil, "B_soldier_Melee_Hybrid"],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], nil, "B_soldier_Melee_Hybrid"],
    ["Grenadier", _grenadierTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["LAT", _latTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["AT", _atTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["AA", _aaTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["MachineGunner", _machineGunnerTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Marksman", _marksmanTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Sniper", _sniperTemplate, nil, nil, "B_soldier_Melee_Hybrid"]
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
    ["SquadLeader", _squadLeaderTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Rifleman", _riflemanTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Medic", _medicTemplate, [["medic", true]], nil, "B_soldier_Melee_Hybrid"],
    ["Engineer", _engineerTemplate, [["engineer", true]], nil, "B_soldier_Melee_Hybrid"],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], nil, "B_soldier_Melee_Hybrid"],
    ["Grenadier", _grenadierTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["LAT", _latTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["AT", _atTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["AA", _aaTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["MachineGunner", _machineGunnerTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Marksman", _marksmanTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Sniper", _sniperTemplate, nil, nil, "B_soldier_Melee_Hybrid"]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Standard", _policeTemplate, nil, nil, "B_soldier_Melee_Hybrid"]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Rifleman", _riflemanTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Medic", _medicTemplate, [["medic", true]], nil, "B_soldier_Melee_Hybrid"],
    ["Engineer", _engineerTemplate, [["engineer", true]], nil, "B_soldier_Melee_Hybrid"],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], nil, "B_soldier_Melee_Hybrid"],
    ["Grenadier", _grenadierTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["LAT", _latTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["AT", _atTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["AA", _aaTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["MachineGunner", _machineGunnerTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Marksman", _marksmanTemplate, nil, nil, "B_soldier_Melee_Hybrid"],
    ["Sniper", _sniperTemplate, nil, nil, "B_soldier_Melee_Hybrid"]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData, nil, nil, "B_soldier_Melee_Hybrid"] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData, nil, nil, "B_soldier_Melee_Hybrid"] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData, nil, nil, "B_soldier_Melee_Hybrid"] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData, nil, nil, "B_soldier_Melee_Hybrid"] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData, nil, nil, "B_soldier_Melee_Hybrid"] call _fnc_generateAndSaveUnitsToTemplate;
