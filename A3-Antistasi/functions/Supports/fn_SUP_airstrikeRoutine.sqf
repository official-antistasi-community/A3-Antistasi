params ["_side", "_timerIndex", "_sleepTime", "_bombType", "_airport", "_targetPos", "_supportName"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
//Sleep to simulate preparetion time
while {_sleepTime > 0} do
{
    sleep 1;
    _sleepTime = _sleepTime - 1;
    if((spawner getVariable _airport) != 2) exitWith {};
};

private _plane = if (_side == Occupants) then {vehNATOPlane} else {vehCSATPlane};
private _crewUnits = if(_side == Occupants) then {NATOPilot} else {CSATPilot};
private _isHelicopter = _plane isKindOf "Helicopter";

private _spawnPos = (getMarkerPos _airport) vectorAdd [0, 0, if (_isHelicopter) then {150} else {500}];
private _strikePlane = createVehicle [_plane, _spawnPos, [], 0, "FLY"];     // FLY forces 100m alt
private _targDir = _spawnPos getDir _targetPos;
_strikePlane setDir _targDir;
_strikePlane setPosATL _spawnPos;                                           // setPosATL kills velocity
_strikePlane setVelocityModelSpace [0, 100, 0];

private _strikeGroup = createGroup _side;
private _pilot = [_strikeGroup, _crewUnits, getPos _strikePlane] call A3A_fnc_createUnit;
_pilot moveInDriver _strikePlane;
_strikeGroup deleteGroupWhenEmpty true;

_strikePlane disableAI "TARGET";
_strikePlane disableAI "AUTOTARGET";

private _timerArray = if(_side == Occupants) then {occupantsAirstrikeTimer} else {invadersAirstrikeTimer};
_timerArray set [_timerIndex, time + 1800];

//Setting up the EH for support destruction
// Could probably just use NATOinit/AIVEHinit
_strikePlane addEventHandler
[
    "Killed",
    {
        params ["_strikePlane"];
        ["TaskSucceeded", ["", localize "STR_antistasi_notification_airstrike_destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        [_strikePlane] spawn A3A_fnc_postMortem;
        [(_strikePlane getVariable "side"), 20, 45] remoteExec ["A3A_fnc_addAggression", 2];
    }
];

_pilot addEventHandler
[
    "Killed",
    {
        params ["_unit"];
        ["TaskSucceeded", ["", localize "STR_antistasi_notification_airstrike_crewKilled"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        [_unit] spawn A3A_fnc_postMortem;
    }
];

private _targetList = server getVariable [format ["%1_targets", _supportName], []];
private _reveal = _targetList select 0 select 1;

private _markerColor = if(_side == Occupants) then {colorOccupants} else {colorInvaders};

private _targetMarker = createMarkerLocal [format ["%1_target", _supportName], _targetPos];
_targetMarker setMarkerShapeLocal "ELLIPSE";
_targetMarker setMarkerBrushLocal "Grid";
_targetMarker setMarkerSizeLocal [25, 100];
_targetMarker setMarkerDirLocal _targDir;
_targetMarker setMarkerColorLocal _markerColor;
_targetMarker setMarkerAlphaLocal 0;

private _textMarker = createMarkerLocal [format ["%1_text", _supportName], _targetPos];
_textMarker setMarkerShapeLocal "ICON";
_textMarker setMarkerTypeLocal "mil_dot";
_textMarker setMarkerTextLocal "Airstrike";
_textMarker setMarkerColorLocal _markerColor;
_textMarker setMarkerAlphaLocal 0;

[_reveal, _targetPos, _side, "AIRSTRIKE", _targetMarker, _textMarker] spawn A3A_fnc_showInterceptedSupportCall;
//[_side, format ["%1_coverage", _supportName]] spawn A3A_fnc_clearTargetArea;

_strikePlane flyInHeight 150;
private _minAltASL = (ATLToASL [_targetPos select 0, _targetPos select 1, 0])#2 +150;
_strikePlane flyInHeightASL [_minAltASL, _minAltASL, _minAltASL];
Debug_2("Fly height ASL: %1 | Target hight: %2", _minAltASL, _targetPos);

private _startBombPosition = _targetPos getPos [100, _targDir + 180];
_startBombPosition set [2, 150];
private _endBombPosition = _targetPos getPos [100, _targDir];
_endBombPosition set [2, 150];

//Determine speed and bomb count on aggression
private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _flightSpeed = ["LIMITED", "NORMAL", "FULL"] select (round random [1, _aggroValue / 50, 0]);
private _bombCount = [2, 3, 4] select (round random [1, _aggroValue / 50, 0]);
if (_bombType == "HE") then {_bombCount = _bombCount * 2};
private _bombParams = [_strikePlane, _bombType, _bombCount, 200];

if (_isHelicopter) then {_flightSpeed = "FULL"};
Info_3("Airstrike %1 will be carried out with %2 bombs at %3 speed", _supportName, _bombCount, toLower _flightSpeed);

private _wp2 = _strikeGroup addWaypoint [_startBombPosition, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed _flightSpeed;
_wp2 setWaypointBehaviour "CARELESS";

[_startBombPosition, driver _strikePlane, _bombParams] spawn
{
    params ["_pos", "_pilot", "_bombParams"];
    waitUntil {sleep 1; ((_pos distance2D _pilot) < 500) || {isNull (objectParent _pilot)}};
    if(isNull (objectParent _pilot)) exitWith {};
    sleep (((_pos distance2d _pilot) - 250) / (speed vehicle _pilot / 3.6));
    if(isNull (objectParent _pilot)) exitWith {};
    _bombParams spawn A3A_fnc_airbomb;
};

private _wp3 = _strikeGroup addWaypoint [_endBombPosition, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed _flightSpeed;
_wp3 setWaypointBehaviour "CARELESS";

private _wp4 = _strikeGroup addWaypoint [getMarkerPos _airport, 2];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointSpeed "FULL";

private _timeout = time + (_targetPos distance _spawnPos) / 20;
waitUntil { sleep 2; (currentWaypoint _strikeGroup == 4) or (time > _timeOut) };
// could potentially "optimize" with this, or an upper-bounds speed version:
//sleep ((time - _timeout) min (_targetPos distance _strikePlane / (speed _strikePlane / 3.6)))

if (time >_timeOut) then {
    Info_1("Plane for %1 did not return before timeout", _supportName);
    // should this be done anyway? Depends how reliable the waypoints are...
    if !(canMove _strikePlane) then { _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 3600] };
    [_strikeGroup] spawn A3A_fnc_groupDespawner;
    [_strikePlane] spawn A3A_fnc_vehDespawner;
} else {
    deleteVehicle _pilot;
    deleteVehicle _strikePlane;
};

deleteMarker _targetMarker;
deleteMarker _textMarker;
[_supportName, _side, 5] spawn A3A_fnc_endSupport;            // hold the coverage marker for a bit
