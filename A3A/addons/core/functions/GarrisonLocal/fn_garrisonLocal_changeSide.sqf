/*
    Garrison-local function for retreat/surrender of defeated garrison
    Troops retreat/surrender, civs are retained, statics and vehicle switch side

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <SIDE> Winning/new side.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_newSide"];

private _garrison = A3A_activeGarrison get _marker;

// Handle retreat/surrender of troops. Don't touch vehicles.
[_marker, true, false] call A3A_fnc_garrisonLocal_clear;

// Now flip the side (retreat/surrender needs original side)
_garrison set ["side", _newSide];

//Convert all statics & vehicles
{
    if (!alive _x) then { continue };
    [_x, _newSide, true] call A3A_fnc_vehKilledOrCaptured;      // should be local
} forEach (_garrison get "vehicles");


// Switch flag actions & texture
private _flag = _garrison get "flag";
if (!isNil "_flag") then {
    _flag setVariable ["A3A_flagFlipTime", time, true];
    [_flag, "remove"] remoteExecCall ["A3A_fnc_flagaction", 0];
    private _flagAction = ["take", "SDKFlag"] select (_newSide == teamPlayer);
    [_flag, _flagAction] remoteExecCall ["A3A_fnc_flagaction", 0, _flag];

    private _flagTexture = Faction(_newSide) get "flagTexture";
    _flag setFlagTexture _flagTexture;
};
