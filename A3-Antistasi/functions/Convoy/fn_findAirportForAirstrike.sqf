params ["_destination", ["_side", sideUnknown]];

/*  Usage: Searches for a suitable Airport for an airstrike on given destination
*
*   params
*   _destination : MARKER or POS; the destination of the airstrike
*   _side : SIDE; the side of the airstrike, only needed if _destination is a POS
*
*   retuns
*   _airport : MARKER; the best suited airport, "" if none found
*/

private _airport = "";
private _fileName = "findAirportForAirstrike";

//Assuming _destination is a pos
private _destinationPos = _destination;

//Given destination is a marker, getting side by marker or given side
if(_destination isEqualType "") then
{
    //Side not given
    if(_side == sideUnknown) then
    {
        _side = sidesX getVariable [_destination, sideUnknown];
    };
    _destinationPos = getMarkerPos _destination;
};

//Sort by side
_possibleAirports = airportsX select {sidesX getVariable [_x, sideUnknown] == _side};

//Sort by further criteria
_possibleAirports = _possibleAirports select
{
    (spawner getVariable _x == 2) &&                    //Not already spawned in
    {(dateToNumber date > server getVariable _x) &&     //Not currently on cooldown
    {!(_x in forcedSpawn) &&                            //Not force spawned in (not sure how long this will be in the script tho)
    {(getMarkerPos _x distance _destinationPos > distanceSPWN)}}} //Not closer than spawn distance
};

if(_side == Occupants) then
{
    _possibleAirports pushBack "NATO_carrier";
}
else
{
    _possibleAirports pushBack "CSAT_carrier";
};

//Sort by max distance and killzones (TODO what are killzones and how are they working??)
_suitableAirports = [];
{
    _posbase = getMarkerPos _x;
    if ((_destinationPos distance2D _posbase < distanceForAirAttack) /*&& (({_x == _markerX} count (killZones getVariable [_x,[]])) < 3)*/) then
    {
        _suitableAirports pushBack _x;
    };
} forEach _possibleAirports;

//If some remain, choose the nearest one, else return empty string
if (count _suitableAirports > 0) then
{
    _airport = [_suitableAirports,_destinationPos] call BIS_fnc_nearestPosition;
    [3, format ["Found %1 suitable airports, will return %2", count _suitableAirports, _airport], _fileName] call A3A_fnc_log;
}
else
{
    _airport = "";
    [3, "FindAirportForAirstrike: No suitable position found, returning empty string", _fileName] call A3A_fnc_log;
};
_airport;
