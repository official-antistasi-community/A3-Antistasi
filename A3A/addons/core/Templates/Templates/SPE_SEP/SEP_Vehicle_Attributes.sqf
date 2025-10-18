
#include "..\SPEX\SPE_Vehicle_Attributes.sqf"


(["attributesVehicles"] call _fnc_getFromTemplate) append [
    // WW2 planes are not super effective
    ["SEP_I_US_WIN_P47D", ["cost", 75]],
    ["SEP_B_GER_WIN_FW190F8", ["cost", 75]],
	
    ["SEP_I_IHTC_M3A1_Halftrack", ["cost", 60]],
    ["SEP_I_US_WIN_M3A1_Halftrack", ["cost", 60]],
    ["SEP_I_US_WIN_M20_AUC", ["cost", 60]],
    ["SEP_I_IHTC_M20_AUC", ["cost", 60]],

    // M8 is too powerful for a lightarmed and not powerful enough for lighttank
    ["SEP_I_US_WIN_M8_LAC", ["cost", 80]],
    ["SEP_I_US_WIN_M8_LAC_ringMount", ["cost", 80]]
];