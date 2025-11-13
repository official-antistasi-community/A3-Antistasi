//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

//TODO: Vehicles, and preferably their spawn chances, need to be added/removed/adjusted depending on the loaded factions. Stopgap fix for RF now.

private _vehiclesCivCar = [
    "C_Quadbike_01_F", 0.8
    ,"C_Hatchback_01_F", 2.0
    ,"C_Hatchback_01_sport_F", 0.3
    ,"C_Offroad_01_F", 0.25
    ,"C_SUV_01_F", 0.5
    ,"C_Van_01_box_F",1.8
    ,"C_Van_02_vehicle_F", 1.0                // van from Orange
    ,"C_Van_02_transport_F", 0.2            // minibus
    ,"C_Offroad_02_unarmed_F", 2.5            // Apex 4WD
    ,"C_Offroad_01_comms_F", 0.05            // Contact
    ,"C_Offroad_01_covered_F", 0.05];
private _vehiclesCivIndustrial = [
    "C_Van_01_transport_F", 1.0
    ,"C_Van_01_box_F",1.8
    ,"C_Truck_02_transport_F", 0.25
    ,"C_Truck_02_covered_F", 0.25
    ,"C_Tractor_01_F", 1.5];

private _vehiclesCivBoat = [
    "C_Boat_Civil_01_rescue_F", 0.1            // motorboats
    ,"C_Boat_Civil_01_police_F", 0.1
    ,"C_Boat_Civil_01_F", 1.0
    ,"C_Rubberboat", 1.0                    // rescue boat
    ,"C_Boat_Transport_02_F", 1.0            // RHIB
    ,"C_Scooter_Transport_01_F", 1.5];

private _vehiclesCivRepair = [
    "C_Offroad_01_repair_F", 0.3
    ,"C_Van_02_service_F", 0.3                // orange
    ,"C_Truck_02_box_F", 0.1];

private _vehiclesCivMedical = ["C_Van_02_medevac_F", 0.1];

private _vehiclesCivFuel = [
    "C_Van_01_fuel_F", 0.2
    ,"C_Truck_02_fuel_F", 0.1];

if ("rf" in A3A_enabledDLC) then {
    _vehiclesCivCar append ["C_Pickup_rf", 2.0, "C_Pickup_covered_rf", 0.1];
    _vehiclesCivRepair append ["C_Pickup_repair_rf", 0.3];
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

["faces", [
    "TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08","TanoanHead_A3_09",
    "TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08","TanoanHead_A3_09",
    "AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"
    ]] call _fnc_saveToTemplate;
"TanoanMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Para_5_F",
    "U_C_Man_casual_1_F",
    "U_C_Man_casual_2_F",
    "U_C_Man_casual_3_F",
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Man_casual_6_F",
    "U_C_man_sport_1_F",
    "U_C_man_sport_2_F",
    "U_C_man_sport_3_F",
    "U_C_Mechanic_01_F",
    "U_C_Poor_1"
];

private _pressUniforms = [
    "U_C_Journalist",
    "U_C_Man_casual_1_F"
    ];

private _workerUniforms = [
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_C_Mechanic_01_F",
    "U_C_Uniform_Farmer_01_F",
    "U_C_WorkerCoveralls"
    ];


private _dlcUniforms = [
    "U_NikosBody",
    "U_NikosAgedBody",
    "U_OrestesBody",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_C_Scientist",
    "U_C_Uniform_Scientist_02_formal_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_01_F"
    ];

if (allowDLCOrange) then {
  _dlcUniforms append [
    "U_C_Paramedic_01_F"
  ];
  _workerUniforms append [
    "U_C_ConstructionCoverall_Black_F",
    "U_C_ConstructionCoverall_Blue_F",
    "U_C_ConstructionCoverall_Red_F",
    "U_C_ConstructionCoverall_Vrana_F"
  ];
};

if (allowDLCWS) then {
  _dlcUniforms append [
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
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press", "H_PASGT_basic_blue_press_F", "H_PASGT_neckprot_blue_press_F"]];
_loadoutData set ["backpacks", ["B_Messenger_Black_F", "B_Messenger_Gray_F","B_CivilianBackpack_01_Everyday_Vrana_F","B_CivilianBackpack_01_Sport_Green_F","B_CivilianBackpack_01_Sport_Blue_F","B_CivilianBackpack_01_Sport_Red_F"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    if(random [0,0.5,1] > 0.3) then {      
        ["helmets"] call _fnc_setHelmet;
    };
    ["uniforms"] call _fnc_setUniform;

    if(random [0,0.5,1] > 0.8) then {      
        ["backpacks"] call _fnc_setBackpack;
    };

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    if(random [0,0.5,1] > 0.3) then {      
        ["helmets"] call _fnc_setHelmet;
    };
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
