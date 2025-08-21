/*
    Server-side function used by local garrison despawn to mark that loot has been stolen on server side

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <STRING> Loot type, can be "crate" or "intel".

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_type"];

Trace_1("Called with params %1", _this);

if (_type == "crate") then {
    private _lootCD = 120*16 / (A3A_garrisonSize get _marker);
    A3A_garrison get _marker set ["lootCD", _lootCD];
};
if (_type == "intel") then {
    private _intelCD = 120*16 / (A3A_garrisonSize get _marker);
    A3A_garrison get _marker set ["intelCD", _intelCD];
};
