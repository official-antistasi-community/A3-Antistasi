/*
    Server-side function to remove single unit type from rebel garrison
    Used from UI, provides feedback to client

    Environment: Unscheduled, server

    Arguments:
    <STRING> Marker name of garrison.
    <STRING> Unit type (loadout name).
    <NUMBER> Machine ID of client.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitType", "_client"];

Trace_1("Called with params %1", _this);

private _titleStr = localize "STR_A3A_garrison_header";

if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith {
	[_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_zone_belong",FactionGet(reb,"name")]] remoteExecCall ["A3A_fnc_customHint", _client];
};

if ([markerPos _marker] call A3A_fnc_enemyNearCheck) exitWith {
	[_titleStr, localize "STR_A3A_garrison_error_enemies_near"] remoteExecCall ["A3A_fnc_customHint", _client];
};

if !(_marker in A3A_garrison) exitWith {
    Error_1("Garrison not found for marker %1", _marker);
};

private _troops = A3A_garrison get _marker get "troops";
if (_troops find _unitType == -1) exitWith {
    Error_2("Unit type %1 not found in garrison %2", _unitType, _marker);
};

// ugh
[1, (server getVariable [_unitType, 0]) / 2] spawn A3A_fnc_resourcesFIA;

// Remove unit from server garrison data
_troops deleteAt (_troops find _unitType);

// Update the marker text if it's rebel
if (sidesX getVariable _marker == teamPlayer) then { [_marker] call A3A_fnc_mrkUpdate };

// Delete real unit if garrison is spawned
if (_marker in A3A_garrisonMachine) then {
    ["remUnitType", [_marker, _unitType]] call A3A_fnc_garrisonOp;
};

// Not called from old UI, don't need this one
//[_marker, _client] spawn A3A_fnc_showSiteInfo;
