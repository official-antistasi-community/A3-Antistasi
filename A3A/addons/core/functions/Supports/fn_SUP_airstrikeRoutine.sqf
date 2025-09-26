/*  Send airstrike against target

Environment: Server, must be spawned

Arguments:
    <STRING> Unique support name (mostly for logging)
    <SIDE> Side to send support from
    <SCALAR> Delay time in seconds
    <POS2D> Target position for airstrike
    <STRING> Marker name of source airport
    <STRING> Resource pool of support, "attack" or "defence"
    <STRING> Classname of aircraft to use
    <STRING> Bomb type to use, "HE", "CLUSTER" or "NAPALM"
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_sleepTime", "_targetPos", "_airport", "_resPool", "_planeType", "_bombType", "_reveal"];

//Sleep to simulate preparation time
sleep _sleepTime;

private _isCarpetBombing = false;
if (_bombType == "CARPET") then {
	_bombType = "HE";
	_isCarpetBombing = true;
};
private _isHelicopter = _planeType isKindOf "Helicopter";
private _spawnPos = (getMarkerPos _airport) vectorAdd [0, 0, if (_isHelicopter) then {150} else {500}];
private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];     // FLY forces 100m alt
private _targDir = _spawnPos getDir _targetPos;
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
    ["TaskSucceeded", ["", localize "STR_A3A_fn_supports_airStrikeVesselDown"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
}];

//["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"]
[_reveal, _targetPos, _side, "Airstrike", 150, 120] spawn A3A_fnc_showInterceptedSupportCall; // no better way to time this with the current system, unfortunately
//[_side, format ["%1_coverage", _supportName]] spawn A3A_fnc_clearTargetArea;


//Determine speed and bomb count on aggression
private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _bombCount = [2, 3, 4] select (round random [1, _aggroValue / 50, 0]);
if (_bombType == "HE") then {_bombCount = _bombCount * 2};
private _bombParams = [_plane, _bombType, _bombCount, 200];
private _flightSpeed = ["LIMITED", "NORMAL", "FULL"] select (round random [1, _aggroValue / 50, 0]);
if (_isHelicopter) then {_flightSpeed = "FULL"};
Info_5("Airstrike %1 against %2 with %3 %4 bombs at %5 speed", _supportName, _targetPos, _bombCount, _bombType, toLower _flightSpeed);

_plane flyInHeight 150;
private _minAltASL = (ATLToASL [_targetPos select 0, _targetPos select 1, 0])#2 +150;
_plane flyInHeightASL [_minAltASL, _minAltASL, _minAltASL];

private _startBombPosition = _targetPos getPos [100, _targDir + 180];
_startBombPosition set [2, 150];
private _endBombPosition = _targetPos getPos [100, _targDir];
_endBombPosition set [2, 150];

if (_isCarpetBombing) then {
    _bombParams set [2, 5 max _bombCount];
    _flightSpeed = "FULL";
    //Extends and wiggles the start and end position to make it feel just a little more organic
    _startBombPosition = _startBombPosition getPos [45 + random 10, _targDir + 180];
    _startBombPosition set [2, 150];
    _endBombPosition = _endBombPosition getPos [45 + random 10, _targDir];
    _endBombPosition set [2, 150];
};

private _wp2 = _group addWaypoint [_startBombPosition, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed _flightSpeed;
_wp2 setWaypointBehaviour "CARELESS";

[_startBombPosition, driver _plane, _bombParams] spawn
{
    params ["_pos", "_pilot", "_bombParams"];
    waitUntil {sleep 1; ((_pos distance2D _pilot) < 500) || {isNull (objectParent _pilot)}};
    if(isNull (objectParent _pilot)) exitWith {};
    sleep (((_pos distance2d _pilot) - 250) / (speed vehicle _pilot / 3.6));
    if(isNull (objectParent _pilot)) exitWith {};
    _bombParams spawn A3A_fnc_airbomb;
};

private _wp3 = _group addWaypoint [_endBombPosition, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed _flightSpeed;
_wp3 setWaypointBehaviour "CARELESS";

private _wp4 = _group addWaypoint [getMarkerPos _airport, 2];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointSpeed "FULL";

private _timeout = time + (_targetPos distance _spawnPos) / 20;
waitUntil { sleep 2; (currentWaypoint _group > 3) or (time > _timeOut) };
// could potentially "optimize" with this, or an upper-bounds speed version:
//sleep ((time - _timeout) min (_targetPos distance _plane / (speed _plane / 3.6)))

if (time >_timeOut) then {
    Info_1("Plane for %1 did not return before timeout", _supportName);
    [_group] spawn A3A_fnc_groupDespawner;
    [_plane] spawn A3A_fnc_vehDespawner;
} else {
    Info_1("Cleaning up %1", _supportName);
    { deleteVehicle _x } forEach units _group;
    deleteVehicle _plane;
};
