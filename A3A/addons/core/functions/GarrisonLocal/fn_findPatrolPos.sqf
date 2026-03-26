/*
    Function to find suitable patrol position for marker

    Arguments:
    <POSITION> ATL position for search center
    <NUMBER> Minimum search radius
    <NUMBER> Maximum search radius
    <NUMBER> Distance to check for nearby objects

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_mrkPos", "_minRad", "_maxRad", "_checkRad"];

// So make like 10-20 attempts radial attempts first
// If those all fail, try roads
// If no roads then do another 40 attempts?

private _pos = [_mrkPos, _minRad, _maxRad, _checkRad, 20] call A3A_fnc_findEmptyPos;
if (_pos isNotEqualTo []) exitWith {_pos};

private _nearRoads = (_mrkPos nearRoads _maxRad) - (_mrkPos nearRoads _minRad);
while {_nearRoads isNotEqualTo []} do {
    private _road = _nearRoads deleteAt floor random count _nearRoads;
    if (_road nearEntities _checkRad isNotEqualTo []) exitWith { _pos = getPosATL _road };
};
if (_pos isNotEqualTo []) exitWith {_pos};

_pos = [_mrkPos, _minRad, _maxRad, _checkRad, 50] call A3A_fnc_findEmptyPos;
if (_pos isNotEqualTo []) exitWith {_pos};

_mrkPos getPos [2, random 360];     // fallback, just put them near the marker


//	createVehicle ["VR_3DSelector_01_default_F", _tpos, [], 0, "CAN_COLLIDE"];
//{deleteVehicle _x} forEach allMissionObjects "VR_3DSelector_01_default_F";
