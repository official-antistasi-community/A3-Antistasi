params ["_side", "_timerIndex", "_supportName"];

/*  Prepares the orbital strike marker

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side for which the support should be called in
        _timerIndex: NUMBER
        _supportName: STRING : The call name of the support

    Returns:
        The name of the marker, covering the whole support area
*/

private _fileName = "SUP_cruiseMissile";

private _spawnPos = [];
if(_side == Occupants) then
{
    _spawnPos = getMarkerPos "NATO_carrier";
}
else
{
    _spawnPos = getMarkerPos "CSAT_carrier";
};

private _coverageMarker = createMarker [format ["%1_coverage", _supportName], _spawnPos];
_coverageMarker setMarkerShape "ELLIPSE";
_coverageMarker setMarkerBrush "Grid";
if(_side == Occupants) then
{
    _coverageMarker setMarkerColor colorOccupants;
}
else
{
    _coverageMarker setMarkerColor colorInvaders;
};
_coverageMarker setMarkerSize [16000, 16000];
_coverageMarker setMarkerAlpha 0;

if(_side == Occupants) then
{
    occupantsOrbitalStrikeTimer set [0, time + (3600 * 3)];
}
else
{
    invadersOrbitalStrikeTimer set [0, time + (3600 * 3)];
};

_spawnPos = _spawnPos vectorAdd [0, 0, 50];

//Creates and anchor point in the world which can be used for attaching the launcher
private _holdObject = createVehicle ["Land_Battery_F", _spawnPos, [], 0, "CAN_COLLIDE"];
private _direction = _spawnPos getDir [worldSize/2, worldSize/2, 0];
_holdObject setDir _direction;
_holdObject enableSimulation false;
_holdObject hideObject true;

//Creates the launcher and attaches it to the anchor point
private _launcher = createVehicle ["B_Ship_MRLS_01_F", _spawnPos, [], 0, "CAN_COLLIDE"];
_launcher attachTo [_holdObject, [0, 0, 0]];
_launcher hideObject true;

//Create the crew and sets its AI
createVehicleCrew _launcher;
_launcher disableAI "Target";
_launcher disableAI "Autotarget";

[_launcher, _side, _supportName] spawn A3A_fnc_SUP_cruiseMissileRoutine;
_coverageMarker;
