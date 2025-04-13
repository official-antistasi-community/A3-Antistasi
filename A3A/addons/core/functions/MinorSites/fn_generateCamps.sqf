// Generate N enemy camps

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

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

private _pathExclude = _exclude;			// don't want spawners or friendlies for this one, only static stuff

// Enemy camps should probably path-block friendly camps, but whatever

// Allow roadblocks & camps to be close together? hmm
{ if (_y#1 == "camp") then { _exclude pushBack _y#0 } } forEach A3A_minorSitesHM;

// add enemy spawners
_exclude append (allUnits select { _x getVariable ["spawner", false] } select { side group _x != _side } apply { getPosATL _x });


// build list of friendly outposts & airports that could create the camp
private _bases = outposts + airportsX select { sidesX getVariable _x == _side } apply { markerPos _x };


// build weighted list of potentials with fast excludes
// prefer sites near rebel HQ
private _weightedSites = [];
{
	// could throw 3/4 away randomly if this is too slow?
	private _campPos = markerPos _x;
	if (_exclude inAreaArray [_campPos, 700, 700] isNotEqualTo []) then { continue };
	if (_bases inAreaArray [_campPos, distanceForLandAttack, distanceForLandAttack] isEqualTo []) then { continue };

	private _hqdist = _campPos distance2d markerPos "Synd_HQ";
	_weightedSites pushBack _campPos;
	_weightedSites pushBack linearConversion [1000, 4000, _hqdist, 3, 1, true];
} forEach A3A_mapCamps;


private _newExclude = [];
private _added = 0;
while {_weightedSites isNotEqualTo []} do {
	private _pos = selectRandomWeighted _weightedSites;
	_weightedSites deleteRange [_weightedSites find _pos, 2];

    // Check against any new camps added
	if (_newExclude inAreaArray [_pos, 700, 700] isNotEqualTo []) then { continue };

	// check ellipse path to nearby bases
	private _nearBases = _bases inAreaArray [_pos, distanceForLandAttack, distanceForLandAttack];
	private _validPath = false;
	{
	    private _midpoint = (_x vectorAdd _pos) vectorMultiply 0.5;
		//if (surfaceIsWater _midpoint) then { continue };		// guess they could just send boats...
        private _targDir = _x getDir _pos;
        if (_pathExclude inAreaArray [_midpoint, 500, distanceForLandAttack/2, _targDir] isEqualTo []) exitWith { _validPath = true };
	} forEach _nearBases;
	if (!_validPath) then { continue };

    Info_2("Adding %1 camp at %2", _side, _pos); 
	[_pos, "camp", _side, ""] call A3A_fnc_addMinorSite;

    _newExclude pushBack _pos;
	_added = _added + 1;
	if (_added >= _numToAdd) exitWith {};
};

if (_added != _numToAdd) then {
	Info_1("Ran out of valid camp positions for %1", _side);
};

_added;
