/*  Fire artillery HE barrage from garrison vehicle at specified target

Environment: Garrison local, spawned not synchronized

Arguments:
    <STRING> Marker (only used on termination)
    <NUMBER> Vehicle ID (only used on termination)
    <OBJECT> Mortar/artillery vehicle
    <ARRAY> Action data: [targpos, delay, reveal]
    <BOOL> True if it's heavy artillery, false if mortar/light
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehID", "_mortar", "_actionData", "_isHeavyArty"];
_actionData params ["_targetPos", "_delay", "_reveal"];

//Sleep to simulate the time it would need to set the support up
sleep _delay;

// Wait until patcom is no longer using this piece
waitUntil { sleep 1; !(_mortar getVariable ["PATCOM_ArtilleryBusy", false]) };

private _shotsForEffect = 6;
private _weapon = _mortar weaponsTurret [0] select 0;              // is this true for every artillery? Probably...
private _reloadTime = getNumber (configFile >> "CfgWeapons" >> _weapon >> "reloadTime") max 2;
private _spreadOffset = [100, 200] select _isHeavyArty;

_mortar setVehicleAmmo 1;

private _magType = [typeOf _mortar] call A3A_fnc_getMortarMags select 1 get "HE";         // guaranteed from server...
private _flightTime = _mortar getArtilleryETA [_targetPos, _magType];

// Ranging shots
private _subTargets = [];
if (_mortar distance2d _targetPos < 1500 + random 1500) then {
    _subTargets pushBack [_targetPos getPos [_spreadOffset, random 360], _flightTime];
} else {
    _subTargets pushBack [_targetPos getPos [_spreadOffset*1.5, random 360], _flightTime];
    _subTargets pushBack [_targetPos getPos [_spreadOffset*0.75, random 360], _flightTime];
};

// Other shots draw a line through the target
private _targDir = getPosATL _mortar vectorFromTo _targetPos;
private _startPos = _targetPos vectorAdd (_targDir vectorMultiply -0.5*_spreadOffset);
private _increment = _targDir vectorMultiply (_spreadOffset / (_shotsForEffect-1));

for "_i" from 1 to (_shotsForEffect) do {
    private _shotPos = _startPos vectorAdd (_increment vectorMultiply _i);
    _subTargets pushBack [_shotPos, _reloadTime];
};


// Turn towards target in case we don't have full arc
private _lastTime = time;
while {canFire _mortar and alive gunner _mortar} do
{
    private _diff = _mortar getRelDir _targetPos;
    if (abs _diff < 1) exitWith {};
    private _maxChange = 10 * (time - _lastTime) / abs _diff;
    private _newDir = getDir _mortar + _diff * (_maxChange min 1);
    _mortar setDir _newDir;
    _lastTime = time;
    sleep 0.01;
};

// Mortar somehow disabled or stolen
if !(canFire _mortar && side _mortar == _mortar getVariable "originalSide") exitWith {
    A3A_garrisonOps pushBack ["vehActionEnd", [_marker, _vehID]];
    //Info_1("%1 has been destroyed or crew killed, aborting routine", _supportName);
};

// Show the support call
private _volleyTime = 15 + _reloadTime*_shotsForEffect + _flightTime*(count _subTargets - _shotsForEffect);
private _suppType = ["MORTAR", "ARTILLERY"] select _isHeavyArty;
[_reveal, _targetPos, side _mortar, _suppType, 150, _volleyTime] remoteExec ["A3A_fnc_showInterceptedSupportCall", 2];

// Now fire the shots. Check whether each shot is fired using this EH
private _firedEH = _mortar addEventHandler ["Fired", { _this#0 setVariable ["A3A_artyFired", true] }];

{
    _x params ["_shotPos", "_interval"];
    _mortar setVariable ["A3A_artyFired", nil];
    _mortar doArtilleryFire [_shotPos, _magType, 1];
    private _timeout = time + 20;
    sleep _interval;
    waitUntil {         // check that arty has fired and reload is completed
        sleep 0.1;
        weaponState [_mortar, [0]] params ["", "", "", "", "", "_reloadPhase", "_magPhase"];
        time > _timeOut or (!(_mortar isNil "A3A_artyFired") and (_reloadPhase max _magPhase == 0));
    };
    if (_mortar isNil "A3A_artyFired") exitWith {
        Error_2("Arty failed to fire round %1; order %2", _forEachIndex, _x);
    };
} forEach _subTargets;

sleep (10 + _flightTime);               // need mortar to still exist when the damage/killed event handlers run
_mortar removeAllEventHandlers "Fired";

A3A_garrisonOps pushBack ["vehActionEnd", [_marker, _vehID]];
