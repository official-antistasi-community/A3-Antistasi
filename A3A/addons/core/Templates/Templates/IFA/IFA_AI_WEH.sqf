//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Wehrmacht"] call _fnc_saveToTemplate;
["spawnMarkerName", "Wehrmacht Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Flags\ifa_weh.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_WEH"] call _fnc_saveToTemplate;

["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports
["attributeLowAir", true] call _fnc_saveToTemplate;
["placeIntel_itemLarge", ["Land_Document_01_F",-155,false]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "LIB_WeaponsBox_Big_SU"] call _fnc_saveToTemplate;
["surrenderCrate", "LIB_BasicWeaponsBox_GER"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "WW2_Cle_Container"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["LIB_Kfz1_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1", "LIB_Kfz1_Hood"]] call _fnc_saveToTemplate;
private _vehiclesLightArmed = ["LIB_Kfz1_MG42", "LIB_Kfz1_MG42"];             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["LIB_OpelBlitz_Open_Y_Camo","LIB_OpelBlitz_Tent_Y_Camo","LIB_SdKfz_7"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_OpelBlitz_Open_Y_Camo","LIB_SdKfz_7"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_SdKfz_7_Ammo","LIB_OpelBlitz_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_OpelBlitz_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_OpelBlitz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_OpelBlitz_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_SdKfz251","LIB_SdKfz251_FFV"]] call _fnc_saveToTemplate;
_vehiclesIFVs = ["LIB_StuG_III_G_WS","a3a_lib_PzKpfwIV_noShield"];

