/*
Maintainer: Shoter
    Creates an upgrade kit crate, tracks it in A3A_upgradeKits, makes it loadable into vehicles
    and adds the client actions through a JIP remoteExec. Does no payment checks, use A3A_fnc_upgradeKitPurchase for player requests.
    Also used by the save loader, so crates of every kind come back the same way.

Arguments:
    <STRING> Kit kind, key of A3A_upgradeKitKinds
    <ANY> Kit id within the kind (town: upgrade id)
    <STRING> Target marker the kit is bound to (town: city marker)
    <SCALAR> Price paid, refunded when the kit is returned at HQ [DEFAULT = 0]
    <ARRAY> Position ATL
    <SCALAR> Direction [DEFAULT = 0]

Return Value:
    <OBJECT> The crate, objNull on failure

Scope: Server
Environment: Unscheduled
Public: No
Dependencies:
    <STRING> A3A_upgradeKitCrateClass
    <ARRAY> A3A_upgradeKits

Example:
    ["town", "clinic", "Kavala", 6000, getPosATL player, 0] call A3A_fnc_upgradeKitCreate;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); objNull };
params [["_kind", "", [""]], ["_id", ""], ["_target", "", [""]], ["_paid", 0, [0]], ["_pos", [], [[]]], ["_dir", 0, [0]]];

if !(_kind in A3A_upgradeKitKinds) exitWith { Error_1("Unknown upgrade kit kind %1", _kind); objNull };
if !([_kind, "valid", [_id, _target]] call A3A_fnc_upgradeKitCall) exitWith { Error_3("Bad %1 kit: %2 for %3", _kind, _id, _target); objNull };
if (count _pos < 2) exitWith { Error_3("Bad position for %1 kit %2: %3", _kind, _id, _pos); objNull };
if (A3A_upgradeKitCrateClass == "") exitWith { Error("No upgrade kit crate class available"); objNull };

private _crate = createVehicle [A3A_upgradeKitCrateClass, [0,0,0], [], 0, "CAN_COLLIDE"];
_crate setDir _dir;
_crate setPosATL _pos;
_crate setVectorUp surfaceNormal _pos;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_crate setVariable ["A3A_upgradeKit", [_kind, _id, _target, _paid], true];
private _jipKey = "A3A_upgradeKitAct_" + ((str _crate splitString ":") joinString "");
_crate setVariable ["A3A_upgradeKitJip", _jipKey];
A3A_upgradeKits pushBack _crate;

// Deleted by Zeus or cleanup: keep the list and the JIP entry consistent
_crate addEventHandler ["Deleted", { [_this # 0, false] call A3A_fnc_upgradeKitRemove }];

[_crate] call A3A_Logistics_fnc_addLoadAction;          // does its own JIP
[_crate] remoteExec ["A3A_fnc_upgradeKitAddActions", 0, _jipKey];

Info_5("Upgrade kit %1 %2 for %3 created at %4, paid %5", _kind, _id, _target, _pos, _paid);
_crate;
