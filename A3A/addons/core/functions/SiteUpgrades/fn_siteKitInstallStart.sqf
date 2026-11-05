/*
Maintainer: Shoter
    Client side of installing a site upgrade from its kit crate.
    Levels 3, 5 and 7 open the placement ghost for their building, placed within A3A_siteUpgradeRadius of the site centre.
    The other levels take a 10 second install next to the crate, cancelled when the player moves away, dies or gets into a vehicle.
    A crate whose level no longer follows the site's level (the site lost a level) can only be returned at HQ.
    Started by the "installStart" mode of A3A_fnc_siteKitHandlers.

Arguments:
    <OBJECT> The kit crate

Return Value:
    <nil>

Scope: Clients
Environment: Scheduled
Public: No
Dependencies: HR_GRG_fnc_confirmPlacement, A3A_fnc_siteUpgradeInstall, A3A_fnc_siteUpgradeRefusal

Example:
    [_crate] spawn A3A_fnc_siteKitInstallStart;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_crate", objNull, [objNull]]];
private _titleStr = localize "STR_A3A_fn_siteUpgrades_title";

if (isNull _crate or {!isNull attachedTo _crate}) exitWith {};
(_crate getVariable ["A3A_upgradeKit", ["", 0, ""]]) params ["_kind", "_level", "_marker"];
if (_kind != "site" or {[_marker] call A3A_fnc_siteType == ""}) exitWith { Error_1("Kit crate %1 carries no valid site kit data", _crate) };
private _siteName = [_marker] call A3A_fnc_siteName;

if (!isNil "HR_GRG_placing" && {HR_GRG_placing}) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_placing"] call A3A_fnc_customHint };
if (player != player getVariable ["owner", player]) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_control"] call A3A_fnc_customHint };
if (_level != ([_marker, false] call A3A_fnc_siteLevel) + 1) exitWith { [_titleStr, format [localize "STR_A3A_fn_siteUpgrades_kitStale", _level, _siteName]] call A3A_fnc_customHint };
private _refusal = [_marker, _level, false] call A3A_fnc_siteUpgradeRefusal;
if (_refusal != "") exitWith { [_titleStr, _refusal] call A3A_fnc_customHint };
if (_crate distance2D markerPos _marker > A3A_siteUpgradeRadius) exitWith { [_titleStr, format [localize "STR_A3A_fn_siteUpgrades_tooFar", _siteName, A3A_siteUpgradeRadius]] call A3A_fnc_customHint };
if ([getPosATL _crate] call A3A_fnc_enemyNearCheck) exitWith { [_titleStr, localize "STR_A3A_fn_townUpgrades_enemyNear"] call A3A_fnc_customHint };

// Levels without a building: a short timed install next to the crate
if !(_level in [3, 5, 7]) exitWith {
    private _duration = 10;
    private _end = time + _duration;
    private _cancelled = false;
    while { time < _end } do {
        if (!alive player or {vehicle player != player} or {player distance _crate > 8} or {isNull _crate}) exitWith { _cancelled = true };
        [_titleStr, format [localize "STR_A3A_fn_siteUpgrades_installing", _level, _siteName, ceil (_end - time)], true] call A3A_fnc_customHint;
        sleep 1;
    };
    if (_cancelled) exitWith { [_titleStr, localize "STR_A3A_fn_siteUpgrades_installCancelled"] call A3A_fnc_customHint };
    [_crate, [], [0,1,0], [0,0,1], player] remoteExecCall ["A3A_fnc_siteUpgradeInstall", 2];
};

private _type = [_marker] call A3A_fnc_siteType;
private _class = A3A_siteUpgradeBuildings getOrDefault [format ["%1|%2", _type, _level], ""];
if (_class == "") exitWith { Error_2("No site building for %1 level %2", _marker, _level) };

// Runs every frame the ghost moves, keep it cheap
private _fnc_check = {
    params ["_ghost", "_crate", "_level", "_marker", "_siteName"];
    if (getPosATL _ghost distance2D markerPos _marker > A3A_siteUpgradeRadius) exitWith { [true, format [localize "STR_A3A_fn_siteUpgrades_tooFar", _siteName, A3A_siteUpgradeRadius]] };
    if (sidesX getVariable [_marker, sideUnknown] != teamPlayer or {_marker in destroyedSites}) exitWith { [true, format [localize "STR_A3A_fn_siteUpgrades_notRebel", _siteName]] };
    [false];
};

private _fnc_placed = {
    params ["_building", "_crate", "_level", "_marker", "_siteName"];
    if (isNull _building) exitWith {};          // placement cancelled
    // The server owns every tracked object: recreate it there
    private _posWorld = getPosWorld _building;
    private _vecDir = vectorDir _building;
    private _vecUp = vectorUp _building;
    deleteVehicle _building;
    [_crate, _posWorld, _vecDir, _vecUp, player] remoteExecCall ["A3A_fnc_siteUpgradeInstall", 2];
};

private _extraMessage = format [localize "STR_A3A_fn_siteUpgrades_placing", _level, _siteName, A3A_siteUpgradeRadius];
[_class, _fnc_placed, _fnc_check, [_crate, _level, _marker, _siteName], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;
