/*
    Worker function to handle garrisoning rebel vehicles that have been unstably placed
    Waits until stationary, then attempts to add to garrison
    Also works around remote creation issue where position update may arrive after remoteExec

    Environment: Server, scheduled

    Parameters:
    <OBJECT> Rebel vehicle to garrison

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_veh"];

// Wait for the thing to settle
waitUntil { sleep 0.1; vectorMagnitude velocity _veh < 0.01 };

if (isNull _veh) exitWith {};                       // might have been deleted immediately after detaching
if (!isNull attachedTo _veh) exitWith {};           // might be attached again
if !(_veh isNil "markerX") exitWith {};             // Already added to a marker apparently

if (getNumber (configOf _veh >> "hasDriver") == 0) exitWith {
    // Statics get added to any marker regardless of crew
    isNil { ["", _veh] call A3A_fnc_garrisonServer_addVehicle };
};

// Mobile vehicles are only added if they're in the rebel HQ and not crewed
if (crew _veh isNotEqualTo []) exitWith {};         // someone could have boarded it immediately
if (A3A_petrosMoving or !(_veh inArea "Synd_HQ")) exitWith {};

isNil {
    _veh setVariable ["lockedForAI", true, true];
    ["Synd_HQ", _veh] call A3A_fnc_garrisonServer_addVehicle;
};
