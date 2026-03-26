/*
    Server-side function to change side of garrison

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <SIDE> New side of garrison.
    <SIDE> Old side of garrison.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_newSide", "_oldSide"];

Trace_1("Called with params %1", _this);

// Other stuff is left alone?
private _garrison = A3A_garrison get _marker;
_garrison set ["troops", [[0,0], []] select (_newSide == teamPlayer)];

// Refresh loot & intel cooldowns if converted to enemy
if (_newSide != teamPlayer) then {
    if (_marker in resourcesX or {_marker in factories}) exitWith {};
    if (_marker in citiesX and _oldSide == teamPlayer) then { _garrison set ["reinfCount", 5] };           // police just return to work

    private _lootCD = 120*16 / (A3A_garrisonSize get _marker);
    if (_oldSide == teamPlayer) then { _garrison set ["lootCD", _lootCD] };     // occ->inv preserves loot
    _garrison set ["intelCD", _lootCD];
} else {
    _garrison deleteAt "lootCD";
    _garrison deleteAt "intelCD";
};

// Need to call this even if unspawned. Clears any vehicle actions.
if (_marker in A3A_garrisonMachine) then {
    ["changeSide", [_marker, _newSide]] call A3A_fnc_garrisonOp;
};
