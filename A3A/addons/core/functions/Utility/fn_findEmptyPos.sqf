/*
    Function to find empty-ish position on land within min/max radius
    Combines distance check for small objects and raycast for large objects
    Includes annular distribution adjustment

    Arguments:
    <POSITION> ATL search position
    <NUMBER> Minimum search radius
    <NUMBER> Maximum search radius
    <NUMBER> Radius to check for nearby objects
    <NUMBER> Maximum number of attempts 
    <CODE> Optional: Additional code to run when checking positions. _tpos passed in as ATL. Return true for rejected, false for accepted

    Returns:
    <POSITION> ATL empty position, or empty array 

    Performance: ~0.015ms per attempt

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_center", "_minDist", "_maxDist", "_checkRad", "_attempts", ["_checkFnc", {false}]];

private _minDist2 = _minDist^2;
private _rDist = _maxDist^2 - _minDist^2;
private _objRad = _checkRad + 1;        // use slightly larger radius for terrain objects because their center isn't great
private _diag = _checkRad / sqrt 2;
private _lOff = [[-_checkRad,0,1], [_checkRad,0,1], [0,-_checkRad,1], [0,_checkRad,1]];
private _dOff = [[_diag,_diag,1], [-_diag,-_diag,1], [-_diag,_diag,1], [_diag,-_diag,1]];

private _pos = [];

for "_i" from 1 to _attempts do {
    private _tpos = _center getPos [sqrt (_minDist2 + random _rDist), random 360];
    if (surfaceIsWater _tpos) then { continue };            // could do gradient check too?
    if (nearestTerrainObjects [_tpos, [], _objRad, false, true] - (_tpos nearRoads _objRad) isNotEqualTo []) then { continue };
    if (_tpos nearEntities _checkRad isNotEqualTo []) then { continue };
    if (_tpos nearObjects ["building", _checkRad] isNotEqualTo []) then { continue };        // rebel constructions mostly

    if (call _checkFnc) then {continue};

    // 45-degree ray & diamond checks for larger objects
/*    private _lOffT = _lOff apply {ATLtoASL (_tpos vectorAdd _x)};
    private _dOffT = _dOff apply {ATLtoASL (_tpos vectorAdd _x)};
    if (lineIntersectsSurfaces [[
        [_lOffT#0, _lOffT#1], [_lOffT#2, _lOffT#3], [_dOffT#0, _dOffT#1], [_dOffT#2, _dOffT#3],         // radial
        [_lOffT#0, _dOffT#2], [_dOffT#2, _lOffT#3], [_lOffT#3, _dOffT#0], [_dOffT#0, _lOffT#1],          // high octagon
        [_lOffT#1, _dOffT#3], [_dOffT#3, _lOffT#2], [_lOffT#2, _dOffT#1], [_dOffT#1, _lOffT#0]          // low octagon
    ]] findIf { _x isNotEqualTo [] } == -1) exitWith {_pos = _tpos};
*/
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _lOff#0), ATLtoASL (_tpos vectorAdd _lOff#1)] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _lOff#2), ATLtoASL (_tpos vectorAdd _lOff#3)] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _dOff#0), ATLtoASL (_tpos vectorAdd _dOff#1)] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _dOff#2), ATLtoASL (_tpos vectorAdd _dOff#3)] isEqualTo []) exitWith {_pos = _tpos};

};

_pos;
