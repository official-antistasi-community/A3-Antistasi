params ["_side"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _faction = Faction(_side);
if(tierWar < 3) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "AIRSTRIKE" && {(_lastSupport select 1) > time}) exitWith {-1};

//Vehicles not available, block support
private _planeType = selectRandom (_faction get "vehiclesPlanesCAS");
if !(_planeType isKindOf "Air") exitWith {-1}; //allow helicopters to also drop bombs as airstrikes

//Select a timer index and the max number of timers available
private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/6)) + 1;

//Search for a timer which allows the support to be fired
if(_side == Occupants) then
{
    if(count occupantsAirstrikeTimer < _playerAdjustment) then
    {
        _timerIndex = count occupantsAirstrikeTimer;
        for "_i" from ((count occupantsAirstrikeTimer) + 1) to _playerAdjustment do
        {
            occupantsAirstrikeTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = occupantsAirstrikeTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};
if(_side == Invaders) then
{
    if(count invadersAirstrikeTimer < _playerAdjustment) then
    {
        _timerIndex = count invadersAirstrikeTimer;
        for "_i" from ((count invadersAirstrikeTimer) + 1) to _playerAdjustment do
        {
            invadersAirstrikeTimer pushBack -1;
        };
    }
    else
    {
        _timerIndex = invadersAirstrikeTimer findIf {_x < time};
        if(_playerAdjustment <= _timerIndex) then
        {
            _timerIndex = -1;
        };
    };
};

_timerIndex;
