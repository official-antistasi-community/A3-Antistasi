/*
Function:
    A3A_fnc_punishment_sentence_server

Description:
    Organises the sentence and addActions of the detainee.
    Includes timer and release mechanism.
    Will release on remote sentence release time shorting.

Scope:
    <SERVER> Execute on server.

Environment:
    <UNSCHEDULED>.

Parameters:
    <STRING> The UID of the detainee being sent to Ocean Gulag.
    <NUMBER> The time the detainee will be imprisoned.

Returns:
    <BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Examples:
    [_UID,_timeTotal] remoteExecCall ["A3A_fnc_punishment_sentence_server",2,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params ["_UID","_timeTotal"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

_timeTotal = 5*(floor (_timeTotal/5)); // Rounds up so the loop lines up.
private _sentenceEndTime = (floor serverTime) + _timeTotal;
private _varspace = [missionNamespace,"A3A_FFPun",_UID,"sentenceEndTime",_sentenceEndTime] call A3A_fnc_setNestedObject;
_varspace setVariable ["timeTotal",_timeTotal];
_varspace setVariable ["offenceTotal",2];

private _varspace = [missionNamespace,"A3A_FFPun",_UID,locationNull] call A3A_fnc_getNestedObject;
private _name = _varspace getVariable ["name","NO NAME"];
private _detainee = _varspace getVariable ["player",objNull];

[_detainee,_UID,_name,_sentenceEndTime,_timeTotal] spawn {
    params ["_detainee","_UID","_name","_sentenceEndTime","_timeTotal"];
    private _filename = "fn_punishment_sentence_server";
    scriptName "fn_punishment_sentence_server";

    private _lastAdmin = objNull;
    private _admin = objNull;
    private _sentenceEndTime_old = _sentenceEndTime;
    private _disconnected = false;

    while {(ceil serverTime) < _sentenceEndTime-1} do { // ceil and -1 if something doesn't sync up
        if (!isPlayer _detainee) exitWith {_disconnected=true};
        _admin = [] call A3A_fnc_getAdmin;  // Refreshes in case the admin logged in.
        if !(_admin isEqualTo _lastAdmin) then {  // Admin Change
            if (!isNull _lastAdmin) then {
                [_name] remoteExecCall ["A3A_fnc_punishment_removeActionForgive",_lastAdmin,false];
            };
            if (!isNull _admin) then {
                if (_admin isEqualTo _detainee) exitWith { [_UID,"forgive"] call A3A_fnc_punishment_release; };  // The admin cannot use the self forgive scroll-action when attached to the surf-board.
                private _injuredFriendly = _detainee getVariable ["_lastFriendlyHit", false];
                private _punishAdminText = if (_injuredFriendly isEqualTo false) then {
                    format[localize "STR_A3A_fn_punish_punSenSv_text2", _name];
                } else {
                    format[localize "STR_A3A_fn_punish_punSenSv_text1", _name, _injuredFriendly];
                };
                [localize "STR_A3A_fn_punish_ff_noti", _punishAdminText] remoteExecCall ["A3A_fnc_customHint",_admin,false];
                [_UID,[missionNamespace,"A3A_FFPun",_UID,"offenceTotal",0] call A3A_fnc_getNestedObject,_name] remoteExecCall ["A3A_fnc_punishment_addActionForgive",_admin,false];
            };
            _lastAdmin = _admin;
        };
        [_detainee,_sentenceEndTime - (floor serverTime)] remoteExec ["A3A_fnc_punishment_sentence_client",_detainee,false];
        [_UID,"add"] call A3A_fnc_punishment_oceanGulag;
        uiSleep 5;
        _sentenceEndTime = [missionNamespace,"A3A_FFPun",_UID,"sentenceEndTime",floor serverTime] call A3A_fnc_getNestedObject; // Polls for updates from admin forgive

    };
    if (_disconnected) then {
        _playerStats = format["Player: %1 [%2], _timeTotal: %3", _name, _UID, str _timeTotal];
        Info_1("DISCONNECTED/DIED WHILE PUNISHED | %1", _playerStats);
        systemChat format["FF: %1 disconnected/died while being punished.",_name];
        [_UID,"remove"] call A3A_fnc_punishment_oceanGulag;
    } else {
        [_UID,["punishment_warden_manual","punishment_warden"] select (_sentenceEndTime_old isEqualTo _sentenceEndTime)] call A3A_fnc_punishment_release;
    };
};
true;
