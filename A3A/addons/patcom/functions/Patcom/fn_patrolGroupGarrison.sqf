/*
    Author: [Hazey] and John Jordan
    Description:
        Sends group directly to garrison positions

    Arguments:
        <Group> Group to run action on.
        <Array> Array of places from patrolGetBuildingPlaces

    Return Value:
        <Group> Returns new group of leftover units, or grpNull if none

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        private _garrisonGroups = [_group, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_places"];

private _units = units _group;
private _newGroup = grpNull;

if (count _units == 0) exitwith {
    Debug_1("PATCOM | No units found in group (%1). Exiting", _group);
    _newGroup;
};

_group lockWP true;         // hmm

{
    _x params ["_placePos", "_placeDir"];

    private _unit = _units deleteAt 0;
    _unit setPosATL _placePos;
    _unit setdir _placeDir;
    _unit setUnitPos "UP";
    _unit setVariable ["A3A_forcedStance", "UP"];
    _unit disableAI "TARGET";           // should stop them being ordered to search 300m away...
    dostop _unit;
    if (_units isEqualTo []) exitWith {};       // ran out of units before places

} forEach _places;

// Splits Garrison AI into additional defense groups if not enough buildings/positions were found.
if (count _units > 0) then {
    Debug_1("PATCOM | Not enough building places, returning leftover group with %1 units", count _units);
    _newGroup = createGroup (side _group);
    _units joinSilent _newGroup;
};
_newGroup
