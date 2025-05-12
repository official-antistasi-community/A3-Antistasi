#include "..\Vanilla\Vanilla_Vehicle_Attributes.sqf"
(["attributesVehicles"] call _fnc_getFromTemplate) append
[
    ["B_ION_APC_Wheeled_01_cannon_lxWS", ["cost", 100], ["threat", 120]],
    ["B_ION_APC_Wheeled_01_command_lxWS", ["cost", 70], ["threat", 120]],
    
    ["B_ION_Heli_Light_02_dynamicLoadout_lxWS", ["cost", 100]],
    
    ["B_D_Heli_Light_01_dynamicLoadout_lxWS", ["cost", 100]],

    ["a3a_ION_Truck_02_zu23_F", ["cost", 60]],
    ["O_SFIA_Truck_02_aa_lxWS", ["cost", 60]],
    
    ["a3a_Heli_Light_01_dynamicLoadout_ION_F", ["cost", 100]],
    ["a3a_Heli_Light_02_black_F", ["cost", 90]],

    ["a3a_Plane_Fighter_03_grey_F", ["cost", 200]]
];