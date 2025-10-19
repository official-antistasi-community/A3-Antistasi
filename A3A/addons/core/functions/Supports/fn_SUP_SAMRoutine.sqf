/*  Maintains SAM launcher support

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <OBJECT> SAM launcher vehicle
    <GROUP> Crew group for vehicle
    <SCALAR> Delay time in seconds
    <SCALAR> Amount of information to reveal to rebels, 0-1
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppData", "_launcher", "_group", "_delay", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_center", "_radius", "_suppTarget"];

sleep _delay;

_launcher addEventHandler ["Fired", {
    params ["_launcher", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    _launcher setVariable ["A3A_currentMissile", _projectile];
}];

private _targetObj = objNull;
private _timeout = time + 900;
private _targTimeout = 0;
private _acquisition = 0;
private _missiles = 4;
private _weapon = weapons _launcher # 0;
while {true} do
{
    // check if launcher/crew are intact
    if !(canFire _launcher and gunner _launcher call A3A_fnc_canFight) exitWith {
        Info_1("%1 has been destroyed or disabled, aborting routine", _supportName);
    };

    // check if we're past the active time/missiles
    if (time > _timeout or _missiles <= 0) exitWith {
        Info_1("%1 has timed out or run out of missiles, aborting", _supportName);
    };

    if (isNull _targetObj) then
    {
        if (_suppTarget isEqualTo []) then { sleep 5; continue };
            
        // New target sent
        _targetObj = _suppTarget select 0;
        if !(alive _targetObj) exitWith {
            _suppTarget resize 0;
            Debug_1("%1 skips target, as it is already dead", _supportName);
            continue;
        };
        Debug_2("Next target for %2 is %1", _suppTarget, _supportName);

        [_reveal, getPosATL _targetObj, _side, "SAM", _targetObj, 60] spawn A3A_fnc_showInterceptedSupportCall;

        _targTimeout = (time + 120);
        _acquisition = 0;
    };

    //Target no longer valid
    if (!canMove _targetObj or time > _targTimeout) then {
        Debug_1("%1 target lost or destroyed, returning to idle", _supportName);
        _suppTarget resize 0;
        _targetObj = objNull;
        _launcher doWatch objNull;
        continue;
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
    Debug("Firing at target");
    //_launcher reveal [_targetObj, 4];           // does this do anything?
    _launcher fireAtTarget [_targetObj];
    //[_reveal, getPosATL _targetObj, _side, "SAM", _targetObj, 60] spawn A3A_fnc_showInterceptedSupportCall;
    _missiles = _missiles - 1;
    _targTimeout = (time + 120);
    sleep 5;        // make sure we reload before firing again, even if missile is destroyed
};

_suppData set [4, 0];       // zero radius to signal termination

[_launcher] spawn A3A_fnc_vehDespawner;
[_group] spawn A3A_fnc_groupDespawner;
