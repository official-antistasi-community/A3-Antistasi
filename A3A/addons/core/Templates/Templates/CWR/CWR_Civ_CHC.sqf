//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "cwr3_c_skoda", 0.5
    , "cwr3_c_rapid", 0.5
    , "cwr3_c_s1203", 0.2
    , "cwr3_c_cj5_militia", 0.3
    , "cwr3_c_gaz24", 0.5
    , "cwr3_c_lada", 0.5
    , "cwr3_c_mini", 0.5
    , "cwr3_c_trabant", 0.5
    , "cwr3_c_landrover_yellow", 0.5
    ]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "cwr3_c_uaz452", 0.3
    , "cwr3_c_ural_blue", 0.2
    , "cwr3_c_ural_empty", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "CUP_C_Fishing_Boat_Chernarus", 0.2
    , "CUP_C_PBX_CIV", 0.7
    , "CUP_C_Zodiac_CIV", 0.7
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "C_Truck_02_box_F", 0.1
    , "C_Offroad_01_repair_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "CUP_C_S1203_Ambulance_CIV", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Truck_02_fuel_F", 0.1
    , "C_Van_01_fuel_F", 0.1
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
"CUP_Names_CzechMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "CUP_U_C_Worker_03",
    "CUP_U_C_Worker_04",
    "CUP_U_C_Worker_02",
    "CUP_U_C_Worker_01",
    "CUP_U_C_Villager_01",
    "CUP_U_C_Villager_04",
    "CUP_U_C_Villager_02",
    "CUP_U_C_Villager_03",
    "CUP_U_C_Woodlander_01",
    "CUP_U_C_Woodlander_02",
    "CUP_U_C_Woodlander_03",
    "CUP_U_C_Woodlander_04",
    "CUP_U_C_Suit_01",
    "CUP_U_C_Suit_02",
    "CUP_U_C_Suit_03",
    "CUP_U_C_Functionary_jacket_02",
    "CUP_U_C_Functionary_jacket_01",
    "CUP_U_C_Functionary_jacket_03",
    "CUP_U_C_Profiteer_02",
    "CUP_U_C_Profiteer_03",
    "CUP_U_C_Profiteer_01",
    "CUP_U_C_Profiteer_04",
    "CUP_U_C_racketeer_01",
    "CUP_U_C_racketeer_04",
    "CUP_U_C_racketeer_02",
    "CUP_U_C_racketeer_03",
    "CUP_U_C_Citizen_02",
    "CUP_U_C_Citizen_01",
    "CUP_U_C_Citizen_04",
    "CUP_U_C_Citizen_03",
    "CUP_U_C_Priest_01"
];          //Uniforms given to Players

private _civUniformsAI = [
    "CUP_U_C_Worker_03",
    "CUP_U_C_Worker_04",
    "CUP_U_C_Worker_02",
    "CUP_U_C_Worker_01",
    "CUP_U_C_Villager_01",
    "CUP_U_C_Villager_04",
    "CUP_U_C_Villager_02",
    "CUP_U_C_Villager_03",
    "CUP_U_C_Woodlander_01",
    "CUP_U_C_Woodlander_02",
    "CUP_U_C_Woodlander_03",
    "CUP_U_C_Woodlander_04"
];  //Uniforms given to AI

private _pressUniforms = ["cwr3_b_camel_pilot_uniform"];            //Uniforms given to Press/Journalists

private _workerUniforms = ["CUP_U_C_Worker_03", "CUP_U_C_Worker_04", "CUP_U_C_Worker_02", "CUP_U_C_Worker_01", "CUP_U_C_Mechanic_02", "CUP_U_C_Mechanic_03", "CUP_U_C_Mechanic_01"];           //Uniforms given to Workers at Factories/Resources

["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civHats = [];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniformsAI];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["CUP_V_B_LHDVest_Blue"]];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];
_loadoutData set ["workerHelmets", ["H_Cap_blk", "CUP_H_PMC_Cap_Tan"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["workerHelmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;