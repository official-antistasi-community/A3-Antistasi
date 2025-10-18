/*
    Server-side function to add currently-existing vehicle to garrison data
    Will remove from any current garrison

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison. Empty string to autodetect from vehicle position.
    <OBJECT> Vehicle to add to garrison.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehicle", ["_doRevealCalc", true]];

Trace_1("Called with params %1", _this);

private _oldMarker = _vehicle getVariable "markerX";
if (!isNil "_oldMarker") then { [_vehicle] call A3A_fnc_garrisonServer_remVehicle };

if (_marker == "") then { _marker = [getPosATL _vehicle] call A3A_fnc_getMarkerForPos };
if (_marker == "") exitWith {};

private _garrison = A3A_garrison get _marker;
private _arrayType = call {
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    if (typeof _vehicle in A3A_utilityItemHM) exitWith {"vehicles"};
    "buildings";
};

if (_arrayType == "buildings" and _marker == "Synd_HQ") then {
    _garrison get "spawnedBuildings" pushBack _vehicle;
    if (_doRevealCalc) then {call A3A_fnc_calcBuildingReveal};
};

(_garrison get _arrayType) pushBack [typeOf _vehicle, getPosWorld _vehicle, vectorDir _vehicle, vectorUp _vehicle];

_vehicle setVariable ["markerX", _marker, true];
_vehicle setVariable ["A3A_resPool", "garrison", true];

// Add to active garrison if spawned
if (_marker in A3A_garrisonMachine) then {
    _vehicle setOwner (A3A_garrisonMachine get _marker);           // TODO: potential driver issues?
    ["addVehicle", [_marker, _vehicle]] call A3A_fnc_garrisonOp;
} else {
    deleteVehicle _vehicle;
};
