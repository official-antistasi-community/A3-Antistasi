//////////////////////////////
//   Civilian Information   //
//////////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["vn_o_item_firstaidkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["vn_o_item_medikit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.

//////////////////////////
//       Vehicles       //
//////////////////////////

private _vehiclesCivCar = [
    "vn_c_wheeled_m151_02", 1.8
    ,"vn_c_wheeled_m151_01", 1.8
    ,"vn_c_car_02_01", 1.5
    ,"vn_c_car_03_01", 1
    ,"vn_c_car_01_01", 0.8
    ,"vn_c_bicycle_01", 0.2];

if (isClass (configFile >> "vnx_credits")) then {
	_vehiclesCivCar append ["vnx_c_wheeled_tuktuk_01_01", 2];
};

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "vn_b_wheeled_m54_01_airport", 0.2
    ,"vn_c_car_04_01", 1]] call _fnc_saveToTemplate;

["vehiclesCivHeli", []] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "vn_c_boat_02_02", 1
    ,"vn_c_boat_07_01", 0.6
    ,"vn_c_boat_08_01", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["vn_b_wheeled_m54_repair_airport", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", []] call _fnc_saveToTemplate;

["vehiclesCivFuel", ["vn_b_wheeled_m54_fuel_airport", 0.2]] call _fnc_saveToTemplate;

["uniforms", [
    "vn_o_uniform_vc_01_01",
    "vn_o_uniform_vc_01_02",
    "vn_o_uniform_vc_02_07",
    "vn_o_uniform_vc_03_02",
    "vn_o_uniform_vc_04_02",
    "vn_o_uniform_vc_05_01",
    "vn_o_uniform_vc_02_05",
    "vn_o_uniform_vc_04_03",
    "vn_o_uniform_vc_03_03"
]] call _fnc_saveToTemplate;

["headgear", [
    "vn_c_headband_04",
    "vn_c_headband_03",
    "vn_c_headband_02",
    "vn_c_headband_01",
    "vn_c_conehat_02",
    "vn_c_conehat_01"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
"vietmen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "vn_o_uniform_vc_01_01",
    "vn_o_uniform_vc_01_02",
    "vn_o_uniform_vc_02_07",
    "vn_o_uniform_vc_03_02",
    "vn_o_uniform_vc_04_02",
    "vn_o_uniform_vc_05_01",
    "vn_o_uniform_vc_02_05",
    "vn_o_uniform_vc_04_03",
    "vn_o_uniform_vc_03_03"
];

private _pressUniforms = [
    "U_Marshal"
    ];

["uniforms", _civUniforms + _pressUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "vn_c_headband_04",
    "vn_c_headband_03",
    "vn_c_headband_02",
    "vn_c_headband_01"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerHelmets", ["vn_c_conehat_02"]];
_loadoutData set ["helmets", _civHats];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["workerHelmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
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