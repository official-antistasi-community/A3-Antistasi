
#include "IFA_CIV_Common.sqf"

"RussianMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////


private _pressUniforms = [
"U_LIB_CIV_Functionary_1", 
"U_LIB_CIV_Assistant", 
"U_LIB_CIV_Assistant_2", 
"U_LIB_CIV_Doctor", 
"U_LIB_CIV_Schoolteacher", 
"U_LIB_CIV_Schoolteacher_2"
];            //Uniforms given to Press/Journalists

["uniforms", _civUniforms + ["U_LIB_CIV_Functionary_1"] + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = [
"H_LIB_CIV_Villager_Cap_1",
"H_LIB_CIV_Villager_Cap_2",
"H_LIB_CIV_Villager_Cap_3",
"H_LIB_CIV_Villager_Cap_4"
];

if(A3A_climate == "arctic") then {
    _civhats append [
    "H_LIB_CIV_Worker_Cap_1",
    "H_LIB_CIV_Worker_Cap_2",
    "H_LIB_CIV_Worker_Cap_3",
    "H_LIB_CIV_Worker_Cap_4"
    ];
};

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

_civhats append ["H_HeadBandage_clean_F", "H_HeadBandage_stained_F", "H_HeadBandage_bloody_F"];

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", []];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", []];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;