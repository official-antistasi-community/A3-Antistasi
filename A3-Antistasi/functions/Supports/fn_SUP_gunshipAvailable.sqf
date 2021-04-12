params ["_side"];

if(tierWar < 6) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "GUNSHIP" && {(_lastSupport select 1) > time}) exitWith {-1};

//Vehicles not available, block support
if(has3CB || hasFFAA) exitWith {-1};

private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/10)) + 1;
private _supportTimer = if(_side == Occupants) then {occupantsGunshipTimer} else {invadersGunshipTimer};

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
