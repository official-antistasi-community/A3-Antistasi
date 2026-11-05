/*
Maintainer: Shoter
    Handler of the "town" upgrade kit kind, registered in A3A_upgradeKitKinds by A3A_fnc_initTownUpgrades.
    The shared kit layer (UpgradeKits) calls it through A3A_fnc_upgradeKitCall. Kit id is the upgrade id, target the city marker.
    See A3A_fnc_initUpgradeKits for the list of modes.

Arguments:
    <STRING> Mode
    <ARRAY> Mode arguments: [id, city] for most modes, [id, city, price] for "bought", [crate] for "canInstall" and "installStart"

Return Value:
    <ANY> Depends on the mode

Scope: Any
Environment: Any, "installStart" spawns the scheduled install
Public: No
Dependencies:
    <HASHMAP> A3A_townUpgradeHM
    <SCALAR> A3A_townUpgradeRadius
    A3A_fnc_townUpgradeHas, A3A_fnc_townUpgradePrice, A3A_fnc_townKitInstallStart

Example:
    ["validate", ["clinic", "Kavala"]] call A3A_fnc_townKitHandlers;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_mode", "", [""]], ["_args", [], [[]]]];

switch (_mode) do {
    case "title": { localize "STR_A3A_fn_townUpgrades_title" };

    case "valid": {
        _args params [["_id", ""], ["_city", ""]];
        _id isEqualType "" and {_city isEqualType ""} and {_id in A3A_townUpgradeHM} and {_city in citiesX};
    };

    case "name": {
        _args params [["_id", ""]];
        localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];
    };

    case "targetName": {
        _args params [["_id", ""], ["_city", ""]];
        _city;
    };

    // Checks shared by the client and the server, the commander or member check is done by the kit layer
    case "validate": {
        _args params [["_id", ""], ["_city", ""]];
        call {
            if (sidesX getVariable [_city, sideUnknown] != teamPlayer or {_city in destroyedSites}) exitWith { format [localize "STR_A3A_fn_townUpgrades_townNotRebel", _city] };
            if ([_city, _id] call A3A_fnc_townUpgradeHas) exitWith { format [localize "STR_A3A_fn_townUpgrades_alreadyInstalled", _city, localize format ["STR_A3A_fn_townUpgrades_name_%1", _id]] };
            "";
        };
    };

    case "price": {
        _args params [["_id", ""], ["_city", ""]];
        [_id, _city] call A3A_fnc_townUpgradePrice;
    };

    case "bought": {
        _args params [["_id", ""], ["_city", ""], ["_price", 0]];
        format [localize "STR_A3A_fn_townUpgrades_bought", localize format ["STR_A3A_fn_townUpgrades_name_%1", _id], _city, _price, A3A_townUpgradeRadius];
    };

    case "label": {
        _args params [["_id", ""], ["_city", ""]];
        [localize format ["STR_A3A_fn_townUpgrades_name_%1", _id], format [localize "STR_A3A_fn_townUpgrades_kitLabelTo", _city]];
    };

    // Action condition, every frame: on the ground near the town centre, the placer checks the exact radius
    case "canInstall": {
        _args params [["_crate", objNull]];
        _crate distance2D markerPos ((_crate getVariable ["A3A_upgradeKit", ["", "", ""]]) # 2) < A3A_townUpgradeRadius + 150;
    };

    case "installStart": {
        _args params [["_crate", objNull]];
        [_crate] spawn A3A_fnc_townKitInstallStart;
        nil;
    };

    default { Error_1("Town kit handler mode does not exist: %1", _mode); nil };
};
