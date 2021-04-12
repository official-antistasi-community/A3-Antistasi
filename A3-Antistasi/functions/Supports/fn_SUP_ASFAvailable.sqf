params ["_side"];

if(tierWar < 4) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "ASF" && {(_lastSupport select 1) > time}) exitWith {-1};

//Make sure the vehicle are available
if(vehNATOPlaneAA == "" || vehCSATPlaneAA == "") exitWith {-1};

//Select a timer index and the max number of timers available
private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/6)) + 1;

//Search for a timer which allows the support to be fired
if(_side == Occupants) then
{
    if(count occupantsASFTimer < _playerAdjustment) then
    {
        _timerIndex = count occupantsASFTimer;
        for "_i" from ((count occupantsASFTimer) + 1) to _playerAdjustment do
        {
            occupantsASFTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = occupantsASFTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};
if(_side == Invaders) then
{
    if(count invadersASFTimer < _playerAdjustment) then
    {
        _timerIndex = count invadersASFTimer;
        for "_i" from ((count invadersASFTimer) + 1) to _playerAdjustment do
        {
            invadersASFTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = invadersASFTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};

_timerIndex;
