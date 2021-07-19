#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
/*
    Author: [Håkon]
    [Description]
        Handles carrying of LTC crates

    Arguments:
    0. <Object> The crate to carry/drop
    1. <Bool>   Picking up the crate
    2. <Object> The unit picking-up/dropping the crate ( optional - Default: Player )

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [Yes/No]
    Dependencies:

    Example:
        [cursorObject, true] call A3A_fnc_carryCrate;
        [_crate, false, _player] call A3A_fnc_carryCrate;

    License: MIT License
*/
params [["_crate", objNull], "_pickUp", ["_player", player]];

if (_pickUp) then {
    if (([_player] call A3A_fnc_countAttachedObjects) > 0) exitWith {systemChat "you are already carrying something."};
    _crate attachTo [_player, [0, 1.5, 0], "Pelvis"];
    _player setVariable ["carryingCrate", true];
    [_player ,_crate] spawn {
        params ["_player", "_crate"];
        waitUntil {_player forceWalk true; !alive _crate or !(_player getVariable ["carryingCrate", false]) or !(vehicle _player isEqualTo _player) or _player getVariable ["incapacitated",false] or !alive _player or !(isPlayer attachedTo _crate) };
        [_crate, false, _player] call A3A_fnc_carryCrate;
    };
} else {
    if (isNull _crate) then {
        private _attached = (attachedObjects _player)select {(typeOf _x) in [FactionGet(occ,"surrenderCrate"), FactionGet(inv,"surrenderCrate")]};
        if (_attached isEqualTo []) exitWith {};
        _crate = _attached # 0;
    };
    if !(isNull _crate) then {
        _player setVelocity [0,0,0];
        detach _crate;
        _crate setVelocity [0,0,0.3];
    };
    _player setVariable ["carryingCrate", nil];
    _player forceWalk false;
};
