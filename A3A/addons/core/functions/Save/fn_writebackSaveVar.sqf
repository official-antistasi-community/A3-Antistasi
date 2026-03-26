/*
    Write a single variable to an Antistasi save and writeback.
    Will be slow, only use for one-off operations that need to be ensured

Scope: Server
Environment: Scheduled or unscheduled

Arguments:
    <STRING> Variable name to write
    <ANY> Variable value to write
    <ARRAY> Optional: Save target if not the current save. Current save target will be preserved.
        <STRING or false> server ID, or false for mission profile namespace
        <STRING> campaign ID
        <STRING> worldname
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_varName", "_varValue", "_saveTarget"];

if (isNil "_saveTarget" and isNil "A3A_saveVersion") exitWith {};               // No data yet written for this game, don't add trash

Info_1("Writing back save var with params %1", _this);

isNil {
    private _oldTarget = if (!isNil "A3A_saveTarget") then { A3A_saveTarget };
    if (!isNil "_saveTarget") then {                // In the rename case, we need to fetch the JSON save data if it exists
        A3A_saveTarget = [_saveTarget#0, _saveTarget#1, _saveTarget#2, false];
        private _json = ["json"] call A3A_fnc_returnSavedStat;
        if (!isNil "_json") then { A3A_saveTarget set [3, fromJSON _json] };
    };

    [_varname, _varValue] call A3A_fnc_setStatVariable;
    call A3A_fnc_finalizeSave;

    if (!isNil "_oldTarget") then { A3A_saveTarget = _oldTarget };
};
