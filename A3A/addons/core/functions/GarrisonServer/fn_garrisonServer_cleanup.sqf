// Used to cleanup off-faction vehicles and buildings from unspawned enemy garrisons
// Also refund any excess troops
// Don't touch buildings for now?
// side needs to be correct when called
// initVarServer must be complete, and enemy resources must be set

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with params %1", _this);

params ["_marker", "_fromSave", "_troopsOnly"];

private _garrison = A3A_garrison get _marker;

if ("_civ" in _marker) exitWith
{
    private _places = A3A_spawnPlacesHM get _marker;
    private _valid = A3A_validVehicles get civilian;
    private _vehicles = _garrison get "vehicles";
    {
        _x params ["_vehType", "_slotNum"];

        if (_slotNum isEqualType 0 and { _slotNum >= count _places }) then {
            _vehicles deleteAt _forEachIndex;
            continue;
        };

        private _slotType = if (_slotNum isEqualType []) then { "civBoat" } else { _places # _slotNum # 0 };
        if !(_vehType in (_valid get _slotType)) then {
            Debug_2("%1 (slot type %2) not valid, swapping", _vehType, _slotType);
            if (_slotType == "civCar") exitWith { _x set [0, selectRandomWeighted civVehiclesWeighted] };
            if (_slotType == "civBoat") exitWith { _x set [0, selectRandomWeighted civBoatsWeighted] };
            _vehicles deleteAt _forEachIndex;
        };
    } forEachReversed (_garrison get "vehicles");
};

private _side = sidesX getVariable _marker;
if (_side == teamPlayer) exitWith {};           // nothing to do here at the moment. TODO: Could use to set threat for unknown vehicles on init?

// Refund any excess troops
private _troops = _garrison get "troops";
private _excess = (_troops#0) - (A3A_garrisonSize get _marker);
if (_excess > 0) then {
    _troops set [0, _troops#0 - _excess];
    [10*_excess, _side, "defence"] call A3A_fnc_addEnemyResources;
};

if (_troopsOnly) exitWith { Trace("Completed") };

// each static & vehicle:
// - lookup type using place index
// - if it doesn't have a place index then just refund it
// - check if type is valid for faction
// - if not, swap for valid vehicle

private _faction = Faction(_side);
private _places = A3A_spawnPlacesHM get _marker;
private _valid = A3A_validVehicles get _side;
private _isAirport = _marker in airportsX;

private _vehicles = _garrison get "vehicles";
{
    _x params ["_vehType", "_slotNum"];

    if (_slotNum isEqualType [] or { _slotNum >= count _places }) then {
        _vehicles deleteAt _forEachIndex;
        private _cost = A3A_vehicleResourceCosts getOrDefault [_vehType, 0];
        [_cost, _side, "defence"] call A3A_fnc_addEnemyResources;
        Debug_1("Refunding %1", _vehType);
        continue;
    };

    private _slotType = _places # _slotNum # 0;
    if !(_vehType in (_valid get _slotType)) then {
        // Arguably should refund this case if it's not a save?
        _x set [0, [_faction, _slotType, _isAirport] call A3A_fnc_selectGarrisonVehicleType];
        Debug_3("%1 (slot type %2) not valid, swapping to %3", _vehType, _slotType, _x#0);
    };
} forEachReversed _vehicles;
