/*
Maintainer: Shoter
    Why a factory cannot start building a vehicle now, used by the Site upgrades tab and A3A_fnc_factoryBuildStart.

Arguments:
    <STRING> Factory marker
    <STRING> Vehicle class, "" to check only the factory
    <OBJECT> Player who asks

Return Value:
    <STRING> "" when the build can start, otherwise the refusal text

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_siteLevel, A3A_fnc_siteName, A3A_fnc_upgradeKitAllowed, A3A_factoryBuildList, A3A_factoryBuilds, A3A_factoryLevelBands

Example:
    private _refusal = [_marker, _class, player] call A3A_fnc_factoryBuildRefusal;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]], ["_class", "", [""]], ["_player", objNull, [objNull]]];

if !(_marker in factories) exitWith { localize "STR_A3A_fn_upgradeKits_notAKit" };
private _siteName = [_marker] call A3A_fnc_siteName;
private _level = [_marker] call A3A_fnc_siteLevel;

call {
    if !([_player] call A3A_fnc_upgradeKitAllowed) exitWith { localize "STR_A3A_fn_upgradeKits_membersOnly" };
    if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith { format [localize "STR_A3A_fn_siteUpgrades_notRebel", _siteName] };
    if (_marker in destroyedSites) exitWith { format [localize "STR_A3A_fn_siteUpgrades_destroyed", _siteName] };
    if (_level < 1) exitWith { format [localize "STR_A3A_fn_siteUpgrades_buildNeedsLevel", _siteName] };
    if (_marker in A3A_factoryBuilds) exitWith { format [localize "STR_A3A_fn_siteUpgrades_buildBusy", _siteName] };
    if (_class == "") exitWith { "" };
    if (isNil "A3A_factoryBuildList") exitWith { localize "STR_A3A_fn_siteUpgrades_buildListPending" };
    private _index = A3A_factoryBuildList findIf { _x # 0 == _class };
    if (_index == -1) exitWith { localize "STR_A3A_fn_siteUpgrades_buildUnknown" };
    if ((A3A_factoryBuildList # _index # 1) > A3A_factoryLevelBands # _level) exitWith { format [localize "STR_A3A_fn_siteUpgrades_buildLevelTooLow", _siteName] };
    "";
};
