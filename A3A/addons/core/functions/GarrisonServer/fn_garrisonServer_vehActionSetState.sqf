/*
    Set server-side state of support vehicle. Usually called from local garrison.

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison. Empty string to autodetect from vehicle position.
    <NUMBER> Support vehicle ID.
    <STRING> State to change to. "ready", "busy", "broken"

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehID", "_state"];

Trace_1("Called with params %1", _this);

private _garrison = A3A_garrison get _marker;
private _supportVehicles = _garrison get "supportVehicles";
if !(_vehID in _supportVehicles) then {
    // Might be true if a vehAction was cancelled by removing a vehicle from the garrison
    Debug_2("No support data for vehicle ID %1 in %2", _vehID, _marker); 
} else {
    _supportVehicles get _vehID set [0, _state];
};

// If all support vehicles are ready, and garrison isn't spawned, then we can drop the machine ID
if (spawner getVariable _marker != 2) exitWith {};
if (values _supportVehicles findIf { _x#0 != "ready" } == -1) then {
    Trace_1("Clearing machine ID for %1");
    A3A_garrisonMachine deleteAt _marker;       // clear machine ID
};
