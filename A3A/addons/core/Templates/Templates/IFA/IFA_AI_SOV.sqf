//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Soviet"] call _fnc_saveToTemplate;
["spawnMarkerName", "Soviet Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Flags\ifa_sov.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_SOV"] call _fnc_saveToTemplate;

["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports
["attributeLowAir", true] call _fnc_saveToTemplate;
["placeIntel_itemLarge", ["Land_Document_01_F",-155,false]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "LIB_WeaponsBox_Big_SU"] call _fnc_saveToTemplate;
["surrenderCrate", "LIB_Lone_Big_Box"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "WW2_Cle_Container"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["LIB_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Willys_MB", "LIB_Willys_MB"]] call _fnc_saveToTemplate;
private _vehiclesLightArmed = ["LIB_Scout_M3_FFV", "LIB_Scout_M3_FFV"];
["vehiclesTrucks", ["LIB_US6_Open","LIB_US6_Tent_Cargo"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US6_Open_Cargo","LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US6_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_Zis6_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_Zis5v_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_Med"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["LIB_SOV_M3_Halftrack", "LIB_SOV_M3_Halftrack", "LIB_SdKfz251_captured_FFV"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", ["LIB_T34_76", "LIB_SU85"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
private _vehiclesLightTanks = ["LIB_T34_76"];
["vehiclesTanks", ["LIB_T34_76", "LIB_T34_76", "LIB_T34_85", "LIB_SU85"]] call _fnc_saveToTemplate;
private _vehiclesHeavyTanks = ["LIB_JS2_43"];

["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["LIB_Pe2","LIB_P39"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["LIB_P39","LIB_RA_P39_2","LIB_RA_P39_3"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["LIB_Li2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["LIB_leFH18"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_leFH18", ["LIB_20x_Shell_105L28_Gr39HlC_HE"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["a3a_LIB_Willys_MB_M1919", "a3a_LIB_Willys_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Willys_MB_Hood","LIB_Willys_MB_Hood"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesLightArmed append ["FA_BA10M", "FA_BA64"];
};
if (isClass (configFile >> "CfgPatches" >> "BT_BT7_M1937_c")) then {
    _vehiclesLightTanks append ["SOV_BT_BT7_M1937", "SOV_BT_BT7A", "SOV_BT_BT7TU_M1937"];
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesLightTanks append ["FA_T26", "FA_T26"];
    _vehiclesHeavyTanks append ["FA_KV1","FA_KV1"];
};

["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", _vehiclesHeavyTanks] call _fnc_saveToTemplate;

//["staticMGs", ["LIB_Maxim_M30_base"]] call _fnc_saveToTemplate;
["staticMGs", ["a3a_hmg_02_high"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Zis3"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_BM37"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_82mmHE_BM37"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["LIB_TM44_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_pomzec_MINE","LIB_PMD6_MINE"]] call _fnc_saveToTemplate;

#include "IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_02","AsianHead_A3_04","AsianHead_A3_07","LivonianHead_1","LivonianHead_10",
"LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_8","LivonianHead_9",
"RussianHead_3","RussianHead_4","RussianHead_5","WhiteHead_01","WhiteHead_02",
"WhiteHead_04","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_18","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
//SpecialForces, Militia, Police Faces and Voices, these are Optional if there is no reason to Include them, leave them out.
["milVoices", ["Male01pol","Male02pol","Male03pol"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", [
["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54_t46"],[],  ""],
["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54_t30"],[],  ""],
["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54_D"],	[],  ""],
["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54","LIB_5Rnd_762x54","LIB_5Rnd_762x54_b30"],[],  ""]
]];

_loadoutData set ["ATRifle", ["LIB_PTRD"]];
_loadoutData set ["lightATLaunchers", ["LIB_Faustpatrone","LIB_PzFaust_30m", "LIB_PzFaust_30m", "LIB_PzFaust_60m"]];
_loadoutData set ["ATLaunchers", ["LIB_M1A1_Bazooka", "LIB_M1A1_Bazooka", "LIB_RPzB"]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];
_loadoutData set ["slSidearms", []];

_loadoutData set ["ATMines", ["LIB_TM44_MINE_mag"]];
_loadoutData set ["APMines", ["LIB_PMD6_MINE_mag","LIB_pomzec_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag", "LIB_US_TNT_4pound_mag"]];

_loadoutData set ["antiTankGrenades", ["LIB_Rpg6"]];
_loadoutData set ["antiInfantryGrenades", ["LIB_F1", "LIB_Rg42"]];
_loadoutData set ["smokeGrenades", ["LIB_RDG"]];
_loadoutData set ["signalsmokeGrenades", ["LIB_RDG"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_SU"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_SU"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["engBackpacks", ["B_LIB_SOV_RA_Rucksack2_Gas_Kit_Shinel"]];
_loadoutData set ["medBackpacks", ["B_LIB_SOV_RA_MedicalBag_Empty"]];
_loadoutData set ["lightBackpacks", ["B_LIB_SOV_RA_GasBag"]];
_loadoutData set ["atBackpacks", ["B_LIB_US_RocketBag_Empty"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHelmets", []];

_loadoutData set ["facewear", []];

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
_sfLoadoutData set ["uniforms", ["U_LIB_SOV_Razvedchik_lis"]];
_sfLoadoutData set ["vests", ["V_LIB_SOV_IShBrVestPPShDisc", "V_LIB_SOV_RA_SVTBelt"]];
_sfLoadoutData set ["mgVests", ["V_LIB_SOV_IShBrVestMG"]];
_sfLoadoutData set ["slVests", ["V_LIB_SOV_IShBrVestPPShDisc", "V_LIB_SOV_IShBrVestPPShMag", "V_LIB_SOV_RA_SVTBelt"]];
_sfLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack2_Gas_Kit_Shinel"]];
_sfLoadoutData set ["atBackpacks", ["B_LIB_US_Backpack_RocketBag_Empty"]];
_sfLoadoutData set ["helmets", ["H_LIB_SOV_RA_Helmet"]];
_sfLoadoutData set ["slHelmets", ["H_LIB_SOV_RA_Helmet"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slWeapons", [
"LIB_SVT_40",
"a3a_lib_AVT_40", 
["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]
]];
_sfLoadoutData set ["rifles", ["LIB_SVT_40"]];
_sfLoadoutData set ["carbines", [
"a3a_lib_AVT_40", 
["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", [], ["LIB_1Rnd_G_DYAKONOV"], ""]
]];
_sfLoadoutData set ["SMGs", [
["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
"LIB_DT", "LIB_DT_OPTIC", 
["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_sfLoadoutData set ["sidearms", ["LIB_TT33"]];
_sfLoadoutData set ["slSidearms", ["LIB_TT33", "LIB_TT33", "LIB_FLARE_PISTOL"]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok_summer"]];
_militaryLoadoutData set ["vests", ["V_LIB_SOV_RA_SVTBelt", "V_LIB_SOV_RA_PPShBelt_Mag"]];
_militaryLoadoutData set ["mgVests", ["V_LIB_SOV_RA_MGBelt_Kit"]];
_militaryLoadoutData set ["slVests", ["V_LIB_SOV_RA_OfficerVest"]];
_militaryLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Shinel", "B_LIB_SOV_RA_Rucksack", "B_LIB_SOV_RA_Rucksack2_Gas_Kit_Shinel"]];
_militaryLoadoutData set ["helmets", ["H_LIB_SOV_RA_PrivateCap", "H_LIB_SOV_RA_PrivateCap", "H_LIB_SOV_RA_Helmet"]];
_militaryLoadoutData set ["slHelmets", ["H_LIB_SOV_RA_OfficerCap", "H_LIB_SOV_RA_Helmet"]];
_militaryLoadoutData set ["radios", ["ItemRadio"]];

_militaryLoadoutData set ["slWeapons", [
["LIB_PPSh41_m", "", "", "", ["LIB_71Rnd_762x25", "LIB_35Rnd_762x25", "LIB_35Rnd_762x25", "LIB_35Rnd_762x25", "LIB_35Rnd_762x25"], [], ""],
"LIB_PPSh41_m", "LIB_M9130", "LIB_SVT_40"]];
_militaryLoadoutData set ["rifles", [
["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], [], ""]
]];
_militaryLoadoutData set ["carbines", ["LIB_M9130", "LIB_M44"]];
_militaryLoadoutData set ["grenadeLaunchers", [
["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", [], ["LIB_1Rnd_G_DYAKONOV"], ""]
]];
_militaryLoadoutData set ["SMGs", ["LIB_PPSh41_m"]];
_militaryLoadoutData set ["machineGuns", ["LIB_DP28"]];
_militaryLoadoutData set ["sidearms", ["LIB_M1895", "LIB_TT33"]];
_militaryLoadoutData set ["slSidearms", ["LIB_M1895", "LIB_TT33", "LIB_FLARE_PISTOL"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_LIB_NKVD_Strelok", "U_LIB_NKVD_Efreitor"]];
_policeLoadoutData set ["slUniforms", ["U_LIB_NKVD_Leutenant"]];
_policeLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt"]];
_policeLoadoutData set ["helmets", ["H_LIB_NKVD_PrivateCap", "H_LIB_NKVD_OfficerCap"]];
_policeLoadoutData set ["slHelmets", ["H_LIB_NKVD_OfficerCap"]];
_policeLoadoutData set ["sidearms", ["LIB_M1895"]];

_policeLoadoutData set ["rifles", [
["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], [], ""], "LIB_M44"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok"]];
_militiaLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt"]];
_militiaLoadoutData set ["mgVests", ["V_LIB_SOV_RA_MGBelt"]];
_militiaLoadoutData set ["slVests", ["V_LIB_SOV_RA_TankOfficerSet"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_SOV_RA_MGAmmoBag_Empty", "B_LIB_SOV_RA_GasBag"]];
_militiaLoadoutData set ["helmets", ["H_LIB_SOV_RA_PrivateCap"]];
_militiaLoadoutData set ["slHelmets", ["H_LIB_SOV_RA_OfficerCap"]];

_militiaLoadoutData set ["ATLaunchers", []];
_militiaLoadoutData set ["lightATLaunchers", ["LIB_Faustpatrone"]];

_militiaLoadoutData set ["rifles", [
["LIB_M9130", "LIB_ACC_M1891_Bayo", "", "", [], [], ""]
]];
_militiaLoadoutData set ["carbines", ["LIB_M38"]];
_militiaLoadoutData set ["SMGs", ["LIB_M38"]];

_militiaLoadoutData set ["sidearms", ["LIB_M1895"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_LIB_SOV_Tank_ryadovoi"]];
_crewLoadoutData set ["vests", ["V_LIB_SOV_RA_Belt"]];
_crewLoadoutData set ["helmets", ["H_LIB_SOV_TankHelmet"]];

_crewLoadoutData set ["machineGuns", [
"LIB_DT", "LIB_DT_OPTIC", 
["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_SOV_Pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_SOV_RA_Belt"]];
_pilotLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Paradrop"]];
_pilotLoadoutData set ["helmets", ["H_LIB_SOV_PilotHelmet"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_LIB_SOV_Kapitan_summer"]];
_officerLoadoutData set ["vests", ["V_LIB_SOV_RA_OfficerVest"]];
_officerLoadoutData set ["slHelmets", ["H_LIB_SOV_RA_OfficerCap"]];

_officerLoadoutData set ["slWeapons", ["LIB_PPSh41_m"]];

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
    ["slVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slWeapons", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["slSidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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

    ["lightBackpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["medBackpacks"] call _fnc_setBackpack;
    
    [["SMGs", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [["grenadeLaunchers", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", selectRandom [3,4,5,6]] call _fnc_addAdditionalMuzzleMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["engBackpacks"] call _fnc_setBackpack;

    [[selectRandom ["SMGs", "carbines"], "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["engBackpacks"] call _fnc_setBackpack;

    [selectRandom["SMGs", "carbines"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

	private _type = selectRandomWeighted ["light", 3,"rifle", 2,"grenade", 1];

    switch(_type) do {
        case "light":
        {
            ["rifles"] call _fnc_setPrimary;
            ["lightBackpacks"] call _fnc_setBackpack;

            ["primary", 5] call _fnc_addMagazines;
            ["lightATLaunchers"] call _fnc_setLauncher;

            ["launcher", 1] call _fnc_addMagazines;
            ["antiTankGrenades", 2] call _fnc_addItem;
        };
        case "rifle":
        {
            ["lightBackpacks"] call _fnc_setBackpack;

            ["ATRifle"] call _fnc_setPrimary;
            ["primary",  round (random [5, 7, 10])] call _fnc_addMagazines;

            ["sidearms"] call _fnc_setHandgun;
            ["handgun", 5] call _fnc_addMagazines;
        };
        case "grenade":
        {
            ["lightBackpacks"] call _fnc_setBackpack;

            ["rifles"] call _fnc_setPrimary;
            ["primary", 5] call _fnc_addMagazines;
            ["antiTankGrenades", 4] call _fnc_addItem;
        };
    };

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
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

    [[selectRandom ["SMGs", "carbines"], "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    private _launch = ["ATLaunchers", "lightATLaunchers"] call _fnc_fallback;
    
    if (_launch == "ATLaunchers") then {
        ["atBackpacks"] call _fnc_setBackpack;
    };
    
    [_launch] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    call (selectRandom [_latTemplate, _atTemplate]);
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["mgVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [["machineGuns", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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

private _marksmanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    
    ["lightBackpacks"] call _fnc_setBackpack;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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
    call _marksmanTemplate;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;
    
    ["vests"] call _fnc_setVest;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};
private _policeSLTemplate = {
    call _policeTemplate;
    if(random 10 > 6) then 
    {
        ["slHelmets"] call _fnc_setHelmet;
        ["slUniforms"] call _fnc_setUniform;
    };
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    
    ["lightBackpacks"] call _fnc_setBackpack;

    if(random 10 > 5) then 
    {
        [selectRandom ["SMGs", "carbines"]] call _fnc_setPrimary;
		if(random 10 > 8) then 
		{
			["machineGuns"] call _fnc_setPrimary;
		};
        ["primary", 2] call _fnc_addMagazines;
    };

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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
private _pilotTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["backpacks"] call _fnc_setBackpack;
    ["uniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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
    ["SquadLeader", _policeSLTemplate],
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
["other", [["Pilot", _pilotTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
