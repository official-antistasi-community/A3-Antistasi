/*  
Maintainer: John Jordan
    Select from distance-weighted list of available enemy air bases or return full list
    Checks idle, spawner, distance and garrison
    Carrier is always available, so always returns something

Scope: Anywhere? Only using on server atm
Environment: Scheduled or unscheduled

Arguments:
    <SIDE> Side of enemy faction
    <POS2D> Target position to use
    <BOOL> Optional, true to return all bases & weights (Default: false)

Return value:
    <STRING> Marker name of airbase, or <ARRAY, ARRAY> [airbases, weights]
*/

params ["_side", "_targPos", ["_returnAll", false]];

private _freeAirports = [];
private _weights = [];
{
    if (sidesX getVariable [_x,sideUnknown] != _side) then {continue};
    if (dateToNumber date < server getVariable [_x, 0]) then {continue};
    if (spawner getVariable _x == 0) then {continue};              // don't need spawn places, so this is fine
    if (count (garrison getVariable [_x,[]]) < 16) then {continue};

    _freeAirports pushBack _x;
    private _effDist = abs ((markerPos _x distance2D _targPos) - 5000);     // prefer mid-distance spawns
    _weights pushBack (1 / _effDist^2);
} forEach airportsX;

// Carrier/air corridor is always available
private _carrier = ["CSAT_carrier", "NATO_carrier"] select (_side == Occupants);
_freeAirports pushBack _carrier;
_weights pushBack (1 / (markerPos _carrier distance2D _targPos)^2);

if (_returnAll) exitWith { [_freeAirports, _weights] };
_freeAirports selectRandomWeighted _weights;
