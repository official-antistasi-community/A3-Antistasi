/*
    A3A_fnc_unlockStatic
    Permit static weapon for garrison AIs. Runs updateRebelStatics on server.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];     //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", nil, true];

private _marker = _target getVariable ["markerX", ""];      // should always be valid though? hmm
if (_marker == "") exitWith {};

["updateStatics", [_marker]] remoteExecCall ["A3A_fnc_garrisonOp", 2];
