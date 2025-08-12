/*
Function:
    A3A_fnc_punishment_FF_addEH

Description:
    Adds EHs for Punishment FF check.
    This is the default entry point for the Punishment Module.
    Nothing else should be called from Antistasi.

Scope:
    <LOCAL> Execute on object you wish to assign the EH to.

Environment:
    <ANY>

Parameters:
    <OBJECT> The Object that the Event Handlers are being added to.
    <BOOLEAN> Whether it is intended to be added to AI.

Returns:
    <BOOLEAN> true if it hasn't crashed; false if tkPunish is disabled or invalid params; nil if it has crashed.

Examples:
    if (hasInterface) then {
        [player] call A3A_fnc_punishment_FF_addEH; // Recommended to add to "onPlayerRespawn.sqf"
    };
    [cursorObject,true] remoteExecCall ["A3A_fnc_punishment_FF_addEH",cursorObject,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/
params [ ["_unit",objNull,[objNull]], ["_addToAI",false,[false]] ];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (tkPunish == 0) exitWith {false};
if (!(_unit isKindOf "Man")) exitWith {
    Error("No unit given");
    false;
};

private _isAI = !isPlayer _unit || !hasInterface || {!(_unit isEqualTo player)}; // Avoiding adding fired handlers for Ai. Needs to be local for ace, self punishment, and checkStatus.

if (_isAI && !_addToAI) exitWith {true};

_unit addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    [[_instigator,_killer], 60, 0.4, _unit] remoteExecCall ["A3A_fnc_punishment_evaluateEvent",2,false];
}];
_unit addEventHandler ["Hit", {
    params ["_unit", "_source", "_damage", "_instigator"];
    [[_instigator,_source], 60, 0.4, _unit] remoteExecCall ["A3A_fnc_punishment_evaluateEvent",2,false];
}];

if (_isAI) exitWith {true};

if (A3A_hasACE) then {
    ["ace_firedPlayer", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
        [_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
    }] call CBA_fnc_addEventHandler;
    ["ace_explosives_place", {
        params ["_explosive","_dir","_pitch","_unit"];
        if !(local _unit) exitWith {}; // ace_explosives_place is a globally executed EH
        [_unit,"Put",_explosive] call A3A_fnc_punishment_FF_checkNearHQ;
    }] call CBA_fnc_addEventHandler;
    ["ace_throwableThrown", {
        params ["_unit", "_throwable"];
        [_unit,"Throw",_throwable] call A3A_fnc_punishment_FF_checkNearHQ;
    }] call CBA_fnc_addEventHandler;
} else {
    _unit addEventHandler ["FiredMan", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
        [_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
    }];
};

[getPlayerUID player] remoteExecCall ["A3A_fnc_punishment_checkStatus",2,false];
Debug_1("Punishment Event Handlers Added to: %1",name _unit);
true;

/*
# Global/Public variables used by punishment module.

All other public variables referenced:
| Name              | Type          | Machine   | Domain            | Description                                                           |
|-------------------|---------------|-----------|-------------------|-----------------------------------------------------------------------|
| A3A_hasACE        | BOOLEAN       | Public    | missionNamespace  | If ACE is loaded.                                                     |
| tkPunish          | SCALAR        | Public    | missionNamespace  | Parameter. 0 - disabled, 1 - enabled, 2 - log/notify only             |
| petros            | OBJECT        | Public    | missionNamespace  | AI that rebels need to protect and access.                            |
| posHQ             | POS3D<AGL>    | Public    | missionNamespace  | getMarkerPos respawnTeamPlayer. The position of the HQ marker.        |

All public created variables:
| Name              | Type          | Machine   | Domain            | Description                                                           |
|-------------------|---------------|-----------|-------------------|-----------------------------------------------------------------------|
| A3A_FFPun_Jailed  | ARRAY<STRING> | Public    | missionNamespace  | Contains UIDs of players who are in ocean gulag. Server write only.   |
| A3A_FFPun         | LOCATION      | Server    | missionNamespace  | Contains locations dynamically named by UID (_UID).                   |
| _UID              | LOCATION      | Server    | A3A_FFPun         | Dynamically named. Contains variable info about the player.           |
| player            | OBJECT        | Server    | _UID              | Object of the detainee.                                               |
| name              | STRING        | Server    | _UID              | In-game name of detainee.                                             |
| overhead          | SCALAR        | Server    | _UID              | Overhead of offence that does not get depreciated.                    |
| offenceTotal      | SCALAR        | Server    | _UID              | Depreciated offence amount plus overhead.                             |
| timeTotal         | SCALAR        | Server    | _UID              | Depreciated punishment time.                                          |
| lastOffenceTime   | SCALAR        | Server    | _UID              | Last ServerTime depreciation was calculated.                          |
| initialPosASL     | POS3D<ASL>    | Server    | _UID              | Initial position of the detainee before he was sent to ocean gulag.   |
| platform          | OBJECT        | Server    | _UID              | Object that the detainee is attached to.                              |
| sentenceEndTime   | SCALAR        | Server    | _UID              | ServerTime that detainee is released.                                 |

Worker processes:
| Script Name                       | Machine   | Description                                                                               |
|-----------------------------------|-----------|-------------------------------------------------------------------------------------------|
| fn_punishment_sentence_server     | Server    | Controls whether detainee in on ocean gulag. Avg time 120sec (But may run longer)         |
| fn_punishment_sentence_client     | Client    | Hosts time counter on detainee. Lasts 5 seconds.                                          |
*/
