/*
    Server-side function to remove active vehicle from garrison
    Only used by rebels at the moment?

    Environment: Unscheduled, server

    Arguments:
    <OBJECT> Vehicle to remove from garrison (garrison autodetected).

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicle"];

Trace_1("Called with params %1", _this);

private _marker = _vehicle getVariable "markerX";
if (isNil "_marker") exitWith { Error_1("Vehicle %1 not in a garrison", _vehicle) };

private _garrison = A3A_garrison get _marker;

private _arrayType = call {
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    if (typeof _vehicle in A3A_utilityItemHM) exitWith {"vehicles"};
    "buildings";
};

// Search for closest vehicle of correct type
private _spawnPlaces = A3A_spawnPlacesHM get _marker;
private _index = -1;
private _minDist = 1e6;
{
    if (typeof _vehicle != _x#0) then { continue };     // wrong vehicle type
    private _placePos = if (_x#1 isEqualType 0) then { _spawnPlaces#(_x#1)#1 } else { _x#1 };
    private _dist = _vehicle distance2d _placePos;
    if (_dist < _minDist) then { _index = _forEachIndex; _minDist = _dist };
} forEach (_garrison get _arrayType);

if (_index < 0) exitWith { Error_2("Vehicle type %1 not found in garrison %2", typeof _vehicle, _marker) };

// Remove from server garrison data
(_garrison get _arrayType) deleteAt _index;
_vehicle setVariable ["markerX", nil, true];

// No local updates for civ as they don't need to manage anything atm
if ("_civ" in _marker) exitWith {};

// Remove from active garrison if spawned
if (_marker in A3A_garrisonMachine) then {
    ["remVehicle", [_marker, _vehicle]] call A3A_fnc_garrisonOp;
};
