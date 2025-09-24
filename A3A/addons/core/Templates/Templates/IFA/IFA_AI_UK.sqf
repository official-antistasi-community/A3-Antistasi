//////////////////////////
//   Side Information   //
//////////////////////////

["name", "UK"] call _fnc_saveToTemplate;
["spawnMarkerName", "UK Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports
["attributeLowAir", true] call _fnc_saveToTemplate;
["placeIntel_itemLarge", ["Land_Document_01_F",-155,false]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "LIB_WeaponsBox_Big_SU"] call _fnc_saveToTemplate;
["surrenderCrate", "LIB_BasicAmmunitionBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "WW2_Cle_Container"] call _fnc_saveToTemplate;

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["LIB_US_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_US_Willys_MB", "LIB_US_Willys_MB_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["LIB_US_Willys_MB_M1919", "LIB_US_Willys_MB_M1919", "LIB_US_Scout_M3_FFV"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["LIB_US_GMC_Tent","LIB_US_GMC_Open","LIB_UniversalCarrier"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US_GMC_Tent","LIB_US_GMC_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US_GMC_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_US_GMC_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_US_GMC_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_US_GMC_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_US_M3_Halftrack", "LIB_US_M3_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["LIB_Cromwell_Mk4","LIB_Churchill_Mk7_Howitzer", "LIB_Churchill_Mk7_AVRE"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers

private _vehiclesLightTanks = ["LIB_M8_Greyhound", "LIB_M3A3_Stuart","LIB_M5A1_Stuart"];        //There's an argument to be made to put the Greyhound in lightArmed too, leaving it here for the moment though
private _vehiclesTanks = ["LIB_M4A4_FIREFLY","LIB_Cromwell_Mk4","LIB_Cromwell_Mk4","LIB_Cromwell_Mk4"];
private _vehiclesHeavyTanks = ["LIB_Churchill_Mk7","LIB_Churchill_Mk7_Crocodile"];

["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_UK_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["LIB_RAF_P39"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["LIB_RAF_P39"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["LIB_C47_RAF"]] call _fnc_saveToTemplate;

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
//These intentionally appear again above among the regular 'military' vehile, to inject some british (militia) troops into the mix
["vehiclesMilitiaLightArmed", ["LIB_UK_Willys_MB_M1919", "LIB_UK_Willys_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_US_NAC_GMC_Tent", "LIB_US_NAC_GMC_Tent","LIB_US_NAC_GMC_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_UK_Willys_MB","LIB_UK_Willys_MB"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_UK_Willys_MB_Hood"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesLightTanks append ["FA_T17E1", "FA_DaimlerMk2", "FA_DaimlerMk2"];               //There's an argument to be made to put these in lightArmed too, leaving them here for the moment though
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesTanks append ["FA_ValentineMk3","FA_ValentineMk3"];
};
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", _vehiclesHeavyTanks] call _fnc_saveToTemplate;

//["staticMGs", ["LIB_M1919_M2"]] call _fnc_saveToTemplate;
["staticMGs", ["a3a_hmg_02_high"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Pak40_g"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_GrWr34_g"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_81mmHE_GRWR34"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_81mm_GRWR34_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["LIB_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_US_M3_MINE"]] call _fnc_saveToTemplate;

#include "IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["voices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;
["faces", [
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
"EnglishMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", [
["LIB_LeeEnfield_No4_CUP", "LIB_ACC_GL_Enfield_CUP_Empty", "", "", [], ["LIB_1Rnd_G_MillsBomb"], ""]
]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", ["LIB_Bren_Mk2"]];
_loadoutData set ["marksmanRifles", [
["LIB_LeeEnfield_No4_Scoped", "", "", "", [], [], ""],
["LIB_LeeEnfield_No4_Scoped", "", "", "", [], [], ""],
["LIB_LeeEnfield_No4_Scoped", "", "", "", ["LIB_10Rnd_770x56_MkVIII"], [], ""]
]];

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", ["LIB_PIAT"]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", ["LIB_Colt_M1911", "LIB_Webley_mk6", "LIB_Webley_mk6"]];
_loadoutData set ["slSidearms", ["LIB_Colt_M1911", "LIB_Webley_mk6", "LIB_Webley_Flare"]];

_loadoutData set ["ATMines", ["LIB_US_M1A1_ATMINE_mag"]];
_loadoutData set ["APMines", ["LIB_M3_MINE_mag","LIB_US_M3_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag", "LIB_US_TNT_4pound_mag"]];

_loadoutData set ["antiTankGrenades", ["LIB_No82"]];
_loadoutData set ["antiInfantryGrenades", ["LIB_MillsBomb"]];
_loadoutData set ["smokeGrenades", ["LIB_No77", "LIB_No77", "LIB_US_M18"]];
_loadoutData set ["signalsmokeGrenades", ["LIB_US_M18_Green","LIB_US_M18_Red","LIB_US_M18_Yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_UK"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_UK"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["engUniforms", []];
_loadoutData set ["medUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["slVests", ["V_LIB_UK_P37_Holster"]];

_loadoutData set ["backpacks", ["B_LIB_UK_HSack_Blanco", "B_LIB_UK_HSack_Blanco_Tea", "B_LIB_UK_HSack_Blanco_Cape"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHelmets", ["H_LIB_UK_Beret"]];

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
_sfLoadoutData set ["uniforms", ["U_LIB_UK_DenisonSmock"]];
_sfLoadoutData set ["engUniforms", ["U_LIB_UK_DenisonSmock"]];
_sfLoadoutData set ["vests", ["V_LIB_UK_P37_Heavy_Blanco","V_LIB_UK_P37_Sten_Blanco"]];
_sfLoadoutData set ["slVests", ["V_LIB_UK_P37_Heavy_Blanco","V_LIB_UK_P37_Sten_Blanco"]];
_sfLoadoutData set ["helmets", ["H_LIB_UK_Para_Helmet_Mk2","H_LIB_UK_Para_Helmet_Mk2_Camo","H_LIB_UK_Para_Helmet_Mk2_Net"]];
_sfLoadoutData set ["slHelmets", ["H_LIB_UK_Balmoral", "H_LIB_UK_Para_Beret"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slWeapons", [
"LIB_M1A1_Carbine",
"a3a_lib_M2_Carbine",
"LIB_M1928_Thompson", 
"LIB_M1928_Thompson", 
["LIB_M1928_Thompson", "", "", "", ["LIB_50Rnd_45ACP", "LIB_30Rnd_45ACP"], [], ""]
]];
_sfLoadoutData set ["rifles", [
"LIB_M1A1_Carbine",
"a3a_lib_M2_Carbine"
]];
_sfLoadoutData set ["carbines", [
"LIB_M1A1_Carbine", 
"LIB_M1A1_Carbine",
"a3a_lib_M2_Carbine"
]];
_sfLoadoutData set ["SMGs", [
"LIB_M1928_Thompson", 
"LIB_M1928_Thompson", 
["LIB_M1928_Thompson", "", "", "", ["LIB_50Rnd_45ACP", "LIB_30Rnd_45ACP"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_LIB_UK_P37", "U_LIB_UK_P37Jerkins"]];
_militaryLoadoutData set ["engUniforms", ["U_LIB_UK_P37_Corporal", "U_LIB_UK_P37Jerkins_Corporal"]];
_militaryLoadoutData set ["vests", ["V_LIB_UK_P37_Rifleman_Blanco","V_LIB_UK_P37_Gasmask_Blanco"]];
_militaryLoadoutData set ["medVests", ["V_LIB_UK_P37_Gasmask", "V_LIB_UK_P37_Heavy"]];
_militaryLoadoutData set ["slVests", ["V_LIB_UK_P37_Holster_Blanco", "V_LIB_UK_P37_Officer_Blanco", "V_LIB_UK_P37_Sten_Blanco"]];

_militaryLoadoutData set ["helmets", ["H_LIB_UK_Helmet_Mk3","H_LIB_UK_Helmet_Mk3_Camo","H_LIB_UK_Helmet_Mk3_Net"]];

_militaryLoadoutData set ["slWeapons", [
"LIB_M1_Carbine", "LIB_M1928A1_Thompson", 
"LIB_Sten_Mk5",
["LIB_Sten_Mk5", "LIB_ACC_No4_Mk2_Bayo", "", "", [], [], ""]
]];
_militaryLoadoutData set ["rifles", [
"LIB_LeeEnfield_No4",
["LIB_LeeEnfield_No4", "LIB_ACC_No4_Mk2_Bayo", "", "", [], [], ""]
]];
_militaryLoadoutData set ["carbines", ["LIB_M1_Carbine","LIB_Sten_Mk2"]];
_militaryLoadoutData set ["SMGs", ["LIB_M1928A1_Thompson","LIB_Sten_Mk2","LIB_Sten_Mk2"]];

_militaryLoadoutData set ["sidearms", ["LIB_Webley_mk6"]];
_militaryLoadoutData set ["slSidearms", ["LIB_Colt_M1911", "LIB_Webley_mk6", "LIB_Webley_Flare"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_LIB_UK_P37", "U_LIB_UK_P37Jerkins"]];
_militiaLoadoutData set ["engUniforms", ["U_LIB_UK_P37_Corporal", "U_LIB_UK_P37Jerkins_Corporal"]];
_militiaLoadoutData set ["vests", ["V_LIB_UK_P37_Rifleman_Blanco"]];
_militiaLoadoutData set ["helmets", ["H_LIB_UK_Helmet_Mk2"]];
_militiaLoadoutData set ["slHelmets", ["H_LIB_UK_Helmet_Mk2_Beachgroup"]];

_militiaLoadoutData set ["slWeapons", ["LIB_Sten_Mk2"]];
_militiaLoadoutData set ["rifles", [
"LIB_LeeEnfield_No1",
["LIB_LeeEnfield_No1", "LIB_ACC_P1903_Bayo", "", "", [], [], ""]
//["LIB_LeeEnfield_No1", "LIB_ACC_P1903_Bayo", "", "", [], [], ""] //Moving to desert templates
]];
_militiaLoadoutData set ["carbines", ["LIB_LeeEnfield_No1","LIB_LeeEnfield_No1"]];
_militiaLoadoutData set ["grenadeLaunchers", [
"LIB_LeeEnfield_No1",
["LIB_LeeEnfield_No1_CUP", "LIB_ACC_GL_Enfield_CUP_Empty", "", "", [], ["LIB_1Rnd_G_MillsBomb"], ""]
]];
_militiaLoadoutData set ["SMGs", ["LIB_LeeEnfield_No1","LIB_Sten_Mk2"]];
_militiaLoadoutData set ["machineGuns", ["LIB_Sten_Mk2","LIB_M1918A2_BAR"]];
_militiaLoadoutData set ["marksmanRifles", ["LIB_LeeEnfield_No4","LIB_LeeEnfield_No4_Scoped"]];

_militiaLoadoutData set ["sidearms", ["LIB_Webley_mk6"]];
_militiaLoadoutData set ["slSidearms", ["LIB_Webley_mk6", "LIB_Webley_mk6", "LIB_Webley_Flare"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_LIB_UK_P37_Sergeant", "U_LIB_UK_P37"]];
_crewLoadoutData set ["vests", ["V_LIB_UK_P37_Crew"]];
_crewLoadoutData set ["helmets", ["H_LIB_UK_Beret_Tankist", "H_LIB_UK_Beret_Headset"]];

_crewLoadoutData set ["SMGs", ["LIB_Sten_Mk2"]];
_crewLoadoutData set ["sidearms", ["LIB_Colt_M1911", "LIB_Webley_mk6"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_US_Pilot", "U_LIB_US_Pilot_2"]];
_pilotLoadoutData set ["vests", ["V_LIB_US_LifeVest"]];
_pilotLoadoutData set ["backpacks", ["B_LIB_US_TypeA3"]];
_pilotLoadoutData set ["helmets", ["H_LIB_US_Helmet_Pilot"]];

_pilotLoadoutData set ["sidearms", ["LIB_Colt_M1911"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_LIB_US_Pilot"]];
_officerLoadoutData set ["vests", ["V_LIB_UK_P37_Officer_Blanco"]];
_officerLoadoutData set ["slHelmets", ["H_LIB_UK_Pilot_Cap"]];
_officerLoadoutData set ["backpacks", []];

_officerLoadoutData set ["slWeapons", ["LIB_Sten_Mk2", "LIB_Sten_Mk5"]];
_officerLoadoutData set ["slSidearms", ["LIB_Colt_M1911", "LIB_Webley_mk6"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    [["slHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
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
    [["medHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["medUniforms", "engUniforms"] call _fnc_fallback] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    
    [[selectRandom ["SMGs", "carbines"], "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["primary", selectRandom [3,4,5]] call _fnc_addAdditionalMuzzleMagazines;

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
    ["engUniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["engUniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    if(random 10 > 5) then 
    {
        ["ATLaunchers"] call _fnc_setLauncher;
        ["backpacks"] call _fnc_setBackpack;
        ["launcher", 1] call _fnc_addMagazines;
        ["antiInfantryGrenades", 1] call _fnc_addItem;
    } else {
        ["antiTankGrenades", 4] call _fnc_addItem;
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

    ["backpacks"] call _fnc_setBackpack;
    
    ["ATLaunchers"] call _fnc_setLauncher;
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
    ["vests"] call _fnc_setVest;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

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

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if(random 10 > 5) then 
    {
        [selectRandom ["SMGs", "carbines"]] call _fnc_setPrimary;
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
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

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
