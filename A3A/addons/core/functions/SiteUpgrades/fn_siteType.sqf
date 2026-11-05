/*
Maintainer: Shoter
    Site upgrade type of a marker.

Arguments:
    <STRING> Marker

Return Value:
    <STRING> "resource", "factory", "seaport", or "" for every other marker

Scope: Any
Environment: Any
Public: No
Dependencies:
    <ARRAY> resourcesX, factories, seaports

Example:
    if ([_marker] call A3A_fnc_siteType != "") then { ... };
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]]];

call {
    if (_marker in resourcesX) exitWith { "resource" };
    if (_marker in factories) exitWith { "factory" };
    if (_marker in seaports) exitWith { "seaport" };
    "";
};
