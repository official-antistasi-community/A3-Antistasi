["attributesVehicles", [

    // In AA arrays but really light-armed
    ["vn_b_wheeled_m54_mg_02", ["cost", 60], ["threat", 80]],
    ["vn_o_wheeled_btr40_mg_03", ["cost", 60], ["threat", 80]],
    ["vn_o_wheeled_z157_mg_02", ["cost", 60], ["threat", 80]],

    // Filling out APC arrays but they're just trucks 
    ["vn_o_wheeled_z157_01", ["cost", 20], ["threat", 0]],
    ["vn_o_wheeled_z157_02", ["cost", 20], ["threat", 0]],

    // Filling out attack helis, but closer to light attack
    ["vn_o_air_mi2_04_02", ["cost", 130]],
    ["vn_o_air_mi2_04_04", ["cost", 130]],

    // These are probably not super effective
    ["vn_o_air_mig19_at", ["cost", 150]],
    ["vn_o_air_mig19_cap", ["cost", 200]],
    ["vn_b_air_f100d_at", ["cost", 150]],
    ["vn_b_air_f100d_cap", ["cost", 200]],
    
    // PT76 with slightly better armor and gunner
    ["vn_o_armor_type63_01", ["cost", 180]]

]] call _fnc_saveToTemplate;
