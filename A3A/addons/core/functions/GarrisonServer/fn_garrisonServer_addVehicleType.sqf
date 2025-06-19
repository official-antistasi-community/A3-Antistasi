/*
    Add vehicle/static of specific type to enemy garrison
    Slot type/number selected at higher level

    Used by? Just init and reinf, so enemy garrisons?
    Vehicles never added in any other way? Not yet...
*/

// Not used by init, because it just dumps classnames & places straight into the array?
// Should reinf use random slot or not?
// 

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehClass", "_slotNum"];

Trace_1("Called with params %1", _this);

if (sidesX getVariable _marker == teamPlayer) exitWith {
    Error("Attempted to add vehicle type to rebel garrison");
};

private _garrison = A3A_garrison get _marker;
(_garrison get "vehicles") pushBack [_vehClass, _slotNum];

// Add to active garrison if spawned
if (_marker in A3A_garrisonMachine) then {
    ["addVehicleType", [_marker, _vehClass, _slotNum]] call A3A_fnc_garrisonOp;
};
