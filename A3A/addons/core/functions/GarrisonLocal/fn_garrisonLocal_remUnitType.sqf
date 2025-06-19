// Used to reduce rebel garrisons
// Assume not used while under attack

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_unitType"];

private _troops = A3A_activeGarrison get _marker get "troops";

private _index = _troops findIf { alive _x and _x getVariable "unitType" == _unitType };
if (_index == -1) exitWith {
    Error_2("Live unit type %1 not found in %2", _unitType, _marker);
};

// Should only be edited when not in contact, so can delete immediately

private _unit = _troops deleteAt _index;
if (vehicle _unit != _unit) exitWith {
    vehicle _unit deleteVehicleCrew _unit;
    [_marker] call A3A_fnc_garrisonLocal_updateStatics;
};
deleteVehicle _unit;
