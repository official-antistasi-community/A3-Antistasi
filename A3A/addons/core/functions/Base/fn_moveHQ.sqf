/*
    Start HQ move process, join petros into player group

    Scope: Server
    Environment: Unscheduled
    Public: Yes

    Example:
    [player] remoteExecCall ["A3A_fnc_moveHQ", 2];
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_player"];

if (A3A_petrosMoving) exitWith {
	Error("MoveHQ called when petros was moving");
};

private _possible = [_player] call A3A_fnc_canMoveHQ;
private _titleStr = localize "STR_A3A_fn_base_movehq_garrison";

if !(_possible#0) exitWith {
    [_titleStr, _possible#1] remoteExecCall ["customHint", _client];
};

A3A_petrosMoving = true; publicVariable "A3A_petrosMoving";

// The enableAI commands will only affect localhost
petros setBehaviour "AWARE";
petros enableAI "MOVE";
petros enableAI "AUTOTARGET";

private _groupPetros = group petros;
[petros] join theBoss;
deleteGroup _groupPetros;

fireX inflame false;

[respawnTeamPlayer, 0, teamPlayer] call A3A_fnc_setMarkerAlphaForSide;
[respawnTeamPlayer, 0, civilian] call A3A_fnc_setMarkerAlphaForSide;

["Synd_HQ", false, true, true] call A3A_fnc_garrisonServer_clear;
