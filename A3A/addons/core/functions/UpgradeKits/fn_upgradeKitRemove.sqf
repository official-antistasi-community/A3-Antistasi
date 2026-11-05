/*
Maintainer: Shoter
    Forgets an upgrade kit crate: removes it from A3A_upgradeKits, clears its JIP actions and deletes the object.

Arguments:
    <OBJECT> The crate
    <BOOL> Delete the object [DEFAULT = true]. False when called from the crate's Deleted handler.

Return Value:
    <nil>

Scope: Server
Environment: Unscheduled
Public: No
Dependencies:
    <ARRAY> A3A_upgradeKits

Example:
    [_crate] call A3A_fnc_upgradeKitRemove;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server") };
params [["_crate", objNull, [objNull]], ["_delete", true, [false]]];

A3A_upgradeKits = A3A_upgradeKits select { !isNull _x and {_x != _crate} };

if (isNull _crate) exitWith {};
private _jipKey = _crate getVariable ["A3A_upgradeKitJip", ""];
if (_jipKey != "") then { remoteExec ["", _jipKey] };
if (_delete) then { deleteVehicle _crate };
