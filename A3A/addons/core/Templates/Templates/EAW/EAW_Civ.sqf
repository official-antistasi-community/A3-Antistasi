//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "LIB_GazM1_dirty", 1,
    "LIB_GazM1", 0.5,
    "LIB_UK_DR_Willys_MB_Hood", 0.1,
    "LIB_UK_DR_Willys_MB", 0.1
    ]] call _fnc_saveToTemplate;             //this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", ["EAW_Dodge1936_Pickup", 0.3]] call _fnc_saveToTemplate;             //this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", []] call _fnc_saveToTemplate;             //this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", ["B_Boat_Transport_01_F", 0.2]] call _fnc_saveToTemplate;             //this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", []] call _fnc_saveToTemplate;            //this line determines civilian repair vehicles

["vehiclesCivMedical", ["EAW_Dodge1936_Pickup_Military_Medical_IJA", 0.02]] call _fnc_saveToTemplate;        //this line determines civilian medic vehicles

["vehiclesCivFuel", []] call _fnc_saveToTemplate;            //this line determines civilian fuel vehicles

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
"ChineseMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = ["EAW_Civ_Robe_Grey","EAW_Civ_Robe_BlueGrey","EAW_Civ_Robe_Uniform_Blue","EAW_Civ_1_Uniform_White","EAW_Civ_1_Uniform_Tan","EAW_Civ_1_Uniform_Grey","EAW_Civ_1_Uniform_Brown","EAW_Civ_1_Uniform"];          //Uniforms given to Normal Civs

private _pressUniforms = ["EAW_Civ_1_Uniform_White","EAW_Civ_1_Uniform_Tan","EAW_Civ_1_Uniform_Grey","EAW_Civ_1_Uniform_Brown","EAW_Civ_1_Uniform"];            //Uniforms given to Press/Journalists

private _workerUniforms = ["EAW_Civ_1_Uniform_White","EAW_Civ_1_Uniform_Tan","EAW_Civ_1_Uniform_Grey","EAW_Civ_1_Uniform_Brown","EAW_Civ_1_Uniform"];           //Uniforms given to Workers at Factories/Resources



["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = ["EAW_SunHat"];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", ["U_LIB_UK_KhakiDrills"]];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Plain_crystal_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_LIB_UK_Helmet_Mk2_Cover_w"]];
_loadoutData set ["pressFacewear", ["G_LIB_Binoculars"]];
_loadoutData set ["facewear", ["EAW_Glasses"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];



private _manTemplate = {
    if (random 10 > 7) then {
        ["helmets"] call _fnc_setHelmet;
    };
    ["uniforms"] call _fnc_setUniform;
    if (random 10 > 7) then {
        ["facewear"] call _fnc_setFacewear;
    };

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;
    if (random 10 > 7) then {
        ["facewear"] call _fnc_setFacewear;
    };

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;
    ["pressFacewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate, nil, 10],
    ["Man", _manTemplate, nil, 10]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;