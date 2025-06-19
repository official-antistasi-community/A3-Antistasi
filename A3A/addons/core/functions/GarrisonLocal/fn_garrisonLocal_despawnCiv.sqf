// Despawn any garrison
// Also used for removing rebel roadblocks/watchposts

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
