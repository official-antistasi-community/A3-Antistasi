//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "CSLA_CIV_ADA1600", 0.5
    , "CSLA_CIV_ADA1600VB", 0.5
    , "CSLA_CIV_AZU", 0.2
    , "CSLA_civ_CATOR", 0.3
    , "CSLA_CIV_Sarka1200", 0.5
    , "CSLA_CIV_Sarka1200PO", 0.5
    , "CSLA_CIV_Sarka1200VB", 0.5
    , "CUP_C_Datsun_Plain", 0.5
    , "CUP_C_Datsun_Tubeframe", 0.5
    , "CUP_C_S1203_CIV_CR", 0.5
    , "CUP_C_Octavia_CIV", 0.5
    ]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "CSLA_CIV_V3S", 0.3
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Rubberboat", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "CUP_I_V3S_Repair_TKG", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "CUP_B_S1203_Ambulance_CR", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Truck_02_fuel_F", 0.1
    , "CUP_I_V3S_Refuel_TKG", 0.1
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;
"TakistaniMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "FIA_uniCitizen",
    "FIA_uniCitizen2",
    "FIA_uniCitizen3",
    "FIA_uniCitizen4",
    "FIA_uniDoctor",
    "FIA_uniWoodlander",
    "FIA_uniWoodlander2",
    "FIA_uniWoodlander4",
    "FIA_uniFunctionary",
    "FIA_uniFunctionary2",
    "FIA_uniVillager",
    "FIA_uniVillager2",
    "FIA_uniVillager3",
    "FIA_uniVillager4",
    "FIA_uniForeman",
    "FIA_uniForeman2"
];

private _civUniformsAI = [
    "FIA_uniCitizen",
    "FIA_uniCitizen2",
    "FIA_uniCitizen3",
    "FIA_uniCitizen4"
];

private _pressUniforms = ["FIA_uniWorker3"];            //Uniforms given to Press/Journalists

private _workerUniforms = ["FIA_uniWorker", "FIA_uniWorker2", "FIA_uniWorker3", "FIA_uniWorker4"];           //Uniforms given to Workers at Factories/Resources

["uniforms", _civUniforms + _civUniformsAI + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civHats = ["US85_beanie", "FIA_capBk", "CSLA_capBk", "FIA_Usanka","CSLA_RadiovkaBk", "CSLA_RadiovkaGy",
"FIA_Radiovka"];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.


private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniformsAI];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];
_loadoutData set ["facewear", ["CUP_Beard_Black", "None", "CUP_Beard_Brown", "CUP_TK_NeckScarf"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

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