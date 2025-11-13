//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "UK3CB_MEC_C_Ikarus", 0                    // bus, dangerously large
    ,"UK3CB_MEC_C_Datsun_Civ_Closed", 0.5
    ,"UK3CB_MEC_C_Datsun_Civ_Open", 1.0            // cargo-capable
    ,"UK3CB_MEC_C_Hatchback", 0.5
    ,"UK3CB_MEC_C_Hilux_Civ_Closed", 0.5
    ,"UK3CB_MEC_C_Hilux_Civ_Open", 1.0            // cargo-capable
    ,"UK3CB_MEC_C_Lada", 0.5
    ,"UK3CB_MEC_C_Lada_Taxi", 0.5
    ,"UK3CB_MEC_C_LR_Closed", 0.5        // land rovers
    ,"UK3CB_MEC_C_LR_Open", 0.5
    ,"UK3CB_MEC_C_Sedan", 0.5
    ,"UK3CB_MEC_C_Skoda", 0.5
    ,"UK3CB_MEC_C_S1203", 0.5
    ,"UK3CB_MEC_C_SUV", 0.3
    ,"UK3CB_MEC_C_UAZ_Closed", 0.5
    ,"UK3CB_MEC_C_UAZ_Open", 0.5
    ,"UK3CB_MEC_C_Gaz24", 0.5
    ,"UK3CB_MEC_C_Golf", 0.5
    ,"UK3CB_MEC_C_Landcruiser",0.5
    ,"UK3CB_MEC_C_Pickup",0.5]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "UK3CB_MEC_C_Forklift", 0.05
    ,"UK3CB_MEC_C_Tractor", 0.2
    ,"UK3CB_MEC_C_Tractor_Old", 0.2
    ,"UK3CB_MEC_C_Kamaz_Covered", 0.3
    ,"UK3CB_MEC_C_Kamaz_Open", 0.3
    ,"UK3CB_MEC_C_Ural", 0.3                // Urals
    ,"UK3CB_MEC_C_Ural_Open", 0.3
    ,"UK3CB_MEC_C_V3S_Closed", 0.3
    ,"UK3CB_MEC_C_V3S_Open", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_rescue_F", 0.1            // motorboats
    ,"C_Boat_Civil_01_police_F", 0.1
    ,"UK3CB_C_Fishing_Boat", 0.3
    ,"UK3CB_C_Fishing_Boat_Smuggler_VIV_FFV", 0.1
    ,"UK3CB_C_Fishing_Boat_Smuggler", 0.2
    ,"UK3CB_C_Fishing_Boat_VIV_FFV", 0.1
    ,"UK3CB_C_Small_Boat_Closed", 0.7
    ,"UK3CB_C_Small_Boat_Open", 0.8
    ,"UK3CB_C_Small_Boat_Wood", 0.9
    ,"C_Rubberboat", 1.0                    // rescue boat
    ,"C_Boat_Transport_02_F", 1.0            // RHIB
    ,"C_Scooter_Transport_01_F", 0.5]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "UK3CB_MEC_C_Kamaz_Repair", 0.1
    ,"UK3CB_MEC_C_Ural_Repair", 0.1
    ,"UK3CB_MEC_C_V3S_Repair", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "UK3CB_MEC_C_S1203_Amb", 0.1
    ,"UK3CB_MEC_C_Hilux_Ambulance", 0.1
    ]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "UK3CB_MEC_C_Kamaz_Fuel", 0.1
    ,"UK3CB_MEC_C_Ural_Fuel", 0.1                // Ural
    ,"UK3CB_MEC_C_V3S_Refuel", 0.1]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "UK3CB_MEC_C_Pants_U_06",
    "UK3CB_MEC_C_Pants_U_16",
    "UK3CB_MEC_C_Pants_U_21",
    "UK3CB_MEC_C_Pants_U_19",
    "UK3CB_MEC_C_Pants_U_10",
    "UK3CB_MEC_C_Jeans_Tshirt_U_01",
    "UK3CB_MEC_C_Jeans_Tshirt_U_08",
    "UK3CB_MEC_C_U_CIT_03",
    "UK3CB_MEC_C_U_WORK_02",
    "UK3CB_MEC_C_U_PROF_01"
];

private _pressUniforms = [
    "U_C_Journalist",
    "U_Marshal"
    ];

private _workerUniforms = [
    "UK3CB_TKC_C_U_Pilot_A",
    "UK3CB_CHC_C_U_DOC_03",
    "UK3CB_CHC_C_U_Overall_05",
    "UK3CB_CHC_C_U_Overall_03"
    ];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "rhs_beanie_green",
    "H_Cap_oli",
    "UK3CB_H_Shemag_red",
    "UK3CB_H_Shemag_red_02",
    "H_StrawHat_dark",
    "H_Cap_blk"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];

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
    ["helmets"] call _fnc_setHelmet;
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
    ["Worker", _workerTemplate, nil, 10],
    ["Man", _manTemplate, nil, 10]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;