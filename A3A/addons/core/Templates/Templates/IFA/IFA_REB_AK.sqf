///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "AK"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Flags\ifa_ak.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_AK"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["diveGear", [""]] call _fnc_saveToTemplate;
["flyGear", ["U_LIB_US_Bomber_Pilot","B_LIB_US_Type5"]] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["a3a_lib_Zis6_BOX"]] call _fnc_saveToTemplate; //We should create a inert "box truck" version

["surrenderCrate", "LIB_Lone_Big_Box"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["LIB_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["a3a_LIB_Willys_MB_M1919"]] call _fnc_saveToTemplate;  //replace with a version in plain green
["vehiclesTruck", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesAT", []] call _fnc_saveToTemplate;
["vehiclesAA", []] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["LIB_C47_RAF"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_Med"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["LIB_GazM1_dirty", "LIB_GazM1"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["LIB_CIV_FFI_CitC4", "LIB_CIV_FFI_CitC4_3"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", []] call _fnc_saveToTemplate;

["staticMGs", ["LIB_Maxim_M30_base"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Zis3"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_FlaK_30"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_M2_60"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "LIB_8Rnd_60mmHE_M2"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", ""] call _fnc_saveToTemplate;

["mineAT", ""] call _fnc_saveToTemplate;
["mineAPERS", ""] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["LIB_US_TNT_4pound_mag", 1], ["LIB_Ladung_Big_MINE_mag", 2]]] call _fnc_saveToTemplate;

switch (A3A_climate) do
{
	case "arid": { 
        ["vehiclesBasic", ["LIB_US_NAC_Willys_MB"]] call _fnc_saveToTemplate;
        ["vehiclesLightUnarmed", ["LIB_GazM1_SOV_camo_sand"]] call _fnc_saveToTemplate;
        ["vehiclesLightArmed", ["LIB_US_NAC_Willys_MB_M1919"]] call _fnc_saveToTemplate;
    };
	case "arctic": { 
        ["vehiclesBasic", ["LIB_Willys_MB_w"]] call _fnc_saveToTemplate;
        ["vehiclesLightUnarmed", ["LIB_Willys_MB_Hood_w"]] call _fnc_saveToTemplate;
        ["vehiclesLightArmed", ["LIB_US_Willys_MB_M1919_w"]] call _fnc_saveToTemplate;
        ["vehiclesTruck", ["LIB_Zis5v_w"]] call _fnc_saveToTemplate;
        ["vehiclesMedical", ["LIB_Zis5v_med_w"]] call _fnc_saveToTemplate;
        
        ["staticAT", ["LIB_Zis3_w"]] call _fnc_saveToTemplate;
    };
};

#include "IFA_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"LIB_WaltherPPK", "LIB_7Rnd_765x17_PPK",
["LIB_M1895", 15], "LIB_7Rnd_762x38",
"LIB_FLARE_PISTOL", "LIB_1Rnd_flare_white",
"V_LIB_SOV_RA_Belt", 
["LIB_Ladung_Small_MINE_mag", 10],
"B_LIB_DAK_A_frame",
"LIB_Binocular_GER",
["B_LIB_GER_Tonister34_cowhide", 3],
["B_LIB_GER_MedicBackpack_Empty", 3],
["H_LIB_WP_Helmet", 5],
["H_LIB_WP_Helmet_med", 5]
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;


private _rebUniforms = [
"U_LIB_WP_Soldier_camo_1",
"U_LIB_WP_Soldier_camo_2",
"U_LIB_WP_Soldier_camo_3"
];          //Uniforms given to Normal Rebels

private _civUniforms = [
"U_LIB_CIV_Citizen_1",
"U_LIB_CIV_Citizen_2",
"U_LIB_CIV_Citizen_3",
"U_LIB_CIV_Citizen_4",
"U_LIB_CIV_Citizen_5",
"U_LIB_CIV_Citizen_6",
"U_LIB_CIV_Citizen_7",
"U_LIB_CIV_Citizen_8",
"U_LIB_CIV_Villager_1",
"U_LIB_CIV_Villager_2",
"U_LIB_CIV_Villager_3",
"U_LIB_CIV_Villager_4",
"U_LIB_CIV_Woodlander_1",
"U_LIB_CIV_Woodlander_2",
"U_LIB_CIV_Woodlander_3",
"U_LIB_CIV_Woodlander_4"
];

["uniforms", _rebUniforms + _civUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", ["H_LIB_WP_Helmet","H_LIB_WP_Cap","H_LIB_WP_Cap","H_LIB_WP_Cap","H_LIB_WP_Cap"]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_6","LivonianHead_9","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01pol","Male02pol","Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _winterGear = [];
if(A3A_climate == "arctic") then {
    _winterGear = ["G_LIB_Scarf2_B", "G_LIB_Scarf2_G","G_LIB_Scarf_B", "G_LIB_Scarf_G", "G_LIB_Headwrap_gloves", "G_LIB_Headwrap","G_LIB_GER_Gloves1", "G_LIB_GER_Gloves2", "G_LIB_GER_Gloves3", "G_LIB_GER_Gloves4"];
    ["headgear", [
    "H_LIB_CIV_Worker_Cap_1",
    "H_LIB_CIV_Worker_Cap_2",
    "H_LIB_CIV_Worker_Cap_3",
    "H_LIB_CIV_Worker_Cap_4", 
    "H_LIB_GER_Ushanka"]] call _fnc_saveToTemplate; 
};

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["facewear", _winterGear + ["G_Bandanna_blk", "G_Bandanna_tan", "G_LIB_Dienst_Brille", "G_LIB_Dienst_Brille2","G_LIB_Scarf2_B", "G_LIB_Scarf2_G","G_LIB_Scarf_B", "G_LIB_Scarf_G"]];

if (isClass (configFile >> "CfgPatches" >> "IFA3_COMP_ACE_main")) then {
    _initialRebelEquipment append ["ACE_LIB_LadungPM", "ACE_LIB_FireCord"];
};
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
