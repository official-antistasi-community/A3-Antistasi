


//Most vehicles below are inserted into categories that which normally has higher requirements in regular antistasi
//Due to this being WW2 and the cost being much more reasonable to modify than the weights.
//For example the SdKfz251 and the M3 Halftrack are used in the APC category despite only being suitable as lightAPCs, 
//putting them there though skews the weighting too much in their favour.
["attributesVehicles", [
    ["LIB_SdKfz_7_AA", ["cost", 80]],
    ["LIB_Zis5v_61K", ["cost", 60]], //There's a lack of AA vehicles in IFA for not-germany, fortunately AA vehicles aren't that important with IFA
    ["LIB_SdKfz251_captured_FFV", ["cost", 60]],
    ["LIB_SdKfz251", ["cost", 60]],
    ["LIB_SdKfz251_FFV", ["cost", 60]],
    ["LIB_US_M3_Halftrack", ["cost", 60]],
    ["LIB_SOV_M3_Halftrack", ["cost", 60]],
    ["LIB_UK_M3_Halftrack", ["cost", 60]],
    ["LIB_M8_Greyhound", ["cost", 80]],
    ["LIB_Ju87", ["cost", 75]],
    ["LIB_Pe2", ["cost", 75]],
    ["LIB_FW190F8", ["cost", 75]],
    ["LIB_FW190F8_2", ["cost", 75]],
    ["LIB_P47", ["cost", 75]],
    ["LIB_P39", ["cost", 75]],
    ["LIB_RA_P39_2", ["cost", 75]],
    ["LIB_RA_P39_3", ["cost", 75]],
    ["LIB_RAF_P39", ["cost", 75]],
    ["LIB_US_P39", ["cost", 75]],
    ["LIB_US_P39_2", ["cost", 75]]
]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append
    [
        ["FA_Sdkfz231", ["cost", 100]],
        ["FA_Sdkfz234", ["cost", 100]],
        ["FA_Sdkfz234_4", ["cost", 100]],
        ["FA_T17E1", ["cost", 80]],
        ["FA_DaimlerMk2", ["cost", 60]]
    ];
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append
    [
        ["FA_Panzer2", ["cost", 100]],
        ["FA_Pz38t", ["cost", 80]],
        ["FA_T26", ["cost", 60]]
    ];
};