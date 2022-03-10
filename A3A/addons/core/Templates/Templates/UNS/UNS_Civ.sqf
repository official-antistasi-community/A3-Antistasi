//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "uns_willys", 1
    ,"uns_zil157", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "uns_zil157", 0.5]] call _fnc_saveToTemplate;

["vehiclesCivHeli", []] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "UNS_skiff2_C", 0.4
    ,"UNS_skiff_C", 0.4
    ,"UNS_skiff2_cargo_C", 0.5
    ,"UNS_skiff_cargo_C", 0.5
    ,"UNS_sampan_cargo", 0.6
    ,"UNS_sampan_fish1", 0.5
    ,"UNS_sampan_large", 0.3
    ,"UNS_sampan_supply", 0.4
    ,"UNS_Sampan_Transport", 0.2
    ,"UNS_sampan_village", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["uns_zil157_repair", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", []] call _fnc_saveToTemplate;

["vehiclesCivFuel", ["uns_Zil157_refuel", 0.2]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "UNS_CIV_U",
    "UNS_CIV_B"
];

private _pressUniforms = [
    "U_Marshal"
    ];

["uniforms", _civUniforms + _pressUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "uns_H_Simc_nasi",
    "UNS_Conehat_VC",
    "UNS_Headband_BK",
    "UNS_Boonie_VC",
    "uns_sas_booniehat_vc_tan",
    "UNS_Boonie3_VC"
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