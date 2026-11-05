/*
Maintainer: Shoter
    Server side of installing a town upgrade. Called after the client has placed the prop ghost.
    Re-validates the crate, the town and the position, consumes the crate and creates the prop.

Arguments:
    <OBJECT> The kit crate
    <ARRAY> Prop position (getPosWorld format)
    <ARRAY> vectorDir
    <ARRAY> vectorUp
    <OBJECT> Installing player

Return Value:
    <nil>

Scope: Server
Environment: Unscheduled
Public: No
Dependencies: A3A_fnc_townUpgradeCreate, A3A_fnc_upgradeKitRemove

Example:
    [_crate, _posWorld, _vecDir, _vecUp, player] remoteExecCall ["A3A_fnc_townUpgradeInstall", 2];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server") };
params [["_crate", objNull, [objNull]], ["_posWorld", [], [[]]], ["_vecDir", [0,1,0], [[]]], ["_vecUp", [0,0,1], [[]]], ["_player", objNull, [objNull]]];
if (isNull _player or _posWorld isEqualTo []) exitWith {};

private _titleStr = localize "STR_A3A_fn_townUpgrades_title";
private _fnc_fail = {
    params ["_text"];
    [_titleStr, _text] remoteExec ["A3A_fnc_customHint", _player];
    Info_2("Town upgrade install by %1 failed: %2", name _player, _text);
};

if (isNull _crate or {!alive _crate} or {!(_crate in A3A_upgradeKits)}) exitWith { [localize "STR_A3A_fn_upgradeKits_notAKit"] call _fnc_fail };
(_crate getVariable ["A3A_upgradeKit", ["", "", ""]]) params ["_kind", "_id", "_city"];
if (_kind != "town" or {!(_id in A3A_townUpgradeHM)}) exitWith { [localize "STR_A3A_fn_upgradeKits_notAKit"] call _fnc_fail };
private _name = localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];

if (_posWorld distance2D _crate > 150) exitWith { [localize "STR_A3A_fn_townUpgrades_tooFarFromCrate"] call _fnc_fail };
if (_posWorld distance2D markerPos _city > A3A_townUpgradeRadius) exitWith { [format [localize "STR_A3A_fn_townUpgrades_tooFar", _city, A3A_townUpgradeRadius]] call _fnc_fail };
if (sidesX getVariable [_city, sideUnknown] != teamPlayer or {_city in destroyedSites}) exitWith { [format [localize "STR_A3A_fn_townUpgrades_townNotRebel", _city]] call _fnc_fail };
if ([_city, _id] call A3A_fnc_townUpgradeHas) exitWith { [format [localize "STR_A3A_fn_townUpgrades_alreadyInstalled", _city, _name]] call _fnc_fail };
if ([ASLToATL _posWorld] call A3A_fnc_enemyNearCheck) exitWith { [localize "STR_A3A_fn_townUpgrades_enemyNear"] call _fnc_fail };

[_crate] call A3A_fnc_upgradeKitRemove;
private _prop = [_city, _id, _posWorld, _vecDir, _vecUp] call A3A_fnc_townUpgradeCreate;
if (isNull _prop) exitWith { Error_2("Town upgrade %1 in %2 could not be created", _id, _city) };

[_titleStr, format [localize "STR_A3A_fn_townUpgrades_installed", _name, _city, name _player]] remoteExec ["A3A_fnc_customHint", teamPlayer];
Info_3("Town upgrade %1 installed in %2 by %3", _id, _city, name _player);
