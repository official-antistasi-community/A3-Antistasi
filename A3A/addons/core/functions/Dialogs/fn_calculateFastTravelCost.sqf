/*
Maintainer: Caleb Serafin
    Calculates the monetary and time cost of fast travel.
    Note: Your code is responsible for to handling the money. That should happen on server in unscheduled execution to avoid the lost update problem.
    Time is capped to 60 seconds.

Arguments:
    <OBJECT> Player who orders fast travel. objNull skips discounts.
    <ARRAY<OBJECT>> Things being fast travelled.
    <POS2D> Destination.

Return Value:
    <SCALAR,SCALAR> Total Money and Max Time cost tuple.

Scope: Any, Global Arguments, No Effect
Environment: Any
Public: Yes

Example:
    [player, [vehicle player], getPos _petrosWhitePowderHouse] call A3A_fnc_calculateFastTravelCost params ["_fastTravelCost","_fastTravelTime"];
    FUNCMAIN(calculateFastTravelCost)
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    ["_initiator", objNull, [objNull]],
    ["_things", objNull, [objNull, grpNull, []]],
    ["_destination", nil, [[]], [2,3]]  // Rather than using [0,0] as default for destination. We will explicitly log errors when nothing is passed.
];
if (isNil "_destination") exitWith {
    Error("_destination was nil");
};
if (_things isEqualType objNull || _things isEqualType grpNull) then {
    _things = [_things];
};

/*
Goal:
Encourage players to touch grass and perform infantry guerrilla tactics easily

Methods:
Should be ultra affordable on foot. (free tier?)
Should be less affordable in vehicles.
Should be premium with cargo or towing.


"premium" is expensive enough to make players consider driving and risking interception by roadblock
We can probably balance based on mission radius, as ft outside that will more rare.
If only infantry are fast travelling, we could reduce the enemy-block-radius for towns. Since infantry should be able to slip in undetected.
Like ft players into building garrison positions.
*/
private _distanceReference = distanceMission;

private _costPerKmForInfantry = 0.0;
private _costPerKmForVehicle = 100.0 / _distanceReference;
private _costPerKmForCargo = 200.0 / _distanceReference;  // For HR logistics cargo, ACE cargo and towing, DOES NOT include the vehicle or person hauling the cargo.

private _secondsPerKmForInfantry = 1.0 / _distanceReference;
private _secondsPerKmForVehicle = 5.0 / _distanceReference;
private _secondsPerKmForCargo = 20.0 / _distanceReference;

// Get all cargo that is being fast travelled.
private _allObjectCargo = [];
private _allInfantryCargo = [];
{
    // ToDo Get cargo of thing here
    private _objectCargo = [];
    private _infantryCargo = crew _x;
    // Add to accumulators.
    _allInfantryCargo append _infantryCargo;
    { _allObjectCargo pushBack _x; } forEach _objectCargo;
} forEach _things;

// Remove object cargo from things. (It gets special pricing)
_things = _things - _allObjectCargo;

// Add infantry to things. There is no unique version of merge.
{ _things pushBackUnique _x } forEach _allInfantryCargo;

// Calculate cost of things.
private _totalCost = 0.0;
private _longestTime = 0.0;
{
    private _distance = _x distance2D _destination;
    private _cost = 0.0;
    private _time = 0.0;
    if (_x isKindOf "Man") then {
        _cost = _distance * _costPerKmForInfantry;
        _time = _distance * _secondsPerKmForInfantry;
    } else { // If any other vehicle
        _cost = _distance * _costPerKmForVehicle;
        _time = _distance * _secondsPerKmForVehicle;
    };

    _totalCost = _totalCost + _cost;
    if (_longestTime < _time) then {
        _longestTime = _time;
    }
} forEach _things;

// Calculate cost of cargo.
{
    private _distance = _x distance2D _destination;
    private _cost = _distance * _costPerKmForCargo;
    private _time = _distance * _secondsPerKmForCargo;

    _totalCost = _totalCost + _cost;
    if (_longestTime < _time) then {
        _longestTime = _time;
    }
} forEach _allObjectCargo;

// Round
_totalCost = ceil _totalCost;
// Cap
_longestTime = _longestTime min 60.0;

// Return
[_totalCost, _longestTime];
