/*  Send a SEAD support against target

Environment: Server, must be spawned

Arguments:
    <STRING> Unique support name (mostly for logging)
    <SIDE> Side to send support from
    <SCALAR> Delay time in seconds
    <POS2D> Target object for SEAD
    <STRING> Marker name of source airport
    <STRING> Resource pool of support, "attack" or "defence"
    <STRING> Classname of aircraft to use
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define ARM_MAG "A3A_customHARMPylon"

params ["_supportName", "_side", "_sleepTime", "_targetObj", "_airport", "_resPool", "_planeType", "_reveal"];

//Sleep to simulate preparation time
sleep _sleepTime;

private _spawnPos = (getMarkerPos _airport) vectorAdd [0, 0, 500];
private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];     // FLY forces 100m alt
private _tgtObjPos = getPosATL _targetObj;
private _targDir = _spawnPos getDir _tgtObjPos;
_plane setDir _targDir;
_plane setPosATL _spawnPos;                                           // setPosATL kills velocity
_plane setVelocityModelSpace [0, 100, 0];
[_plane, _side, _resPool] call A3A_fnc_AIVEHInit;

private _group = [_side, _plane] call A3A_fnc_createVehicleCrew;
_group deleteGroupWhenEmpty true;
{
    [_x, nil, false, _resPool] call A3A_fnc_NATOinit; 
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
} forEach units _group;
[-10 * count units _group, _side, _resPool] call A3A_fnc_addEnemyResources;

// Should we really have these?
_plane addEventHandler ["Killed", {
    params ["_plane"];
    ["TaskSucceeded", ["", localize "STR_A3A_fn_supports_seadDown"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
}];

//["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"]
[_reveal, getPos _targetObj, _side, "SEAD", _targetObj, 120] spawn A3A_fnc_showInterceptedSupportCall;

_plane flyInHeight 500;
private _minAltASL = (ATLToASL [_tgtObjPos select 0, _tgtObjPos select 1, 0])#2 +500;
_plane flyInHeightASL [_minAltASL, _minAltASL, _minAltASL];
_plane reveal [_targetObj, 4];
private _planeMags = getPylonMagazines _plane;
private _armHardpoints = [[1,2], [3,4]] select (count _planeMags > 5); // should look decent on most stuff. doesnt matter, these dont even sync across network
for "_i" from 1 to (count _planeMags) do {
    _plane setPylonLoadout [_i, ["", ARM_MAG] select (_i in _armHardpoints), true];
};

private _timeout = time + 600 + random 300; // shouldnt be predictable
((units _group)#0) disableAI "FIREWEAPON";
private _tgtRadarRange = getNumber (configFile >> "CfgVehicles" >> typeOf _targetObj >> "Components" >> "SensorsManagerComponent" >> "Components" >> "ActiveRadarSensorComponent" >> "AirTarget" >> "maxRange"); 
private _strikeWindow = (_tgtRadarRange min 24000) max 8000;
private _launchDistance = _strikeWindow * 0.85;
private _loiterRadius = _strikeWindow * 0.95;
private _armWeapon = getText (configFile >> "CfgMagazines" >> ARM_MAG >> "pylonWeapon");
_plane setVariable ["A3A_targetedRadar", _targetObj];
_plane setVariable ["A3A_lastKnownTargetPos", getPosATL _targetObj];
private _missileEH = _plane addEventHandler ["Fired", {
    _this spawn {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
        if (_magazine isNotEqualTo ARM_MAG) exitWith {};
        private _target = _unit getVariable ["A3A_targetedRadar", objNull];
        private _targetLastKnown = _unit getVariable ["A3A_lastKnownTargetPos", getPosATL _target];
        // if radar on at launch, guide to radar, if not guide to 

        private _lastState = false;
        // if theres no radar at launch, harm should be very inaccurate (think prebrief location), if it reacquires at any point, should be much more so
        _projectile setMissileTargetPos (_targetLastKnown getPos [random 200, random 360]);
        // systemChat format ["LAUNCHED AT DISTANCE %1", _target distance2d _unit];
        /*
        private _camera = "camera" camCreate getPosATL _projectile; 
        _camera attachTo [_projectile, [0, -5, 1]];
        _camera cameraEffect ["internal", "back"];
        */
        //while {alive _projectile && {_projectile distance _targetLastKnown > 2000}} do { // can relock until 2km out
        while {alive _projectile} do {
            private _currentState = (isVehicleRadarOn _target);
            if (_currentState isNotEqualTo _lastState) then { // we have event handlers at home
                _lastState = _currentState;
                if (_currentState) then {
                    _projectile setMissileTarget _target;
                    _targetLastKnown = getPosATL _target;
                } else {
                    _projectile setMissileTarget objNUll;
                    _projectile setMissileTargetPos (_targetLastKnown getPos [random (linearConversion [2000, 12000, _projectile distance _targetLastKnown, 1, 50, true]), random 360]);
                };
            };
            sleep 0.25;
        };
        //_camera cameraEffect ["terminate", "back"];
    };
}];

