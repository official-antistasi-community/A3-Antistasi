/*
    Author: [Hazey]
    Description:
        Get a flank position based on best position forumla.

    Arguments:
        <Array> Position to find the flank position around.
        <Number> Radius to search for the flank position.
        <Number> Precision of the search. Higher = Better performance.
        <Number> Max results to return. The maximum possible is the number of random samples, which is n = 2 * radius / precision

    Return Value:
        <Array> Found flank position.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        private _flankPosition = [_enemyPosition, 250] call A3A_fnc_patrolFlankPos;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    "_position",
    "_radius",
    ["_precision", 100],
    ["_sources", 5]
];

private _flankPosition = [];

 // Get best attack vector for flank. I have dead bodies set maybe a little high, but we really don't want them flanking into the firefight.
private _bestPositions = selectBestPlaces [_position, _radius, "((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (100*deadbody)", _precision, _sources];

// If no position is found, we create a random one.
if (_bestPositions isEqualTo []) then {
    _flankPosition = [(_position select 0) + (sin (random 360)) * (random 100 + 100), (_position select 1) + (cos (random 360)) * (random 100 + 100), 0];
} else {
    // Selects random from _bestPositions, array contains x number of defined sources in selectBestPlaces
    private _randomPosition = selectRandom _bestPositions;
    _flankPosition = _randomPosition select 0;
    _flankPosition set [2, 0];
};

_flankPosition;