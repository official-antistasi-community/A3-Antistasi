/*
Function:
	A3A_fnc_punishment

Description:
	Punishes the player given for FF.
	Doesn't do the checking itself, refer to A3A_fnc_punishment_FF.

Scope:
	<SERVER>

Environment:
	<UNSCHEDULED> Suspension may cause simultaneous read then write of the players FF stats, leading to the last call taking preference.

Parameters:
	<OBJECT> Player that is being verified for FF.
	<NUMBER> The amount of time to add to the players total sentence time.
	<NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
	<OBJECT> [OPTIONAL] The victim of the player's FF.

Returns:
	<STRING> Either an exemption type or a return from fn_punishment.sqf.

Examples:
	[_instigator,_timeAdded,_offenceAdded,_victim] remoteExecCall ["A3A_fnc_punishment",2,false]; // How it should be called from another A3A_fnc_punishment_FF.
	// Unit Tests:
	[cursorObject, 0, 0] remoteExecCall ["A3A_fnc_punishment",2];                                 // Ping with FF Warning
	[cursorObject,120, 1] remoteExecCall ["A3A_fnc_punishment",2];                                // Punish, 120 additional seconds
	[player,10, 1] remoteExecCall ["A3A_fnc_punishment",2];                                       // Test Self Punish, 10 additional seconds
	// Function that goes hand-in-hand
	[getPlayerUID cursorObject,"forgive"] remoteExecCall [A3A_fnc_punishment_release,2]; // Forgive all sins

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull],["_customMessage",""]];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//////////////////Settings//////////////////
private _depreciationCoef = 0.75;	// Modifies the drop-off curve of the punishment score; a higher number drops off quicker, a lower number lingers longer.
private _overheadPercent = 0.3;		// Percentage of _offenceAdded that does not get depreciated.

//////////Fetches punishment values/////////
private _originalBody = _instigator getVariable ["owner",_instigator];
private _UID = getPlayerUID _instigator;
private _name = name _instigator;
private _currentTime = (floor serverTime);

private _varspace = [missionNamespace,"A3A_FFPun",_UID,locationNull] call A3A_fnc_getNestedObject;
private _timeTotal = _varspace getVariable ["timeTotal",0];
private _offenceTotal = _varspace getVariable ["offenceTotal",0];
private _lastTime = _varspace getVariable ["lastOffenceTime",_currentTime];
private _overhead = _varspace getVariable ["overhead",0];

///////////////Data validation//////////////
_lastTime = (0 max _lastTime) min _currentTime;
_overhead = (0 max _overhead) min 1;
_offenceAdded = 0 max _offenceAdded;
_offenceTotal = (0 max _offenceTotal) min 2;
_timeAdded = 0 max _timeAdded;
_timeTotal = 0 max _timeTotal;

//////////////FF score addition/////////////
private _periodDelta = _currentTime - _lastTime;
_offenceTotal = _offenceTotal - _overhead;                                                      // _overhead is removed to exclude it from depreciation calculation.
_overhead = (_overhead + _offenceAdded * _overheadPercent) min 1;

_offenceTotal = _offenceTotal * (1-_depreciationCoef*(1-(_offenceTotal))) ^(_periodDelta/300);  // Special Depreciation formula, slow curve -> exponential drop -> slow curve ‾‾\__

_offenceTotal = (_offenceTotal + _offenceAdded * (1-_overheadPercent)) min 1;                   // New offence is added here. However, the amount of additional offence that was taken for overhead: is now excluded.
_offenceTotal = _offenceTotal + _overhead;                                                      // Maximum sum is capped at two as they were capped at one before this addition.

_timeTotal = _timeTotal * (1-_depreciationCoef) ^(_periodDelta/3000);                           // Simpler depreciation formula, larger time is used as their is no overhead system to stop it from becoming mere milliseconds after an hour.
_timeTotal = _timeTotal + _timeAdded;

//////////Saves data to instigator//////////
private _varspace = [missionNamespace,"A3A_FFPun",_UID,"timeTotal",_timeTotal] call A3A_fnc_setNestedObject;
_varspace setVariable ["offenceTotal",_offenceTotal];
_varspace setVariable ["lastOffenceTime",_currentTime];
_varspace setVariable ["overhead",_overhead];
_varspace setVariable ["name",_name];
_varspace setVariable ["player",_originalBody];

///////////////Victim Notifier//////////////
private _injuredComrade = "";
private _victimStats = "damaged systemPunished [AI]";
if (_victim isKindOf "Man") then {
	_injuredComrade = [localize "STR_antistasi_customHint_FF_injured"+" ",name _victim] joinString "";
	[localize "str_cfg_markers_warning", format [localize "STR_antistasi_customHint_punish_hurt",_name]] remoteExecCall ["A3A_fnc_customHint", _victim, false];
	private _UIDVictim = ["AI", getPlayerUID _victim] select (isPlayer _victim);
	_victimStats = ["damaged ",name _victim," [",_UIDVictim,"]"] joinString "";
};

/////////////Instigator Notifier////////////
private _playerStats = ["Total-time: ",str _timeTotal," (incl. +",str _timeAdded,"), Offence+Overhead: ",str _offenceTotal," [",str (_offenceTotal-_overhead),"+",str _overhead,"] (incl. +",str _offenceAdded,")"] joinString "";
private _instigatorLog = [["WARNING","GUILTY"] select (_offenceTotal >= 1)," | ",_name," [",_UID,"] ",_victimStats,", ",_playerStats] joinString "";
Info(_instigatorLog);

[localize "str_cfg_markers_warning", [localize "STR_antistasi_customHint_friendlyFire",_injuredComrade,_customMessage] joinString "<br/>"] remoteExecCall ["A3A_fnc_customHint", _originalBody, false];

if (_offenceTotal < 1) exitWith {"WARNING";};

////////Exit Remote Control (if any)////////
if (_instigator isEqualTo _originalBody) then {
	[_UID,_timeTotal] spawn A3A_fnc_punishment_sentence_server;  // Scope is within unscheduled space.
} else {
	(units group _originalBody) joinSilent group _originalBody;  // Refer to controlunit.sqf for source of this *function*
	group _instigator selectLeader _originalBody;
	[localize "STR_antistasi_customHint_control", localize "STR_antistasi_customHint_control_return"] remoteExecCall ["A3A_fnc_customHint",_instigator,false];
	[_originalBody] remoteExec ["selectPlayer",_instigator,false];

	[_instigator,_originalBody,_UID,_timeTotal,_name] spawn {  // Waits for player to control original body. This will be relocated to sentence_client in the future allowing for snappy execution server-side.
		params ["_instigator","_originalBody","_UID","_timeTotal","_name"];
		private _timeOut = serverTime + 20;
		waitUntil {isPlayer _originalBody || _timeOut < serverTime};
		if !(isPlayer _originalBody) exitWith {
            private _timeOutLog = ["TIMED-OUT | Gave up waiting for ",_name," [",_UID,"] to exit remote control."] joinString "";
            Error(_timeOutLog);
		};
		[_UID,_timeTotal] call A3A_fnc_punishment_sentence_server; // Scope is within scheduled space.
	};
};
"GUILTY";
