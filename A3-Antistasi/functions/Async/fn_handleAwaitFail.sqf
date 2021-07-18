/*
Author: Håkon
Description:
    Cleans up variables of awaits where timeout was reached.

Arguments:
0. <>

Return Value:
<>

Scope: Server,Server/HC,Clients,Any
Environment: Scheduled/unscheduled/Any
Public: Yes/No
Dependencies:

Example:

License: MIT License
*/
params ["_var"];

if (isNil "A3A_Async_FailedAwait") exitWith {
    A3A_Async_FailedAwait = [_var];
    [] spawn {
        // periodically clean vars for failed awaits due to timeouts
        while {true} do {
            sleep 60;
            private _toNil = A3A_Async_FailedAwait select {!isNil};
            { missionNamespace setVariable [_x, nil] } forEach _toNil;
            A3A_Async_FailedAwait = A3A_Async_FailedAwait select {!isNil};
            if (A3A_Async_FailedAwait isEqualTo []) then {A3A_Async_FailedAwait = nil};
        };
    };
    true
};
A3A_Async_FailedAwait pushBack _var;
true
