/*
Maintainer: Shoter
    Upgrade level of a resource, factory or seaport.
    The effective level is what every bonus uses: 0 while the site is enemy-held or destroyed, the stored level otherwise.
    The stored level is kept whichever side holds the site, a recapture brings its bonuses back.

Arguments:
    <STRING> Site marker
    <BOOL> Effective level [DEFAULT = true]. False returns the stored level (tab, marker text, save).

Return Value:
    <SCALAR> Level 0 to 7

Scope: Any
Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_siteLevels

Example:
    private _level = [_marker] call A3A_fnc_siteLevel;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]], ["_effective", true, [true]]];

if (isNil "A3A_siteLevels") exitWith { 0 };
private _level = A3A_siteLevels getOrDefault [_marker, 0];
if (_level == 0 or !_effective) exitWith { _level };
if (sidesX getVariable [_marker, sideUnknown] != teamPlayer or {_marker in destroyedSites}) exitWith { 0 };
_level;
