/*
    Garrison-local function for despawning civilian "garrison"

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name (actually spawn key, citymarker + "_civ")

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
A3A_activeGarrison deleteAt _marker;

// Only have vehicles at the moment
{
    // Kinda sloppy but whatever
    if (_x getVariable ["markerX", ""] != _marker) then { continue };
    deleteVehicle _x;
} forEach (_garrison get "vehicles");
