/*
    Server-side function for reinforcing enemy towns

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <NUMBER> Troop count to add (usually fractional)

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_troopCount"];

Trace_1("Called with params %1", _this);

// Add to the server garrison data store

private _garrison = A3A_garrison get _marker;
private _troops = _garrison get "troops";
if (_troops#0 >= A3A_garrisonSize get _marker) exitWith {};         // maxed
private _reinf = _troopCount + (_garrison getOrDefault ["reinfCount", 0]);

while {_reinf >= 2} do {
    _troops set [0, (_troops#0) + 2];
    _reinf = _reinf - 2;
    if (_marker in A3A_garrisonMachine) then {
        ["cityReinf", [_marker, _troops#1]] call A3A_fnc_garrisonOp;
    };
};
_garrison set ["reinfCount", _reinf];
