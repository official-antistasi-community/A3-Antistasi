/*  Create and maintain air superiority fighter support

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <STRING> Resource pool of support, "attack" or "defence"
    <STRING> Marker name of source airport
    <STRING> Classname of aircraft to use
    <SCALAR> Delay time in seconds
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug_1("ASFRoutine called with %1", _this);

params ["_suppData", "_resPool", "_airport", "_planeType", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];

//Sleep to simulate preparation time
sleep _sleepTime;

private _spawnPos = (markerPos _airport);
private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];
_plane setDir (_spawnPos getDir _suppCenter);
_plane setPosATL (_spawnPos vectorAdd [0, 0, 1000]);
_plane setVelocityModelSpace [0, 150, 0];
_plane flyInHeight 1000;
[_plane, _side, _resPool] call A3A_fnc_AIVehInit;
_plane setVariable ["SupportData", _suppData];        // for use in EHs
[_plane, "AA"] call A3A_fnc_setPlaneLoadout;

private _group = [_side, _plane] call A3A_fnc_createVehicleCrew;
{ [_x, nil, false, _resPool] call A3A_fnc_NATOinit } forEach units _group;
_group deleteGroupWhenEmpty true;
[-10 * count units _group, _side, _resPool] call A3A_fnc_addEnemyResources;

_plane addEventHandler ["Killed", {
    params ["_plane"];
    ["TaskSucceeded", ["", localize "STR_A3A_fn_supports_ASFDown"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
}];


while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
private _loiterWP = _group addWaypoint [_suppCenter, 0];
_loiterWP setWaypointSpeed "NORMAL";
_loiterWP setWaypointType "Loiter";
_loiterWP setWaypointLoiterRadius 2000;
_loiterWP setWaypointLoiterAltitude 700;
_group setCurrentWaypoint _loiterWP;
Debug_2("%1 underway from %2", _supportName, _airport);


private _remTargets = 2;
private _timeout = time + 900;
private _currentlyAttacking = false;
private _targetObj = objNull;
while {true} do
{
    //Plane somehow destroyed or disabled
    if !(canFire _plane && side _plane == _side) exitWith {
        Info_1("%1 has been destroyed or disabled, aborting routine", _supportName);
    };

    if (!_currentlyAttacking && _remTargets <= 0) exitWith {
        Info_1("%1 has run out of targets, aborting routine", _supportName);
    };

    if (time > _timeout) exitWith {
        Info_1("%1 has run out of time, aborting routine", _supportName);
    };

    if (!_currentlyAttacking) then
    {
        if (_suppTarget isEqualTo []) exitWith {};

        _targetObj = _suppTarget select 0;
        if !(alive _targetObj) exitWith {
            _suppTarget resize 0;
            Debug_1("%1 skips target, as it is already dead", _supportName);
        };
        Debug_2("Next target for %2 is %1", _suppTarget, _supportName);
        _timeout = _timeout + 300;              // make sure it has some time to kill

        private _attackWP = _group addWaypoint [_targetObj, 0];
        _attackWP setWaypointType "DESTROY";
        _attackWP waypointAttachVehicle _targetObj;
//        _attackWP setWaypointSpeed "FULL";
        _group setCurrentWaypoint _attackWP;

        _group reveal [_targetObj, 1.5];         // do we need to add knowledge level to target list? Only used here?
        _group setBehaviourStrong "COMBAT";
        _group setCombatMode "RED";
        _plane flyInHeight -1;          // experimental
        _currentlyAttacking = true;

        [_reveal, getPos _targetObj, _side, "ASF", _targetObj, 60] spawn A3A_fnc_showInterceptedSupportCall;
    }
    else
    {
        // TODO: better evasion mechanics?
        if (!alive _targetObj or {_targetObj distance2D _suppCenter > _suppRadius and _targetObj distance2D _plane > 3000}) then
        {
            _remTargets = _remTargets - 1;
            _suppTarget resize 0;           // clear target array so support routines can add the next

            if !(alive _targetObj) then {
                Debug_1("Target destroyed, %1 returns to cycle mode", _supportName);
            } else {
                Debug_1("Target evaded, %1 returns to cycle mode", _supportName);
            };

            deleteWaypoint [_group, 1];
            _group setCurrentWaypoint _loiterWP;

            _group setBehaviourStrong "AWARE";
            _group setCombatMode "YELLOW";
            _plane flyInHeight 1000; // make the plane resume default loiter height because arma 3
            _currentlyAttacking = false;
            _timeout = _timeout - 300;
        };
    };

    sleep 5;
};

_suppData set [4, 0];           // Set activesupport radius to 0, enables cleanup

[_group] spawn A3A_fnc_groupDespawner;
[_plane] spawn A3A_fnc_vehDespawner;

//Have the plane fly back home
if (canMove _plane && {[driver _plane] call A3A_fnc_canFight}) then
{
    while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
    private _wpBase = _group addWaypoint [_spawnPos, 0];
    _wpBase setWaypointSpeed "NORMAL";
    _wpBase setWaypointBehaviour "CARELESS";
    _group setCurrentWaypoint _wpBase;

    private _timeout = time + (getPos _plane distance2d _spawnPos) / 20;
    waitUntil { sleep 2; (currentWaypoint _group != 0) or (time > _timeout) };
    if (time > _timeout) exitWith {};
    { deleteVehicle _x } forEach (units _group);
    deleteVehicle _plane;
};