private _vehiclesLightTanks = ["a3a_lib_PzKpfwIV_noShield"];
["vehiclesTanks", ["LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_PzKpfwIV_H","LIB_PzKpfwIV_H","LIB_PzKpfwV","a3a_lib_PzKpfwIV_noShield"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["LIB_PzKpfwVI_E","LIB_PzKpfwVI_E_1","LIB_PzKpfwVI_B"]] call _fnc_saveToTemplate;

["vehiclesAA", ["LIB_FlakPanzerIV_Wirbelwind", "LIB_FlakPanzerIV_Wirbelwind", "LIB_SdKfz_7_AA"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["LIB_Ju87","LIB_FW190F8_2"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["LIB_FW190F8","LIB_FW190F8_2"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["LIB_C47_RAF"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["LIB_FlaK_36_ARTY","LIB_leFH18","LIB_SdKfz124"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_FlaK_36_ARTY", ["LIB_45x_SprGr_KwK36_HE"]],
["LIB_leFH18", ["LIB_20x_Shell_105L28_Gr39HlC_HE"]],
["LIB_SdKfz124", ["LIB_20x_Shell_105L28_Gr39HlC_HE"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["LIB_Kfz1_MG42_camo", "LIB_Kfz1_MG42_camo"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_OpelBlitz_Open_G_Camo"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Kfz1_camo","LIB_Kfz1_Hood_camo"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_Kfz1_Hood_sernyt","LIB_Kfz1_sernyt"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesLightArmed append ["FA_BA64_Captured"];
    _vehiclesIFVs append ["FA_Sdkfz231", "FA_Sdkfz234", "FA_Sdkfz234_4", "FA_Sdkfz231"];
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesLightTanks = ["FA_Panzer2", "FA_Panzer2", "FA_Pz38t", "FA_Pz38t", "FA_Pz38t"];
};
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesIFVs", _vehiclesIFVs] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;

//["staticMGs", ["LIB_MG42_Lafette_Deployed","LIB_MG34_Lafette_Deployed","LIB_MG42_Lafette_low_Deployed","LIB_MG34_Lafette_low_Deployed"]] call _fnc_saveToTemplate;
["staticMGs", ["a3a_hmg_02_high"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Pak40"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_FlaK_36_AA","LIB_FlaK_38","LIB_FlaK_38","LIB_FlaK_38","LIB_FlaK_38","LIB_Flakvierling_38","LIB_Flakvierling_38"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_GrWr34","LIB_GrWr34_g"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_81mmHE_GRWR34"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_81mm_GRWR34_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["LIB_TMI_42_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_SMI_35_1_MINE","LIB_SMI_35_MINE", "LIB_shumine_42_MINE"]] call _fnc_saveToTemplate;

#include "IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["male01ger", "male02ger", "male03ger", "male04ger", "male05ger", "male06ger"]] call _fnc_saveToTemplate;
"LIB_GermanMen" call _fnc_saveNames;

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
["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57_SMK"], [], ""],
["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57_sS"], [], ""],
["LIB_K98ZF39", "", "", "", ["LIB_5Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]
]];

_loadoutData set ["lightATLaunchers", ["LIB_PzFaust_30m", "LIB_PzFaust_60m"]];
_loadoutData set ["ATLaunchers", ["LIB_RPzB"]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", ["LIB_P38"]];
_loadoutData set ["slSidearms", ["LIB_P08", "LIB_M1896", "LIB_FLARE_PISTOL"]];

_loadoutData set ["ATMines", ["LIB_TMI_42_MINE_mag"]];
_loadoutData set ["APMines", ["LIB_shumine_42_MINE_mag","LIB_SMI_35_MINE_mag","LIB_SMI_35_1_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag", "LIB_US_TNT_4pound_mag"]];

_loadoutData set ["antiTankGrenades", ["LIB_Shg24x7", "LIB_Pwm"]];
_loadoutData set ["antiInfantryGrenades", ["LIB_Shg24", "LIB_Shg24", "LIB_M39"]];
_loadoutData set ["smokeGrenades", ["LIB_NB39"]];
_loadoutData set ["signalsmokeGrenades", ["LIB_NB39"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_GER"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_GER"]];

_loadoutData set ["uniforms", ["U_LIB_GER_Schutze", "U_LIB_GER_MG_schutze"]];
_loadoutData set ["medUniforms", ["U_LIB_GER_Medic"]];
_loadoutData set ["vests", []];
_loadoutData set ["mgVests", ["V_LIB_GER_VestMG"]];
_loadoutData set ["engVests", ["V_LIB_GER_PioneerVest"]];
_loadoutData set ["slVests", ["V_LIB_GER_VestUnterofficer", "V_LIB_GER_FieldOfficer"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["engBackpacks", ["B_LIB_GER_SapperBackpack_empty"]];
_loadoutData set ["medBackpacks", ["B_LIB_GER_MedicBackpack_Empty", "B_LIB_GER_Tonister34_cowhide"]];
_loadoutData set ["lightBackpacks", ["B_LIB_GER_A_frame"]];
_loadoutData set ["atBackpacks", ["B_LIB_GER_Panzer_Empty"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

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
_sfLoadoutData set ["uniforms", ["U_LIB_ST_Soldier_E44", "U_LIB_ST_MGunner_E44"]];
_sfLoadoutData set ["medUniforms", ["U_LIB_ST_Medic_E44"]];
_sfLoadoutData set ["vests", ["V_LIB_GER_VestG43", "V_LIB_GER_VestSTG"]];
_sfLoadoutData set ["slVests", ["V_LIB_GER_VestUnterofficer"]];
_sfLoadoutData set ["backpacks", ["B_LIB_GER_SapperBackpack_empty","B_LIB_GER_Tonister34_cowhide"]];
_sfLoadoutData set ["helmets", ["H_LIB_ST_Helmet2"]];

_sfLoadoutData set ["antiInfantryGrenades", ["LIB_M39"]];

//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["lightATLaunchers", []];
_sfLoadoutData set ["slWeapons", [["LIB_MP44", "", "", "", ["LIB_30Rnd_792x33"], [], ""]]];
_sfLoadoutData set ["rifles", ["LIB_G43"]];
_sfLoadoutData set ["carbines", ["LIB_G43"]];
_sfLoadoutData set ["grenadeLaunchers", [
["LIB_MP44_GW", "LIB_ACC_GW_SB_Empty", "", "", ["LIB_30Rnd_792x33"], ["LIB_1Rnd_G_SPRGR_30"], ""],
["LIB_MP44_GW", "LIB_ACC_GW_SB_Empty", "", "", ["LIB_30Rnd_792x33"], ["LIB_1Rnd_G_SPRGR_30", "LIB_1Rnd_G_PZGR_40"], ""],
["LIB_MP44_GW", "LIB_ACC_GW_SB_Empty", "", "", ["LIB_30Rnd_792x33"], ["LIB_1Rnd_G_PZGR_40"], ""],
["LIB_MP44_GW", "LIB_ACC_GW_SB_Empty", "", "", ["LIB_30Rnd_792x33"], ["LIB_1Rnd_G_PZGR_40", "LIB_1Rnd_G_SPRGR_30"], ""]
]];
_sfLoadoutData set ["SMGs", [["LIB_MP44", "", "", "", ["LIB_30Rnd_792x33"], [], ""]]];
_sfLoadoutData set ["machineGuns", ["LIB_FG42G"]];
_sfLoadoutData set ["marksmanRifles", [["LIB_FG42G", "", "", "LIB_Optic_Zf4", [], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["vests", ["V_LIB_GER_VestKar98"]];
_militaryLoadoutData set ["backpacks", ["B_LIB_GER_SapperBackpack_empty","B_LIB_GER_Tonister34_cowhide"]];
_militaryLoadoutData set ["helmets", ["H_LIB_GER_Helmet"]];
_militaryLoadoutData set ["radios", ["ItemRadio"]];

_militaryLoadoutData set ["slWeapons", [["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19"], [], ""]]];
_militaryLoadoutData set ["rifles", [["LIB_K98_Late", "LIB_ACC_K98_Bayo", "", "", [], ["LIB_5Rnd_792x57"], ""]]];
_militaryLoadoutData set ["carbines", ["LIB_G41"]];
_militaryLoadoutData set ["grenadeLaunchers", [
["LIB_K98_Late_GW", "LIB_ACC_GW_SB_Empty", "", "", [], ["LIB_1Rnd_G_SPRGR_30"], ""],
["LIB_K98_Late_GW", "LIB_ACC_GW_SB_Empty", "", "", [], ["LIB_1Rnd_G_SPRGR_30", "LIB_1Rnd_G_PZGR_30"], ""],
["LIB_K98_Late_GW", "LIB_ACC_GW_SB_Empty", "", "", [], ["LIB_1Rnd_G_PZGR_30", "LIB_1Rnd_G_SPRGR_30"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19"], [], ""],
["LIB_MP38", "", "", "", ["LIB_32Rnd_9x19"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", ["LIB_MG34", "LIB_MG42"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["vests", ["V_LIB_GER_PrivateBelt"]];
_militiaLoadoutData set ["engVests", ["V_LIB_GER_VestMP40"]];
_militiaLoadoutData set ["slVests", ["V_LIB_GER_FieldOfficer"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_GER_A_frame"]];
_militiaLoadoutData set ["helmets", ["H_LIB_GER_Cap"]];

_militiaLoadoutData set ["antiInfantryGrenades", ["LIB_Shg24"]];
_militiaLoadoutData set ["ATLaunchers", []];
_militiaLoadoutData set ["slWeapons", [
["LIB_MP38", "", "", "", ["LIB_32Rnd_9x19"], [], ""], 
"LIB_K98_Late"
]];
_militiaLoadoutData set ["lightATLaunchers", ["LIB_Faustpatrone"]];
_militiaLoadoutData set ["rifles", [["LIB_K98_Late", "LIB_ACC_K98_Bayo", "", "", [], ["LIB_5Rnd_792x57"], ""]
]];
_militiaLoadoutData set ["carbines", [
["LIB_G3340", "", "", "", [], ["LIB_5Rnd_792x57"], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", []];
_militiaLoadoutData set ["SMGs", [
["LIB_MP38", "", "", "", ["LIB_32Rnd_9x19"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["LIB_MP38", "", "", "", ["LIB_32Rnd_9x19"], [], ""], 
"LIB_K98_Late"
]];
_militiaLoadoutData set ["sidearms", ["LIB_WaltherPPK", "LIB_P38"]];
_militiaLoadoutData set ["slSidearms", ["LIB_WaltherPPK", "LIB_P38", "LIB_FLARE_PISTOL"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_LIB_GER_Tank_crew_private", "U_LIB_GER_Tank_crew_unterofficer"]];
_crewLoadoutData set ["vests", ["V_LIB_GER_TankPrivateBelt"]];
_crewLoadoutData set ["helmets", ["H_LIB_GER_TankPrivateCap", "H_LIB_GER_TankPrivateCap2"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_GER_LW_pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_GER_OfficerBelt"]];
_pilotLoadoutData set ["helmets", ["H_LIB_GER_LW_PilotHelmet"]];
_pilotLoadoutData set ["backpacks", ["B_LIB_GER_LW_Paradrop"]];
_pilotLoadoutData set ["sidearms", ["LIB_WaltherPPK", "LIB_P08", "LIB_M1896", "a3a_lib_M712"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_LIB_GER_Oberst"]];
_officerLoadoutData set ["slVests", ["V_LIB_GER_OfficerVest"]];
_officerLoadoutData set ["helmets", ["H_LIB_GER_OfficerCap"]];

_officerLoadoutData set ["slWeapons", [
["LIB_MP40", "", "", "", ["LIB_32Rnd_9x19"], [], ""]
]];
_officerLoadoutData set ["slSidearms", ["LIB_P08", "LIB_M1896"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet;
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
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

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
    ["medUniforms"] call _fnc_setUniform;
    ["medBackpacks"] call _fnc_setBackpack;
    
    [["SMGs", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

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
    ["engVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["engBackpacks"] call _fnc_setBackpack;

    [[selectRandom ["SMGs", "carbines"], "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;


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
    ["engVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["engBackpacks"] call _fnc_setBackpack;

    [["SMGs", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

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

    ["lightBackpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [[selectRandom ["SMGs", "carbines"], "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;
	
    private _launch = ["ATLaunchers", "lightATLaunchers"] call _fnc_fallback;
    
    [_launch] call _fnc_setLauncher;
    if (_launch == "ATLaunchers") then {
        ["atBackpacks"] call _fnc_setBackpack;
        ["launcher", 2] call _fnc_addMagazines;
    } else {
        ["lightBackpacks"] call _fnc_setBackpack;
    };
    
    //TODO - Add a check if it's disposable.

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
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

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
    ["primary", 3] call _fnc_addAdditionalMuzzleMagazines;

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
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["lightBackpacks"] call _fnc_setBackpack;

    if(random 10 > 5) then 
    {
        ["SMGs"] call _fnc_setPrimary;
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
