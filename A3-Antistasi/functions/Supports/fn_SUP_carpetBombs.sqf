params ["_side", "_timerIndex", "_supportPos", "_supportName"];

/*  Sets up the data for the airstrike support

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side of which the airstrike should be send
        _timerIndex: NUMBER :  The number of the support timer
        _supportPos: POSITION : The position to which the airstrike should be carried out
        _supportName: STRING : The callsign of the support

    Returns:
        The name of the target marker, empty string if not created
*/

private _fileName = "SUP_carpetBombs";

private _targetMarker = createMarker [format ["%1_coverage", _supportName], _supportPos];
_targetMarker setMarkerShape "ELLIPSE";
_targetMarker setMarkerBrush "Grid";
_targetMarker setMarkerSize [100, 200];
if(_side == Occupants) then
{
    _targetMarker setMarkerColor colorOccupants;
};
if(_side == Invaders) then
{
    _targetMarker setMarkerColor colorInvaders;
};
_targetMarker setMarkerAlpha 0;

private _timerArray = if(_side == Occupants) then {occupantsCarpetBombTimer} else {invadersCarpetBombTimer};
_timerArray set [_timerIndex, time + 10800];

private _carrierMarker = if (_side == Occupants) then {"NATOCarrier"} else {"CSATCarrier"};
private _markerDir = getMarkerPos _carrierMarker getDir _supportPos;
_targetMarker setMarkerDir _markerDir;

private _setupTime = 1000 - ((tierWar - 1) * 90);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);


[_side, _sleepTime, _supportPos, _supportName] spawn A3A_fnc_SUP_carpetBombsRoutine;

private _result = [_targetMarker, _minSleepTime, _setupTime];
_result;