private _targetWP = _group addWaypoint [_targetObj, 0];
_targetWP setWaypointType "DESTROY";
_targetWP setWaypointBehaviour "CARELESS"; // helps stop them firing both mi
_targetWP setWaypointCombatMode "BLUE";

// phases:
// 1. move to target, get within launch distance (85% of max radar range)
// 2. launch harm, turn back
// 3. enter loiter pattern, wait until radar is on (min 15 seconds)
// 4. turn in, fire second missile
// 5. break away and RTB

sleep 10; // give a reasonable time to know its there and react if it spawns close

waitUntil { sleep 1; ((currentWaypoint _group > 1) or (time > _timeOut)) || ((_targetObj distance _plane) <  _launchDistance) };

{ deleteWaypoint _x } forEachReversed (waypoints _group);
private _loiterWP = _group addWaypoint [_targetObj, 0];
_loiterWP setWaypointType "LOITER";
_loiterWP setWaypointBehaviour "AWARE";
_loiterWP setWaypointLoiterRadius _loiterRadius;

if (((_targetObj distance _plane) <  _launchDistance)) then {
    _plane fire _armWeapon;
    _group setCurrentWaypoint _loiterWP;
};

sleep 3;

private _target2WP = _group addWaypoint [_targetObj, 0];
_target2WP setWaypointType "DESTROY";
_target2WP setWaypointBehaviour "COMBAT";

sleep 30;

waitUntil { sleep 2; (currentWaypoint _group > 2) or (time > _timeOut) || (isVehicleRadarOn _targetObj) || (!alive _targetObj)};

if (isVehicleRadarOn _targetObj) then {
    _plane setVariable ["A3A_lastKnownTargetPos", getPosATL _targetObj];
    _group setCurrentWaypoint _target2WP;
    sleep 15; // give the plane time to reorient and line up the next shot
};

waitUntil { sleep 2; (currentWaypoint _group > 3) or (time > _timeOut) || ((_targetObj distance _plane) <  _launchDistance) || (!alive _targetObj)};

if (((_targetObj distance _plane) <  _launchDistance) && (alive _targetObj)) then {
    _plane fire _armWeapon;
};

{ deleteWaypoint _x } forEachReversed (waypoints _group);
private _rtbWP = _group addWaypoint [getMarkerPos _airport, 0];
_rtbWP setWaypointType "MOVE";
_rtbWP setWaypointBehaviour "CARELESS";

private _timeout = time + (getPos _plane distance2d getMarkerPos _airport) / 20;
waitUntil { sleep 2; (currentWaypoint _group != 0) or (time > _timeout) };

if (time >_timeOut) then {
    Info_1("Plane for %1 did not return before timeout", _supportName);
    [_group] spawn A3A_fnc_groupDespawner;
    [_plane] spawn A3A_fnc_vehDespawner;
} else {
    Info_1("Cleaning up %1", _supportName);
    { deleteVehicle _x } forEach units _group;
    deleteVehicle _plane;
};

// ["SEAD", Occupants, "defence", 1000, curatorSelected#0#0, getPos (curatorSelected#0#0), 1, 0] spawn A3A_fnc_createSupport;
