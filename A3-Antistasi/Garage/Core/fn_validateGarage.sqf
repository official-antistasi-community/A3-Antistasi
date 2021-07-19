/*
    Author: [Håkon]
    Description:
        Validates the vehicle entries in the garage

    Arguments: <nil>

    Return Value: <nil>

    Scope: Server
    Environment: Any
    Public: Yes
    Dependencies: HR_GRG_Vehicles, HR_GRG_Sources

    Example: [] call HR_GRG_fnc_validateGarage;

    License: Håkon Rydland Garage SHARED SOURCE LICENSE
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
//find invalid vehicle class entries
private _invalidentries = [];
private _cfg = (configFile >> "CfgVehicles");
{
    private _cat = _x;
    private _catIndex = _forEachIndex;
    {
        Debug_2("Value X: %1 - Y: %2", _x, _y);
        private _class = _y#1;
        if !(isClass (_cfg >> _class)) then {_invalidentries pushBack [_catIndex, _x]};
    } forEach _x;
} forEach HR_GRG_Vehicles;

{
    //remove invalid classes from garage pool
    _x params ["_catIndex", "_entry"];
    private _cat = HR_GRG_Vehicles#_catIndex;
    private _vehicle = _cat deleteAt _entry;
    Info_1("Removing invalid class: %1", _vehicle#1);

    //clear them from the source registre
    private _sourceType = HR_GRG_Sources findIf {_entry in _x};
    if (_sourceType > -1) then {
        private _sources = HR_GRG_Sources#_sourceType;
        _sources deleteAt (_sources find _entry);
    };
} forEach _invalidentries;
