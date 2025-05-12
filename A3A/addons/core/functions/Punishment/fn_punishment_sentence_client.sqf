/*
Function:
	A3A_fnc_punishment_sentence_client

Description:
	Controls the client side UI for punishment sentences.

Scope:
	<LOCAL> Execute on detainee to use his processing power.

Environment:
	<SCHEDULED>

Parameters:
	<STRING> The UID of the detainee in Ocean Gulag.
	<NUMBER> The time left until detainee is released.

Returns:
	<BOOLEAN> true after 5 seconds if it hasn't crashed; false if the detainee disconnected or died; nil if it has crashed.

Examples:
	[_UID,_timeLeft] remoteExec ["A3A_fnc_punishment_sentence_client",_detainee,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params ["_detainee","_timeLeft"];
private _filename = "fn_punishment_sentence_client";
scriptName "fn_punishment_sentence_client";

if (_timeLeft < 5) then {_timeLeft = 5;}; // Sometimes something somewhere might go out of sync, so we just troll the player if that happens.

for "_timeLeft" from _timeLeft to _timeLeft-4 step -1 do {
	if (!isPlayer _detainee) exitWith {false};
	[localize "STR_A3A_fn_punish_ff_pun", format [localize "STR_A3A_fn_punish_punSenCl_text",_timeLeft], true] call A3A_fnc_customHint;
	uiSleep 1;
};
true;
