// Used to cleanup off-faction vehicles and buildings from unspawned enemy garrisons
// Don't touch buildings for now?
// side needs to be correct when called
// initVarServer must be complete, and enemy resources must be set

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with params %1", _this);

params ["_marker", "_fromSave"];

// each static & vehicle:
// - lookup type using place index
// - if it doesn't have a place index then just refund it
// - check if type is valid for faction
// - if not, swap for valid vehicle

private _side = sidesX getVariable _marker;
if (_side == teamPlayer) exitWith {};           // nothing to do here at the moment. TODO: Could use to set threat for unknown vehicles on init?

private _faction = Faction(_side);
private _garrison = A3A_garrison get _marker;
private _places = A3A_spawnPlacesHM get _marker;
private _valid = A3A_validVehicles get _side;
private _isAirport = _marker in airportsX;

{
    private _vehicles = _garrison get _x;
    {
        _x params ["_vehType", "_slotNum"];

        if !(_slotNum isEqualType 0) then {
            _vehicles deleteAt _forEachIndex;
            private _cost = A3A_vehicleResourceCosts getOrDefault [_vehType, 0];
            [_cost, _side, "defence"] call A3A_fnc_addEnemyResources;
            continue;
        };

        private _slotType = _places # _slotNum # 0;
        if !(_vehType in (_valid get _slotType)) then {
            // Arguably should refund this case if it's not a save?
            _x set [0, [_faction, _slotType, _isAirport] call A3A_fnc_selectGarrisonVehicleType];
        };

    } forEachReversed _vehicles;
} forEach ["statics", "vehicles"];

Trace("Completed");
