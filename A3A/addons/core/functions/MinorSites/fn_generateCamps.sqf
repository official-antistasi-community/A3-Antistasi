// Generate N enemy camps

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define CAMP_MIN 700
#define CAMP_MAX 1500
#define HQ_MIN 1000
#define HQ_MAX 4000
#define HQ_MUL 3

params ["_side", "_numToAdd"];

Info_2("Attempting to add %1 camps for %2", _numToAdd, _side);


// Build list of positions to exclude if within radius
private _exclude = (citiesX + outposts + airportsX + seaports + factories + resourcesX) select { sidesX getVariable _x != _side };
_exclude = (_exclude + outpostsFIA + ["Synd_HQ"]) apply { markerPos _x };

// Make an effective wider exclude area for enemy airports using four points
private _offsets = [[300,0],[0,300],[-300,0],[0,-300]];
private _excludeL = airportsX select { sidesX getVariable _x != _side } apply { markerPos _x };
{
    private _basePos = _x;
    _exclude append (_offsets apply { _basePos vectorAdd _x });
} forEach _excludeL;

private _pathExclude = _exclude;			// don't want spawners, camps or friendlies for this one, only static stuff

// Enemy camps should probably path-block friendly camps, but whatever

// Allow roadblocks & camps to be close together? hmm
private _curCamps = [];
{ if (_y#1 == "camp") then { _curCamps pushBack _y#0 } } forEach A3A_minorSitesHM;
_exclude append _curCamps;

// add enemy spawners
_exclude append (allUnits select { _x getVariable ["spawner", false] } select { side group _x != _side } apply { getPosATL _x });


// build list of friendly outposts & airports that could create the camp
private _bases = outposts + airportsX select { sidesX getVariable _x == _side } apply { markerPos _x };


// build weighted list of potentials with fast excludes
// prefer sites near rebel HQ and not near other camps
private _sites = [];
private _weights = [];
{
    // could throw 3/4 away randomly if this is too slow?
    private _campPos = markerPos _x;
    if (_exclude inAreaArray [_campPos, CAMP_MIN, CAMP_MIN] isNotEqualTo []) then { continue };
    if (_bases inAreaArray [_campPos, distanceForLandAttack, distanceForLandAttack] isEqualTo []) then { continue };

    // reduce weight for other nearby camps
    private _baseWeight = 1;
    {
        _baseWeight = _baseWeight - linearConversion [CAMP_MIN, CAMP_MAX, _x distance2d _campPos, 1, 0, true];
    } forEach (_curCamps inAreaArray [_campPos, CAMP_MAX, CAMP_MAX]);
    if (_baseWeight <= 0) then { continue };

    // Increase chance of spawning near rebel HQ
    private _hqdist = _campPos distance2d markerPos "Synd_HQ";
    _sites pushBack _campPos;
    _weights pushBack linearConversion [HQ_MIN, HQ_MAX, _hqdist, HQ_MUL*_baseWeight, _baseWeight, true];
} forEach A3A_mapCamps;


private _added = 0;
while {true} do {
    private _pos = _sites selectRandomWeighted _weights;
    if (isNil "_pos") exitWith {};			// might be no >0 weights rather than empty array

    // check ellipse path to nearby bases
    private _nearBases = _bases inAreaArray [_pos, distanceForLandAttack, distanceForLandAttack];
    private _validPath = false;
    {
        private _midpoint = (_x vectorAdd _pos) vectorMultiply 0.5;
        //if (surfaceIsWater _midpoint) then { continue };		// guess they could just send boats...
        private _targDir = _x getDir _pos;
        if (_pathExclude inAreaArray [_midpoint, 500, distanceForLandAttack/2, _targDir] isEqualTo []) exitWith { _validPath = true };
    } forEach _nearBases;
    if (!_validPath) then { _weights set [_sites find _pos, 0]; continue };

    [_pos, "camp", _side, ""] call A3A_fnc_addMinorSite;

    _added = _added + 1;
    if (_added >= _numToAdd) exitWith {};

    // Reduce weights of nearby sites (including the selected one)
    {
        private _weightAdj = linearConversion [CAMP_MIN, CAMP_MAX, (_sites#_x) distance2d _pos, 1, 0, true];
        _weights set [_x, 0 max ((_weights#_x) - _weightAdj)];			// selectRandomWeighted does not accept negatives
    } forEach (_sites inAreaArrayIndexes [_pos, CAMP_MAX, CAMP_MAX]);
};

if (_added < _numToAdd) then {
    Info_1("Ran out of valid camp positions for %1", _side);
};

_added;
