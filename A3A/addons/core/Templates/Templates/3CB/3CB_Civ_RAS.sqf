//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

//TODO: Vehicles, and preferably their spawn chances, need to be added/removed/adjusted depending on the loaded factions. Stopgap fix for RF now.

["vehiclesCivCar", [
    "UK3CB_C_Ikarus_RED", 0.001                    // bus, dangerously large
    ,"UK3CB_C_Datsun_Closed", 0.01
    ,"UK3CB_C_Datsun_Open", 10.0            // cargo-capable
    ,"UK3CB_C_Hatchback", 10.0
    ,"UK3CB_C_Hilux_Closed", 1.0
    ,"UK3CB_C_Hilux_Open", 0.5            // cargo-capable
    ,"UK3CB_C_LandRover_Softtop_Transport_Closed", 0.5        // land rovers
    ,"UK3CB_C_LandRover_Softtop_Transport_Open", 1.5
    ,"UK3CB_C_Sedan", 10.0
    ,"UK3CB_C_Skoda", 10.0
    ,"UK3CB_C_Gaz24", 2.5
    ,"UK3CB_C_Octavia", 2.5
    ,"UK3CB_C_Landcruiser", 2.5
    ,"UK3CB_C_Lada", 1.0
    ,"UK3CB_C_Pickup", 1.0
    ,"C_Offroad_02_unarmed_F", 1.25]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "UK3CB_C_Forklift", 0.005
    ,"UK3CB_C_Tractor", 0.2
    ,"UK3CB_C_Tractor_Old", 0.2
    ,"UK3CB_C_Kamaz_Open", 0.9
    ,"UK3CB_C_Kamaz_Covered", 0.9                // Ural
    ]] call _fnc_saveToTemplate;

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
    "UK3CB_C_LandRover_Softtop_Repair_Closed_Port", 0.1
    ,"UK3CB_C_Ural_Repair", 0.05]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "UK3CB_C_LandRover_Hardtop_Ambulance", 0.1
    ,"UK3CB_C_Hilux_Ambulance", 0.1
    ]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "UK3CB_C_LandRover_Softtop_Refuel_Open_Port", 0.1
    ,"UK3CB_ADC_C_Ural_Fuel", 0.05]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06",
"GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Barklem", "AfricanHead_02",
"AsianHead_A3_02", "AsianHead_A3_03", "WhiteHead_05"]] call _fnc_saveToTemplate;
"CivMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_redwhite",
    "U_C_Man_casual_1_F",
    "U_C_Man_casual_2_F",
    "U_C_Man_casual_3_F",
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Man_casual_6_F",
    "U_C_ArtTShirt_01_v1_F",
    "U_C_ArtTShirt_01_v2_F",
    "U_C_ArtTShirt_01_v3_F",
    "U_C_ArtTShirt_01_v4_F",
    "U_C_ArtTShirt_01_v5_F",
    "U_C_ArtTShirt_01_v6_F",
    "U_NikosBody",
    "U_NikosAgedBody",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_OrestesBody",
    "U_C_Poor_1",
    "U_C_HunterBody_grn"
];

private _pressUniforms = [
    "U_C_Journalist",
    "U_Marshal"
    ];

private _workerUniforms = [
    "UK3CB_CHC_C_U_Overall_01",
    "UK3CB_CHC_C_U_Overall_02",
    "UK3CB_CHC_C_U_Overall_03",
    "UK3CB_CHC_C_U_Overall_04",
    "UK3CB_CHC_C_U_Overall_05"
    ];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F",
    "UK3CB_H_Safari_Hat_Brown",
    "H_Booniehat_mgrn",
    "H_Cap_surfer",
    "H_Cap_tan",
    "H_Cap_Lyfe",
    "H_Cap_blu",
    "H_Cap_grn_BI",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
    "UK3CB_H_Bandanna_Red_Check"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["workVests", ["V_Safety_orange_F", "V_Safety_orange_F", "V_Safety_blue_F", "V_Safety_yellow_F", "V_Safety_yellow_F", "V_Safety_yellow_F", "V_Safety_yellow_F"]];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["facewear", ["G_Respirator_white_F", "G_Spectacles_Tinted", "G_Squares_Tinted", "G_Aviator", "G_Lady_Blue", "G_Shades_Black", "G_Sport_Greenblack", "G_Sport_Blackyellow", "G_Shades_Red"]];
_loadoutData set ["workFacewear", ["G_Respirator_yellow_F", "G_EyeProtectors_F", "G_Lowprofile"]];
_loadoutData set ["workHelmets", ["H_EarProtectors_yellow_F", "H_Construction_earprot_orange_F", "H_Construction_headset_orange_F", "H_Construction_earprot_yellow_F", "H_Construction_headset_yellow_F", "H_Construction_basic_white_F"]];
_loadoutData set ["pressHelmets", ["H_Cap_press", "H_Cap_press", "H_Cap_press", "H_PASGT_basic_blue_press_F", "H_PASGT_neckprot_blue_press_F"]];

_loadoutData set ["backpacks", ["B_Messenger_Coyote_F", "B_Messenger_Gray_F", "B_Messenger_Black_F", "B_CivilianBackpack_01_Everyday_Vrana_F", "B_CivilianBackpack_01_Sport_Blue_F", "B_CivilianBackpack_01_Sport_Green_F", "B_CivilianBackpack_01_Sport_Red_F", "B_LegStrapBag_black_F", "B_LegStrapBag_coyote_F"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    if(random [0,0.5,1] > 0.3) then {      
        ["helmets"] call _fnc_setHelmet;
    };
    if(random [0,0.5,1] > 0.7) then {      
        ["backpacks"] call _fnc_setBackpack;
    };
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["workHelmets"] call _fnc_setHelmet;
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
    ["Man", _manTemplate, nil, 10]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
