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

private _vehID = -1;
private _index = if (_arrayType == "buildings") then {
    // Search for close building of correct type
    _garrison get "buildings" findIf { _x#0 == typeOf _vehicle and {getPosWorld _vehicle distance2d _x#1 < 0.1} };
} else {
    // Just find the vehicle with the right ID
    if (_vehicle isNil "A3A_vehID") exitWith {-1};
    _vehID = _vehicle getVariable "A3A_vehID";
    _garrison get "vehicles" findIf { _x#3 == _vehID };
};
if (_index < 0) exitWith { Error_2("Vehicle type %1 not found in garrison %2", typeof _vehicle, _marker) };

// Remove from server garrison data
(_garrison get _arrayType) deleteAt _index;
_vehicle setVariable ["markerX", nil, true];
_garrison get "supportVehicles" deleteAt _vehID;            // Remove from support vehicles array, if it's in there

// Recalculate HQ building reveal value
if (_arrayType == "buildings" && (_marker == "Synd_HQ")) then {call A3A_fnc_calcBuildingReveal};

// No local updates for civ as they don't need to manage anything atm
if ("_civ" in _marker) exitWith {};

// Remove from active garrison if spawned
// TODO: Need to handle support vehicles if we start using this for non-rebels
if (_marker in A3A_garrisonMachine) then {
    ["remVehicle", [_marker, _vehicle]] call A3A_fnc_garrisonOp;
};
