/*  Creates and maintains UAV support

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <STRING> Resource pool of support, "attack" or "defence"
    <STRING> Marker name of source airport
    <POS2D> Target position for airstrike
    <STRING> Classname of aircraft to use
    <SCALAR> Delay time in seconds
    <SCALAR> Amount of information to reveal to rebels, 0-1
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppData", "_resPool", "_airport", "_planeType", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];

//Sleep to simulate preparation time
sleep _sleepTime;
private _currentTarget = objNull;
private _laser = objNull;
private _spawnPos = markerPos _airport vectorAdd [0,0,300];
private _uav = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];
[_side, _uav] call A3A_fnc_createVehicleCrew;
_groupVeh = group driver _uav;
{ [_x, nil, false, _resPool] call A3A_fnc_NATOinit } forEach (crew _uav);           // arguable
[-10 * count units _groupVeh, _side, _resPool] call A3A_fnc_addEnemyResources;
[_uav, _side, _resPool] call A3A_fnc_AIVEHinit;
private _gunner = gunner _uav;

_uav addEventHandler ["Fired", {
    params ["_uav", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    _uav setVariable ["A3A_currentMissile", _projectile];
}];

_wp = _groupVeh addWayPoint [_suppCenter, 0];
_wp setWaypointBehaviour "AWARE";
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointLoiterRadius 600;
_groupVeh setCurrentWaypoint _wp;
_uav flyInHeight 350;           // maybe not necessary if we lock the waypoint
_groupVeh lockWP true;          // prevent exiting the SAD waypoint

private _timeout = time + 900;
private _enemySide = [Occupants, Invaders] select (_side == Invaders);
_uav addEventHandler
[
    "Fired",
    {
        params ["_uav", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

        private _target = _uav getVariable ["currentTarget", objNull]; //what target?
        if(_target isEqualTo objNull) exitWith {};//what?

        if(_target isEqualType objNull) then
        {
            _target = getPosASL _target;
        };

        [_projectile, _target] spawn
        {
            params ["_projectile", "_target"];
            sleep 0.25;
            private _speed = (speed _projectile)/3.6;
            while {!(isNull _projectile) && {alive _projectile}} do
            {   
                if ((getPos _projectile) select 2 < 10) exitwith {};
                sleep 0.1;
                private _dir = vectorNormalized (_target vectorDiff (getPosASL _projectile));
                _projectile setVelocity (_dir vectorMultiply _speed);
                _projectile setVectorDir _dir;
            };
        };
    }
];

while {time < _timeout && canMove _uav} do
{
    waitUntil { sleep 5; _uav distance2d _suppCenter < 1000|| !alive _uav};
    // check if launcher/crew are intact
    if !(canFire _uav and gunner _uav call A3A_fnc_canFight || alive _uav) exitWith {
        Info_1("%1 has been destroyed or disabled, aborting routine", _supportName);
    };

    private _area = [_suppCenter, 1000, 1000, 0, false];         // inArea still needs long defaults in 2.18
    private _friendGroups = groups _side select {local _x} select {leader _x inArea _area};

    // Choose four random enemies to spot
    private _allEnemies = (units teamPlayer + units _enemySide) inAreaArray [_suppCenter, 500, 500];
    private _spottedEnemies = [];
    for "_i" from 0 to 3 do {
        if (count _allEnemies == 0) exitWith {};
        _spottedEnemies pushBack (_allEnemies deleteAt (floor random count _allEnemies));
    };
    {
        private _group = _x;
        { _group reveal [_x, 2] } forEach _spottedEnemies;
        // (almost) all attacking units should be server-local anyway, but the non-local versions for reference:
        //or: [[_group, _spottedEnemies], { { _this#0 reveal [_x, 2] } forEach _this#1 }] remoteExec ["call", leader _group];
        //{ [_group, [_x, 2]] remoteExec ["reveal", leader _group] } forEach _spottedEnemies;
    } forEach _friendGroups;

    // check if we're past the active time/missiles
    if (time > _timeout) exitWith {
        Info_1("%1 has timed out, aborting", _supportName);
    };

    sleep 10;
    if (isNull _currentTarget) then
    {
        private _currentTarget = selectRandom _spottedEnemies;
        //Creates the laser target to mark the target
        _laser = createVehicle ["LaserTargetE", (getPos _currentTarget), [], 0, "CAN_COLLIDE"];
        Info_1("Trying to attack laser to %1", _currentTarget);
        _uav setVariable ["currentTarget", _currentTarget];
        _laser attachTo [_currentTarget, [0,0,0]];
        _uav doWatch _laser;

        //Send the laser target to the launcher
        _side reportRemoteTarget [_laser, 600];
        _laser confirmSensorTarget [_side, true];
        _uav reveal [_laser, 4];
        [_uav, (weapons _uav) select 1] call BIS_fnc_fire;
        //_uav fireAtTarget [_laser, currentMuzzle (gunner _uav)];
        if !(alive _currentTarget) exitWith {
            _uav doTarget objNull; /// _gunner
            _uav doWatch objNull; /// _gunner
            _uav setVariable ["currentTarget", nil];
            _suppTarget resize 0;
	    deleteVehicle _laser;
            Debug_1("%1 skips target, as it is already dead", _supportName);
            continue;
        };
    };

    // wait for previous missile to have effect (or not)
    if (alive (_uav getVariable ["A3A_currentMissile", objNull])) then { sleep 1; continue };
    deleteVehicle _laser;

    //_targTimeout = (time + 120);
    sleep 10;
};

_suppData set [4, 0];  // Set activesupport radius to zero, prevents adding further targets

[_groupVeh] spawn A3A_fnc_groupDespawner;
[_uav] spawn A3A_fnc_vehDespawner;

//Have the plane fly back home
if (canMove _uav) then
{
    while {count waypoints _groupVeh > 0} do { deleteWaypoint [_groupVeh, 0] };
    private _wpBase = _groupVeh addWaypoint [markerPos _airport, 0];
    _wpBase setWaypointSpeed "NORMAL";
    _wpBase setWaypointBehaviour "CARELESS";
    _groupVeh setCurrentWaypoint _wpBase;

    private _timeout = time + (_uav distance2d _spawnPos) / 20;
    waitUntil { sleep 2; (currentWaypoint _groupVeh != 0) or (time > _timeout) };
    if (time > _timeout) exitWith {};
    { deleteVehicle _x } forEach (units _groupVeh);
    deleteVehicle _uav;
};
