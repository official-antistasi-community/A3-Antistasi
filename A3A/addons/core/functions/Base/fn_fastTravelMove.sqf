// TODO: Everything here needs a refactor, and preferably this and fastTravelRadio will be merged.

/*
Maintainer: Tiny-DM
    Moves this player or target group to the destination.
    This function manages hints, deducts money, finds the cost, manages the black screen, and moves the player.
    No checks are ran to ensure the player is actually able to fast travel to the given destination.

Arguments:
    <STRING> Marker to get type of

Return Value:
    <STRING> Marker type

Scope: Local
Environment: Scheduled
Public: No
Dependencies:
    <ARRAY> airportsX

Example:
    [player,"Synd_HQ",player] spawn A3A_fnc_fastTravelMove; // Moves player back to HQ
    [_hcGroup,"airport",player] spawn A3A_fnc_fastTravelMove; // Moves given HC group to the first defined airport, regardless of side.

License: APL-ND

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_groupX","_base","_player"];
private _titleStr = localize "STR_A3A_fn_dialogs_ftradio_title";
private _esHC = (_groupX isEqualType grpNull);
_boss = leader _groupX;

private _ftUnit = [_player, _boss] select _esHC;
[_ftUnit, [vehicle _ftUnit], markerPos _base] call FUNCMAIN(calculateFastTravelCost) params ["_fastTravelCost","_fastTravelTime"];
if !(_esHC) then {[-_fastTravelCost] call A3A_fnc_resourcesPlayer};

_positionX = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
//if (!_esHC) then {disableUserInput true; cmutText ["Fast traveling, please wait","BLACK",2]; sleep 2;} else {hcShowBar false;hcShowBar true;hint format ["Moving group %1 to destination",groupID _groupX]; sleep _fastTravelTime;};
if (!_esHC) then {
    disableUserInput true;
    cutText [format [localize "STR_A3A_fn_dialogs_fastTravelRadio_begin", ([[_fastTravelTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format)],"BLACK",1];
    sleep 1;
} else {
    [_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_grp_moving",groupID _groupX]] call A3A_fnc_customHint;
    sleep _fastTravelTime;
};
if (!_esHC) then
    {
    _timePassed = 0;
    while {_timePassed < _fastTravelTime} do
        {
        cutText [format [localize "STR_A3A_fn_dialogs_fastTravelRadio_begin", ([[_fastTravelTime - _timePassed] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format)],"BLACK",0.0001];
        sleep 1;
        _timePassed = _timePassed + 1;
        }
    };
_checkForPlayer = false;
if (limitedFT == 1) then
    {
    _vehicles = [];
    {if (vehicle _x != _x) then {_vehicles pushBackUnique (vehicle _x)}} forEach units _groupX;
    {if ((vehicle _x) in _vehicles) exitWith {_checkForPlayer = true}} forEach (call A3A_fnc_playableUnits);
    };
if (_checkForPlayer and ((_base != "SYND_HQ") and !(_base in airportsX)))
exitWith {[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_cancelled",groupID _groupX]] call A3A_fnc_customHint;};
private _ftUnits = [];
{
_unit = _x;
if ((!isPlayer _unit) or (_unit == player)) then
    {
    //_unit hideObject true;
    _unit allowDamage false;
    _ftUnits pushBack _unit;
    if (_unit != vehicle _unit) then
        {
        if (driver vehicle _unit == _unit) then
            {
            sleep 3;
            _radiusX = 10;
            private _roads = [];
            while {true} do
                {
                _roads = _positionX nearRoads _radiusX;
                if (count _roads > 0) exitWith {};
                _radiusX = _radiusX + 10;
                };
            _road = _roads select 0;
            _pos = position _road findEmptyPosition [10,100,typeOf (vehicle _unit)];
            vehicle _unit setPos _pos;
            };
        if ((vehicle _unit isKindOf "StaticWeapon") and (!isPlayer (leader _unit))) then
            {
            _pos = _positionX findEmptyPosition [10,100,typeOf (vehicle _unit)];
            vehicle _unit setPosATL _pos;
            };
        }
    else
        {
        if (!(_unit getVariable ["incapacitated",false])) then
            {
            _positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
            _unit setPosATL _positionX;
            if (isPlayer leader _unit) then {_unit setVariable ["rearming",false]};
            _unit doWatch objNull;
            _unit doFollow leader _unit;
            }
        else
            {
            _positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
            _unit setPosATL _positionX;
            };
        };
    };
} forEach units _groupX;
if (!_esHC) then {disableUserInput false;cutText [localize "STR_A3A_fn_dialogs_fastTravelRadio_end","BLACK IN",1]}
else {[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_grp_arrived",groupID _groupX]] call A3A_fnc_customHint;};
[] call A3A_fnc_playerLeashRefresh;
sleep 5;
{_x allowDamage true} forEach _ftUnits;
