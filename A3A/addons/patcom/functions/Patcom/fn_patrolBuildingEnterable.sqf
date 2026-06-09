/*
    Author: [Hazey] and John Jordan
    Description:
        Checks if building is enterable and validates it with a blacklist

    Arguments:
        <Object> House/Object you want to check if its enterable

    Return Value:
        <Bool> Returns True or False if house is enterable

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_x] call A3A_fnc_patrolBuildingEnterable

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_house"];

// No building positions
if (_house buildingPos -1 isEqualTo []) exitWith { false };

// Check if the house is blacklisted
if (typeOf _house in PATCOM_Building_Blacklist) exitWith { false };

// Don't place units in destroyed buildings
if (damage _house >= 1 or isObjectHidden _house) exitWith { false };

true;
