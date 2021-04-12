params ["_side", "_timerIndex", "_supportPos", "_supportName"];

/*  Prepares the orbital strike marker

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side for which the support should be called in
        _timerIndex: NUMBER
        _supportPos: POSITION : The position where the strike should hit
        _supportName: STRING : The call name of the support

    Returns:
        The name of the marker, covering the whole support area
*/

private _fileName = "SUP_orbitalStrike";


private _coverageMarker = createMarker [format ["%1_coverage", _supportName], _supportPos];
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
_coverageMarker setMarkerSize [500, 500];
_coverageMarker setMarkerAlpha 0;

if(_side == Occupants) then
{
    occupantsOrbitalStrikeTimer set [0, time + (3600 * 12)];
}
else
{
    invadersOrbitalStrikeTimer set [0, time + (3600 * 12)];
};

private _setupTime = 1200 - ((tierWar - 1) * 100);
private _minSleepTime = (1 - (tierWar - 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

[ATLtoASL _supportPos, _sleepTime, _supportName, _side] spawn A3A_fnc_SUP_orbitalStrikeRoutine;

private _result = [_coverageMarker, _minSleepTime, _setupTime];
_result;
