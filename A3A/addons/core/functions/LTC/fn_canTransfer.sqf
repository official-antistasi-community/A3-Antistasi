/*
    Author: [Håkon]
    [Description]
        Handles request to transfer from a container to another

    Arguments:
    0. <Object> Crate to transfere from
    1. <Int>    Client ID
    2. <Bool>   Transfere done ( optional -Default: false)

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example:
        [cursorObject, clientOwner] remoteExecCall ["A3A_fnc_canTransfer", 2];
        [_target, clientOwner, true] remoteExecCall ["A3A_fnc_canTransfer", 2];

    License: MIT License
*/
//blocks transfer if container is already transfering
params ["_crate", ["_owner",2], ["_done", false]];
private _titleStr = localize "STR_A3A_fn_ltc_title";

if (isNil "LTCTransferringCrates") then {LTCTransferringCrates = []};
if (!_done) then {

    if !(_crate in LTCTransferringCrates) then {
        LTCTransferringCrates pushBack _crate;
        [_crate] remoteExec ["A3A_fnc_lootFromContainer", _owner];

        _crate spawn {
            sleep 20;
            if (_this in LTCTransferringCrates) then {
                LTCTransferringCrates deleteAt (LTCTransferringCrates find _this);
            };
        };
    } else {
        [_titleStr, localize "STR_A3A_fn_ltc_cant_already"] remoteExec ["A3A_fnc_customHint", _owner];
    };


} else {
    if (_crate in LTCTransferringCrates) then {
        LTCTransferringCrates deleteAt (LTCTransferringCrates find _crate);
    };
};
