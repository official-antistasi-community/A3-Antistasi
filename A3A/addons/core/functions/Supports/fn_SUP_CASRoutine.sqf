/*  Create and maintain close air support bomber

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

Debug_1("CASRoutine called with %1", _this);

params ["_suppData", "_resPool", "_airport", "_planeType", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];

//Sleep to simulate preparation time
sleep _sleepTime;

private _spawnPos = (markerPos _airport);
private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];
_plane setDir (_spawnPos getDir _suppCenter);
_plane setPosATL (_spawnPos vectorAdd [0, 0, 500]);
_plane setVelocityModelSpace [0, 150, 0];
_plane flyInHeight 500;
[_plane, _side, _resPool] call A3A_fnc_AIVehInit;
[_plane, "CAS"] call A3A_fnc_setPlaneLoadout;

private _group = [_side, _plane] call A3A_fnc_createVehicleCrew;
{ [_x, nil, false, _resPool] call A3A_fnc_NATOinit } forEach units _group;
_group deleteGroupWhenEmpty true;
_group setBehaviourStrong "CARELESS";
[-10 * count units _group, _side, _resPool] call A3A_fnc_addEnemyResources;


_plane addEventHandler ["Killed", {
    params ["_plane"];
    ["TaskSucceeded", ["", localize "STR_A3A_fn_supports_CASDown"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
}];

// should we be passing the timeout around here? Or have separate timeouts for bomb & CAS?
if (count (_plane getVariable "diveParams") > 0) then {
    [_suppData, _plane, _group, _reveal] call A3A_fnc_SUP_CASDiveBomb;
};

if (canFire _plane && canMove _plane && side _plane == _side) then {
    [_suppData, _plane, _group, _reveal] call A3A_fnc_SUP_CASApproach;
};

_suppData set [4, 0];           // Set activesupport radius to zero, enabling cleanup

[_group] spawn A3A_fnc_groupDespawner;
[_plane] spawn A3A_fnc_vehDespawner;

//Have the plane fly back home
if (canMove _plane && {driver _plane call A3A_fnc_canFight}) then
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
