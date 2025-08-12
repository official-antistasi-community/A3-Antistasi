/*
    Author: [Hazey]
    Description:
        Sends group directly to garrison positions

    Arguments:
        <Group> Group to run action on.
        <Array> Position you want group to look for garrison positions.
        <Number> How far you want to look for potential positions

    Return Value:
        <Group> Returns array of new groups created by the function (for leftover units).

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        private _garrisonGroups = [_group, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_position", "_radius"];

private _units = units _group;
private _buildings = [];
private _newGroups = [];
private _minimumUnits = 2; // Minimum units per building.

if (count _units == 0) exitwith {
    Debug_1("PATCOM | No units found in group (%1). Exiting", _group);
    _newGroups;
};

_group lockWP true;
_buildings = [_position, _radius] call A3A_fnc_patrolEnterableBuildings;

// Don't place units in destroyed buildings
_buildings = _buildings select { damage _x < 1 && !isObjectHidden _x };

if (count _buildings == 0) exitWith {
    Debug_1("PATCOM | No Valid Garrison buildings found near group: %1 | Defaulting to Defend.", _group);
    [_group, "Patrol_Defend", 0, 100, -1, true, _position, false] call A3A_fnc_patrolLoop;
    _newGroups;
};
_buildings = _buildings call BIS_fnc_arrayShuffle;

// Figure out how many units should be put in each building.
private _unitsPerBuilding = ceil(count _units / count _buildings);
if (_unitsPerBuilding < _minimumUnits) then {_unitsPerBuilding = _minimumUnits};

{
    if (count _units == 0) exitWith {};
    private _building = _x;
    private _class = typeOf _building;
    private _buildingPositions = [];
    private _unitsPlaced = 0;

    // Check to see if building is in whitelist first for better unit positions.
    if (_class in PATCOM_Garrison_Positions_Whitelist) then {
        {
            _buildingPositions pushBack (_building buildingPos _x);
        } forEach (PATCOM_Garrison_Positions_Whitelist get _class);
    } else {
        // If no pre-defined building positions are found. We default to a random one.
        _buildingPositions = _building buildingPos -1;
    };

    // Mix up the building positions for better randomization.
    _buildingPositions = _buildingPositions call BIS_fnc_arrayShuffle;

    {
        // Exit if no more units are available to be placed.
        if (count _units == 0) exitWith {
            Trace("PATCOM | No more garrison units available to place. Exiting");
        };

        // Exit if we have already placed max amount of units in building.
        if (_unitsPlaced >= _unitsPerBuilding) exitWith {
            Trace("PATCOM | Max garrison units placed in building. Moving to next building");
        };

         // Move to next position if current one is invalid.
        if (_x isEqualTo [0,0,0]) then {
            Debug_1("PATCOM | Position invalid in (%1), moving to next position", _class);
            continue;
        };

        // Continue to next building position if current position is too close to a static weapon.
        if ((count (_x nearEntities ["StaticWeapon", 3])) > 0) then {
            Debug_1("PATCOM | Position (%1) too close to StaticWeapon, moving to next position.", _x);
            continue;
        };

        // Move the unit and set them up in position.
        private _unit = _units deleteAt 0;
        _unit setPosATL _x;
        _unit setdir ((_unit getRelDir _building)-180);
        _unit setUnitPos "UP";
        dostop _unit;
        
        // Add 1 to unit placed counter for max units per building limit. (_minimumUnits)
        _unitsPlaced = _unitsPlaced + 1;

    } forEach _buildingPositions;
} forEach _buildings;

// Splits Garrison AI into additional defense groups if not enough buildings/positions were found.
if (count _units > 0) then {
   private _groupSplit = createGroup (side _group);
   _newGroups pushBack _groupSplit;
   _units joinSilent _groupSplit;
   [_groupSplit, "Patrol_Defend", 0, 100, -1, true, _position, false] call A3A_fnc_patrolLoop;
};
_newGroups