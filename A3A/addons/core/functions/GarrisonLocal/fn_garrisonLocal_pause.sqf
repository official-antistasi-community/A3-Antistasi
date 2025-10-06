/*
    Garrison-local function to hide & disable sim for garrison units & vehicles

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
_garrison set ["paused", true];

// don't bother with buildings? or hideobject only?
private _toChange = (_garrison get "troops") + (_garrison get "civs") + (_garrison get "vehicles");
_toChange = _toChange select { alive _x };

{ _x enableSimulationGlobal false; _x allowDamage false } forEach _toChange;
if (clientOwner == 2) exitWith { { _x hideObjectGlobal true } forEach _toChange };
[_toChange, { { _x hideObjectGlobal true } forEach _this }] remoteExecCall ["call", 2];
