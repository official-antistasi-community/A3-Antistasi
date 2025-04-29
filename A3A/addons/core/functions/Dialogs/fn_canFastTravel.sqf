/*
Maintainer: Caleb Serafin
    REAL CHECKING NOT IMPLEMENTED YET. A3A_fnc_fastTravelRadio still responsible for actual checks. Arguments will change.
    Checks whether a player can fast travel. Does not check financials.
    If destination is provided: travel to there will also be verified.
    returns tuple of isAllowed and list of reasons why not.

Arguments:
    <OBJECT> Player who orders fast travel. objNull skips permissions.
    <OBJECT> | <GROUP> | <ARRAY<OBJECT>> Thing(s) being fast travelled.
    <POS2D> Optionally specify destination. [DEFAULT = nil]

Return Value:
    <BOOL,ARRAY<STRING>> If fast travel is allowed and reasons why not.

Scope: Any, Global Arguments, No Effect
Environment: Any
Public: Yes

Example:
    [player, player] call A3A_fnc_canFastTravel params ["_isFastTravelAllowed","_fastTravelBlockers"];
    if (!_isFastTravelAllowed) exitWith {
        { systemChat _x } foreach _fastTravelBlockers;
    }
    [] call A3A_fnc_fastTravelRadio;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    ["_player", objNull, [objNull]],
    ["_things", objNull, [objNull, grpNull, []]],
    ["_destination", nil, [[]], [2,3]]
];
if (_things isEqualType objNull || _things isEqualType grpNull) then {
    _things = [_things];
};
private _blockers = [];


// Most of the below code is ported from fastTravelRadio

private _isHC = false;
private _groupX = grpNull;
if (count hcSelected _player == 1) then {_groupX = hcSelected player select 0; _isHC = true} else {_groupX = group player};

if ((limitedFT == 2) && !(_isHC)) then {_blockers append ["no_param"]};
if (count hcSelected _player > 1) then {_blockers append ["grp_select"]};
if (({isPlayer _x} count units _groupX > 1) and (_isHC)) then {_blockers append ["no_command"]};
if (_player != _player getVariable ["owner",_player]) then {_blockers append ["no_control"]};
if (!_isHC and !isNil {vehicle player getVariable "SA_Tow_Ropes"}) then {_blockers append ["no_tow"]};
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) then {_blockers append ["no_ff"]};

private _checkX = false;
{if ([getPosATL _x] call A3A_fnc_enemyNearCheck) exitWith {_checkX = true}} forEach units _groupX;
if (_checkX) then {_blockers append ["no_enemy1"]};

{if ((vehicle _x!= _x) and ((isNull (driver vehicle _x)) or (!canMove vehicle _x) or (vehicle _x isKindOf "Boat"))) then
	{
	if (not(vehicle _x isKindOf "StaticWeapon")) then {_checkX = true};
	}
} forEach units _groupX;
if (_checkX) then {_blockers append ["no_other"]};

// generic blockers done, location-specific blockers now
if !(isNil "_destination") then {
    private _markersX = markersX + [respawnTeamPlayer];
    _base = [_markersX, _destination] call BIS_Fnc_nearestPosition;
    if (((!_isHC) and (limitedFT == 1)) and ((_base != "SYND_HQ") and !(_base in airportsX))) then {_blockers append ["no_onlyhq"]};
    if ((sidesX getVariable [_base,sideUnknown]) in [Occupants, Invaders]) then {_blockers append ["no_enemy2"]};
    if (_base in forcedSpawn) exitWith {_blockers append ["no_attack1"]};
    if ([getMarkerPos _base] call A3A_fnc_enemyNearCheck) then {_blockers append ["no_attack2"]};
    if (!(player call A3A_fnc_isMember || player == theBoss) && {!([_destination] call A3A_fnc_playerLeashCheckPosition)}) then {_blockers append ["no_members"]};
};

[count _blockers == 0, _blockers];

