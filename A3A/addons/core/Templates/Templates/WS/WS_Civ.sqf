//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

private _vehiclesCivCar = [
    "C_Quadbike_01_F", 0.15
    ,"C_Hatchback_01_F", 1.0
    ,"C_Hatchback_01_sport_F", 0.15
    ,"C_Offroad_01_F", 1.5
    ,"C_Offroad_lxWS", 1.5
    ,"C_SUV_01_F", 0.75
    ,"C_Van_02_vehicle_F", 1.0                // van from Orange
    ,"C_Van_02_transport_F", 0.2            // minibus
    ,"C_Offroad_02_unarmed_F", 1.5            // Apex 4WD
    ,"C_Offroad_01_comms_F", 0.3            // Contact
    ,"C_Offroad_01_covered_F", 0.3];

private _vehiclesCivIndustrial = [
    "C_Van_01_transport_F", 1.0
    ,"C_Van_01_box_F", 0.8
    ,"C_Truck_02_transport_F", 0.5
    ,"C_Truck_02_covered_F", 0.5
    ,"C_Tractor_01_F", 0.3    
    ,"C_Truck_02_racing_lxWS", 0.2
	,"C_Truck_02_flatbed_lxWS", 0.5
	,"C_Truck_02_cargo_lxWS", 0.5];

private _vehiclesCivBoat = [
    "C_Boat_Civil_01_rescue_F", 0.1            // motorboats
    ,"C_Boat_Civil_01_police_F", 0.1
    ,"C_Boat_Civil_01_F", 1.0
    ,"C_Rubberboat", 1.0                    // rescue boat
    ,"C_Boat_Transport_02_F", 1.0            // RHIB
    ,"C_Scooter_Transport_01_F", 0.5];

private _vehiclesCivRepair = [
    "C_Offroad_01_repair_F", 0.3
    ,"C_Van_02_service_F", 0.3                // orange
    ,"C_Truck_02_box_F", 0.1];

private _vehiclesCivMedical = ["C_Van_02_medevac_F", 0.1];

private _vehiclesCivFuel = [
    "C_Van_01_fuel_F", 0.2
    ,"C_Truck_02_fuel_F", 0.1];

if ("rf" in A3A_enabledDLC) then {
    _vehiclesCivCar append ["C_Pickup_rf", 1.25, "C_Pickup_covered_rf", 0.2];
    _vehiclesCivRepair append ["C_Pickup_repair_rf", 0.2];
    _vehiclesCivFuel append ["a3a_civ_Pickup_fuel_rf", 0.1];
};

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesCivIndustrial", _vehiclesCivIndustrial] call _fnc_saveToTemplate;
["vehiclesCivBoat", _vehiclesCivBoat] call _fnc_saveToTemplate;
["vehiclesCivRepair", _vehiclesCivRepair] call _fnc_saveToTemplate;
["vehiclesCivMedical", _vehiclesCivMedical] call _fnc_saveToTemplate;
["vehiclesCivFuel", _vehiclesCivFuel] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03",
"lxWS_African_Head_Old","lxWS_African_Head_01","lxWS_African_Head_02",
"lxWS_African_Head_03","lxWS_African_Head_04","lxWS_African_Head_05","lxWS_Said_Head",
"lxWS_African_Head_Old_Bard"]] call _fnc_saveToTemplate;
"lxWS_WSaharaMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_lxWS_C_Djella_01",
    "U_lxWS_C_Djella_02",
    "U_lxWS_C_Djella_02a",
    "U_lxWS_C_Djella_03",
    "U_lxWS_C_Djella_04",
    "U_lxWS_C_Djella_05",
    "U_lxWS_C_Djella_06",
    "U_lxWS_C_Djella_07",
    "U_lxWS_Tak_01_A",
    "U_lxWS_Tak_01_B",
    "U_lxWS_Tak_01_C",
    "U_lxWS_Tak_02_A",
    "U_lxWS_Tak_02_B",
    "U_lxWS_Tak_02_C",
    "U_lxWS_Tak_03_A",
    "U_lxWS_Tak_03_B",
    "U_lxWS_Tak_03_C"
];

private _pressUniforms = [
    "U_C_Journalist",
    "U_Marshal"
    ];

private _workerUniforms = [
    "U_C_WorkerCoveralls",
    "U_C_Uniform_Farmer_01_F"
    ];

private _dlcUniforms = [];

if (allowDLCOrange) then {
  _dlcUniforms append [
    "U_C_Paramedic_01_F",
    "U_C_Mechanic_01_F"
  ];
};

if ("rf" in A3A_enabledDLC) then {
    private _RFleatherJackets = [
        "U_C_PilotJacket_black_RF",
        "U_C_PilotJacket_brown_RF",
        "U_C_PilotJacket_lbrown_RF",
        "U_C_PilotJacket_open_black_RF",
        "U_C_PilotJacket_open_brown_RF",
        "U_C_PilotJacket_open_lbrown_RF"];
    _dlcUniforms append _RFleatherJackets;
    if (A3A_climate in ["temperate","arctic"]) then {
        _civUniforms append _RFleatherJackets;
    };
};

_workerUniforms append [
"U_C_ConstructionCoverall_Black_F",
"U_C_ConstructionCoverall_Blue_F",
"U_C_ConstructionCoverall_Red_F",
"U_C_ConstructionCoverall_Vrana_F"
];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;

private _civhats = [
	"H_Bandanna_blu",
	"H_Bandanna_cbr",
	"H_Bandanna_gry",
	"H_Bandanna_khk",
	"H_Bandanna_sand",
	"H_Bandanna_sgg",
	"H_Bandanna_surfer",
	"H_Bandanna_surfer_blk",
	"H_Bandanna_surfer_grn",
	"H_Cap_blk",
	"H_Cap_blu",
	"H_Cap_grn",
	"H_Cap_grn_BI",
	"H_Cap_oli",
	"H_Cap_red",
	"H_Cap_surfer",
	"H_Cap_tan",
	"H_StrawHat",
	"H_StrawHat_dark",
	"H_Hat_checker",
	"H_ShemagOpen_khk",
	"lxWS_H_cloth_5_A",
	"lxWS_H_cloth_5_C",
	"lxWS_H_cloth_5_B",

	"lxWS_H_turban_01_black",
	"lxWS_H_turban_01_blue",
	"lxWS_H_turban_01_green",
	"lxWS_H_turban_01_red",
	"lxWS_H_turban_01_sand",
	"lxWS_H_turban_01_gray",
	"lxWS_H_turban_01_yellow",

	"lxWS_H_turban_02_black",
	"lxWS_H_turban_02_blue",
	"lxWS_H_turban_02_green",
	"lxWS_H_turban_02_orange",
	"lxWS_H_turban_02_red",
	"lxWS_H_turban_02_sand",
	"lxWS_H_turban_02_gray",
	"lxWS_H_turban_02_yellow",

	"lxWS_H_turban_03_black",
	"lxWS_H_turban_03_blue",
	"lxWS_H_turban_03_green",
	"lxWS_H_turban_03_orange",
	"lxWS_H_turban_03_red",
	"lxWS_H_turban_03_sand",
	"lxWS_H_turban_03_gray",
	"lxWS_H_turban_03_yellow",

	"lxWS_H_turban_04_black",
	"lxWS_H_turban_04_blue",
	"lxWS_H_turban_04_green",
	"lxWS_H_turban_04_red",
	"lxWS_H_turban_04_sand",
	"lxWS_H_turban_04_gray",
	"lxWS_H_turban_04_yellow"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press", "H_PASGT_basic_blue_press_F","H_PASGT_neckprot_blue_press_F"]];

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
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
