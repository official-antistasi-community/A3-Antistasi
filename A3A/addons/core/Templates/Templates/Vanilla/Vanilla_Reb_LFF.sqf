///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "LFF"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F_Enoch\Flags\flag_looters_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_EnochLooters"] call _fnc_saveToTemplate;

["vehiclesBasic", ["C_Quadbike_01_black_F"]] call _fnc_saveToTemplate;
private _vehiclesLightUnarmed = ["a3a_Offroad_01_black_F"];
private _vehiclesLightArmed = ["a3a_Offroad_01_black_armed_F"];
["vehiclesTruck", ["I_G_Van_01_transport_F", "a3a_Van_02_black_transport_F", "a3a_Van_02_black_vehicle_F"]] call _fnc_saveToTemplate;
private _vehiclesAT = ["a3a_Offroad_01_black_AT_F"];
private _vehicleAA = [];

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["I_C_Plane_Civil_01_F"]] call _fnc_saveToTemplate;

private _vehiclesCivCar = ["C_Offroad_01_comms_F", "C_Offroad_01_covered_F","C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F"];
["vehiclesCivTruck", ["C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
private _vehiclesCivHeli = ["C_Heli_Light_01_civil_F", "a3a_C_Heli_Transport_02_F"];
["vehiclesCivBoat", ["C_Boat_Civil_01_F", "C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate;
private _staticAA = ["I_static_AA_F"];
private _staticMortars = ["I_G_Mortar_01_F"];
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;



if ("expansion" in A3A_enabledDLC) then {
    _vehiclesCivCar append ["C_Offroad_02_unarmed_F"];
    _vehiclesLightUnarmed append ["a3a_Offroad_02_black_unarmed_F"];
    _vehiclesLightArmed append ["a3a_Offroad_02_LMG_black_F"];
    _vehiclesAT append ["a3a_Offroad_02_black_AT_F"];
};

if ("rf" in A3A_enabledDLC) then {
    _vehiclesCivCar append ["C_Pickup_rf","C_Pickup_covered_rf"];
    _vehiclesLightUnarmed append ["a3a_black_Pickup_rf","a3a_black_Pickup_covered_rf"];
    _vehiclesLightArmed append ["a3a_black_Pickup_mmg_rf","a3a_black_Pickup_hmg_rf"];
    _staticMortars append ["I_G_CommandoMortar_rf"];
    _vehiclesCivHeli append ["C_Heli_EC_01A_civ_RF","C_Heli_EC_04_rescue_RF"];
};

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

if ("ws" in A3A_enabledDLC) then {
    _vehicleAA append ["a3a_ION_Truck_02_zu23_F"];
    _staticAA insert [0, ["I_Tura_ZU23_lxWS"]];
    _vehiclesLightUnarmed insert [1, ["a3a_ION_Offroad_armor"]];
    _vehiclesLightArmed insert [1, ["a3a_ION_Offroad_armor_armed"]];
    _vehiclesAT insert [1, ["a3a_ION_Offroad_armor_at"]];
};

["vehiclesCivHeli", _vehiclesCivHeli] call _fnc_saveToTemplate;
["staticMortars",_staticMortars] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAT] call _fnc_saveToTemplate;

["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

#include "Vanilla_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"hgun_Pistol_heavy_02_F","hgun_P07_blk_F","hgun_Rook40_F",
"sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug",
"6Rnd_45ACP_Cylinder","16Rnd_9x21_Mag","MiniGrenade","SmokeShell",
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_khk",
"V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr",
"V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt",
"Binocular","hgun_Pistol_Signal_F","6Rnd_GreenSignal_F","6Rnd_RedSignal_F",
"acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol"];

if ("expansion" in A3A_enabledDLC) then {
    _initialRebelEquipment append [["launch_RPG7_F", 15], ["RPG7_F", 45], "hgun_Pistol_01_F", "10Rnd_9x21_Mag"];
} else {
    _initialRebelEquipment append [["launch_RPG32_green_F", 15], ["RPG32_F", 30]];
};

if ("rf" in A3A_enabledDLC) then {
    _initialRebelEquipment append ["srifle_h6_blk_rf","10Rnd_556x45_AP_Stanag_red_RF","10Rnd_556x45_AP_Stanag_RF","10Rnd_556x45_AP_Stanag_green_RF"];
};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio && ("enoch" in A3A_enabledDLC)) then {
    _initialRebelEquipment append ["B_RadioBag_01_black_F", "B_RadioBag_01_digi_F", "a3a_B_RadioBag_01_oucamo_F", "a3a_B_RadioBag_01_wdl_F"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_C_E_LooterJacket_01_F",
    "U_I_L_Uniform_01_deserter_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_olive_F",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_O_R_Gorka_01_black_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_2_F"
];

private _dlcUniforms = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];
//They aren't DLC uniforms, but i think you get it

if ("expansion" in A3A_enabledDLC) then {
    _dlcUniforms append [
        "U_I_C_Soldier_Bandit_4_F",
        "U_I_C_Soldier_Bandit_1_F",
        "U_I_C_Soldier_Bandit_5_F",
        "U_I_C_Soldier_Para_2_F",
        "U_I_C_Soldier_Para_3_F",
        "U_I_C_Soldier_Para_5_F",
        "U_I_C_Soldier_Para_4_F",
        "U_I_C_Soldier_Para_1_F",
        "U_I_C_Soldier_Camo_F"
    ];
};

if ("ws" in A3A_enabledDLC) then {
    _dlcUniforms append [
        "U_lxWS_ION_Casual1",
        "U_lxWS_ION_Casual2",
        "U_lxWS_ION_Casual3",
        "U_lxWS_ION_Casual4",
        "U_lxWS_ION_Casual5",
        "U_lxWS_SFIA_deserter"
    ];
};

if ("rf" in A3A_enabledDLC) then {
    _dlcUniforms append [
        "U_IG_Guerrilla_RF",
        "U_IG_leader_RF"
    ];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_tan",
    "H_Cap_tan",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_Lyfe",
    "H_Cap_red",
    "H_Cap_blu",
    "H_Cap_headphones",
    "H_Bandanna_khk_hs",
    "H_Bandanna_blu",
    "H_Bandanna_cbr"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_6","LivonianHead_9","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01pol","Male02pol","Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["balaclavas", ["G_Balaclava_blk", "G_Balaclava_BlueStrips", "G_Balaclava_Flecktarn", "G_Balaclava_Halloween_01", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Balaclava_Flames1", "G_Balaclava_Scarecrow_01", "G_Balaclava_Skull1", "G_Balaclava_Tropentarn"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];
_loadoutData set ["argoFacemask", ["G_Bandanna_BlueFlame1", "G_Bandanna_BlueFlame2", "G_Bandanna_CandySkull", "G_Bandanna_OrangeFlame1", "G_Bandanna_RedFlame1", "G_Bandanna_Skull1", "G_Bandanna_Syndikat1", "G_Bandanna_Syndikat2","G_Bandanna_Skull2", "G_Bandanna_Vampire_01"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1, "balaclavas", 1, "argoFacemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1, "balaclavas", 1, "argoFacemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

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
