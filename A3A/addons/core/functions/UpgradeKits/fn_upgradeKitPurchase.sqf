/*
Maintainer: Shoter
    Server side of buying an upgrade kit. Called after the client has placed the crate ghost at HQ.
    Re-validates the player (member or commander), the kind's own checks, duplicates and funds,
    computes the price here (never trusts the client), takes the faction money and creates the tracked crate.

Arguments:
    <STRING> Kit kind, key of A3A_upgradeKitKinds
    <ANY> Kit id within the kind (town: upgrade id)
    <STRING> Target marker the kit is bound to (town: city marker)
    <ARRAY> Crate position ATL
    <SCALAR> Crate direction
    <OBJECT> Buying player

Return Value:
    <OBJECT> The crate, objNull when the purchase was refused

Scope: Server
Environment: Unscheduled
Public: No
Dependencies: A3A_fnc_upgradeKitAllowed, A3A_fnc_upgradeKitCall, A3A_fnc_upgradeKitCreate, A3A_fnc_resourcesFIA

Example:
    ["town", "clinic", "Kavala", getPosATL player, getDir player, player] remoteExecCall ["A3A_fnc_upgradeKitPurchase", 2];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); objNull };
params [["_kind", "", [""]], ["_id", ""], ["_target", "", [""]], ["_pos", [], [[]]], ["_dir", 0, [0]], ["_player", objNull, [objNull]]];
if (isNull _player) exitWith { objNull };
if !(_kind in A3A_upgradeKitKinds) exitWith { Error_2("Unknown upgrade kit kind %1 requested by %2", _kind, name _player); objNull };

private _titleStr = [_kind, "title"] call A3A_fnc_upgradeKitCall;
private _fnc_fail = {
    params ["_text"];
    [_titleStr, _text] remoteExec ["A3A_fnc_customHint", _player];
    Info_5("Upgrade kit purchase of %1 %2 for %3 by %4 failed: %5", _kind, _id, _target, name _player, _text);
    objNull;
};

if !([_player] call A3A_fnc_upgradeKitAllowed) exitWith { [localize "STR_A3A_fn_upgradeKits_membersOnly"] call _fnc_fail };
if !([_kind, "valid", [_id, _target]] call A3A_fnc_upgradeKitCall) exitWith { Error_3("Bad %1 kit request: %2 for %3", _kind, _id, _target); objNull };
if (_pos isEqualTo [] or {_pos distance2D _player > 75}) exitWith { Error_2("Upgrade kit position %1 too far from %2", _pos, name _player); objNull };

private _refusal = [_kind, "validate", [_id, _target]] call A3A_fnc_upgradeKitCall;
if (_refusal != "") exitWith { [_refusal] call _fnc_fail };

private _name = [_kind, "name", [_id, _target]] call A3A_fnc_upgradeKitCall;
private _targetName = [_kind, "targetName", [_id, _target]] call A3A_fnc_upgradeKitCall;

// One crate per kind, id and target, the same as installed upgrades
private _key = [_kind, _id, _target];
private _duplicate = A3A_upgradeKits findIf { !isNull _x and {((_x getVariable ["A3A_upgradeKit", []]) select [0, 3]) isEqualTo _key} };
if (_duplicate != -1) exitWith { [format [localize "STR_A3A_fn_upgradeKits_kitExists", _name, _targetName]] call _fnc_fail };

private _cost = [_kind, "price", [_id, _target]] call A3A_fnc_upgradeKitCall;
if (server getVariable ["resourcesFIA", 0] < _cost) exitWith { [format [localize "STR_A3A_fn_upgradeKits_noMoney", _cost]] call _fnc_fail };
[0, -_cost] call A3A_fnc_resourcesFIA;

private _crate = [_kind, _id, _target, _cost, _pos, _dir] call A3A_fnc_upgradeKitCreate;
if (isNull _crate) exitWith { [0, _cost] call A3A_fnc_resourcesFIA; Error_2("Upgrade kit %1 %2 could not be created, refunded", _kind, _id); objNull };

[_titleStr, [_kind, "bought", [_id, _target, _cost]] call A3A_fnc_upgradeKitCall] remoteExec ["A3A_fnc_customHint", _player];
Info_5("Upgrade kit %1 %2 for %3 bought by %4 for %5", _kind, _id, _target, name _player, _cost);
_crate;
