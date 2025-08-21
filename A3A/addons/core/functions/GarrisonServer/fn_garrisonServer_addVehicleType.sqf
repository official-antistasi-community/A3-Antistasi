/*
    Server-side function to add vehicle/static of specific type to enemy garrison
    Slot type/number selected at higher level

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <STRING> Classname of vehicle to add to garrison.
    <NUMBER> Slot number to place vehicle (index into spawnPlaces).

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehClass", "_slotNum"];

Trace_1("Called with params %1", _this);

if (sidesX getVariable _marker == teamPlayer) exitWith {
    Error("Attempted to add vehicle type to rebel garrison");
};

private _garrison = A3A_garrison get _marker;
(_garrison get "vehicles") pushBack [_vehClass, _slotNum];

// Add to active garrison if spawned
if (_marker in A3A_garrisonMachine) then {
    ["addVehicleType", [_marker, _vehClass, _slotNum]] call A3A_fnc_garrisonOp;
};
