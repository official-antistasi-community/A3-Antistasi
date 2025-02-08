["attributesVehicles", [
    // WW2 planes are not super effective
    ["SPE_P47", ["cost", 75]],
    ["SPE_FW190F8", ["cost", 75]],

    ["SPE_US_M3_Halftrack", ["cost", 60]],
    ["SPE_M20_AUC", ["cost", 60]],
    // M8 is too powerful for a lightarmed and not powerful enough for lighttank
    ["SPE_M8_LAC", ["cost", 80]],
    ["SPE_M8_LAC_ringMount", ["cost", 80]]

]] call _fnc_saveToTemplate;
