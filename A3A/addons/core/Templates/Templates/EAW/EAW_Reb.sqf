///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "LIM"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\Flag_green_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_INDFOR_EP1"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["diveGear", [""]] call _fnc_saveToTemplate;
["flyGear", ["U_LIB_US_Bomber_Pilot","B_LIB_US_Type5"]] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["a3a_lib_Zis6_BOX"]] call _fnc_saveToTemplate; //We should create a inert "box truck" version

["surrenderCrate", "LIB_Mine_AmmoBox_US"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["LIB_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["a3a_LIB_Willys_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["EAW_Dodge1936_Pickup_Military_ROC"]] call _fnc_saveToTemplate;
["vehiclesAT", []] call _fnc_saveToTemplate;
["vehiclesAA", []] call _fnc_saveToTemplate;

["vehiclesBoat", ["EAW_Daihatsu_LC_IJA", "B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["EAW_HawkIII", "EAW_i16"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["EAW_Dodge1936_Pickup_Military_Medical_IJA"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["LIB_GazM1_dirty"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["EAW_Dodge1936_Pickup"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", []] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["a3a_lib_Zis6_BOX"]] call _fnc_saveToTemplate;

["staticMGs", ["EAW_Type24_MG"]] call _fnc_saveToTemplate;
["staticAT", ["EAW_ROC_Pak36"]] call _fnc_saveToTemplate;
["staticAA", ["EAW_T98_20mm_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["EAW_ROC_Type20_Mortar"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "EAW_Type97_81mm_HE"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", ""] call _fnc_saveToTemplate;
["staticMortarMagFlare", "EAW_Type97_81mm_Flare"] call _fnc_saveToTemplate;

["mineAT", "LIB_TMI_42_MINE_mag"] call _fnc_saveToTemplate;
["mineAPERS", "LIB_STMI_MINE_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["LIB_US_TNT_4pound_mag", 1], ["LIB_Ladung_Big_MINE_mag", 2]]] call _fnc_saveToTemplate;

#include "..\IFA\IFA_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "EAW_Type14", ["EAW_Type14_Magazine", 80],
    "LIB_WaltherPPK", ["LIB_7Rnd_765x17_PPK", 70],
    "LIB_FLARE_PISTOL", "LIB_1Rnd_flare_white",
    "EAW_Hanyang_Bayonet", "EAW_Hanyang_Bayonet_Attach",
    "EAW_Chinese_Medic_Bag", "EAW_NRA_PouchesBottom", "EAW_NRA_PouchesTop", 
    "EAW_Bedroll_Tan", "EAW_Bedroll_2_Tan",
    "LIB_Binocular_UK", ["LIB_Rg42", 10], ["LIB_No77", 10],
    ["LIB_STMI_MINE_mag", 3], ["LIB_TMI_42_MINE_mag", 3], ["LIB_Ladung_Small_MINE_mag", 10], ["LIB_shumine_42_MINE_mag", 10]
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
//_initialRebelEquipment append [];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;


private _rebUniforms = ["EAW_Civ_1_Uniform_White","EAW_Civ_1_Uniform_Tan","EAW_Civ_1_Uniform_Grey","EAW_Civ_1_Uniform_Brown","EAW_Civ_1_Uniform"];          //Uniforms given to Normal Rebels

private _extraUniforms = [];          //only given to the Arsenal not Rebels


["uniforms", _rebUniforms + _extraUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", ["EAW_SunHat"]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

//Faces and Voices given to Rebell AI
["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
"ChineseMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["facewear", ["EAW_Glasses"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    if (random 10 > 7) then {
        ["facewear"] call _fnc_setFacewear;
    };

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    if (random 10 > 7) then {
        ["facewear"] call _fnc_setFacewear;
    };

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate, nil, 1],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate, nil, 10],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate, nil, 10],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate, nil, 10]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
