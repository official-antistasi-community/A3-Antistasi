/*  Create and maintain mortar and artillery supports

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <OBJECT> Mortar/artillery vehicle
    <GROUP> Crew group of mortar/artillery vehicle
    <SCALAR> Delay time in seconds
    <SCALAR> Amount of information to reveal to rebels, 0-1
    <BOOL> True if it's heavy artillery, false if mortar/light
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppData", "_mortar", "_crewGroup", "_sleepTime", "_reveal", "_isHeavyArty"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_target"];

//Sleep to simulate the time it would need to set the support up
sleep _sleepTime;

private _timeAlive = 1200;
private _shotsForEffect = 6;
private _maxVolleys = 3;
private _reloadTime = [3,10] select _isHeavyArty;
private _spreadOffset = [100, 200] select _isHeavyArty;

//A function to repeatedly fire onto a target without loops by using an EH
private _fn_executeMortarFire =
{
    params ["_mortar"];

    _mortar addEventHandler ["Fired", {
        params ["_mortar"];

        private _subTargets = _mortar getVariable ["FireOrder", []];
        if (_subTargets isEqualTo []) exitWith {
            _mortar removeEventHandler ["Fired", _thisEventHandler];
            _mortar setVariable ["FireOrder", nil];
        };
        (_subTargets deleteAt 0) params ["_shotPos", "_delayTime"];

        [_shotPos, _delayTime, _mortar] spawn {
            params ["_shotPos", "_delayTime", "_mortar"];
            sleep _delayTime;
            _mortar doArtilleryFire [_shotPos, _mortar getVariable "shellType", 1];
        }
    }];

    private _subTargets = _mortar getVariable ["FireOrder", []];

    // Fire first shot after specified delay
    (_subTargets deleteAt 0) params ["_shotPos", "_delayTime"];
    sleep _delayTime;
    _mortar doArtilleryFire [_shotPos, _mortar getVariable "shellType", 1];
};


private _fn_rotateToTarget =
{
    params ["_mortar", "_targPos"];

    private _change = (_mortar getDir _targPos) - getDir _mortar;
    _change = (_change + 540) % 360 - 180;
    if (abs _change < 1) exitWith {};

    addMissionEventHandler ["EachFrame", {
        _thisArgs params ["_mortar", "_startDir", "_change", "_startTime"];

        private _interval = 10 * (time - _startTime) / abs _change;        // 10 degree/sec turn
        private _newDir = _startDir + _change * (_interval min 1);
        _mortar setDir  _newDir;
        if (!alive _mortar or !alive gunner _mortar or _interval >= 1) exitWith {
            removeMissionEventHandler ["EachFrame", _thisEventHandler];
        };
    }, [_mortar, getDir _mortar, _change, time]];
};


private _timeout = time + _timeAlive;
while {time < _timeout} do
{
    sleep 5;

    //Mortar somehow disabled/stolen
    if !(canFire _mortar && side _mortar == _side) exitWith {
        Info_1("%1 has been destroyed or crew killed, aborting routine", _supportName);
    };

    if !(isNil {_mortar getVariable "FireOrder"}) then { continue };        // mortar still firing at last target

    if (_maxVolleys <= 0) exitWith {
        Info_1("%1 has no more rounds left to fire, aborting routine", _supportName);
    };

    // Read in new target if there is one
    if (_target isEqualTo []) then { continue };         // no new target added yet
    _mortar setVehicleAmmo 1;
    private _targetPos = _target select 1;                  // only use position here, not target object
    _target resize 0;                                       // clear target array so that a new one can be added externally
    Debug_2("%1 Next target is %2", _supportName, _targetPos);

    private _flightTime = _mortar getArtilleryETA [_targetPos, _mortar getVariable "shellType"];
    private _subTargets = [];

    // Ranging shots
    if (_mortar distance2d _targetPos < 1500 + random 1500) then {
        _subTargets pushBack [_targetPos getPos [_spreadOffset, random 360], 20];
    } else {
        _subTargets pushBack [_targetPos getPos [_spreadOffset*1.5, random 360], 20];
        _subTargets pushBack [_targetPos getPos [_spreadOffset*0.75, random 360], _flightTime];
    };

    // Other shots draw a line through the target
    private _targDir = getPosATL _mortar vectorFromTo _targetPos;
    private _startPos = _targetPos vectorAdd (_targDir vectorMultiply -0.5*_spreadOffset);
    private _increment = _targDir vectorMultiply (_spreadOffset / (_shotsForEffect-1));

    _subTargets pushBack [_startPos, _flightTime];
    for "_i" from 1 to (_shotsForEffect-1) do {
        private _shotPos = _startPos vectorAdd (_increment vectorMultiply _i);
        _subTargets pushBack [_shotPos, _reloadTime];
    };

    private _volleyTime = 0;
    { _volleyTime = _volleyTime + (_x#1) } forEach _subTargets;
    _timeout = _timeout max (time + _volleyTime);                // don't cleanup until the volley is done
    [_reveal, _targetPos, _side, _suppType, 150, _volleyTime] spawn A3A_fnc_showInterceptedSupportCall;

    // Start shooting
    _mortar setVariable ["FireOrder", _subTargets];
    [_mortar, _targetPos] spawn _fn_rotateToTarget;
    [_mortar] spawn _fn_executeMortarFire;
    _maxVolleys = _maxVolleys - 1;

    //Makes sure that all units escape before attacking
    // [_side, _targetMarker] spawn A3A_fnc_clearTargetArea;
};

_mortar removeAllEventHandlers "Fired";
_suppData set [4, 0];           // Set radius to zero to signal completion

{ unassignVehicle _x } forEach units _crewGroup;

[_crewGroup] spawn A3A_fnc_groupDespawner;
[_mortar] spawn A3A_fnc_VEHdespawner;
