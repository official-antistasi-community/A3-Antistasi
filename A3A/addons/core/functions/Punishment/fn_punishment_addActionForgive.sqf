/*
Function:
	A3A_fnc_punishment_addActionForgive

Description:
	Adds action to the Admin to forgive the detainee;
	Adds action to the detainee to refresh the Admin's action.

Scope:
	<LOCAL> Execute on the admin.

Environment:
	<UNSCHEDULED>

Parameters:
	<STRING> The UID of the detainee that the actions pertains to.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if the detainee is free; nil if it has crashed.

Examples:
	[_UID] remoteExec ["A3A_fnc_punishment_addActionForgive",_admin,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params ["_UID","_offenceTotal","_name"];
private _filename = "fn_punishment_addActionForgive";

if (_offenceTotal < 1) exitWith {false}; // If offence is less than 1, the UID is not a detained player.

private _actionsSelf = actionIDs player;
private _alreadyHasAction = false; // Avoids having the action added again.
private _actionName = ["[" + localize "STR_A3A_fn_punishment_FF_addAcFor" + "]" ,_name,""] joinString """";
if ((!isNil "_actionsSelf") && {!(_actionsSelf isEqualTo [])}) then {  // All players will be scanned, in-case they were previously an admin.
	{
		if (((player actionParams _x)#0) isEqualTo _actionName) exitWith {
			_alreadyHasAction = true;
		};
	} forEach _actionsSelf;
};

if (!_alreadyHasAction) then {
	private _addAction_parameters = [
		_actionName,
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
				[_arguments,"forgive"] remoteExecCall ["A3A_fnc_punishment_release",2,false];
			};
			player removeAction _actionId;
		},
		_UID,
		0.1
	];
	player addAction _addAction_parameters;
};
true;
