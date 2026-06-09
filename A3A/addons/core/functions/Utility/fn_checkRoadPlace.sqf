/*
    Function to check whether space at roadside fits a vehicle

    Arguments:
    <POSITION> Position on center of road. Z isn't used.
    <NUMBER> Direction of road. Will attempt to place 90 degrees left of that.

    Returns:
    ATL vehicle position center, or false for failure

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_roadPos", "_roadDir"];
private _sideDir = _roadDir - 90;

// Takes ATL position, raycasts in direction at same ATL height, returns closest surface collision or 5m
private _fnc_raycast = {
    params ["_spos", "_dir"];
    private _epos = _spos getPos [7, _dir]; _epos set [2, _spos#2];
    private _surf = lineIntersectsSurfaces [ATLtoASL _spos, ATLtoASL _epos, objNull, objNull, true, 1, "GEOM"];	 // should include see-through fences?
    if (_surf isEqualTo []) exitWith { 7 };
    _surf#0#0 distance2d _spos;
};

// raycast at each end to find closest roadside wall
private _pos1 = _roadPos getPos [4, _roadDir+180]; _pos1 set [2, 0.5];
private _minDist = [_pos1, _sideDir] call _fnc_raycast;
//createVehicle ["VR_3DSelector_01_default_F", _pos1, [], 0, "CAN_COLLIDE"];
private _pos2 = _roadPos getPos [4, _roadDir]; _pos2 set [2, 0.5];
_minDist = _minDist min ([_pos2, _sideDir] call _fnc_raycast);
//createVehicle ["VR_3DSelector_01_default_F", _pos1, [], 0, "CAN_COLLIDE"];
if (_minDist < 5) exitWith { false };		  // scenery too close, skip

// trace between those two, 0.5, further in
private _spos = _pos1 getPos [_minDist-0.5, _sideDir]; _spos set [2, 0.5];
private _epos = _pos2 getPos [_minDist-0.5, _sideDir]; _epos set [2, 0.5];
if (lineIntersectsSurfaces [ATLtoASL _spos, ATLtoASL _epos, objNull, objNull, true, 1, "GEOM"] isNotEqualTo []) exitWith { false };

// then check for small objects like lampposts within place area
private _placePos = _roadPos getPos [_minDist-2.5, _sideDir];
private _nearObj = nearestTerrainObjects [_placePos, [], 5, false, true] - (_placePos nearRoads 5);		// don't include the road
if (_nearObj inAreaArray [_placePos, 2.4, 5, _roadDir, true] isNotEqualTo []) exitWith { false };
//createVehicle ["VR_3DSelector_01_complete_F", _placePos, [], 0, "CAN_COLLIDE"];
_placePos;

/* Test code
{deleteVehicle _x} forEach allMissionObjects "VR_3DSelector_01_default_F";

private _places = [];
private _roads = getPosATL player nearRoads 100;
{
private _road = _x;
private _start = getRoadInfo _road # 6;
private _end = getRoadInfo _road # 7;
private _roaddir = _start getDir _end;

private _roadlen = _start distance _end;

//private _placePos = false;

for "_i" from 4 to _roadlen step 8 do {
	private _testPos = _start getPos [_i, _roaddir];
	_placePos = [getPosATL _road, _roaddir] call _fnc_checkRoadPlace;
	if (_placePos isEqualType []) then { _places pushBack _placePos };
	_placePos = [getPosATL _road, _roaddir+180] call _fnc_checkRoadPlace;
	if (_placePos isEqualType []) exitWith { _places pushBack _placePos };
};
} forEach _roads;

[count _roads, count _places];
*/