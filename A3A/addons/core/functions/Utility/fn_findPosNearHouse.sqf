/*
    Function to find empty outside position for unit near building
    Checks in a circle around house from chosen direction, projecting back towards house

    Arguments:
    <OBJECT> Building to search around
    <NUMBER> Distance to place from building surface
    <NUMBER> (Optional) Direction from house to search first. Otherwise places towards nearest road.

    Returns:
    <POSITION> ATL empty position, or empty array if none found

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_house", "_dist", "_prefDir"];

if (isNil "_prefDir") then {
    for "_rad" from 10 to 50 step 10 do {
        private _nearRoads = _house nearRoads _rad;
        if (_nearRoads isNotEqualTo []) exitWith { _prefDir = _house getDir _nearRoads#0 };
    };
    if (isNil "_prefDir") then { _prefDir = random 360 };
};

private _radius = boundingBoxReal _house # 2 + 1;
private _housePos = getPosATL _house; _housePos set [2, 0.5];
private _houseASL = ATLtoASL _housePos;

// don't use sides. Instead, check every X degrees, starting with prefdir. Much simpler.
// go for fixed 10 degrees to start with

private _fnc_checkDir = {
    params ["_dir"];
    private _outerPos = _housePos getPos [_radius, _dir]; _outerPos set [2, 0.5];
    private _outerASL = ATLtoASL _outerPos;

    // project line towards house
    private _intersect = lineIntersectsSurfaces [ATLtoASL _outerPos, _houseASL];
    if (_intersect isEqualTo []) exitWith {};

    // generate position _dist from contact, then test whether that has a roof
    //private _vdir = _houseASL vectorFromTo _outerASL;
    private _testASL = _intersect#0#0 vectorAdd (_intersect#0#1 vectorMultiply _dist);     // distance from wall
    if (lineIntersectsSurfaces [_testASL vectorAdd [0,0,50], _testASL] isNotEqualTo []) exitWith {};
    _testASL;
};

private _emptyPos = [];
for "_diffDir" from 0 to 180 step 10 do {
    private _rval = (_prefDir + _diffDir) call _fnc_checkDir;
    if (isNil "_rval") then { _rval = (_prefDir - _diffDir) call _fnc_checkDir };
    if (!isNil "_rval") exitWith { _emptyPos = ASLtoATL _rval };
};

_emptyPos;
