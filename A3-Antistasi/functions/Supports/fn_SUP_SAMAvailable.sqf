params ["_side", "_position"];

if(tierWar < 7) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "SAM" && {(_lastSupport select 1) > time}) exitWith {-1};

if !(allowUnfairSupports) exitWith {-1};

if({sidesX getVariable [_x, sideUnknown] == _side} count airportsX == 0) exitWith {-1};

if(airportsX findIf {(getMarkerPos _x) distance2D _position < 8000} == -1) exitWith {-1};

private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/5)) + 1;
private _supportTimer = if(_side == Occupants) then {occupantsSAMTimer} else {invadersSAMTimer};

if(count _supportTimer < _playerAdjustment) then
{
    _timerIndex = count _supportTimer;
    for "_i" from ((count _supportTimer) + 1) to _playerAdjustment do
    {
        _supportTimer pushBack -1;
    };
}
else
{
    _timerIndex = _supportTimer findIf {_x < time};
    if(_playerAdjustment <= _timerIndex) then
    {
        _timerIndex = -1;
    };
};

_timerIndex;
