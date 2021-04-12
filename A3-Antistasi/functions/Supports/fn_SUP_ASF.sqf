params ["_side", "_timerIndex", "_supportObj", "_supportName"];

/*  Sets up the ASF support

    Execution: HC or Server

    Scope: Internal

    Params:
        _side: SIDE : The side of which the ASF should be send
        _timerIndex: NUMBER :  The number of the support timer
        _supportObj: OBJ : The position to which the airstrike should be carried out
        _supportName: STRING : The callsign of the support

    Returns:
        The name of the target marker, empty string if not created
*/


private _fileName = "SUP_ASF";
private _airport = [_supportObj, _side] call A3A_fnc_findAirportForAirstrike;

if(_airport == "") exitWith
{
    [2, format ["No airport found for %1 support", _supportName], _fileName] call A3A_fnc_log;
    ""
};

private _targetMarker = createMarker [format ["%1_coverage", _supportName], getPos _supportObj];
_targetMarker setMarkerShape "ELLIPSE";
_targetMarker setMarkerBrush "Grid";
_targetMarker setMarkerSize [8000, 8000];

if(_side == Occupants) then
{
    _targetMarker setMarkerColor colorOccupants;
};
if(_side == Invaders) then
{
    _targetMarker setMarkerColor colorInvaders;
};
_targetMarker setMarkerAlpha 0;

private _timerArray = if(_side == Occupants) then {occupantsASFTimer} else {invadersASFTimer};
_timerArray set [_timerIndex, time + 5400];

private _setupTime = 1800 - ((tierWar - 1) * 170);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

[_side, _timerIndex, _sleepTime, _airport, _supportName, getPos _supportObj] spawn A3A_fnc_SUP_ASFRoutine;

private _result = [_targetMarker, _minSleepTime, _setupTime];
_result;
