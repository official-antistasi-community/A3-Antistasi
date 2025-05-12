/*
Maintainer: Caleb Serafin
    Modifies the provided player's funds.
    Function will automatically re-execute on the server if called on a client.
    Provides backwards compatibility for direct execution on client.

Arguments:
    <SCALAR> Amount to add (make negative for deduction.)
    <OBJECT> The player to add to remove money from. (DEFAULT: player)

Return Value:
    <BOOL> Returns true if transaction successful, false if not. Will always be false if executed on non-server.

Scope: Any, Global Arguments, Global Effect
Environment: Unscheduled
Public: Yes

Example:
    [-100] call A3A_fnc_resourcesPlayer; // Backwards compatible Deduct 100 Euros
    [420, _theAffectedPlayer] call FUNCMAIN(resourcesPlayer); // The server-side call to add money.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    ["_moneyAdjustment", 0, [0]],
    ["_playerObject", player, [objNull]]
];

if (!isServer) exitWith {
    [_moneyAdjustment, _playerObject] remoteExecCall ["A3A_fnc_resourcesPlayer", 2];
    false;
};

private _storedMoney = _playerObject getVariable ["moneyX", 0];
Trace_1("_moneyAdjustment: %1",_moneyAdjustment);
Trace_1("_storedMoney: %1",_storedMoney);
if (_moneyAdjustment < 0 && -_moneyAdjustment > _storedMoney) exitWith {false};  // Prevent debt, but allow adding money if somehow in debt.
_storedMoney = _storedMoney + _moneyAdjustment;
_playerObject setVariable ["moneyX", _storedMoney, true];

[] remoteExec ["A3A_fnc_statistics", _playerObject];
true;
