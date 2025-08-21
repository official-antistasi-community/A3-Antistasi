/*
    Server-side function to dispatch a garrison op to appropriate machine

    Environment: Server, scheduled or unscheduled

    Arguments:
    <STRING> Garrison op type.
    <ARRAY> Parameters for garrison op. First parameter is always marker name.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_opType", "_params"];
private _marker = _params # 0;

Trace_1("Called with params %1", _this);

// Also prevents any attempt to send ops to markersToDelete
if !(_marker in A3A_garrisonMachine) exitWith {
    Error_2("Attempted to send op %1 to inactive marker %2", _opType, _marker);
};

isNil {
    private _machineID = A3A_garrisonMachine get _marker;
    [[_opType, _params], { A3A_garrisonOps pushBack _this }] remoteExecCall ["call", _machineID];
};
