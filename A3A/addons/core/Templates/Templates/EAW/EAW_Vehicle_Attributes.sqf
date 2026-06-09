


//Most vehicles below are inserted into categories that which normally has higher requirements in regular antistasi
//Due to this being WW2 and the cost being much more reasonable to modify than the weights.
//For example the SdKfz251 and the M3 Halftrack are used in the APC category despite only being suitable as lightAPCs, 
//putting them there though skews the weighting too much in their favour.


(["attributesVehicles"] call _fnc_getFromTemplate) append [
    ["EAW_Type89_1937",     ["cost", 150], ["threat", 300]],
    ["EAW_ChiHa",           ["cost", 150], ["threat", 300]],
    ["EAW_ChiHa_Kai",       ["cost", 150], ["threat", 300]],
    ["EAW_T26_NRA",         ["cost", 150], ["threat", 300]],
    ["EAW_Vickers6Ton",     ["cost", 150], ["threat", 300]],

    ["EAW_Ki27_AI",         ["cost", 75]],
    ["EAW_Ki43_II_AI",      ["cost", 75]],
    ["EAW_Ki43_II",         ["cost", 75]],
    ["EAW_HawkIII_AI",      ["cost", 75]],
    ["EAW_i16_AI",          ["cost", 75]],
    ["EAW_AVG_P40_AI",      ["cost", 75]],
    ["EAW_HawkIII",         ["cost", 75]],
    ["EAW_i16",             ["cost", 75]],
    ["EAW_AVG_P40",         ["cost", 75]]

];

#include "..\..\AircraftLoadouts\SAB\SAB_Vehicle_Attributes.sqf"