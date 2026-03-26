/*
    Server-side despawn function for both military and civ garrisons

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

Trace_1("Called with params %1", _this);

if !(_marker in A3A_garrisonMachine) exitWith {
    Error_1("Garrison %1 not spawned", _marker);
};

spawner setVariable [_marker, 2, true];

if ("_civ" in _marker) exitWith {
    ["despawnCiv", [_marker]] call A3A_fnc_garrisonOp;
    A3A_garrisonMachine deleteAt _marker;       // clear machine ID
    Trace("Completed");
};


// Things to clean up on despawn
if (_side != teamPlayer) then {
    // If it's an enemy marker then cleanup old/misplaced vehicles on despawn
    [_marker, false, false] call A3A_fnc_garrisonServer_cleanup;
} else {
    // If it's a rebel marker then update vehicle fuel/ammo state
    _marker call A3A_fnc_garrisonServer_updateVehData;
};

["despawn", [_marker]] call A3A_fnc_garrisonOp;

// If support vehicles are marked as broken then we fix them on despawn
private _garrison = A3A_garrison get _marker;
private _supportVehicles = _garrison get "supportVehicles";
private _supportsBusy = false;
{
    if (_y#0 == "broken") then {_y set [0, "ready"]};
    if (_y#0 == "busy") then {_supportsBusy = true};
} forEach _supportVehicles;

// If all the support vehicles are inactive then we can clear the machine ID
if (!_supportsBusy) then {
    Trace_1("Clearing machine ID for %1");
    A3A_garrisonMachine deleteAt _marker;       // clear machine ID
};
