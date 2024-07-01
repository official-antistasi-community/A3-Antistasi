/*
Maintainer: Caleb Serafin, DoomMetal
    Gets a high command groups assigned vehicle

Arguments:
    <GROUP> A high command group

Return Value:
    <OBJECT> The high command groups vehicle or objNull if it has none

Scope: Any, Global Arguments
Environment: Any
Public: Yes
Dependencies:
    None

Example:
    [_someGroup] call FUNC(getGroupVehicle); // Returns the group vehicle if it has one, objNull if not

License: APL-ND

*/

// This function was part of A3A_fnc_vehStats

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_groupX",grpNull]];


if !((typeName _groupX) isEqualTo "GROUP") exitWith
{
    Error_1("%1 is not a group", _groupX);
    objNull;
};

if (isNull _groupX) exitWith
{
    Error("Group is null");
    objNull;
};

_vehicle = objNull;
{
    _owner = _x getVariable "owner";
    if (!isNil "_owner") then {if (_owner == _groupX) exitWith {_vehicle = _x}};
} forEach vehicles;

if (isNull _vehicle) then
{
    {
        if ((vehicle _x != _x) and (_x == driver _x) and !(vehicle _x isKindOf "StaticWeapon")) exitWith {_vehicle = vehicle _x};
    } forEach units _groupX;
};

_vehicle
