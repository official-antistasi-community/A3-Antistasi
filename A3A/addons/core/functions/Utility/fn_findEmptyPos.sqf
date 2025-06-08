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

Returns:
    <POSITION> ATL empty position, or empty array 

Performance: ~0.015ms per attempt
*/

params ["_center", "_minDist", "_maxDist", "_checkRad", "_attempts"];

// Annular distribution adjustment. Split into rectangle and triangle.
private _diffDist = _maxDist - _minDist;
private _propLinear = 2 * _diffDist * _minDist / _diffDist^2;
_propLinear = _propLinear / (_propLinear + 1);

private _objRad = _checkRad + 1;        // use slightly larger radius for terrain objects because their center isn't great
private _diag = _checkRad * sqrt 2;
private _lOff = [[-_checkRad,0,1], [_checkRad,0,1], [0,-_checkRad,1], [0,_checkRad,1]];
private _dOff = [[_diag,_diag,1], [-_diag,-_diag,1], [-_diag,_diag,1], [_diag,-_diag,1]];

private _pos = [];

for "_i" from 1 to _attempts do {
    private _tpos = if (random 1 < _propLinear) then { _center getPos [_minDist + random _diffDist, random 360] }
        else { _center getPos [_minDist + _diffDist * sqrt random 1, random 360] };

    // minDist=0 case reduces to _maxDist * sqrt random 1

    if (surfaceIsWater _tpos) then { continue };            // could do gradient check too?
    if (nearestTerrainObjects [_tpos, [], _objRad, false, true] - (_tpos nearRoads _objRad) isNotEqualTo []) then { continue };
    if (_tpos nearEntities _checkRad isNotEqualTo []) then { continue };

    // 45-degree ray checks for larger objects
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _lOff#0), ATLtoASL (_tpos vectorAdd _lOff#1)] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _lOff#2), ATLtoASL (_tpos vectorAdd _lOff#3)] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _dOff#0), ATLtoASL (_tpos vectorAdd _dOff#1)] isNotEqualTo []) then {continue};
    if (lineIntersectsSurfaces [ATLtoASL (_tpos vectorAdd _dOff#2), ATLtoASL (_tpos vectorAdd _dOff#3)] isEqualTo []) exitWith {_pos = _tpos};
};

_pos;
