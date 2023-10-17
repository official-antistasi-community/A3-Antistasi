["attributesVehicles", [
    // Attack helis with only fixed miniguns
    ["O_Heli_Light_02_dynamicLoadout_F", ["cost", 100]],
    ["O_Heli_Light_02_F", ["cost", 100]],
    ["B_Heli_Light_01_armed_F", ["cost", 100]],
    ["B_Heli_Light_01_dynamicLoadout_F", ["cost", 100]],
    ["I_E_Heli_light_03_dynamicLoadout_F", ["cost", 100]],

    // AAF trash CAS
    ["I_Plane_Fighter_03_dynamicLoadout_F", ["cost", 200]],
    
    // NATO AFV - Tank Destroyer
    ["B_T_AFV_Wheeled_01_cannon_F", ["cost", 230], ["threat", 300]],
    ["B_AFV_Wheeled_01_cannon_F", ["cost", 230], ["threat", 300]],
    ["B_T_AFV_Wheeled_01_up_cannon_F", ["cost", 230], ["threat", 300]],
    ["B_AFV_Wheeled_01_up_cannon_F", ["cost", 230], ["threat", 300]],
    
    // CSAT Tank
    ["O_MBT_04_cannon_F", ["cost", 230]],
    ["O_MBT_04_cannon_F", ["cost", 230]],
    ["O_MBT_04_command_F", ["cost", 250], ["threat", 330]], //Has 30mm auto cannon commander turret
    ["O_MBT_04_command_F", ["cost", 250], ["threat", 330]]    // -||-

]] call _fnc_saveToTemplate;
