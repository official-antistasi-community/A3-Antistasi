/*
Maintainer: Shoter
    Handler of the "site" upgrade kit kind, registered in A3A_upgradeKitKinds by A3A_fnc_initSiteUpgrades.
    The shared kit layer (UpgradeKits) calls it through A3A_fnc_upgradeKitCall. Kit id is the level (1 to 7), target the site marker.
    See A3A_fnc_initUpgradeKits for the list of modes.

Arguments:
    <STRING> Mode
    <ARRAY> Mode arguments: [level, marker] for most modes, [level, marker, price] for "bought", [crate] for "canInstall" and "installStart"

Return Value:
    <ANY> Depends on the mode

Scope: Any
Environment: Any, "installStart" spawns the scheduled install
Public: No
Dependencies: A3A_fnc_siteType, A3A_fnc_siteName, A3A_fnc_siteUpgradeRefusal, A3A_fnc_siteUpgradePrice, A3A_fnc_siteKitInstallStart

Example:
    ["validate", [1, "resource_3"]] call A3A_fnc_siteKitHandlers;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_mode", "", [""]], ["_args", [], [[]]]];

switch (_mode) do {
    case "title": { localize "STR_A3A_fn_siteUpgrades_title" };

    case "valid": {
        _args params [["_level", 0], ["_marker", ""]];
        _level isEqualType 0 and {_marker isEqualType ""} and {_level >= 1} and {_level <= A3A_siteUpgradeMaxLevel} and {[_marker] call A3A_fnc_siteType != ""};
    };

    case "name": {
        _args params [["_level", 0]];
        format [localize "STR_A3A_fn_siteUpgrades_levelName", _level];
    };

    case "targetName": {
        _args params [["_level", 0], ["_marker", ""]];
        [_marker] call A3A_fnc_siteName;
    };

    // Rebel-held, not destroyed, the next level, within the release cap, no other crate for the site
    case "validate": {
        _args params [["_level", 0], ["_marker", ""]];
        [_marker, _level] call A3A_fnc_siteUpgradeRefusal;
    };

    case "price": {
        _args params [["_level", 0], ["_marker", ""]];
        [_marker, _level] call A3A_fnc_siteUpgradePrice;
    };

    case "bought": {
        _args params [["_level", 0], ["_marker", ""], ["_price", 0]];
        format [localize "STR_A3A_fn_siteUpgrades_bought", _level, [_marker] call A3A_fnc_siteName, _price, A3A_siteUpgradeRadius];
    };

    case "label": {
        _args params [["_level", 0], ["_marker", ""]];
        [format [localize "STR_A3A_fn_siteUpgrades_kitLabel", _level], format [localize "STR_A3A_fn_townUpgrades_kitLabelTo", [_marker] call A3A_fnc_siteName]];
    };

    // Action condition, every frame: on the ground near the site, the install does the exact checks
    case "canInstall": {
        _args params [["_crate", objNull]];
        _crate distance2D markerPos ((_crate getVariable ["A3A_upgradeKit", ["", 0, ""]]) # 2) < A3A_siteUpgradeRadius + 50;
    };

    case "installStart": {
        _args params [["_crate", objNull]];
        [_crate] spawn A3A_fnc_siteKitInstallStart;
        nil;
    };

    default { Error_1("Site kit handler mode does not exist: %1", _mode); nil };
};
