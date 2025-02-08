/*  CAS routine to perform a low-level attack run

Environment: Server, scheduled, internal

Arguments:
    <OBJECT> Aircraft object to use
    <OBJECT> Target object for attack run
    <STRING> Name of support (for debug logging)
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_plane", "_target", "_supportName"];
Debug_1("%1 has started gun run", _supportName);

//Creating the startpoint for the fire EH loop
private _fnc_executeWeaponFire =
{
    params ["_plane", "_fireParams"];
    _fireParams params ["_armed", "_mainGunShots", "_rocketShots", "_missileShots"];
    private _ammoHM = _plane getVariable "ammoCount";

    Debug_1("Execute weapon fire called with fireParams %1", _fireParams);

    private _weapons = _plane getVariable ["missileLauncher", []];
    if (_missileShots > 0 && _weapons isNotEqualTo []) then
    {
        //Select missile weapon
        private _selectedWeapon = "";
        private _currentHighest = -1;
        {
            if (_ammoHM get _x > _currentHighest) then {
                _selectedWeapon = _x;
                _currentHighest = _ammoHM get _x;
            };
            if (_currentHighest >= _missileShots) exitWith {};
        } forEach _weapons;
        Debug_2("Selected missile %1, remaining shots %2", _selectedWeapon, _currentHighest);
        if (_currentHighest <= 0) exitWith {};

        //Fire weapon if one is selected (guided weapons only gets fired when they have a lockon possibility on the target)
        _plane setVariable ["missileShots", _missileShots min _currentHighest];
        private _missileFired = false;
        _missileFired = _plane fireAtTarget [_plane getVariable "currentTarget", _selectedWeapon];
        
        //This should only affect RHSGREF_A29B_HIDF and UK3CB_B_T28Trojan_HIDF_CAS
        if (!(gunner _plane isEqualTo objNull) && !_missileFired) then { 
            //Strictly speaking not required for the two planes this fix is for, the backup if statement would select the correct firemode regardless - future proofing
            private _weapCfg = configFile >> "cfgWeapons" >> _selectedWeapon;
            private _modes = ["Direct","TopDown"] arrayIntersect getArray (_weapCfg >> "modes");
            if (_modes isEqualTo []) then { _modes = getArray (_weapCfg >> "modes") };
            private _modeCfg = [_weapCfg >> (_modes#0), _weapCfg] select (_modes#0 == "this");
            (driver _plane) forceWeaponFire [_selectedWeapon, configName _modeCfg];
        };
    };

    private _weapons = _plane getVariable ["rocketLauncher", []];
    if (_rocketShots > 0 && _weapons isNotEqualTo []) then
    {
        //Select rocket weapon for use
        private _selectedWeapon = "";
        private _currentHighest = -1;
        {
            if (_ammoHM get _x > _currentHighest) then {
                _selectedWeapon = _x;
                _currentHighest = _ammoHM get _x;
            };
            if (_currentHighest >= _rocketShots) exitWith {};
        } forEach _weapons;
        Debug_2("Selected rocket %1, remaining shots %2", _selectedWeapon, _currentHighest);
        if (_currentHighest <= 0) exitWith {};

        private _weapCfg = configFile >> "cfgWeapons" >> _selectedWeapon;
        private _modes = ["Single", "Close_AI"] arrayIntersect getArray (_weapCfg >> "modes");
        if (_modes isEqualTo []) then { _modes = getArray (_weapCfg >> "modes") };
        private _modeCfg = [_weapCfg >> (_modes#0), _weapCfg] select (_modes#0 == "this");

        //Force weapon fire
        _plane setVariable ["rocketShots", _rocketShots min _currentHighest];
        _plane setVariable ["rocketReload", getNumber (_modeCfg >> "reloadTime")];
        Debug_3("Firing %1 shots with mode %2 and reload %3", _plane getVariable "rocketShots", configName _modeCfg, _plane getVariable "rocketReload");
        (driver _plane) forceWeaponFire [_selectedWeapon, configName _modeCfg];
    };

    private _selectedWeapon = _plane getVariable ["mainGun", ""];
    if(_mainGunShots > 0 && _selectedWeapon != "") then
    {
        //Fire main gun with selected mode. Assume that we won't run out of ammo...
        private _weapCfg = configFile >> "cfgWeapons" >> _selectedWeapon;
        private _modes = ["close"] arrayIntersect getArray (_weapCfg >> "modes");           // can add preferred modes here in priority order
        if (_modes isEqualTo []) then { _modes = getArray (_weapCfg >> "modes") };
        private _modeCfg = [_weapCfg >> (_modes#0), _weapCfg] select (_modes#0 == "this");

        //Force weapon fire
        _plane setVariable ["mainGunShots", _mainGunShots];
        _plane setVariable ["mainGunReload", getNumber (_modeCfg >> "reloadTime")];
        Debug_3("Firing %1 shots with mode %2 and reload %3", _plane getVariable "mainGunShots", configName _modeCfg, _plane getVariable "mainGunReload");
        (driver _plane) forceWeaponFire [_selectedWeapon, configName _modeCfg];
    };
};

/*
private _fireParams =
[
    //[armed, main gun shots, rocket shots, missile shots]
    [true, 20, 3, 1],
    [true, 30, 5, 1],
    [true, 40, 7, 0]
];
*/
//private _fireParams = [[true, 30, 0, 0], [true, 30, 0, 0], [true, 30, 0, 0]];
//private _fireParams = [[true, 0, 0, 1], [true, 0, 0, 1], [true, 0, 0, 1]];
private _fireParams = +(_plane getVariable "fireParams");
_plane setVariable ["currentTarget", _target];


