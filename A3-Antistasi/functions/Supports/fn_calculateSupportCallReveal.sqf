/*
Author: Wurzel0701
    Calculates the reveal value for a support based on the given position

Arguments:
    <POSITION> The position from which the reveal value should be calculated

Return Value:
    <NUMBER> The calculated reveal value (range 0 - 1)

Scope: Server
Environment: Unscheduled
Public: Yes
Dependencies:
    <ARRAY> airportsX
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <ARRAY> antennas
    <ARRAY> outposts

Example:
    [getPos player] call A3A_fnc_calculateSupportCallReveal;
*/

params
[
    ["_position", [0,0,0], [[]]]
];

private _result = 0;

//Hard value is the reveal you always get, softValue is a chance to get this amount of reveal
private _hardValue = 0;
private _softValue = 20;

//HQ really near, high chance to get something
if(_position distance2D (getMarkerPos "Synd_HQ") < 1000) then
{
    _hardValue = 20;
    _softValue = _softValue + 20;
};
//HQ near, light chance to get something
if(_position distance2D (getMarkerPos "Synd_HQ") < 2500) then
{
    _softValue = _softValue + 20;
};

//If nearest airport is owned by rebels increase chance, if near increase even more
private _nearestAirport = [airportsX, _position] call BIS_fnc_nearestPosition;
if(sidesX getVariable [_nearestAirport, sideUnknown] == teamPlayer) then
{
    _softValue = _softValue + 20;
    if((getMarkerPos _nearestAirport) distance2D _position < 1500) then
    {
        _hardValue = _hardValue + 10;
        _softValue = _softValue + 10;
    };
};

//If nearest antenna is owned by rebels increase chance, if near increase even more
private _nearestAntenna = [antennas, _position] call BIS_fnc_nearestPosition;
private _antennaMarker = [outposts + airportsX, _position] call BIS_fnc_nearestPosition;
if(sidesX getVariable [_antennaMarker, sideUnknown] == teamPlayer) then
{
    _hardValue = _hardValue + 10;
    _softValue = _softValue + 20;
    if((getMarkerPos _antennaMarker) distance2D _position < 2000) then
    {
        _hardValue = _hardValue + 20;
        _softValue = _softValue + 10;
    };
};

//Calculate results
_result = _hardValue + (round (random _softValue));
_result = (_result / 100) min 1;

_result;
