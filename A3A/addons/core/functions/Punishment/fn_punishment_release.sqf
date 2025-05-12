/*
Function:
	A3A_fnc_punishment_release

Description:
	Releases a detainee from his sentence if he is incarcerated.
	Forgives all punishment stats.

Scope:
	<SERVER> Execute on server.

Environment:
	<UNSCHEDULED>

Parameters:
	<STRING> The detainee's UID.
	<STRING> Who is calling the function. All external calls should only use "forgive".

Returns:
	<BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Examples:
	[_UID,"forgive"] remoteExecCall ["A3A_fnc_punishment_release",2]; // Forgive all sins and release from Ocean Gulag.

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params ["_UID",["_source",""]];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {
    Error("NOT SERVER");
	false;
};

private _varspace = [missionNamespace,"A3A_FFPun",_UID,locationNull] call A3A_fnc_getNestedObject;
private _name = _varspace getVariable ["name","NO NAME"];
private _detainee = _varspace getVariable ["player",objNull];

private _playerStats = format["Player: %1 [%2]", _name, _UID];

private _releaseFromSentence = {
	[_name] remoteExecCall ["A3A_fnc_punishment_removeActionForgive",0,false];
	[_UID,"remove"] call A3A_fnc_punishment_oceanGulag;
};
private _forgiveStats = {
	private _varspace = [missionNamespace,"A3A_FFPun",_UID,"timeTotal",nil] call A3A_fnc_setNestedObject;
	_varspace setVariable ["offenceTotal",nil];
	_varspace setVariable ["overhead",nil];
	_varspace setVariable ["sentenceEndTime",nil];
};

switch (_source) do {
	case "punishment_warden": {
		call _forgiveStats;
		call _releaseFromSentence;
        Info_1("RELEASE | %1", _playerStats);
		if (isPlayer _detainee) then {
			[localize "STR_A3A_fn_punish_ff_pun", localize "STR_A3A_fn_punish_punRel_enough"] remoteExecCall ["A3A_fnc_customHint", _detainee, false];
		};
		true;
	};
	case "punishment_warden_manual": {
		call _forgiveStats;
		call _releaseFromSentence;
        Info_1("FORGIVE | %1", _playerStats);
		if (isPlayer _detainee) then {
			[localize "STR_A3A_fn_punish_ff_pun", localize "STR_A3A_fn_punish_punRel_admin"] remoteExecCall ["A3A_fnc_customHint", _detainee, false];
		};
		true;
	};
	case "forgive": {
		[missionNamespace,"A3A_FFPun",_UID,"sentenceEndTime",0] call A3A_fnc_setNestedObject;
		true;
	};
	default {
        Error_1("INVALID PARAMS | _source=""%1""", _source);
		false;
	};
};
