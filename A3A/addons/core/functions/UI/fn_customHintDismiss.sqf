/*
Function:
    A3A_fnc_customHintDismiss

Description:
    Dequeues the top hint.
    If _dismissAll then it will empty the entire queue.

Scope:
    <LOCAL> Executed by each player to dequeue an item from their queue.

Environment:
    <UNSCHEDULED> Suspensions may lead to the user pressing the action-key twice before call A3A_fnc_customHintRender. This results in dequeuing two items.

Parameters:
    <BOOLEAN> true to empty whole queue. [DEFAULT=false]

Returns:
    <BOOLEAN> true if executed successfully; false if A3A_customHintEnable is false; nil if it has crashed.

Examples:
    call A3A_fnc_customHintDismiss;
    [true] call A3A_fnc_customHintDismiss; // Clear all

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params [["_dismissAll",false]];
private _filename = "fn_customHintDismiss.sqf";

if (!hasInterface || !A3A_customHintEnable) exitWith {false;}; // Disabled for server & HC.
if (_dismissAll) then {
    A3A_customHint_MSGs = [];
} else {
    if !(count A3A_customHint_MSGs isEqualTo 0) then {
        private _lastMSGIndex = count A3A_customHint_MSGs - 1;
        A3A_customHint_MSGs deleteAt _lastMSGIndex;
    };
};
A3A_customHint_UpdateTime = serverTime;
[] call A3A_fnc_customHintRender;  // Instant update will be preffered when user is dismissing notifications.
true;
