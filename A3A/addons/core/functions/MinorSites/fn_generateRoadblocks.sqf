// Generate N roadblocks using roadblock pairs and current roadblock positions

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_numToAdd"];

Info_2("Attempting to add %1 roadblocks for %2", _numToAdd, _side);


private _usedPairs = A3A_minorSitesHM apply { _y#3 };
private _pairWeights = [];		// pairRef, weight
{
    _y params ["_mrkA", "_mrkB", "_weight"];
    
    if (_x in _usedPairs) then { continue };

    private _sideA = sidesX getVariable _mrkA;
    private _sideB = sidesX getVariable _mrkB;
    if (_sideA != _side and _sideB != _side) then { continue };

    // should also discard if distance is too short and one marker is enemy...
    private _dist = markerPos _mrkA distance2d markerPos _mrkB;
    if (_sideA != _side) then {
        if (_dist < [1000, 1300] select (_mrkA in airportsX)) then { continue };
    };
    if (_sideB != _side) then {
        if (_dist < [1000, 1300] select (_mrkB in airportsX)) then { continue };
    };

    _pairWeights pushBack _x;
    _pairWeights pushBack _weight;

} forEach A3A_roadblockPairsHM;

// Don't place roadblocks within friendly airports
private _exclude = (citiesX + outposts + seaports + factories + resourcesX) select { sidesX getVariable _x != _side };
_exclude = (_exclude + airportsX + outpostsFIA + ["Synd_HQ"]) apply { markerPos _x };

// Make an effective wider exclude area for enemy airports using four points
private _offsets = [[300,0],[0,300],[-300,0],[0,-300]];
private _excludeL = airportsX select { sidesX getVariable _x != _side } apply { markerPos _x };
{
    private _basePos = _x;
    _exclude append (_offsets apply { _basePos vectorAdd _x });
} forEach _excludeL;

// Allow roadblocks and camps to be placed near each other
{ if (_y#1 == "roadblock") then { _exclude pushBack _y#0 } } forEach A3A_minorSitesHM;

// include enemy spawners as well
_exclude append (allUnits select { _x getVariable ["spawner", false] } select { side group _x != _side } apply { getPosATL _x });

private _added = 0;
private _fails = 0;
private _failsAllowed = 4 + _numToAdd;
while {_fails < _failsAllowed} do {

    // Select random weighted pair
    if (_pairWeights isEqualTo []) exitWith {};
    private _pairRef = selectRandomWeighted _pairWeights;
    _pairWeights deleteRange [_pairWeights find _pairRef, 2];			// don't try each pair more than once? Hmm

    // random roll of 2/3 route, 1/3 random? random might be route too
    (A3A_roadblockPairsHM get _pairRef) params ["_mrkA", "_mrkB"];
    private _navMethod = random 1 < 0.6;
    private _road = if (_navMethod) then {
        [_mrkA, _mrkB, _exclude] call A3A_fnc_selectRoadBetweenMarkersNav;
    } else {
        [_mrkA, _mrkB, _exclude] call A3A_fnc_selectRoadBetweenMarkersRand;
    };
    if (isNull _road) then {
        Debug_3("Failed to find roadblock between %1 and %2, nav %3", _mrkA, _mrkB, _navMethod);
        _fails = _fails+1; continue;
    };

    // add roadblock
    private _pos = getPosATL _road;
    [_pos, "roadblock", _side, _pairRef] call A3A_fnc_addMinorSite;

    _added = _added + 1;
    if (_added >= _numToAdd) exitWith {};

    // If we're doing multiple roadblocks, sort out the lists for the next pass
    _exclude pushBack _pos;
    _failsAllowed = _failsAllowed + 3;
};

Info_1("%1 total failed attempts", _fails);

_added;
