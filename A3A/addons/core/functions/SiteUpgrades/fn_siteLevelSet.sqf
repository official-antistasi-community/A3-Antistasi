/*
Maintainer: Shoter
    Stores the upgrade level of a site, broadcasts A3A_siteLevels and refreshes the site's map marker.
    Buildings are not touched, see A3A_fnc_siteBuildingCreate and A3A_fnc_siteLevelDrop.

Arguments:
    <STRING> Site marker
    <SCALAR> Level 0 to 7
    <BOOL> Broadcast and refresh the marker [DEFAULT = true]. False while loading many sites, the caller broadcasts once.

Return Value:
    <nil>

Scope: Server
Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_siteLevels

Example:
    [_marker, 2] call A3A_fnc_siteLevelSet;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server") };
params [["_marker", "", [""]], ["_level", 0, [0]], ["_broadcast", true, [true]]];

_level = 0 max round _level min A3A_siteUpgradeMaxLevel;
if (_level == 0) then { A3A_siteLevels deleteAt _marker } else { A3A_siteLevels set [_marker, _level] };

if (_broadcast) then {
    publicVariable "A3A_siteLevels";
    [_marker] call A3A_fnc_mrkUpdate;
};
