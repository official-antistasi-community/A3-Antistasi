/*
    A3A_fnc_selfReviveReset
    Remove any self-revive after-effects and clear the timeout

    Arguments: 
        1. <Bool> True for no effect transition or message

    Environment: Player-local
*/

params [["_instant", true]];

if (!A3A_selfReviveMethods) exitWith {};

if (!isNil "A3A_selfRevivePPHandle") then {
    _handle = A3A_selfRevivePPHandle;
    A3A_selfRevivePPHandle = nil;
    if (!_instant) then {
        _handle ppEffectAdjust [1, 1, 0,
            [0, 0, 0, 0],
            [1, 1, 1, 1],
            [0.299, 0.587, 0.114, 0]
        ];
        _handle ppEffectCommit 10;
        sleep 10;
    };
    _handle ppEffectEnable false;
    ppEffectDestroy _handle;
};

// Already cleared by box or respawn
if (!_instant && !isNil { player getVariable "A3A_selfReviveTimeout" }) then {
    [localize "STR_A3A_selfRevive_title", localize "STR_A3A_selfRevive_timeout"] call A3A_fnc_customHint;
};
player setVariable ["A3A_selfReviveTimeout", nil];

if (getCustomAimCoef player > 1) then { player setCustomAimCoef 1 };
