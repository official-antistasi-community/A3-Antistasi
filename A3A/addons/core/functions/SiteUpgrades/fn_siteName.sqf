/*
Maintainer: Shoter
    Readable name of a resource, factory or seaport, which have no names of their own: "Factory near Kavala".

Arguments:
    <STRING> Site marker

Return Value:
    <STRING>

Scope: Any
Environment: Any
Public: No
Dependencies:
    <ARRAY> citiesX

Example:
    private _name = [_marker] call A3A_fnc_siteName;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]]];

private _type = [_marker] call A3A_fnc_siteType;
if (_type == "") exitWith { _marker };
private _typeName = localize format ["STR_A3A_fn_siteUpgrades_type_%1", _type];
if (citiesX isEqualTo []) exitWith { _typeName };
private _city = [citiesX, markerPos _marker] call BIS_fnc_nearestPosition;
format [localize "STR_A3A_fn_siteUpgrades_siteName", _typeName, _city];
