/*
    Server-side function for adding new units to enemy garrison

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <NUMBER> Troop count to add.
    <NUMBER> Troop quality of added units.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitCount", "_quality"];

Trace_1("Called with params %1", _this);

if (sidesX getVariable _marker == teamPlayer) exitWith {
    Error_1("Attempted to add unit count to rebel marker %1", _marker);
};

// Add troops to server garrison data, averaging the quality
private _troops = A3A_garrison get _marker get "troops";
private _newQuality = (_troops#0 * _troops#1 + _unitCount * _quality) / (_troops#0 + _unitCount);
_troops set [0, _troops#0 + _unitCount];
_troops set [1, _newQuality];

// Add real unit if garrison is spawned
// Shouldn't really happen because we don't use this if the garrison is spawned?

if (_marker in A3A_garrisonMachine) then {
    ["spawnUnitCount", [_marker, _unitCount, _quality]] call A3A_fnc_garrisonOp;
};
