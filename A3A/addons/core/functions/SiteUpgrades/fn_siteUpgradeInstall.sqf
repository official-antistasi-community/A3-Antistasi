/*
Maintainer: Shoter
    Server side of installing a site upgrade level from its kit crate.
    Re-validates the crate, the site and the position, consumes the crate, raises the stored level
    and creates the building for levels 3, 5 and 7.

Arguments:
    <OBJECT> The kit crate
    <ARRAY> Building position (getPosWorld format), [] for levels without a building
    <ARRAY> vectorDir
    <ARRAY> vectorUp
    <OBJECT> Installing player

Return Value:
    <BOOL> True when the level was installed

Scope: Server
Environment: Unscheduled
Public: No
Dependencies: A3A_fnc_siteUpgradeRefusal, A3A_fnc_upgradeKitRemove, A3A_fnc_siteLevelSet, A3A_fnc_siteBuildingCreate

Example:
    [_crate, [], [0,1,0], [0,0,1], player] remoteExecCall ["A3A_fnc_siteUpgradeInstall", 2];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); false };
params [["_crate", objNull, [objNull]], ["_posWorld", [], [[]]], ["_vecDir", [0,1,0], [[]]], ["_vecUp", [0,0,1], [[]]], ["_player", objNull, [objNull]]];
if (isNull _player) exitWith { false };

private _titleStr = localize "STR_A3A_fn_siteUpgrades_title";
private _fnc_fail = {
    params ["_text"];
    [_titleStr, _text] remoteExec ["A3A_fnc_customHint", _player];
    Info_2("Site upgrade install by %1 failed: %2", name _player, _text);
    false;
};

if (isNull _crate or {!alive _crate} or {!(_crate in A3A_upgradeKits)}) exitWith { [localize "STR_A3A_fn_upgradeKits_notAKit"] call _fnc_fail };
(_crate getVariable ["A3A_upgradeKit", ["", 0, ""]]) params ["_kind", "_level", "_marker"];
if (_kind != "site" or {!(["site", "valid", [_level, _marker]] call A3A_fnc_upgradeKitCall)}) exitWith { [localize "STR_A3A_fn_upgradeKits_notAKit"] call _fnc_fail };
private _siteName = [_marker] call A3A_fnc_siteName;

if (_level != ([_marker, false] call A3A_fnc_siteLevel) + 1) exitWith { [format [localize "STR_A3A_fn_siteUpgrades_kitStale", _level, _siteName]] call _fnc_fail };
private _refusal = [_marker, _level, false] call A3A_fnc_siteUpgradeRefusal;
if (_refusal != "") exitWith { [_refusal] call _fnc_fail };
if (_crate distance2D markerPos _marker > A3A_siteUpgradeRadius) exitWith { [format [localize "STR_A3A_fn_siteUpgrades_tooFar", _siteName, A3A_siteUpgradeRadius]] call _fnc_fail };

private _hasBuilding = _level in [3, 5, 7];
if (_hasBuilding) then {
    if (count _posWorld != 3) exitWith { _refusal = localize "STR_A3A_fn_upgradeKits_notAKit" };
    if (_posWorld distance2D _crate > 150) exitWith { _refusal = localize "STR_A3A_fn_townUpgrades_tooFarFromCrate" };
    if (_posWorld distance2D markerPos _marker > A3A_siteUpgradeRadius) exitWith { _refusal = format [localize "STR_A3A_fn_siteUpgrades_tooFar", _siteName, A3A_siteUpgradeRadius] };
};
if (_refusal != "") exitWith { [_refusal] call _fnc_fail };
if ([getPosATL _crate] call A3A_fnc_enemyNearCheck) exitWith { [localize "STR_A3A_fn_townUpgrades_enemyNear"] call _fnc_fail };

[_crate] call A3A_fnc_upgradeKitRemove;
[_marker, _level] call A3A_fnc_siteLevelSet;
if (_hasBuilding) then { [_marker, _level, _posWorld, _vecDir, _vecUp] call A3A_fnc_siteBuildingCreate };

[_titleStr, format [localize "STR_A3A_fn_siteUpgrades_installed", _siteName, _level, name _player]] remoteExec ["A3A_fnc_customHint", teamPlayer];
Info_3("Site %1 raised to level %2 by %3", _marker, _level, name _player);
true;
