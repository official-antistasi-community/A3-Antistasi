if (!isServer) exitWith {};

/*  Checks if the marker should change its owner after a unit died and flips it if need be
    Execution on: Server
    Scope: Internal
    Params:
        _marker : STRING : Name of the marker the unit died on
        _side : SIDE : Side of the unit which died
    Returns:
        Nothing
*/
params ["_marker", "_side"];

if ((isNil "_marker") or (isNil "_side")) exitWith {};

//Await lock
waitUntil {!zoneCheckInProgress};
zoneCheckInProgress = true;

//If marker is a different side than the unit which died on it, we don't care
if(_side != sidesX getVariable [_marker, sideUnknown]) exitWith
{
    zoneCheckInProgress = false
};

private _enemy1 = sideUnknown;
private _enemy2 = sideUnknown;

switch (_side) do
{
    case (teamPlayer):
    {
        _enemy1 = Invaders;
    	_enemy2 = Occupants;
    };
    case (Occupants):
    {
        _enemy1 = Invaders;
		_enemy2 = teamPlayer;
    };
    case (Invaders):
    {
        _enemy1 = Occupants;
        _enemy2 = teamPlayer;
    };
};

[0,0,0] params ["_defenderUnitCount", "_enemy1UnitCount", "_enemy2UnitCount"];

private _markerPos = getMarkerPos _marker;
{
    if((_markerPos distance2D _x < 300) && {[_x] call A3A_fnc_canFight}) then
    {
        switch (side (group _x)) do
        {
            case (_side): {_defenderUnitCount = _defenderUnitCount + 1};
            case (_enemy1): {_enemy1UnitCount = _enemy1UnitCount + 1};
            case (_enemy2): {_enemy2UnitCount = _enemy2UnitCount + 1};
        };
    }
} forEach allUnits;

[
    3,
    format ["ZoneCheck at %1 found %2 friendly %5 units, %3 enemy %6 units and %4 enemy %7 units", _marker, _defenderUnitCount, _enemy1UnitCount, _enemy2UnitCount, _side, _enemy1, _enemy2],
    "zoneCheck"
] call A3A_fnc_log;

if (_enemy1UnitCount > 3 * _defenderUnitCount || {_enemy2UnitCount > 3 * _defenderUnitCount}) then
{
    private _winner = if (_enemy1UnitCount > _enemy2UnitCount) then {_enemy1} else {_enemy2};
    [_winner,_marker] remoteExec ["A3A_fnc_markerChange",2];
};
zoneCheckInProgress = false;
