["attributesVehicles", [
    ["I_C_Offroad_02_LMG_F", ["rebCost", 500]],
    ["I_C_Offroad_02_unarmed_F", ["rebCost", 150]], //Slow, 4 seats only
    
    ["a3a_C_Heli_Transport_02_F", ["rebCost", 8000]]

]] call _fnc_saveToTemplate;

//Western Sahara Vehicles, 
if (isClass (configFile >> "CfgPatches" >> "Vehicles_F_lxWS")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append [
        ["I_G_Offroad_01_armor_base_lxWS", ["rebCost", 400], ["threat", 20]],
        ["I_G_Offroad_01_armor_armed_lxWS", ["rebCost", 900], ["threat", 60]],
        ["I_G_Offroad_01_armor_AT_lxWS", ["rebCost", 900], ["threat", 60]],
        ["a3a_ION_Offroad_armor", ["rebCost", 400], ["threat", 20]],
        ["a3a_ION_Offroad_armor_armed", ["rebCost", 900], ["threat", 60]],
        ["a3a_ION_Offroad_armor_at", ["rebCost", 900], ["threat", 60]]
    ];
};

//Reaction Forces Vehicles
if (isClass (configFile >> "CfgPatches" >> "RF_Vehicles")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append [
        ["C_Heli_EC_01A_civ_RF", ["rebCost", 8000]],
        ["C_Heli_EC_04_rescue_RF", ["rebCost", 8000]],
        ["C_Pickup_rf", ["rebCost", 250]],
        ["C_Pickup_covered_rf", ["rebCost", 250]],
        ["a3a_FIA_Pickup_hmg_rf", ["rebCost", 900]]
    ];
};
