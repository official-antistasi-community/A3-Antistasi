/*
Maintainer: Shoter
    Whether a site upgrade kit crate for this site exists. One site has at most one crate at a time.
    The server reads its kit list, clients look for crates carrying the public kit record.

Arguments:
    <STRING> Site marker

Return Value:
    <BOOL>

Scope: Any
Environment: Any
Public: No
Dependencies:
    <ARRAY> A3A_upgradeKits (server), <STRING> A3A_upgradeKitCrateClass (clients)

Example:
    if ([_marker] call A3A_fnc_siteKitInTransit) then { ... };
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_marker", "", [""]]];

private _crates = if (isServer) then { A3A_upgradeKits } else { allMissionObjects A3A_upgradeKitCrateClass };
(_crates findIf {
    private _kit = _x getVariable ["A3A_upgradeKit", []];
    !isNull _x and {_kit isNotEqualTo []} and {_kit # 0 == "site"} and {_kit # 2 == _marker}
}) != -1;
