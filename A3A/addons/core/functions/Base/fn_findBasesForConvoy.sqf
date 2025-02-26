params ["_mrkDest", ["_possibleBases", airportsX + outposts], ["_maxDistance", 3000]];

private _posDest = getMarkerPos _mrkDest;
private _side = sidesX getVariable [_mrkDest,sideUnknown];
if (_mrkDest in citiesX and _side == teamPlayer) then {_side = Occupants};

private _bases = _possiblebases select {
    (sidesX getVariable [_x,sideUnknown] == _side)
    and (_posDest distance getMarkerPos _x > 1000)
    and (_posDest distance getMarkerPos _x < _maxDistance)
    and {
        (spawner getVariable _x == 2)
        and (dateToNumber date > server getVariable _x) 					// garrison not busy
        and (count (garrison getVariable [_x,[]]) >= 16)					// sufficient garrison
        and ([_x,_mrkDest] call A3A_fnc_arePositionsConnected)
        and !(_x in forcedSpawn) and !(_x in blackListDest)
        and ({_x == _mrkDest} count (killZones getVariable [_x,[]]) < 3)
    };
};

if (count _bases == 0) exitWith {""};
selectRandom _bases;
