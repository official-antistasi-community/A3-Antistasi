/*
Maintainer: Caleb Serafin
    REAL CHECKING NOT IMPLEMENTED YET. A3A_fnc_fastTravelRadio still responsible for actual checks. Arguments will change.
    Checks whether a _player can fast travel. Does not check financials.
    If destination is provided: travel to there will also be verified.
    returns tuple of isAllowed and list of reasons why not.

Arguments:
    <OBJECT> Player who orders fast travel. objNull skips permissions.
    <OBJECT> | <GROUP> | <ARRAY<OBJECT>> Thing(s) being fast travelled.
    <POS2D> Optionally specify destination. [DEFAULT = nil]

Return Value:
    ARRAY<STRING> Reasons (if any) why fast travel is not allowed.

Scope: Any, Global Arguments, No Effect
Environment: Any
Public: Yes

Example:
    private _fastTravelBlockers = [_player, _player] call A3A_fnc_canFastTravel;
    if (_fastTravelBlockers isNotEqualTo []) exitWith {
        { systemChat _x } foreach _fastTravelBlockers;
    }
    [] call A3A_fnc_fastTravelRadio;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    ["_player", objNull, [objNull]],
    ["_things", objNull, [objNull, grpNull, []]],
    ["_base", nil, [""]]
];
private _blockers = [];

// Most of the below code is ported from fastTravelRadio

private _groupX = group _player;
private _vehicle = vehicle _player;
private _isVeh = _vehicle != _player;
private _isHC = false;
if (_things isNotEqualTo _player) then {_groupX = _things; _isHC = true; _isVeh = false};

if ((limitedFT == 2) && !(_isHC)) then {_blockers append ["no_param"]};
if (count hcSelected _player > 1) then {_blockers append ["grp_select"]};
if (({isPlayer _x} count units _groupX > 1) and (_isHC)) then {_blockers append ["no_command"]};
if (_player != _player getVariable ["owner",_player]) then {_blockers append ["no_control"]};
if (!_isHC and !(_vehicle isNil "SA_Tow_Ropes")) then {_blockers append ["no_tow"]};
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID _player) in A3A_FFPun_Jailed}) then {_blockers append ["no_ff"]};

private _leader = if (_isHC) then { leader _groupX } else { _player };
if ([getPosATL _leader] call A3A_fnc_enemyNearCheck) then {_blockers append ["no_enemy1"]};
if (_isVeh and _player != driver _vehicle) then {_blockers append ["not_driver"]};
if (_isVeh and (!canMove _vehicle or !(_vehicle isKindOf "Land"))) then {_blockers append ["no_other"]};

// generic blockers done, location-specific blockers now
if !(isNil "_base") then {
    if (((!_isHC) and (limitedFT == 1)) and ((_base != "SYND_HQ") and !(_base in airportsX))) then {_blockers append ["no_onlyhq"]};
    if (sidesX getVariable [_base,sideUnknown] != teamPlayer) then {_blockers append ["no_enemy2"]};
    private _nearMarkers = markersX inAreaArrayIndexes [_base, 500, 500] apply { markersX # _x };
    if (_nearMarkers arrayIntersect forcedSpawn isNotEqualTo []) exitWith {_blockers append ["no_attack1"]};
    if ([markerPos _base] call A3A_fnc_enemyNearCheck) then {_blockers append ["no_attack2"]};
    if (!(_player call A3A_fnc_isMember || _player == theBoss) && {!([markerPos _base] call A3A_fnc_playerLeashCheckPosition)}) then {_blockers append ["no_members"]};
};

_blockers;
