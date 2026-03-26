["attributesVehicles", [

    // In AA arrays but really light-armed
    ["a3a_vn_b_wheeled_m54_mg_02", ["cost", 60], ["threat", 80]],
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
    ["vn_b_air_f100d_at", ["cost", 210]],
    ["vn_b_air_f100d_cap", ["cost", 200]],
    
    // PT76 with slightly better armor and gunner
    ["vn_o_armor_type63_01", ["cost", 180]]
]] call _fnc_saveToTemplate;

// S.O.G. Nickel Steel
if (isClass (configFile >> "CfgPatches" >> "vnx_credits")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append [
        // skyhawks, worse across the board than either of the real planes + restricted to aim9ds
        ["vnx_b_air_a4e_usmc_cas", ["cost", 180]],
        ["vnx_b_air_a4e_ran_cas", ["cost", 180]],
        ["vnx_b_air_a4e_rnzaf_cas", ["cost", 180]],
        ["vnx_b_air_a4e_ran_cap", ["cost", 200]],
        ["vnx_b_air_a4e_rnzaf_cap", ["cost", 200]],

        // silly COIN plane with MMG main guns, no guided munitions
        ["vnx_b_air_ov10a_mr", ["cost", 140]],
        ["vnx_b_air_ov10a_usmc_mr", ["cost", 140]],
        ["vnx_b_air_ov10a_aus_covey", ["cost", 140]]     
    ];
};