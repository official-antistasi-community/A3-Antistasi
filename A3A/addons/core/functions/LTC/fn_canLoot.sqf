/*
    Author: [Håkon]
    [Description]
        Handles request to loot an area with LTC

    Arguments:
    0. <Object> Crate to loot to
    1. <Int>    Client ID
    2. <Bool>   Transfere done ( optional -Default: false)

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example:
        [cursorObject, clientOwner] remoteExecCall ["A3A_fnc_canLoot", 2];
        [_container, clientOwner, true] remoteExecCall ["A3A_fnc_canLoot", 2];

    License: MIT License
*/
//blocks looting if nearby container is already looting
params ["_crate", ["_owner",2], ["_done", false]];
private _pos = getPos _crate;
private _titleStr = localize "STR_A3A_fn_ltc_title";

if (isNil "LTClootingAreas") then {LTClootingAreas = []};
if (!_done) then {
    private _alreadyLootingPos = LTClootingAreas inAreaArray [_pos, 20, 20];

    if (_alreadyLootingPos isEqualTo []) then {
        LTClootingAreas pushBack _pos;
        [_crate] remoteExec ["A3A_fnc_lootToCrate", _owner];

        _pos spawn {
            sleep 20;
            if (_this in LTClootingAreas) then {
                LTClootingAreas deleteAt (LTClootingAreas find _this);
            };
        };
    } else {
        [_titleStr, localize "STR_A3A_fn_ltc_canl_cooldown"] remoteExec ["A3A_fnc_customHint", _owner];
    };

} else {
    _pos = LTClootingAreas inAreaArray [_pos, 1, 1]; //override in case of looting while crate was in motion, done by the carry action
    if !(_pos isEqualTo []) then {
        LTClootingAreas deleteAt (LTClootingAreas find (_pos#0));
    };
};
