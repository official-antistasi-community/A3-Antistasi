/*
Maintainer: Shoter
    Why a site upgrade level cannot be bought now, used by the kit handler (client and server) and the Site upgrades tab.

Arguments:
    <STRING> Site marker
    <SCALAR> Level to buy
    <BOOL> Check for a kit already in transit to this site [DEFAULT = true]

Return Value:
    <STRING> "" when the level can be bought, otherwise the refusal text

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_siteType, A3A_fnc_siteLevel, A3A_fnc_siteKitInTransit, A3A_fnc_siteName

Example:
    private _refusal = [_marker, 1] call A3A_fnc_siteUpgradeRefusal;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]], ["_level", 0, [0]], ["_checkTransit", true, [true]]];

private _type = [_marker] call A3A_fnc_siteType;
if (_type == "") exitWith { localize "STR_A3A_fn_upgradeKits_notAKit" };
private _siteName = [_marker] call A3A_fnc_siteName;
private _stored = [_marker, false] call A3A_fnc_siteLevel;
private _cap = A3A_siteUpgradeLevelCap getOrDefault [_type, 0];

call {
    if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith { format [localize "STR_A3A_fn_siteUpgrades_notRebel", _siteName] };
    if (_marker in destroyedSites) exitWith { format [localize "STR_A3A_fn_siteUpgrades_destroyed", _siteName] };
    if (_stored >= _cap) exitWith { format [localize "STR_A3A_fn_siteUpgrades_atCap", _siteName, _cap] };
    if (_level != _stored + 1) exitWith { format [localize "STR_A3A_fn_siteUpgrades_wrongLevel", _siteName, _stored, _stored + 1] };
    if (_checkTransit and {[_marker] call A3A_fnc_siteKitInTransit}) exitWith { format [localize "STR_A3A_fn_siteUpgrades_kitInTransit", _siteName] };
    "";
};
