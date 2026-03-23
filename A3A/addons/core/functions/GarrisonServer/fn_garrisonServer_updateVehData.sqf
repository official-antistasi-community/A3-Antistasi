/*
    Server-side function to store state for rebel garrison vehicles on despawn/save

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

// Can't use the local garrison due to despawn->spawn timing issue
// Maybe should workaround that with spawn lockout? later
// Relies on object being somewhere near the original, because we don't store IDs.

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with params %1", _this);

params ["_marker"];

// Nothing to do for enemy garrisons, they resupply automatically?
if (sidesX getVariable _marker != teamPlayer) exitWith {};

// Can't actually tell whether garrison is spawned here... huh
private _garrison = A3A_garrison get _marker;
private _spawnPlaces = A3A_spawnPlacesHM get _marker;

{
    //if (_x#1 isEqualType 0) then { continue };                     // don't bother dealing with placed vehicles for now
    private _posATL = if (_x#1 isEqualType 0) then { _spawnPlaces#(_x#1)#1 } else { ASLtoATL (_x#1#0) };
    private _veh = nearestObject [_posATL, _x#0];          // position, type
    // sanity checks?
    private _reason = call {
        if (isNull _veh) exitWith { "missing" };
        if (!alive _veh) exitWith { "dead" };
        if (_x#3 != _veh getVariable ["A3A_vehID", -1]) exitWith { "wrongVID" };
    };
    if (!isNil "_reason") then {
        Error_3("Vehicle type %1 not found in %2, reason: %3", _x#0, _marker, _reason);
        continue;
    };
    // Update pos/dir, in case it got nudged
    if (_x#1 isEqualType []) then { _x set [1, [getPosWorld _veh, vectorDir _veh, vectorUp _veh]] };
    _x set [2, _veh call HR_GRG_fnc_getState];

} forEach (_garrison get "vehicles");
