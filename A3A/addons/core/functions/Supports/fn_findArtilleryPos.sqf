/*
    Function to find suitable position for artillery
    Checks for empty area 

    Arguments:
    <POSITION> ATL position for search center
    <NUMBER> Minimum search radius
    <NUMBER> Maximum search radius
    <NUMBER> Distance to check for nearby objects

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_mrkPos", "_minRad", "_maxRad"];

// Make 50 attempts radial attempts first
// If those all fail, try roads
// If no roads then do another 40 attempts?

private _pos = [_mrkPos, _minRad, _maxRad, 6, 50, true] call A3A_fnc_findEmptyPos;
if (_pos isNotEqualTo []) exitWith {_pos};

_mrkPos getPos [50 * sqrt random 1, random 360];     // fallback, just put them near the center

//	createVehicle ["VR_3DSelector_01_default_F", _tpos, [], 0, "CAN_COLLIDE"];
//{deleteVehicle _x} forEach allMissionObjects "VR_3DSelector_01_default_F";