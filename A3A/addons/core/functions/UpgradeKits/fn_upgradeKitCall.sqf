/*
Maintainer: Shoter
    Calls the handler of an upgrade kit kind. The shared kit code goes through here and never checks the kind itself.
    See A3A_fnc_initUpgradeKits for the modes and their arguments.

Arguments:
    <STRING> Kit kind, key of A3A_upgradeKitKinds ("town")
    <STRING> Handler mode
    <ARRAY> Mode arguments [DEFAULT = []]

Return Value:
    <ANY> What the handler returns, nil when the kind is unknown

Scope: Any
Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_upgradeKitKinds

Example:
    private _price = ["town", "price", ["clinic", "Kavala"]] call A3A_fnc_upgradeKitCall;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_kind", "", [""]], ["_mode", "", [""]], ["_args", [], [[]]]];

if (isNil "A3A_upgradeKitKinds") exitWith { Error("Upgrade kit kinds have not arrived on this machine"); nil };
private _handler = A3A_upgradeKitKinds getOrDefault [_kind, ""];
if (_handler == "") exitWith { Error_2("Unknown upgrade kit kind %1 (mode %2)", _kind, _mode); nil };

[_mode, _args] call (missionNamespace getVariable [_handler, {}]);
