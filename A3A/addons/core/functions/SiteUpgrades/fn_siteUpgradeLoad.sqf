/*
Maintainer: Shoter
    Loads the site upgrade save keys. Called from A3A_fnc_loadStat after the garrisons and sides are loaded.
    Markers that no longer exist (map template changed) and levels out of range are skipped.
    Enemy-held sites keep their level, unlike town upgrades. A building is rebuilt only while its level is still held.
    A save without these keys never calls this, every site then stays at level 0.

Arguments:
    <STRING> Save key, "siteUpgrades" or "siteKits"
    <ARRAY> Saved value, see A3A_fnc_siteUpgradeSaveData

Return Value:
    <nil>

Scope: Server
Environment: Unscheduled
Public: No
Dependencies: A3A_fnc_siteType, A3A_fnc_siteLevelSet, A3A_fnc_siteBuildingCreate, A3A_fnc_upgradeKitCreate

Example:
    ["siteUpgrades", _varValue] call A3A_fnc_siteUpgradeLoad;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server") };
params [["_varName", "", [""]], ["_varValue", [], [[]]]];

if (_varName == "siteUpgrades") exitWith {
    _varValue params [["_version", 0, [0]], ["_levels", [], [[]]], ["_buildings", [], [[]]]];
    if (_version != 1) exitWith { Error_1("Unknown site upgrade save version %1, site levels not loaded", _version) };

    {
        _x params [["_marker", "", [""]], ["_level", 0, [0]]];
        if ([_marker] call A3A_fnc_siteType == "" or {_level < 0} or {_level > A3A_siteUpgradeMaxLevel}) then { Error_2("Skipping saved site level %1 for %2", _level, _marker); continue };
        [_marker, _level, false] call A3A_fnc_siteLevelSet;
    } forEach _levels;
    publicVariable "A3A_siteLevels";

    {
        _x params [["_marker", "", [""]], ["_level", 0, [0]], ["_posWorld", [], [[]]], ["_vecDir", [0,1,0], [[]]], ["_vecUp", [0,0,1], [[]]]];
        if ([_marker, false] call A3A_fnc_siteLevel < _level or {!(_level in [3, 5, 7])}) then { Error_2("Skipping saved site building %1 for %2", _level, _marker); continue };
        [_marker, _level, _posWorld, _vecDir, _vecUp] call A3A_fnc_siteBuildingCreate;
    } forEach _buildings;

    { [_x] call A3A_fnc_mrkUpdate } forEach keys A3A_siteLevels;
    Info_1("Site upgrade levels loaded: %1", A3A_siteLevels);
};

if (_varName == "siteKits") exitWith {
    {
        _x params ["_level", "_marker", "_paid", "_pos", "_dir"];
        if !(["site", "valid", [_level, _marker]] call A3A_fnc_upgradeKitCall) then { Error_2("Skipping saved site kit %1 for %2", _level, _marker); continue };
        // A kit whose level no longer follows the site still loads, it can be returned for its price paid
        ["site", _level, _marker, _paid, _pos, _dir] call A3A_fnc_upgradeKitCreate;
    } forEach _varValue;
};

Error_1("Unknown site upgrade save key %1", _varName);
