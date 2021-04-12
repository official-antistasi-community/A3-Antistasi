params ["_side", "_timerIndex", "_supportObj", "_supportName"];

/*  Sets up the gunship support

    Execution: HC or Server

    Scope: Internal

    Params:
        _side: SIDE : The side of which the CAS should be send
        _timerIndex: NUMBER :  The number of the support timer
        _supportObj: OBJ : The position to which the airstrike should be carried out
        _supportName: STRING : The callsign of the support

    Returns:
        The name of the target marker, empty string if not created
*/

private _fileName = "SUP_gunship";

private _supportPos = if(_supportObj isEqualType []) then {_supportObj} else {getPos _supportObj};
private _airport = [_supportPos, _side] call A3A_fnc_findAirportForAirstrike;

if(_airport == "") exitWith
{
    [2, format ["No airport found for %1 support", _supportName], _fileName] call A3A_fnc_log;
    ""
};

private _targetMarker = createMarker [format ["%1_coverage", _supportName], _supportPos];
_targetMarker setMarkerShape "ELLIPSE";
_targetMarker setMarkerBrush "Grid";
_targetMarker setMarkerSize [400, 400];

if(_side == Occupants) then
{
    _targetMarker setMarkerColor colorOccupants;
};
if(_side == Invaders) then
{
    _targetMarker setMarkerColor colorInvaders;
};
_targetMarker setMarkerAlpha 0;

private _setupTime = 1598 - ((tierWar - 1) * 127.5);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

if(_side == Occupants) then
{
    [_sleepTime, _timerIndex, _airport, _supportPos, _supportName] spawn A3A_fnc_SUP_gunshipRoutineNATO;
}
else
{
    [_sleepTime, _timerIndex, _airport, _supportPos, _supportName] spawn A3A_fnc_SUP_gunshipRoutineCSAT;
};

private _result = [_targetMarker, _minSleepTime, _setupTime];
_result
