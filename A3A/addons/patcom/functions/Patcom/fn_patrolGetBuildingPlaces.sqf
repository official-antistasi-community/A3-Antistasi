/*
    Author:  [Hazey] and John Jordan
    Description:
        Return list of building positions for area

    Arguments:
        <Array or String> Search position for garrison positions. If it's a marker, use to constrain search
        <Number> Search radius
        <Number> Maximum number of positions to return

    Return Value:
        <Array> Array of [positionATL, dir] for building places

    Scope: Any
    Environment: Any
    Public: No

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_posOrMarker", "_radius", "_maxPlaces"];

private _buildings = [_posOrMarker, _radius] call A3A_fnc_patrolEnterableBuildings;

// Figure out how many units should be put in each building.
private _unitsPerBuilding = 2 max ceil (_maxPlaces / (count _buildings max 1));

private _places = [];
while {_buildings isNotEqualTo []} do
{
    private _building = _buildings deleteAt floor random count _buildings;
    private _class = typeOf _building;

    // Check to see if building is in whitelist first for better unit positions.
    private _buildingPositions = if (_class in PATCOM_Garrison_Positions_Whitelist) then {
        (PATCOM_Garrison_Positions_Whitelist get _class) apply { _building buildingPos _x };
    } else {
        _building buildingPos -1;
    };
    if ([0,0,0] in _buildingPositions) then {
        Error_1("Bad building position in %1", _class);
        _buildingPositions = _buildingPositions - [[0,0,0]];
    };

    private _unitsInBuilding = 0;
    while {_buildingPositions isNotEqualTo []} do
    {
        private _placePos = _buildingPositions deleteAt floor random count _buildingPositions;

        // Continue to next building position if current position is too close to a static weapon.
        if (count (_placePos nearEntities ["StaticWeapon", 3]) > 0) then {
            Debug_1("PATCOM | Position (%1) too close to StaticWeapon, moving to next position.", _placePos);
            continue;
        };

        _places pushBack [_placePos, _building getRelDir _placePos];
        _unitsInBuilding = _unitsInBuilding + 1;
        if (count _places >= _maxPlaces or _unitsInBuilding >= _unitsPerBuilding) exitWith {};
    };
    if (count _places >= _maxPlaces) exitWith {};
};

_places;
