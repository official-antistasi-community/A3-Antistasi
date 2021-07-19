/*  Returns a weighted and balanced vehicle pool for the given side and filter

    Execution on: All

    Scope: External

    Params:
        _side: SIDE : The side for which the vehicle pool should be used
        _filter: ARRAY of STRINGS : The bases classes of units that should be filtered out (for example ["LandVehicle"] or ["Air"])

    Returns:
        _vehiclePool: ARRAY : [vehicleName, weight, vehicleName2, weight2]
*/

params ["_side", ["_filter", []]];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _faction = Faction(_side);
private _isOcc = _side isEqualTo Occupants;
private _vehicleSelection = [];

Debug_2("Now searching for attack vehicle pool for %1 with filter %2", _side, _filter);
//In general is Invaders always a bit less chill than the occupants, they will use heavier vehicles more often and earlier
private_vehicleSelection = switch (tierWar) do {
    case (1): {
        [
            [_faction get "vehiclesLightArmed", if (_isOcc) then {15} else {5}],
            [_faction get "vehiclesTrucks", if (_isOcc) then {10} else {15}],
            [_faction get "vehiclesHelisLight", if (_isOcc) then {25} else {25}],
            [_faction get "vehiclesAPCs", if (_isOcc) then {35} else {30}],
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), if (_isOcc) then {15} else {25}]
        ]
    };
    case (2): {
        [
            [_faction get (if (_isOcc) then {"vehiclesLightArmed"} else {"vehiclesAA"}), if (_isOcc) then {15} else {10}],
            [_faction get "vehiclesHelisLight", if (_isOcc) then {25} else {15}],
            [_faction get "vehiclesAPCs", 40],
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), if (_isOcc) then {20} else {35}]
        ]
    };
    case (3):
    {
        [
            [_faction get "vehiclesHelisLight", if (_isOcc) then {15} else {5}],
            [_faction get "vehiclesAPCs", 35],
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), if (_isOcc) then {40} else {30}],
            [_faction get "vehiclesAA", if (_isOcc) then {10} else {15}]
        ] + (if (_isOcc) then { [] } else {[
            [_faction get "vehiclesHelisAttack", 15]
        ]});
    };
    case (4):
    {
        [
            [_faction get "vehiclesAPCs", if (_isOcc) then {30} else {15}],
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), if (_isOcc) then {40} else {15}],
            [_faction get "vehiclesAA", 15],
            [_faction get "vehiclesHelisAttack", if (_isOcc) then {15} else {20}]
        ] + (if (_isOcc) then { [] } else {[
            [_faction get "vehiclesTanks", 15],
            [_faction get "vehiclesPlanesTransport", 20]
        ]});
    };
    case (5):
    {
        [
            [_faction get "vehiclesAPCs", if (_isOcc) then {20} else {15}],
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), if (_isOcc) then {20} else {10}],
            [_faction get "vehiclesAA", 15],
            [_faction get "vehiclesHelisAttack", if (_isOcc) then {30} else {15}],
            [_faction get "vehiclesTanks", if (_isOcc) then {15} else {20}]
        ] + (if (_isOcc) then { [] } else {[
            [_faction get "vehiclesPlanesTransport", 15]
        ]});
    };
    case (6):
    {
        [
            [_faction get "vehiclesAPCs", if (_isOcc) then {15} else {10}],
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), if (_isOcc) then {10} else {5}],
            [_faction get "vehiclesAA", 10],
            [_faction get "vehiclesHelisAttack", 20],
            [_faction get "vehiclesTanks", if (_isOcc) then {15} else {20}],
            [_faction get "vehiclesPlanesTransport", 15]
        ];
    };
    case (7);
    case (8);
    case (9);
    case (10):
    {
        [
            [_faction get "vehiclesAPCs", 10],
            [_faction get "vehiclesAA", if (_isOcc) then {5} else {10}],
            [_faction get "vehiclesHelisAttack", if (_isOcc) then {20} else {25}],
            [_faction get "vehiclesTanks", if (_isOcc) then {20} else {25}],
            [_faction get "vehiclesPlanesTransport", 15]
        ] + (if (_isOcc) then { [
            [(_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"), 10]
        ] } else { [] });
    };
};

//Use this function to filter out any unwanted elements
_fn_checkElementAgainstFilter =
{
    params ["_element", "_filter"];

    private _passed = true;
    {
        if(_element isKindOf _x) exitWith
        {
            _passed = false;
            Debug_2("%1 didnt passed filter %2", _element, _x);
        };
    } forEach _filter;

    _passed;
};

//Break unit arrays down to single vehicles
private _vehiclePool = [];
{
    if((_x select 0) isEqualType []) then
    {
        private _points = 0;
        private _vehicleCount = count (_x select 0);
        if(_vehicleCount != 0) then
        {
            _points = (_x select 1)/_vehicleCount;
        }
        else
        {
            Error("Found vehicle array with no defined vehicles!");
        };
        {
            if(([_x, _filter] call _fn_checkElementAgainstFilter) && {[_x] call A3A_fnc_vehAvailable}) then
            {
                _vehiclePool pushBack _x;
                _vehiclePool pushBack _points;
            };
        } forEach (_x select 0);
    }
    else
    {
        if(([_x select 0, _filter] call _fn_checkElementAgainstFilter) && {[_x select 0] call A3A_fnc_vehAvailable}) then
        {
            _vehiclePool pushBack (_x select 0);
            _vehiclePool pushBack (_x select 1);
        };
    };
} forEach _vehicleSelection;

Debug_4("For %1 and war level %2 selected units are %3, filter was %4", _side, tierWar, _vehiclePool, _filter);

_vehiclePool;
