/*
Maintainer: Caleb Serafin
    Replacement for fn_donateMoney
    Transfers the desired funds from the donor to the receiver.
    The donor does not get points for donating. This was disabled due to abuse-ability.
    Function will automatically re-execute on the server if called on a client.
    Provides backwards compatibility for direct execution on client.

Arguments:
    <OBJECT> The player object who loses money.
    <OBJECT | STRING> The receiver who gains money. Either a player object or the string "faction" to donate to faction.
    <SCALAR> Amount of Euros to transfer.

Return Value:
    <BOOL> Returns true if donation successful, false if not. Will always be false if executed on non-server.

Scope: Any, Global Arguments, Global Effect
Environment: Unscheduled
Public: Yes

Example:
    [player, cursorObject, 100] call A3A_fnc_sendMoney;
    [player, "faction", 420] call A3A_fnc_sendMoney;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("_this: %1",_this);
params [
    ["_donateFrom", player, [objNull]],
    ["_donateTo", objNull, [objNull,""]],
    ["_donateAmount", 0, [0]]
];

if (isNull _donateFrom || !isPlayer _donateFrom) exitWith {
    Error("_donateFrom was null or not player.");
    false;  // Return
};

if (!isServer) exitWith {
    _this remoteExecCall ["A3A_fnc_sendMoney", 2];
    false;
};

private _title = localize "STR_A3A_fn_orgp_donMon_titel";

if (_donateAmount <= 0) exitWith {
    [_title, localize "STR_A3A_fn_orgp_donMon_not_positive"] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
    false;
};

if (_donateTo isEqualType "") exitWith {
    switch (toLower _donateTo) do {
        case ("faction"): {
            if ([-_donateAmount, _donateFrom] call A3A_fnc_resourcesPlayer) exitWith {
                [0, _donateAmount] call A3A_fnc_resourcesFIA;
                private _scoreReward = 1 * (_donateAmount / 100);
                player setVariable ["score", (player getVariable ["score", 0]) + _scoreReward, true];  // Raise player score for donating.
                [_title, format [localize "STR_A3A_fn_orgp_donMon_donated_faction", _donateAmount]] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
                true;
            };
            [_title, format [localize "STR_A3A_fn_orgp_donMon_no_less", _donateAmount]] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
            false;  // Return
        };
        default {
            Error("Switch case ("+toLower _donateTo+") does not match any options.");
            false;  // Return
        };
    };
};

if (isNull _donateTo || !isPlayer _donateTo) exitWith {
    [_title, localize "STR_A3A_fn_orgp_donMon_no_looking"] call A3A_fnc_customHint;
    false;  // Return
};

if ([-_donateAmount, _donateFrom] call A3A_fnc_resourcesPlayer) exitWith {
    [_donateAmount, _donateTo] call A3A_fnc_resourcesPlayer;
    [_title, format [localize "STR_A3A_fn_orgp_donMon_donated_player", name _donateTo, _donateAmount]] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
    [_title, format [localize "STR_A3A_fn_orgp_donMon_received_money", _donateAmount, name _donateFrom]] remoteExecCall ["A3A_fnc_customHint", _donateTo];
    true;  // Return
};
[_title, format [localize "STR_A3A_fn_orgp_donMon_no_less", _donateAmount]] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
false;  // Return
