params ["_helicopter"];

private _originPos = _helicopter getVariable "PosOrigin";
private _posDestination = _helicopter getVariable "PosDestination";
private _landingPad = _helicopter getVariable "LandingPad";
private _crewGroup = group driver _helicopter;
private _cargoGroup = grpNull;

{
    if(group _x != _crewGroup) exitWith
    {
        _cargoGroup = group _x;
    };
} forEach (crew _helicopter);

private _endPos = getPosASL _landingPad;
private _startPos = getPosASL _helicopter;

private _midPos = +_endPos;
_midPos set [2, (_endPos select 2) + 100];

private _initialVelocity = (velocity _helicopter);
_initialVelocity set [2, 0];
private _velocityVector = +_initialVelocity;
_initialVelocity = vectorMagnitude _initialVelocity;
private _initialSpeed = speed _helicopter/3.6;
//We got the initial velocity of the heli

private _distance = _startPos distance2D _midPos;
private _landingTime = _distance/_initialVelocity * 1.35;

private _maxAngle = ((_initialVelocity * _initialVelocity/3600) * 35) min 35;

//Starting land approach with bezier curve
private _startToMidVector = _midPos vectorDiff _startPos;
private _midToEndVector = _endPos vectorDiff _midPos;

private _vectorDir = vectorDir _helicopter;
private _vectorUp = vectorUp _helicopter;

_helicopter flyInHeight 0;

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

    if((!(alive _helicopter)) || (!(alive _driver))) exitWith {};
};

if((!(alive _helicopter)) || (!(alive _driver))) exitWith {};

[_helicopter] call A3A_fnc_smokeCoverAuto;

(units _cargoGroup) allowGetIn false;
doGetOut (units _cargoGroup);

sleep 3;
_helicopter flyInHeight 100;

private _vehWP1 = _crewGroup addWaypoint [_originPos, 0];
_vehWP1 setWaypointType "MOVE";
_vehWP1 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
_vehWP1 setWaypointBehaviour "CARELESS";
_crewGroup setCurrentWaypoint _vehWP1;

_cargoGroup spawn A3A_fnc_attackDrillAI;
private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 1];
_cargoWP1 setWaypointType "MOVE";
_cargoWP1 setWaypointBehaviour "AWARE";
_cargoWP1 setWaypointSpeed "FULL";
private _cargoWP2 = _cargoGroup addWaypoint [_posDestination, 2];
_cargoWP2 setWaypointType "SAD";
_cargoWP2 setWaypointBehaviour "COMBAT";
