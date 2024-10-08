/*
    Author: [Håkon]
    [Description]
        Returns the category index of a class

    Arguments:
    0. <String> Class you want to know the category index of

    Return Value:
    <Int> category index; -1 if it has no category, and -2 if it is found on the blacklist. Used for deleting the vehicle after being found on the blacklist.

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [_class] call HR_GRG_fnc_getCatIndex;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_class", "_vehicle", [""]]];
if ( !isClass (configFile >> "CfgVehicles" >> _class) ) exitWith { Error_1("Invalid Input: %1", _class); -1 };

/* _vtol = "getNumber (_x >> 'vtol') >= 0" configClasses (configFile >> "CfgVehicles");
_class in [_vtol]; */ 
//&& (getNumber (configOf _vehicle >> "isUav") == 0)
//case (getNumber (configOf _vehicle >> "isUav") > 0): { 2 };
private _editorCat = cfgEditorCat(_class);
switch (true) do {
    //filter blacklist first
    case (_class in HR_GRG_blacklistVehicles): { -2 };
    //vanilla
    case (_editorCat isEqualTo "EdSubcat_Cars"): { 0 };
    case (_editorCat in ["EdSubcat_Tanks","EdSubcat_APCs","EdSubcat_AAs","EdSubcat_Artillery"]): { 1 };
    case (_editorCat in ["EdSubcat_Helicopters"] || getNumber (configOf _vehicle >> "vtol") > 0): { 2 };
    //case (getNumber (configOf _vehicle >> "vtol") > 0): { 3 };
    case (_editorCat in ["EdSubcat_Planes"] && (getNumber (configOf _vehicle >> "vtol") == 0)): { 3 };
    case (_editorCat isEqualTo "EdSubcat_Boats"): { 4 };
    case (_editorCat isEqualTo "EdSubcat_Turrets"): { 5 };
    case (_class isKindOf "staticWeapon"): {5}; //some non-vanilla artillery is statics

    //rhs
    case (_editorCat in ["rhs_EdSubcat_car","rhs_EdSubcat_truck","rhs_EdSubcat_mrap"]): {0};
    case (_editorCat in ["rhs_EdSubcat_apc","rhs_EdSubcat_ifv","rhs_EdSubcat_tank","rhs_EdSubcat_aa","rhs_EdSubcat_artillery"]): {1};
    case (_editorCat in ["rhs_EdSubcat_helicopter","rhs_EdSubcat_helicopter_d","rhs_EdSubcat_helicopter_wd"]): { 2 };
    case (_editorCat in ["rhs_EdSubcat_aircraft"]): { 3 };
    case (_editorCat isEqualTo "rhs_EdSubcat_boat"): { 4 };

    //cup
    case (_editorCat in ["CUP_EdSubcat_Bikes","CUP_EdSubCat_Cars_Woodland","CUP_EdSubCat_UpHMMWV_Cars_Desert","CUP_EdSubCat_Cars_Winter"]): { 0 };

    //Fallback
    case (_class isKindOf "Car"): { 0 };
    case (_class isKindOf "Tank"): { 1 };
    case (_class isKindOf "Helicopter"): { 2 };
    case (_class isKindOf "Plane"): { 3 };
    case (_class isKindOf "Ship"): { 4 };
    //case (_class isKindOf "Static"): { 6 };

    default { -1 };
};
