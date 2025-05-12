//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "LIB_GazM1", 1.5, 
    "LIB_GazM1_dirty", 2.5,
    "LIB_CIV_FFI_CitC4", 0.125, 
    "LIB_CIV_FFI_CitC4_2", 0.125, 
    "LIB_CIV_FFI_CitC4_3", 0.125, 
    "LIB_GazM1_SOV_camo_sand", 1, 
    "LIB_GazM1_SOV", 1
    ]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "LIB_CIV_FFI_CitC4", 0.25, 
    "LIB_CIV_FFI_CitC4_2", 0.25, 
    "LIB_CIV_FFI_CitC4_3", 0.25
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "B_Boat_Transport_01_F", 0.7
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
]] call _fnc_saveToTemplate;

#include "SPE_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","SPE_Connors","SPE_Ivanych","SPE_OBrien","SPE_Vasiliev","WhiteHead_02","WhiteHead_04","WhiteHead_05","WhiteHead_09","WhiteHead_11","WhiteHead_13","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
"SPE_FrenchMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_SPE_CIV_Citizen_1",
    "U_SPE_CIV_Citizen_1_tie",
    "U_SPE_CIV_Citizen_1_trop",
    "U_SPE_CIV_Citizen_2",
    "U_SPE_CIV_Citizen_2_tie",
    "U_SPE_CIV_Citizen_2_trop",
    "U_SPE_CIV_Citizen_3",
    "U_SPE_CIV_Citizen_3_tie",
    "U_SPE_CIV_Citizen_4",
    "U_SPE_CIV_Citizen_4_tie",
    "U_SPE_CIV_Citizen_4_trop",
    "U_SPE_CIV_Citizen_5",
    "U_SPE_CIV_Citizen_5_tie",
    "U_SPE_CIV_Citizen_5_trop",
    "U_SPE_CIV_Citizen_6",
    "U_SPE_CIV_Citizen_6_tie",
    "U_SPE_CIV_Citizen_6_trop",
    "U_SPE_CIV_Citizen_7",
    "U_SPE_CIV_Citizen_7_tie",
    "U_SPE_CIV_Citizen_7_trop"
];

private _pressUniforms = [
    "U_SPE_CIV_pak2_bruin",
    "U_SPE_CIV_pak2_bruin_swetr",
    "U_SPE_CIV_pak2_bruin_tie",
    "U_SPE_CIV_pak2_grijs",
    "U_SPE_CIV_pak2_grijs_swetr",
    "U_SPE_CIV_pak2_grijs_tie",
    "U_SPE_CIV_pak2_zwart",
    "U_SPE_CIV_pak2_zwart_alt",
    "U_SPE_CIV_pak2_zwart_swetr",
    "U_SPE_CIV_pak2_zwart_tie",
    "U_SPE_CIV_pak2_zwart_tie_alt"
    ];            //Uniforms given to Press/Journalists

private _workerUniforms = [
    "U_SPE_CIV_Worker_1",
    "U_SPE_CIV_Worker_1_tie",
    "U_SPE_CIV_Worker_1_trop",
    "U_SPE_CIV_Worker_2",
    "U_SPE_CIV_Worker_2_tie",
    "U_SPE_CIV_Worker_2_trop",
    "U_SPE_CIV_Worker_3",
    "U_SPE_CIV_Worker_3_tie",
    "U_SPE_CIV_Worker_3_trop",
    "U_SPE_CIV_Worker_4",
    "U_SPE_CIV_Worker_4_tie",
    "U_SPE_CIV_Worker_4_trop",
    "U_SPE_CIV_Worker_Coverall_1",
    "U_SPE_CIV_Worker_Coverall_1_trop",
    "U_SPE_CIV_Worker_Coverall_2",
    "U_SPE_CIV_Worker_Coverall_2_trop",
    "U_SPE_CIV_Worker_Coverall_3",
    "U_SPE_CIV_Worker_Coverall_3_trop"
    ];           //Uniforms given to Workers at Factories/Resources

["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civHats = [
    "H_SPE_CIV_Fedora_Cap_1",
    "H_SPE_CIV_Fedora_Cap_2",
    "H_SPE_CIV_Fedora_Cap_3",
    "H_SPE_CIV_Fedora_Cap_5",
    "H_SPE_CIV_Fedora_Cap_6",
    "H_SPE_CIV_Worker_Cap_2",
    "H_SPE_CIV_Worker_Cap_3"
    ];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.


private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_SPE_CIV_Fedora_Cap_1","H_SPE_CIV_Fedora_Cap_2","H_SPE_CIV_Fedora_Cap_3","H_SPE_CIV_Fedora_Cap_4","H_SPE_CIV_Fedora_Cap_5"]];
_loadoutData set ["workerHelmets", ["","H_SPE_CIV_Worker_Cap_1","H_SPE_CIV_Worker_Cap_2","H_SPE_CIV_Worker_Cap_3"]];
_loadoutData set ["facewear", ["G_SPE_Cigarette_Belomorkanal","G_SPE_Cigarette_Grundstein","G_SPE_Dienst_Brille","G_SPE_Pipe_Sir_Winston"]];

_loadoutData set ["maps", ["ItemMap"]];

private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
};
private _workerTemplate = {
    ["workerHelmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressUniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;