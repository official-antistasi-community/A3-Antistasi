/*

Scope: Server
Environment: Unscheduled

Arguments:

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Uses:
// 1. Call after creating the save hashmap when saving.
//    - always has saveHM. Should delete the old entry and re-insert at end? could replace instead now...
// 2. Called from writebackSaveVar.
//    - may or may not have saveHM. Should replace current entry.
// 3. Called when importing save.
//    - shouldn't have an index. insert at end.

A3A_saveTarget params ["_serverID", "_campaignID", "_map", "_saveHM"];

private _saveEntry = [_campaignID, _map, "Greenfor"];
if (_saveHM isEqualType createHashMap) then
{
    // Build the header data
    private _headerHM = createHashMap;
    {
        if (isNil {_saveHM get _x}) then { continue };          // avoid weird compat issues if we add stuff to header
        _headerHM set [_x, _saveHM get _x];
    } forEach ["name", "version", "saveTime", "ended", "params", "factions", "DLC", "addonVics", "map"];
    _saveEntry set [3, toJSON _headerHM];

    // Write the JSON blob
    ["json", toJSON _saveHM, true] call A3A_fnc_setStatVariable;
};

private _newNamespace = _serverID isEqualType false;
private _namespace = [profileNamespace, missionProfileNamespace] select _newNamespace;
if (!_newNamespace) then { profileNamespace setVariable ["ss_serverID", _serverID] };			// prevent old versions causing lost saves

private _saveList = [_namespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
private _saveIndex = _saveList findIf { _x select 0 == _campaignID };
if (_saveIndex == -1) then { _saveList pushBack _saveEntry } else { _saveList set [_saveIndex, _saveEntry] };
_namespace setVariable ["antistasiSavedGames", _saveList];          // in case it doesn't already exist

if (_newNamespace) then { saveMissionProfileNamespace } else { saveProfileNamespace };
