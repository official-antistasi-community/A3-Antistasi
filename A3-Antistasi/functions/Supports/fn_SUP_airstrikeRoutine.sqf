params ["_side", "_timerIndex", "_sleepTime", "_bombType", "_airport", "_targetPos", "_supportName"];

private _fileName = "SUP_airstrikeRoutine";
//Sleep to simulate preparetion time
while {_sleepTime > 0} do
{
    sleep 1;
    _sleepTime = _sleepTime - 1;
    if((spawner getVariable _airport) != 2) exitWith {};
};

private _plane = if (_side == Occupants) then {vehNATOPlane} else {vehCSATPlane};
private _crewUnits = if(_side == Occupants) then {NATOPilot} else {CSATPilot};

private _spawnPos = (getMarkerPos _airport);
private _strikePlane = createVehicle [_plane, _spawnPos, [], 0, "FLY"];
private _dir = _spawnPos getDir _targetPos;
_strikePlane setDir _dir;

//Put it in the sky
_strikePlane setPosATL (_spawnPos vectorAdd [0, 0, 500]);

_strikePlane setVelocityModelSpace (velocityModelSpace _strikePlane vectorAdd [0, 150, 0]);

private _strikeGroup = createGroup _side;
private _pilot = [_strikeGroup, _crewUnits, getPos _strikePlane] call A3A_fnc_createUnit;
_pilot moveInDriver _strikePlane;

_strikePlane disableAI "TARGET";
_strikePlane disableAI "AUTOTARGET";
_strikePlane setVariable ["bombType", _bombType, true];

private _timerArray = if(_side == Occupants) then {occupantsAirstrikeTimer} else {invadersAirstrikeTimer};

_timerArray set [_timerIndex, time + 1800];
_strikePlane setVariable ["TimerArray", _timerArray, true];
_strikePlane setVariable ["TimerIndex", _timerIndex, true];
_strikePlane setVariable ["supportName", _supportName, true];
_strikePlane setVariable ["side", _side, true];

//Setting up the EH for support destruction
_strikePlane addEventHandler
[
    "Killed",
    {
        params ["_strikePlane"];
        [2, format ["Plane for %1 destroyed, airstrike aborted", _strikePlane getVariable "supportName"], "SUP_airstrike"] call A3A_fnc_log;
        ["TaskSucceeded", ["", "Airstrike Vessel Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _timerArray = _strikePlane getVariable "TimerArray";
        private _timerIndex = _strikePlane getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 3600];
        [_strikePlane getVariable "supportName", _strikePlane getVariable "side"] spawn A3A_fnc_endSupport;
        [_strikePlane] spawn A3A_fnc_postMortem;

        if((_strikePlane getVariable "side") == Occupants) then
        {
            [[20, 45], [0, 0]] remoteExec ["A3A_fnc_prestige", 2];
        }
        else
        {
            [[0, 0], [20, 45]] remoteExec ["A3A_fnc_prestige", 2];
        };
    }
];

_pilot setVariable ["Plane", _strikePlane, true];
_pilot addEventHandler
[
    "Killed",
    {
        params ["_unit"];
        ["TaskSucceeded", ["", "Airstrike crew killed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _strikePlane = _unit getVariable "Plane";
        [2, format ["Crew for %1 killed, airstrike aborted", _strikePlane getVariable "supportName"], "SUP_airstrike"] call A3A_fnc_log;
        private _timerArray = _strikePlane getVariable "TimerArray";
        private _timerIndex = _strikePlane getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 1800];
        [_unit] spawn A3A_fnc_postMortem;
    }
];

_pilot spawn
{
    private _pilot = _this;
    waitUntil {sleep 10; (isNull _pilot) || {!(alive _pilot) || (isNull objectParent _pilot)}};
    if(isNull _pilot || !(alive _pilot)) exitWith {};

    //Pilot ejected, spawn despawner
    [group _pilot] spawn A3A_fnc_groupDespawner;
};

_strikeGroup deleteGroupWhenEmpty true;

private _targetList = server getVariable [format ["%1_targets", _supportName], []];
private _reveal = _targetList select 0 select 1;

private _textMarker = createMarker [format ["%1_text", _supportName], _targetPos];
_textMarker setMarkerShape "ICON";
_textMarker setMarkerType "mil_dot";
_textMarker setMarkerText "Airstrike";
if(_side == Occupants) then
{
    _textMarker setMarkerColor colorOccupants;
}
else
{
    _textMarker setMarkerColor colorInvaders;
};
_textMarker setMarkerAlpha 0;

[_reveal, _targetPos, _side, "AIRSTRIKE", format ["%1_coverage", _supportName], _textMarker] spawn A3A_fnc_showInterceptedSupportCall;
[_side, format ["%1_coverage", _supportName]] spawn A3A_fnc_clearTargetArea;

_strikePlane flyInHeight 150;
private _minAltASL = ATLToASL [_targetPos select 0, _targetPos select 1, 0];
_strikePlane flyInHeightASL [(_minAltASL select 2) +150, (_minAltASL select 2) +150, (_minAltASL select 2) +150];

private _airportPos = getMarkerPos _airport;
private _dir = markerDir (format ["%1_coverage", _supportName]);

private _startBombPosition = _targetPos getPos [100, _dir + 180];
_startBombPosition set [2, 150];
private _endBombPosition = _targetPos getPos [100, _dir];
_endBombPosition set [2, 150];

//Determine speed and bomb count on aggression
private _aggroValue = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _flightSpeed = "LIMITED";
private _bombCount = 4;
if(_aggroValue >= 70) then
{
    _flightSpeed = "FULL";
    _bombCount = 8;
};
if(_aggroValue > 30 && _aggroValue < 70) then
{
    _flightSpeed = "NORMAL";
    _bombCount = 6;
};
[2, format["Airstrike %1 will be carried out with %2 bombs at %3 speed", _supportName, _bombCount, toLower _flightSpeed], _fileName] call A3A_fnc_log;

//Creating bombing parameters
private _bombParams = [_strikePlane, _strikePlane getVariable "bombType", _bombCount, 200];
(driver _strikePlane) setVariable ["bombParams", _bombParams, true];

private _wp2 = _strikeGroup addWaypoint [_startBombPosition, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed _flightSpeed;
_wp2 setWaypointBehaviour "CARELESS";

[_startBombPosition, driver _strikePlane] spawn
{
    params ["_pos", "_pilot"];
    waitUntil {sleep 1; ((_pos distance2D _pilot) < 350) || {isNull (objectParent _pilot)}};
    if(isNull (objectParent _pilot)) exitWith {};
    waitUntil {sleep 0.1; ((_pos distance2D _pilot) < 250) || {isNull (objectParent _pilot)}};
    if(isNull (objectParent _pilot)) exitWith {};
    (_pilot getVariable 'bombParams') spawn A3A_fnc_airbomb;
};

private _wp3 = _strikeGroup addWaypoint [_endBombPosition, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed _flightSpeed;
_wp3 setWaypointBehaviour "CARELESS";

private _wp4 = _strikeGroup addWaypoint [_airportPos, 2];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointSpeed "FULL";
_wp4 setWaypointStatements ["true", "[(objectParent this) getVariable 'supportName', side (group this)] spawn A3A_fnc_endSupport; deleteVehicle (objectParent this); deleteVehicle this"];

_strikePlane hideObjectGlobal false;
_strikePlane enableSimulation true;
