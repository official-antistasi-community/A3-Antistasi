/*
    Author: [Hazey] and John Jordan
    Description:
        Returns an array of enterable buildings

    Arguments:
        <Array or String> Search center or marker. If marker, use area as constraint.
        <Number> Maximum search radius

    Return Value:
        <Array> List of enterable houses.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _buildings = [_position, _radius] call A3A_fnc_patrolEnterableBuildings;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_posOrMarker", "_radius"];

private _buildings = if (_posOrMarker isEqualType "") then {
    nearestObjects [markerPos _posOrMarker, ["House","Building"], _radius] inAreaArray _posOrMarker;
} else {
    nearestObjects [_posOrMarker, ["House","Building"], _radius];
};

_buildings select { _x call A3A_fnc_patrolBuildingEnterable };
