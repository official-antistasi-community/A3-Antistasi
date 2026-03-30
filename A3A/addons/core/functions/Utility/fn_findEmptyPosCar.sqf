/*
    Function to find empty-ish position on land within min/max radius
    Combines distance check for small objects and raycast for large objects
    Includes annular distribution adjustment
    Optimized for car shaped objects. Needs created vehicle for bounding box.

    Arguments:
    <POSITION> ATL search position
    <OBJECT> Object to use for bounding box size
    <NUMBER> Direction of object to test
    <NUMBER> Minimum search radius
    <NUMBER> Maximum search radius
    <NUMBER> Maximum number of attempts 
    <CODE> Optional: Additional code to run when checking positions. _tpos passed in as ATL. Return true for rejected, false for accepted

    Returns:
    <POSITION> ATL empty position, or empty array 

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_center", "_vehicle", "_dir", "_minDist", "_maxDist",  "_attempts", ["_checkFnc", {false}]];

private _minDist2 = _minDist^2;
private _rDist = _maxDist^2 - _minDist^2;
private _bb = boundingBoxReal [_vehicle, "Geometry"];
private _bbHeight = _bb#1#2 - _bb#0#2 + 1;        // offset from mid
private _checkRad = _bb#2 + 2;
_bb = [_bb#0 vectorAdd [-1,-1,0], _bb#1 vectorAdd [1,1,0]];

// Corner offset prep
private _bbC = [[_bb#0#0, _bb#0#1], [_bb#0#0, _bb#1#1], [_bb#1#0, _bb#1#1], [_bb#1#0, _bb#0#1]];
private _cost = cos _dir; private _sint = sin _dir;
private _lowC = _bbC apply { [_cost*_x#0 + _sint*_x#1, -_sint*_x#0 + _cost*_x#1, 0.7] };
private _midZvec = [0,0,0.8];
private _highZvec = [0,0,_bbHeight-1.5];

private _pos = [];

for "_i" from 1 to _attempts do {
    private _tpos = _center getPos [sqrt (_minDist2 + random _rDist), random 360];
    if (surfaceIsWater _tpos) then { continue };
    if (surfaceNormal _tpos # 2 < 0.94) then { continue };      // 20 degrees maximum gradient
    if (nearestTerrainObjects [_tpos, [], _checkRad, false, true] - (_tpos nearRoads _checkRad) isNotEqualTo []) then { continue };
    if (_tpos nearEntities _checkRad isNotEqualTo []) then { continue };
    if (_tpos nearObjects ["building", _checkRad] isNotEqualTo []) then { continue };        // rebel constructions mostly

    // Quick low diagonals
    private _lowCT = _lowC apply {ATLtoASL (_tpos vectorAdd _x)};
    if (lineIntersectsSurfaces [_lowCT#0, _lowCT#2] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [_lowCT#1, _lowCT#3] isNotEqualTo []) then {continue};

    if (call _checkFnc) then {continue};

    private _midCT = _lowCT apply { _x vectorAdd _midZvec };
    private _highCT = _midCT apply { _x vectorAdd _highZvec };
    if (lineIntersectsSurfaces [[
        [_lowCT#0, _lowCT#1], [_lowCT#1, _lowCT#2], [_lowCT#2, _lowCT#3], [_lowCT#3, _lowCT#0],         // low rectangle
        [_midCT#0, _midCT#1], [_midCT#1, _midCT#2], [_midCT#2, _midCT#3], [_midCT#3, _midCT#0],         // mid rectangle
        [_lowCT#0, _highCT#0], [_lowCT#1, _highCT#1], [_lowCT#2, _highCT#2], [_lowCT#3, _highCT#3]      // roof checks
    ]] findIf { _x isNotEqualTo [] } == -1) exitWith {_pos = _tpos};
};

_pos;
