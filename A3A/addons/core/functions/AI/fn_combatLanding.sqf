/*  Helicopter flies a combat landing approach, lands and unloads cargo group before returning to base

Scope: Server or HC
Environment: Scheduled, spawned

Parameters:
    <OBJECT> The helicopter to control
    <GROUP> Crew group for helicopter
    <GROUP> Cargo group for helicopter
    <POSATL> Destination position for troops to attack after landing
    <POSATL> Position for heli to return to after offloading
    <POSATL> Landing position for heli
*/

params ["_helicopter", "_crewGroup", "_cargoGroup", "_posDestination", "_originPos", "_landPos"];

// avoid weird situations where they receive RTB instructions before they finish unloading
_crewGroup setVariable ["A3A_AIScriptHandle", _thisScript];
_cargoGroup setVariable ["A3A_AIScriptHandle", _thisScript];

private _landPad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
_helicopter setVariable ["LandingPad", _landPad, true];             // cleared up (eventually) by heli deletion handler

//Create the waypoints for the crewGroup
private _vehWP0 = _crewGroup addWaypoint [_landpos, 0];
_vehWP0 setWaypointType "MOVE";
_vehWP0 setWaypointSpeed "FULL";
_vehWP0 setWaypointCompletionRadius 150;
_vehWP0 setWaypointBehaviour "CARELESS";

private _midHeight = [100, 150] select (A3A_climate isEqualTo "tropical");
_helicopter flyInHeight _midHeight;

waitUntil {sleep 1; (_helicopter distance2D _landPos) < 1500};
_helicopter limitSpeed 250;         // just so the Osprey slows down a bit, really
waitUntil {sleep 1; (_helicopter distance2D _landPos) < 600};

_helicopter flyInHeight 0;                  // helps to keep it near the ground after landing
_helicopter land "LAND";                    // also drops the gear on the huron

// Landing path setup
private _endPos = getPosASL _landPad;
private _startPos = getPosASL _helicopter;
private _midPos = _endPos vectorAdd [0,0,_midHeight];

private _initialVelocity = (velocity _helicopter);
_initialVelocity set [2, 0];
private _velocityVector = +_initialVelocity;
_initialVelocity = vectorMagnitude _initialVelocity;
private _initialSpeed = speed _helicopter/3.6;
//We got the initial velocity of the heli

private _distance = _startPos distance _midPos;
private _landingTime = _distance/_initialVelocity * 1.35;

private _maxAngle = ((_initialVelocity * _initialVelocity/3600) * 35) min 35;

//Starting land approach with bezier curve
private _startToMidVector = _midPos vectorDiff _startPos;
private _midToEndVector = _endPos vectorDiff _midPos;

private _vectorDir = vectorDir _helicopter;
private _vectorUp = vectorUp _helicopter;

private _interval = 0;
private _time = 0;
private _angleStep = 0.25;
private _angleTarget = 0;
private _angleIs = 0;
private _angleDiff = 0;
private _heightDiff = 0;


private _driver = driver _helicopter;
while {_interval < 0.9999} do
{
    //Update data
    _vectorDir = vectorDir _helicopter;
    _vectorUp = vectorUp _helicopter;

    //Calculating the current angle and what the helicopter should turn too
    _angleTarget = sin (_interval * 180) * _maxAngle;
    _angleIs = (asin (_vectorDir select 2));
    _angleDiff = _angleTarget - _angleIs;
    if(_angleDiff > _angleStep) then {_angleDiff = _angleStep;};
    if(_angleDiff < -_angleStep) then {_angleDiff = -_angleStep;};

    //Calculating the height and back value needed
    _backFactor = -tan (_angleDiff);
    _vectorUp = _vectorUp vectorAdd (_vectorDir vectorMultiply _backFactor);

    _heightDiff = (sin (_angleIs + _angleDiff)) - (_vectorDir select 2);
    _vectorDir = _vectorDir vectorAdd [0, 0, _heightDiff];

    private _lineStart = _startPos vectorAdd (_startToMidVector vectorMultiply _interval);
    private _lineEnd = _midPos vectorAdd (_midToEndVector vectorMultiply _interval);

    _helicopter setVelocityTransformation
    [
        _lineStart,
        _lineEnd,
        _velocityVector,
        _velocityVector,
        _vectorDir,
        _vectorDir,
        _vectorUp,
        _vectorUp,
        _interval
    ];

    _time = time;
    sleep 0.001;
    _interval = _interval + (((time - _time)/_landingTime) * (1 - (_interval / 2)));

    _velocityVector = _lineEnd vectorDiff _lineStart;
    _velocityVector = (vectorNormalized _velocityVector) vectorMultiply (_initialSpeed * (1 - _interval));

    if(!canMove _helicopter || !alive _driver) exitWith {};
};

_cargoGroup leaveVehicle _helicopter;
private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 10];
_cargoWP1 setWaypointType "MOVE";
_cargoWP1 setWaypointBehaviour "AWARE";
_cargoWP1 setWaypointSpeed "FULL";
private _cargoWP2 = _cargoGroup addWaypoint [_posDestination, 50];
_cargoWP2 setWaypointType "SAD";
_cargoWP2 setWaypointBehaviour "COMBAT";
_cargoGroup spawn A3A_fnc_attackDrillAI;

if(!canMove _helicopter || !alive _driver) exitWith { deleteVehicle _landPad };

// Dirty hack to stop the heli lurching around near the ground
private _dismountTime = 5 + count units _cargoGroup;
[_helicopter, time + _dismountTime, _midHeight, _landPad] spawn {
    params ["_heli", "_endTime", "_flyHeight", "_landPad"];
    while { time < _endTime } do {
        _heli setVelocity [0,0,-0.5];
        sleep 1;
    };
    _heli flyInHeight _flyHeight;
    deleteVehicle _landPad;
};
[_helicopter] call A3A_fnc_smokeCoverAuto;          // Already done by GetOut handler in AIVehInit?

sleep _dismountTime;

// Heli RTB
private _vehWP1 = _crewGroup addWaypoint [_originPos, 0];
_vehWP1 setWaypointType "MOVE";
_vehWP1 setWaypointStatements ["true", "if (local this and alive this) then { deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList }"];
_vehWP1 setWaypointBehaviour "CARELESS";
_crewGroup setCurrentWaypoint _vehWP1;
