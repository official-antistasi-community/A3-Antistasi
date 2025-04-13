
// Generate plausible marker-to-marker pairs that roadblocks might be placed along
// A3A_roadblockPairs containing [mrk1, mrk2, weight]
// Weight based on location importance divided by number of pairs connected to those locations

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("Starting roadblock pair generation");

//********** detect all potential roadblock pairs ************************************

private _mainMarkers = airportsX + outposts + seaports + factories + resourcesX + citiesX;

private _markersXYI = [];
{ _markersXYI pushBack [markerPos _x # 0, markerPos _x # 1, _forEachIndex] } forEach _mainMarkers;

private _fnc_isValidPair = {
	params ["_pos1", "_pos2"];
	private _length = _pos1 distance2d _pos2;
	//if (_length < 500 or _length > 3000) exitWith { false };
	if (_length > distanceForLandAttack + 1000) exitWith { false };
    private _midpoint = (_pos1 vectorAdd _pos2) vectorMultiply 0.5;
    _markersXYI inAreaArray [_midpoint, _length/6, _length*0.499, _pos1 getDir _pos2, false] isEqualTo [];
};

private _roadblockPairs = [];
private _markers = +_mainMarkers;
while { count _markers >= 2 } do {
	private _mrk1 = _markers deleteAt (count _markers - 1);
	{
		if ([markerPos _mrk1, markerPos _x] call _fnc_isValidPair) then { _roadblockPairs pushBack [_mrk1, _x] };
	} forEach _markers;
};


//********************************************
// Filter to proper graph with pathfinding
// Version 2, sorts by true route length first

Info("Generating routes");

// build hashmap of marker nodes
private _markerNodes = (_mainMarkers apply { _x call A3A_fnc_getMarkerNavPoint }) createHashMapFromArray [];

// filter to pairs where pathfinding doesn't hit other marker nodes, store pathfinding data
private _pairPathData = [];
while {_roadblockPairs isNotEqualTo []} do {
	isNil {
		// Method to use 20ms/frame minimum script time
		private _startTime = diag_deltaTime;
		while {_roadblockPairs isNotEqualTo [] and diag_deltaTime - _startTime < 0.02} do {

			private _pair = _roadblockPairs deleteAt 0;
			private _inputs = [_pair#0, _pair#1, distanceForLandAttack + 2000];
			private _route = _inputs call A3A_fnc_findPathSimple;
			if (_route isEqualType false) then { continue };

			// Check that route doesn't pass through other markers
			private _noEnds = _route select [1, count _route - 2];
			if (_noEnds findIf { _x in _markerNodes } != -1) then { continue };

			_pairPathData pushBack [_inputs#2, _pair#0, _pair#1, _route];
		};
	};
};

Info("Filtering out overlapped routes");

// need to check shorter routes first
_pairPathData sort true;

// Check what proportion of route is fresh
private _freshNodes = [];
_freshNodes resize [count navGrid, true];
_roadblockPairs = [];
{
	_x params ["_routeLen", "_mrk1", "_mrk2", "_route"];
	if (count _route <= 2) then { _roadblockPairs pushBack [_mrk1, _mrk2, _routeLen]; continue };

	// First node setup
	private _firstNode = _route deleteAt 0;
	private _lastPos = navGrid#_firstNode#0;
	private _lastFresh = _freshNodes#_firstNode;
	_freshNodes set [_firstNode, false];

	private _freshDist = 0;
	private _totalDist = 0;
	private ["_newPos", "_dist", "_newFresh"];
	{
		_newPos = navGrid#_x#0;
		_newFresh = _freshNodes#_x;
		_dist = _lastPos distance2d _newPos;
		_totalDist = _totalDist + _dist;
		if (_lastFresh or _newFresh) then { _freshDist = _freshDist + _dist };
		_freshNodes set [_x, false];
		_lastFresh = _newFresh;
		_lastPos = _newPos;
	} forEach _route;

	if (_freshDist / _totalDist > 0.25) then { _roadblockPairs pushBack [_mrk1, _mrk2, _freshDist] };

	Debug_4("%1 to %2, %3 fresh out of %4", _mrk1, _mrk2, _freshDist, _totalDist);

} forEach _pairPathData;


//*****************************************
// Roadblock pair weight generation

Info("Generating pair weights");

// Accumulate total connection length per marker
private _markerConn = createHashMap;
{
	_x params ["_mrk1", "_mrk2", "_len"];
	_markerConn set [_mrk1, (_markerConn getOrDefault [_mrk1, 0]) + _len];
	_markerConn set [_mrk2, (_markerConn getOrDefault [_mrk2, 0]) + _len];

} forEach _roadblockPairs;

// Calculate value of each marker
// Mostly ripped from findAttackTargets
private _markerVal = createHashMap;
private _radioTowers = antennas + antennasDead;
{
	// Do we still special-case cities?
    if (_x in citiesX) then {
	    _markerVal set [_x, sqrt ((server getVariable _x) # 0)];
		continue;
	};
    private _value = call {
        if (_x in outposts) exitWith { [20, 25] select (count (_radioTowers inAreaArray _x) > 0) };
        if (_x in seaports) exitWith { 20 };
        if (_x in airportsX) exitWith { 60 };
        if (_x in factories) exitWith { 15 };
        10;     // resources
    };
    _value = _value + ([_x, true] call A3A_fnc_garrisonSize) / 2;         // Bit of preference for large/defensible targets. Don't use frontline adjustment here
	_markerVal set [_x, _value];
} forEach _mainMarkers;

A3A_roadblockPairsHM = createHashMap;
{
	_x params ["_mrk1", "_mrk2", "_len"];

	private _value = (_markerVal get _mrk1) + (_markerVal get _mrk2);
	private _connlen = (_markerConn get _mrk1) + (_markerConn get _mrk2);
	_x pushBack (_value * _len / _connLen);						// append the weight

	A3A_roadblockPairsHM set [_mrk1 + "/" + _mrk2, _x];			// use joined marker names as key. Do we need to sort?
} forEach _roadblockPairs;

Info_1("Detected %1 roadblock pairs", count _roadblockPairs);
