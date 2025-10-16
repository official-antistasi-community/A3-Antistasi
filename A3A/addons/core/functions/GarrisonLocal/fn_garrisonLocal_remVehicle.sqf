/*
    Garrison-local function to remove vehicle object from active garrison data.

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <OBJECT> Vehicle to remove from garrison.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_vehicle"];

// Will happen if the vehicle was deleted immediately after. Probably not an issue.
if (isNull _vehicle) exitWith {};

private _garrison = A3A_activeGarrison get _marker;

private _arrayType = call {
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    if (typeof _vehicle in A3A_utilityItemHM) exitWith {"vehicles"};
    "buildings";
};
private _array = _garrison get _arrayType;
_array deleteAt (_array find _vehicle);

{
    if (_x getVariable ["markerX", ""] == _marker) then { unassignVehicle _x; moveOut _x };
} forEach crew _vehicle;
