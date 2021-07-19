/*
    File: fn_crewTypeForVehicle.sqf
    Author: Spoffy, CalebSerafin

    Description:
        Guesses the correct crew type for the given vehicle.

    Parameter(s):
        _side - Side of the vehicle [SIDE]
        _vehicle - Vehicle to guess on [OBJECT]

    Returns:
        Unit type [STRING]

    Dependences:
        A3A_vehClassToCrew [HASHMAP]     // Should be declares in fn_initVarServer.sqf

    Example(s):
        [west,cursorObject] call A3A_fnc_crewTypeForVehicle;  // Returns some NATO Crew Unit type
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_side", "_vehicle"];

private _sideIndex = [west, east, independent, civilian] find _side;
private _typeX = typeOf _vehicle;
private _occGroups = FactionGet(occ,"groups");
private _invGroups = FactionGet(inv,"groups");
private _rebGroups = FactionGet(reb,"groups");

A3A_vehClassToCrew getOrDefault [_typeX,[_occGroups get "grunt", _invGroups get "grunt", _rebGroups get "staticCrew", "C_Man_1"]] select _sideIndex;
