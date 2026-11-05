/*
Maintainer: Shoter
    Client side of buying an upgrade kit. Pre-checks, then the garage placement ghost for the crate at HQ.
    On placement the server is asked to take the faction money and create the tracked crate.
    The checks of the kind (town held, not yet built) come from the kind's handler.

Arguments:
    <STRING> Kit kind, key of A3A_upgradeKitKinds
    <ANY> Kit id within the kind (town: upgrade id)
    <STRING> Target marker the kit is bound to (town: city marker)

Return Value:
    <nil>

Scope: Clients
Environment: Scheduled
Public: No
Dependencies: HR_GRG_fnc_confirmPlacement, A3A_fnc_upgradeKitAllowed, A3A_fnc_upgradeKitCall, A3A_fnc_upgradeKitPurchase

Example:
    ["town", "clinic", "Kavala"] spawn A3A_fnc_upgradeKitBuy;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_kind", "", [""]], ["_id", ""], ["_target", "", [""]]];

private _titleStr = [_kind, "title"] call A3A_fnc_upgradeKitCall;
if (isNil "_titleStr") exitWith {};          // unknown kind, logged
if !([_kind, "valid", [_id, _target]] call A3A_fnc_upgradeKitCall) exitWith { Error_3("Bad %1 kit request: %2 for %3", _kind, _id, _target) };

if (!isNil "HR_GRG_placing" && {HR_GRG_placing}) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_placing"] call A3A_fnc_customHint };
if (player != player getVariable ["owner", player]) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_control"] call A3A_fnc_customHint };
if !([player] call A3A_fnc_upgradeKitAllowed) exitWith { [_titleStr, localize "STR_A3A_fn_upgradeKits_membersOnly"] call A3A_fnc_customHint };
if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_enemy"] call A3A_fnc_customHint };
if !(player inArea "Synd_HQ") exitWith { [_titleStr, localize "STR_A3A_fn_upgradeKits_notAtHQ"] call A3A_fnc_customHint };

private _refusal = [_kind, "validate", [_id, _target]] call A3A_fnc_upgradeKitCall;
if (_refusal != "") exitWith { [_titleStr, _refusal] call A3A_fnc_customHint };

private _cost = [_kind, "price", [_id, _target]] call A3A_fnc_upgradeKitCall;
if (server getVariable ["resourcesFIA", 0] < _cost) exitWith { [_titleStr, format [localize "STR_A3A_fn_upgradeKits_noMoney", _cost]] call A3A_fnc_customHint };
if (A3A_upgradeKitCrateClass == "") exitWith { Error("No upgrade kit crate class available") };

private _fnc_placed = {
    params ["_crate", "_kind", "_id", "_target"];
    if (isNull _crate) exitWith {};          // placement cancelled
    // The server owns every tracked object: recreate it there
    private _pos = getPosATL _crate;
    private _dir = getDir _crate;
    deleteVehicle _crate;
    [_kind, _id, _target, _pos, _dir, player] remoteExecCall ["A3A_fnc_upgradeKitPurchase", 2];
};

private _name = [_kind, "name", [_id, _target]] call A3A_fnc_upgradeKitCall;
private _targetName = [_kind, "targetName", [_id, _target]] call A3A_fnc_upgradeKitCall;
private _extraMessage = format [localize "STR_A3A_fn_upgradeKits_placingKit", _name, _targetName, _cost];
[A3A_upgradeKitCrateClass, _fnc_placed, {[false]}, [_kind, _id, _target], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;
