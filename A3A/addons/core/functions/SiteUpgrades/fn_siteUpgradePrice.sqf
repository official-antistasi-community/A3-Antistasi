/*
Maintainer: Shoter
    Price of one site upgrade level: round(typeBase x mapScale x weight(level) / 100) x 100.
    Only broadcast constants are used, so clients show the price the server charges.

Arguments:
    <STRING> Site marker
    <SCALAR> Level 1 to 7

Return Value:
    <SCALAR> Price in faction money, 0 for a marker that is not a site or a level out of range

Scope: Any
Environment: Any
Public: No
Dependencies:
    A3A_siteUpgradeTypeBase, A3A_siteUpgradeMapScale, A3A_siteUpgradeWeights

Example:
    private _price = [_marker, 3] call A3A_fnc_siteUpgradePrice;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]], ["_level", 0, [0]]];

private _type = [_marker] call A3A_fnc_siteType;
if (_type == "" or {_level < 1} or {_level > count A3A_siteUpgradeWeights}) exitWith { 0 };

private _price = (A3A_siteUpgradeTypeBase get _type) * (A3A_siteUpgradeMapScale get _type) * (A3A_siteUpgradeWeights # (_level - 1));
100 * round (_price / 100);
