/*  Adds an entry to the enemy recent damage records on the server
    For air vehicles, adds the input threat to the vehicle instead

Scope: Server
Environment: Preferably unscheduled

Arguments:
    <SIDE> Side that took the damage, must be occupants or invaders
    <POS2D> Position that damage was taken
    <SCALAR> Resource value of damage, max 999
    <OBJECT> Killer vehicle, for adding threat to
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_side", "_pos", "_value", "_killer"];

if (_killer isKindOf "Air") exitWith {
    Debug_2("Adding %1 threat to vehicle %2", _value, typeof _killer);

    private _extraThreat = _killer getVariable ["A3A_airKills", 0];
    _killer setVariable ["A3A_airKills", _extraThreat + _value];
};

if (_side != Occupants && _side != Invaders) exitWith { Error_1("Called with invalid side: %1", _side) };

private _killPosValue = [_pos#0, _pos#1, 1000*20 + round _value];      // upper part is a time in minutes, lower part is value
([A3A_recentDamageOcc, A3A_recentDamageInv] select (_side == Invaders)) pushBack _killPosValue;
