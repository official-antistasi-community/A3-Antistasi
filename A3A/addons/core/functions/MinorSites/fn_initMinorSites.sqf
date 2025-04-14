// Generate initial roadblocks from map markers
// Dependencies: A3A_mapRoadblocks, A3A_mapCamps (from map), A3A_roadblockPairsHM, mainmarker sides, rebel HQ position

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("Setting up roadblock pair checks");

private _pairData = [];		// weight, pairkey, ellipse [center, a, b, dir]
{
    _y params ["_mrkA", "_mrkB", "_weight"];

    private _posA = markerPos _mrkA;
    private _posB = markerPos _mrkB;
    private _midpoint = (_posA vectorAdd _posB) vectorMultiply 0.5;
    private _length = _posA distance2d _posB;
    _pairData pushBack [_weight, _x, [_midpoint, _length/6, _length*0.5, _posA getDir _posB]];
    
} forEach A3A_roadblockPairsHM;
_pairData sort true;			// Check the smaller pairs first for area. Hmm... Might make sense. Area check is quite strict.

private _midpoints = _pairData apply { _x#2#0 };

//{ diag_log _x } forEach _pairData;

private _fnc_findBestPair = {
    // Check if the roadblock is within a roadblock pair ellipse
    private _index = _pairData findIf { _this inArea _x#2 };
    if (_index == -1) then {
        // Fallback, find the nearest pair instead
        private _nearDist = 1e6;
        private _dist = nil;
        {
            _dist = _this distance2d _x;
            if (_dist < _nearDist) then { _nearDist = _dist; _index = _forEachIndex };
        } forEach _midpoints;
    };
    _pairData#_index#1
};

if (!isNil "A3A_minorSitesHM") exitWith {
    Info("Recent save detected, checking validity of roadblock pairs");

    // need to check that all roadblock sites have a valid pairRef
    {
        _y params ["_pos", "_type", "_side", "_pairRef"];
        if (_type != "roadblock") then { continue };		// TODO: enemy and rebel roadblocks are different types...
        if (_pairRef in A3A_roadblockPairsHM) then { continue };		// This one is fine
        private _newRef = _pos call _fnc_findBestPair;
        _y set [3, _newRef];
        Info_3("PairRef %1 doesn't exist for roadblock %2, setting to %3", _pairRef, _x, _newRef);

    } forEach A3A_minorSitesHM;

    // Update the old marker data
    publicVariable "controlsX";
    publicVariable "markersX";

    Info("Finished checking pair references for roadblocks");
};

Info("New campaign or old save found, converting temporary sites from map data");

A3A_minorSitesHM = createHashMap;

{
    private _pos = markerPos _x;
    if !(isOnRoad _pos) then { continue };		// should do something else with these?

    // Discard entirely if rebel HQ is within 500m
    if (markerPos "Synd_HQ" distance2d _pos < 500) then { continue };

    // Find the best-fitting pair
    private _pairRef = _pos call _fnc_findBestPair;

    // Determine side from proximity to markers at each end
    A3A_roadblockPairsHM get _pairRef params ["_mrkA", "_mrkB"];
    private _Anear = _pos distance2d markerPos _mrkA < _pos distance2d markerPos _mrkB;
    private _side = sidesX getVariable ([_mrkB, _mrkA] select _Anear);
    if (_side == teamPlayer) then { continue };

    // Should exclude if too close to enemy site on other side, but trust the map for now

    [_pos, "roadblock", _side, _pairRef] call A3A_fnc_addMinorSite;
} forEach A3A_mapRoadblocks;

Info("Finished converting sites. Adding roadblocks to fill");

// Should we have pop/value dependence?
private _mainMarkers = citiesX + outposts + seaports + factories + resourcesX + airportsX;

{
    private _side = _x;
    private _curRB = 0;
    private _curCamp = 0;
    {
        if (_y#2 != _side) then { continue };
        if (_y#1 == "roadblock") then {_curRB = _curRB + 1};
        if (_y#1 == "camp") then {_curCamp = _curCamp + 1};
    } forEach A3A_minorSitesHM;

    private _wantedCount = { sidesX getVariable _x == _side } count _mainMarkers;
    private _addedRB = [_side, _wantedCount - _curRB] call A3A_fnc_generateRoadblocks;
    Info_3("Generated %1 out of %2 new roadblocks for %3", _addedRB, _wantedCount - _curRB, _side);

    _wantedCount = _wantedCount / 2;
    private _addedCamp = [_side, _wantedCount - _curCamp] call A3A_fnc_generateCamps;
    Info_3("Generated %1 out of %2 new camps for %3", _addedCamp, _wantedCount - _curCamp, _side);

} forEach [Invaders, Occupants];        // invader priority

Info("Roadblock and camp generation complete");

// Update the old marker data
publicVariable "controlsX";
publicVariable "markersX";
