// Store state for rebel garrison vehicles on despawn/save
// Server-side, unscheduled
// Can't use the local garrison due to despawn->spawn timing issue
// Maybe should workaround that with spawn lockout? later

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with params %1", _this);

params ["_marker"];

// Nothing to do for enemy garrisons, they resupply automatically?
if (sidesX getVariable _marker != teamPlayer) exitWith {};

// Can't actually tell whether garrison is spawned here... huh
private _garrison = A3A_garrison get _marker;

private _usedVehicles = [];
{
    private _veh = nearestObject [_x#1, _x#0];          // position, type
    // sanity checks?
    private _reason = call {
        if (isNull _veh) exitWith { "missing" };
        if (!alive _veh) exitWith { "dead" };
        if (_veh getVariable "markerX" != _marker) exitWith { "notMarker" };
        if (_veh in _usedVehicles) exitWith { "used" };
    };
    if (!isNil "_reason") then {
        Error_3("Vehicle type %1 not found in %2, reason: %3", _x#0, _marker, _reason);
        continue;
    };
    _x set [4, _veh call HR_GRG_getVehState];
    _usedVehicles pushBack _veh;
} forEach (_garrison get "vehicles");

Trace("Completed");
