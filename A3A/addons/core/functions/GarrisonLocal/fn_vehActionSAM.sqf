/*  Fire SAM from garrison vehicle at specified target

Environment: Garrison local, spawned not synchronized

Arguments:
    <STRING> Marker (only used on termination)
    <NUMBER> Vehicle ID (only used on termination)
    <OBJECT> SAM vehicle
    <ARRAY> Additional action data from server: [target, delay, reveal]
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehID", "_launcher", "_actionData"];
_actionData params ["_targetObj", "_delay", "_reveal"];

//Sleep to simulate the time it would need to set the support up
sleep _delay;

[_reveal, getPosATL _targetObj, side _launcher, "SAM", _targetObj, 60] remoteExec ["A3A_fnc_showInterceptedSupportCall", 2];

_launcher addEventHandler ["Fired", {
    params ["_launcher", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    _launcher setVariable ["A3A_currentMissile", _projectile];
}];

//_group setCombatMode "WHITE";        // TODO: Put this into spawning somewhere
_launcher setVehicleAmmo 1;

private _targTimeout = time + 120;
private _acquisition = 0;
private _missiles = 2;
private _weapon = weapons _launcher # 0;

while {true} do
{
    // Launcher somehow disabled/stolen
    if !(canFire _launcher && side _launcher == _launcher getVariable "originalSide") exitWith {
        Debug("SAM destroyed or crew killed, aborting");
    };

    // Target no longer valid
    if (!canMove _targetObj or time > _targTimeout) exitWith {
        Debug("SAM target lost or destroyed, aborting");
    };

    // Update acquisition depending on whether path to target is blocked
    private _targdir = _launcher getDir _targetObj;
    private _intercept = getPosASL _launcher vectorAdd [300*sin _targdir, 300*cos _targdir, 200];
    private _isBlocked = terrainIntersectASL [_intercept, getPosASL _targetObj];
    private _vecDir = getPosASL _launcher vectorFromTo getPosASL _targetObj;
    private _outOfArc = (_launcher weaponDirection _weapon) vectorDotProduct _vecDir < 0.707;      // 45 degrees
    _acquisition = _acquisition + ([0.1, -0.1] select (_isBlocked or _outOfArc));
    _acquisition = 1 min _acquisition max 0;
    _launcher doWatch ASLtoATL _intercept;              // doWatch uses ATL
    if (_acquisition < 1) then { sleep 1; continue };

    // wait for previous missile to have effect (or not)
    if (alive (_launcher getVariable ["A3A_currentMissile", objNull])) then { sleep 1; continue };

    // Actually fire
    Debug("SAM firing at target");
    //_launcher reveal [_targetObj, 4];           // does this do anything?
    _launcher fireAtTarget [_targetObj];
    _missiles = _missiles - 1;
    _targTimeout = (time + 120);
    sleep 5;        // make sure we reload before firing again, even if missile is destroyed
    if (_missiles == 0) exitWith {};
};

_launcher doWatch objNull;
_launcher removeAllEventHandlers "Fired";

sleep 30;       // make sure launcher still exists when target is hit

A3A_garrisonOps pushBack ["vehActionEnd", [_marker, _vehID]];
