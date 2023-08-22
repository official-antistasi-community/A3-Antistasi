
// Server-only, unscheduled, for adding single unit type to rebel garrison

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitType", "_client"];

if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith {
	[localize "STR_A3A_garrison_header", "Garrison lost"] remoteExecCall ["A3A_fnc_customHint", _client];
};

private _hr = server getVariable "hr";
if (_hr < 1) exitWith {
	[localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_error_no_hr"] remoteExecCall ["A3A_fnc_customHint", _client];
};

private _resourcesFIA = server getVariable "resourcesFIA";
private _costs = server getVariable _unitType;
if (_costs > _resourcesFIA) exitWith {
	[localize "STR_A3A_garrison_header",  format [localize "STR_A3A_garrison_error_no_money", _costs]] remoteExecCall ["A3A_fnc_customHint", _client];
};

if ([markerPos _marker] call A3A_fnc_enemyNearCheck) exitWith {
	[localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_error_enemies_near"] remoteExecCall ["A3A_fnc_customHint", _client];
};

// TODO: Do we still want this?
private _troops = A3A_garrison get _marker get "troops";
private _limit = [_marker] call A3A_fnc_getGarrisonLimit;
if (_limit != -1 && {count _troops >= _limit}) exitWith {
	[localize "STR_A3A_garrisons_header", localize "STR_A3A_garrison_reached_limit"] remoteExecCall ["A3A_fnc_customHint", _client];
};

// ugh
[-1,-_costs] spawn A3A_fnc_resourcesFIA;

// Add unit to server garrison data
_troops pushBack _unitType;

// TODO: update marker?

// Add real unit if garrison is spawned
private _machineID = A3A_garrisonMachine get _marker;
if (!isNil "_machineID") then {
    ["spawnUnit", [_marker, _unitType]] remoteExecCall ["A3A_fnc_garrisonOp", _machineID];
};

// Print new garrison info in hint box on client
// Probably doesn't need to be done unscheduled? Arguable
[_marker, _client] spawn A3A_fnc_showSiteInfo;
