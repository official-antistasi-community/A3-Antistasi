params ["_side"];

if(tierWar < 8) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "CARPETBOMB" && {(_lastSupport select 1) > time}) exitWith {-1};

if !(allowUnfairSupports) exitWith {-1};

private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/8)) + 1;
private _supportTimer = if(_side == Occupants) then {occupantsCarpetBombTimer} else {invadersCarpetBombTimer};

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
