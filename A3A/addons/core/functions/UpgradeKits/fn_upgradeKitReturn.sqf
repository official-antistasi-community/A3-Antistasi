/*
Maintainer: Shoter
    Handles a request to return an upgrade kit at HQ, from a member or the commander.
    The crate is removed and the price paid (A3A_upgradeKit # 3) is refunded.

Arguments:
    <OBJECT> The kit crate
    <OBJECT> Player requesting the return

Return Value:
    <SCALAR> Money refunded, -1 when the return was refused

Scope: Server
Environment: Unscheduled
Public: No
Dependencies: A3A_fnc_upgradeKitAllowed, A3A_fnc_upgradeKitCall, A3A_fnc_upgradeKitRemove, A3A_fnc_resourcesFIA

Example:
    [_crate, player] remoteExecCall ["A3A_fnc_upgradeKitReturn", 2];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); -1 };
params [["_crate", objNull, [objNull]], ["_player", objNull, [objNull]]];
if (isNull _crate or isNull _player) exitWith { -1 };

(_crate getVariable ["A3A_upgradeKit", []]) params [["_kind", ""], ["_id", ""], ["_target", ""], ["_paid", 0]];
private _titleStr = if (_kind in A3A_upgradeKitKinds) then { [_kind, "title"] call A3A_fnc_upgradeKitCall } else { localize "STR_A3A_fn_upgradeKits_title" };
private _fnc_fail = {
    params ["_text"];
    [_titleStr, _text] remoteExec ["A3A_fnc_customHint", _player];
    Info_3("Upgrade kit return of %1 by %2 failed: %3", _crate, name _player, _text);
    -1;
};

if !([_player] call A3A_fnc_upgradeKitAllowed) exitWith { [localize "STR_A3A_fn_upgradeKits_membersOnly"] call _fnc_fail };
if (!(_crate in A3A_upgradeKits) or {!(_kind in A3A_upgradeKitKinds)}) exitWith { [localize "STR_A3A_fn_upgradeKits_notAKit"] call _fnc_fail };
if !(_crate inArea "Synd_HQ") exitWith { [localize "STR_A3A_fn_upgradeKits_returnNotAtHQ"] call _fnc_fail };

[_crate] call A3A_fnc_upgradeKitRemove;
if (_paid > 0) then { [0, _paid] call A3A_fnc_resourcesFIA };

private _name = [_kind, "name", [_id, _target]] call A3A_fnc_upgradeKitCall;
private _targetName = [_kind, "targetName", [_id, _target]] call A3A_fnc_upgradeKitCall;
[_titleStr, format [localize "STR_A3A_fn_upgradeKits_returned", _name, _targetName, _paid]] remoteExec ["A3A_fnc_customHint", _player];
Info_5("Upgrade kit %1 %2 for %3 returned by %4, refunded %5", _kind, _id, _target, name _player, _paid);
_paid;
