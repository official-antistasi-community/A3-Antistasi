//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", ["EAW_Dodge1936_Pickup", 1]] call _fnc_saveToTemplate;             //this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", ["EAW_Dodge1936_Pickup", 1]] call _fnc_saveToTemplate;             //this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", []] call _fnc_saveToTemplate;             //this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", []] call _fnc_saveToTemplate;             //this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", []] call _fnc_saveToTemplate;            //this line determines civilian repair vehicles

["vehiclesCivMedical", ["EAW_Dodge1936_Pickup_Military_Medical_IJA", 1]] call _fnc_saveToTemplate;        //this line determines civilian medic vehicles

["vehiclesCivFuel", []] call _fnc_saveToTemplate;            //this line determines civilian fuel vehicles

/////////////////////
///  Identities   ///
/////////////////////

["faces", []] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = ["EAW_Civ_Robe_Grey","EAW_Civ_Robe_BlueGrey","EAW_Civ_Robe_Uniform_Blue","EAW_Civ_1_Uniform_White","EAW_Civ_1_Uniform_Tan","EAW_Civ_1_Uniform_Grey","EAW_Civ_1_Uniform_Brown","EAW_Civ_1_Uniform"];          //Uniforms given to Normal Civs

private _pressUniforms = [];            //Uniforms given to Press/Journalists

private _workerUniforms = [];           //Uniforms given to Workers at Factories/Resources

private _dlcUniforms = [];          //Uniforms given if DLCs are enabled, only given to the Arsenal not Civilians


["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = ["EAW_SunHat"];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

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
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _manTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;