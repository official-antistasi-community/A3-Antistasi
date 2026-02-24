/*
    Server-side function for adding IDs to garrison vehicles and initializing the support data

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _garrison = A3A_garrison get _marker;
private _nextID = 1;
{ _x set [3, _nextID]; _nextID = _nextID + 1 } forEach (_garrison get "vehicles");
//{ _x set [4, _nextID]; _nextID = _nextID + 1 } forEach (_garrison getOrDefault ["buildings", []]);     // cities don't have buildings

// Register support vehicles in garrison (arty, SAM etc)
// Uses hashmap of vehicle class -> support type
// May as well run this for rebels too? Makes airfield swaps simpler
private _supportVehicles = createHashMap;
{
    private _supportType = A3A_supportVehTypes get _x#0;
    _supportVehicles set [_x#3, ["ready", _supportType, _x]];
} forEach (_garrison get "vehicles" select {_x#0 in A3A_supportVehTypes});

_garrison set ["supportVehicles", _supportVehicles];
_garrison set ["nextVehID", _nextID];
