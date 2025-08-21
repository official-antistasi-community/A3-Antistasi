/*
    Server-side spawn function for both military and civ garrisons

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

if (_marker in A3A_garrisonMachine) exitWith {
    Error_1("Garrison %1 already spawned", _marker);
};
if (_marker in A3A_markersToDelete) exitWith {
    Error_1("Garrison %1 being deleted, spawn blocked", _marker);
};

spawner setVariable [_marker, 0, true];

private _machineID = if (_marker == "Synd_HQ") then { 2 } else { call A3A_fnc_chooseMachineForGarrison };
A3A_garrisonMachine set [_marker, _machineID];

private _data = A3A_garrison get _marker;
if ("_civ" in _marker) then {
    ["spawnCiv", [_marker, _data]] call A3A_fnc_garrisonOp;
} else {
    private _side = sidesX getVariable _marker;
    ["spawn", [_marker, _data, _side]] call A3A_fnc_garrisonOp;
};
