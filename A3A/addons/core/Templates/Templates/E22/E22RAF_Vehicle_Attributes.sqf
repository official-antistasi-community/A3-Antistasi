["attributesVehicles", [
    // CSAT heavy tank
    ["O_MBT_04_cannon_F", ["cost", 230]],
    ["O_MBT_04_cannon_F", ["cost", 230]],
    ["O_MBT_04_command_F", ["cost", 250], ["threat", 330]], //Has 30mm auto cannon commander turret
    ["O_MBT_04_command_F", ["cost", 250], ["threat", 330]],    // -||-

    // Modern bulky IFV
    ["min_rf_t_15", ["cost", 150], ["threat", 150]],
    ["min_rf_t_15_winter", ["cost", 150], ["threat", 150]],
    ["min_rf_t_15_desert", ["cost", 150], ["threat", 150]],

    // Incredibly capable air defense system
    ["min_rf_sa_22", ["cost", 200], ["threat", 270]],
    ["min_rf_sa_22_winter", ["cost", 200], ["threat", 270]],
    ["min_rf_sa_22_desert", ["cost", 200], ["threat", 270]]
]] call _fnc_saveToTemplate;