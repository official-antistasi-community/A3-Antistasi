/*
    Function to find suitable position for artillery & SAMs
    Checks firing arcs around position

    Arguments:
    <POSITION> ATL position for search center
    <NUMBER> Minimum search radius
    <NUMBER> Maximum search radius
    <ARRAY> Optional: Array of positions to exclude (20m distance)

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_mrkPos", "_minRad", "_maxRad", ["_exclude", []]];

private _checkFnc = {
    if (surfaceNormal _tpos # 2 < 0.996) exitWith {true};     // 5 degree max gradient
    if (_exclude inAreaArray [_tpos, _excDist, _excDist] isNotEqualTo []) exitWith {true};
    private _startPos = ATLtoASL _tpos vectorAdd [0,0,2];
    private _intersect = false;
    for "_deg" from 0 to 315 step 45 do {
        private _endPos = ATLtoASL _tpos vectorAdd [200 * sin _deg, 200 * cos _deg, 100];
        if (lineIntersectsSurfaces [_startPos, _endPos] isNotEqualTo []) exitWith {_intersect = true};
    };
    _intersect;
};

// Make 50 radial attempts
private _excDist = 20;
private _pos = [_mrkPos, _minRad, _maxRad, 6, 50, _checkFnc] call A3A_fnc_findEmptyPos;
if (_pos isNotEqualTo []) exitWith {_pos};

// Make another 50 attempts with smaller exclusion radius
_excDist = 10;
private _pos = [_mrkPos, _minRad, _maxRad, 6, 50, _checkFnc] call A3A_fnc_findEmptyPos;
if (_pos isNotEqualTo []) exitWith {_pos};

// TODO: breaks for current support usage
false;
//_mrkPos getPos [50 * sqrt random 1, random 360];     // fallback, just put them near the center

//	createVehicle ["VR_3DSelector_01_default_F", _tpos, [], 0, "CAN_COLLIDE"];
//{deleteVehicle _x} forEach allMissionObjects "VR_3DSelector_01_default_F";
