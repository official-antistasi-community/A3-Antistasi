/*
    Generate civ car and boat places for a city
    Car places should be deterministic. Boat places are not.

    Environment: Pre-init

    Arguments:
    <ARRAY> Marker name of city.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

// Perf: About 5ms for a dense 200m radius

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];


private _cityRad = 250 min vectorMagnitude markerSize _marker;
private _nearRoads = nearestTerrainObjects [markerPos _marker, ["MAIN ROAD", "ROAD", "TRACK"], _cityRad, false, false];

// no bridges or junctions
_nearRoads = _nearRoads select { !(getRoadInfo _x # 8) } select { count roadsConnectedTo [_x, true] <= 2 };
private _roads = _nearRoads select { count (_x nearRoads 10) < 2 };
if (_roads isEqualTo []) then { _roads = _nearRoads };                  // Some maps spam overlapped roads, so fallback

if (_roads isEqualTo []) exitWith {
    Error_1("Roads not found for marker %1", _marker);
    A3A_spawnPlacesHM set [_marker + "_civ", []];
};

private _fnc_checkRoadPlace = {
    params ["_roadPos", "_roadDir"];
    private _sideDir = _roadDir - 90;

    // Takes ATL position, raycasts in direction at same ATL height, returns closest surface collision or 5m
    private _fnc_raycast = {
        params ["_spos", "_dir"];
        private _epos = _spos getPos [7, _dir]; _epos set [2, _spos#2];
        private _surf = lineIntersectsSurfaces [ATLtoASL _spos, ATLtoASL _epos, objNull, objNull, true, 1, "GEOM"];     // should include see-through fences?
        if (_surf isEqualTo []) exitWith { 7 };
        _surf#0#0 distance2d _spos;
    };

    // raycast at each end to find closest roadside wall
    private _pos1 = _roadPos getPos [4, _roadDir+180]; _pos1 set [2, 0.5];
    private _minDist = [_pos1, _sideDir] call _fnc_raycast;

    private _pos2 = _roadPos getPos [4, _roadDir]; _pos2 set [2, 0.5];
    _minDist = _minDist min ([_pos2, _sideDir] call _fnc_raycast);
    if (_minDist < 5) exitWith { false };          // scenery too close, skip

    // trace between those two, 0.5, further in
    private _spos = _pos1 getPos [_minDist-0.5, _sideDir]; _spos set [2, 0.5];
    private _epos = _pos2 getPos [_minDist-0.5, _sideDir]; _epos set [2, 0.5];
    if (lineIntersectsSurfaces [ATLtoASL _spos, ATLtoASL _epos, objNull, objNull, true, 1, "GEOM"] isNotEqualTo []) exitWith { false };

    // then check for small objects like lampposts within place area
    private _placePos = _roadPos getPos [_minDist-2.5, _sideDir];
    private _nearObj = nearestTerrainObjects [_placePos, [], 5, false, true] - [_x];        // don't include the road
    if (_nearObj inAreaArray [_placePos, 2.4, 5, _roadDir, true] isNotEqualTo []) exitWith { false };

    _vehPlaces pushBack ["civCar", _placePos, _roadDir];
    true;
};

private _roadsUsed = [];
private _vehPlaces = [];
{
    private _roadInfo = getRoadInfo _x;
    private _roadDir = _roadInfo#6 getDir _roadInfo#7;
    private _roadPos = getPosATL _x;

    private _valid = [_roadPos, _roadDir] call _fnc_checkRoadPlace;
    if (_valid) then { _roadsUsed pushBack _x };

} forEach _roads;

// Reverse direction
{
    if (_x in _roadsUsed) then { continue };
    private _roadPos = getPosATL _x;
    if (_roadsUsed inAreaArray [_roadPos, 30, 30] isNotEqualTo []) then { continue };
    private _roadInfo = getRoadInfo _x;
    private _roadDir = _roadInfo#6 getDir _roadInfo#7;

    [_roadPos, _roadDir+180] call _fnc_checkRoadPlace;

} forEach _roads;


// Do boats as well
// Code copied from findSeaPath

// waterDepth returns actual depth in metres. factor [a,b] caps range to 0 at <=a, 1 at >=b
private _places = selectBestPlaces [markerPos _marker, 300, "2*(waterDepth factor [0,0.01]) - waterDepth", 30, 10] select { _x#1 > 0 };
_places = _places select { _x#0 nearObjects ["Piers_base_F", 30] isEqualTo [] };
if (isClass (configFile >> "CfgPatches" >> "CUP_Terrains_Winter_Objects")) then {_places = _places select { _x#0 nearObjects ["Land_nav_pier_m_2", 30] isEqualTo []}};
_places = _places select { nearestTerrainObjects [_x#0, ["ROCK"], 30, false, true] isEqualTo [] };

{
    // improve accuracy
    private _place = selectBestPlaces [_x#0, 15, "2*(waterDepth factor [0,0.01]) - waterDepth", 3, 1] select 0 select 0;
    private _sea = selectBestPlaces [_x#0, 15, "waterdepth", 3, 1] select 0 select 0;

    _vehPlaces pushBack ["civBoat", _place, _place getDir _sea];

} forEach _places;


A3A_spawnPlacesHM set [_marker + "_civ", _vehPlaces];

// civ zamak bbreal geometry:
// [[-1.26607,-3.91876,-2.16498],[1.26565,3.9149,0.66529],4.0758]

// so 8m x 3m should be enough