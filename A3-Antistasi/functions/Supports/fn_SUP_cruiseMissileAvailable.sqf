params ["_side", "_position"];

//Deactivated due to arma glitching, looking into it later
if(true) exitWith {-1};

if(tierWar < 8) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "MISSILE" && {(_lastSupport select 1) > time}) exitWith {-1};

if !(allowUnfairSupports) exitWith {-1};

private _shipMarker = "";
if(_side == Occupants) then
{
    _shipMarker = "NATO_carrier";
}
else
{
    _shipMarker = "CSAT_carrier";
};

//Cruise missile range is 16 km (it can have 32km, but I limit it here)
if((getMarkerPos _shipMarker) distance2D _position > 16000) exitWith {-1};

private _timerIndex = -1;
private _playerAdjustment = (floor ((count allPlayers)/10)) + 1;
private _supportTimer = if(_side == Occupants) then {occupantsCruiseMissileTimer} else {invadersCruiseMissileTimer};

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