private _enterRunPos = getPosASL _plane;
private _targetPos = eyePos _target;
if(terrainIntersectASL [_enterRunPos, _targetPos]) exitWith {
    Debug_1("%1 gun way is blocked, recalculating", _supportName);
};
private _exitRunPos = _targetPos vectorAdd [0,0,20];

private _forwardSpeed = (velocityModelSpace _plane) select 1;
private _timeForRun = (_enterRunPos vectorDistance _exitRunPos) / _forwardSpeed;

private _forward = _enterRunPos vectorFromTo _exitRunPos;
private _speedVector = _forward vectorMultiply _forwardSpeed;
private _upVector = _forward vectorCrossProduct (vectorUp _plane) vectorCrossProduct _forward;

private _transform = [
        _enterRunPos, _exitRunPos,
        _speedVector, _speedVector,
        _forward, _forward,
        _upVector, _upVector, 0];

// Set up intervals at which to fire
private _fireIntervals = [];
private _runDist = _plane distance2d _target;
{ if (_runDist > _x) then { _fireIntervals pushBack (1 - _x / _runDist) } } forEach [700, 1000, 1500];
reverse _fireIntervals;
while { count _fireParams > count _fireIntervals } do { _fireParams deleteAt 0 };
Debug_2("Fire intervals for run dist %1: %2", _runDist, _fireIntervals);

//This should only affect RHSGREF_A29B_HIDF and UK3CB_B_T28Trojan_HIDF_CAS
private _gunnerLaser = getText(configFile >> "A3A" >> "Loadouts" >> "CASPlane" >> typeOf _plane >> "gunnerLaser");
if (_gunnerLaser isNotEqualTo "") then {
    (gunner _plane) doTarget _target;
    _plane lockCameraTo [_target, [0]];
    (gunner _plane) forceWeaponFire [_gunnerLaser, _gunnerLaser];
};

addMissionEventHandler ["EachFrame",
{
    _thisArgs params ["_plane", "_target", "_startTime", "_timeForRun", "_transform", "_fireParams", "_fireFnc", "_fireIntervals"];
    _interval = (time - _startTime) / _timeForRun;

    if (!alive _target or (_plane distance2d _target) < 300 or _interval > 0.95 or !canMove _plane or isNull driver _plane) exitWith {
        Debug_1("EachFrame handler terminated with interval %1", _interval);
        _transform set [8, 1];      // signal completion to the waitUntil
        removeMissionEventHandler ["EachFrame", _thisEventHandler];
    };

    _transform set [8, _interval];
    _plane setVelocityTransformation _transform;

    if (_interval > _fireIntervals#0) then {
        if (_fireParams#0#0) then { [_plane, _fireParams#0] spawn _fireFnc };
        _fireParams deleteAt 0;
        _fireIntervals deleteAt 0;
    };

}, [_plane, _target, time, _timeForRun, _transform, _fireParams, _fnc_executeWeaponFire, _fireIntervals]];

waitUntil { sleep 1; _transform#8 >= 1 };

Debug_1("Gun run for %1 finished, returning control", _supportName);

//This should only affect RHSGREF_A29B_HIDF and UK3CB_B_T28Trojan_HIDF_CAS
if (_gunnerLaser isNotEqualTo "") then {
    _plane lockCameraTo [objNull, [0]];
    (gunner _plane) forceWeaponFire [_gunnerLaser, _gunnerLaser];
};
/*
    if(_interval > 0.25 && (_fireParams#0#0)) then
    {
        Debug_1("Rounds to fire in first phase: %1", _fireParams#0);
        //Execute fire params
        [_plane, _fireParams#0] spawn _fireFnc;
        (_fireParams#0) set [0, false];
    };
    //Second burst
    if(_interval > 0.5 && (_fireParams#1#0)) then
    {
        Debug_3("Rounds unfired in first phase: %1, %2, %3", _plane getVariable "mainGunShots", _plane getVariable "rocketShots", _plane getVariable "missileShots");
        Debug_1("Rounds to fire in second phase: %1", _fireParams#1);
        //Execute fire params
        [_plane, _fireParams#1] spawn _fireFnc;
        (_fireParams#1) set [0, false];
    };
    //Third burst
    if(_interval > 0.75 && (_fireParams#2#0)) then
    {
        Debug_3("Rounds unfired in second phase: %1, %2, %3", _plane getVariable "mainGunShots", _plane getVariable "rocketShots", _plane getVariable "missileShots");
        Debug_1("Rounds to fire in third phase: %1", _fireParams#2);
        //Execute fire params
        [_plane, _fireParams#2] spawn _fireFnc;
        (_fireParams#2) set [0, false];
    };

Debug_3("Rounds unfired in third phase: %1, %2, %3", _plane getVariable "mainGunShots", _plane getVariable "rocketShots", _plane getVariable "missileShots");
*/
