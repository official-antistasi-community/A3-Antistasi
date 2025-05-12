// Server-side function to remove unit from garrison
// currently only used on death of unit with non-nil markerX?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit"];

Trace_1("Called with params %1", _this);

private _marker = _unit getVariable "markerX";
if (isNil "_marker") exitWith { Error_1("Unit %1 not in a garrison", _unit) };

private _troops = A3A_garrison get _marker get "troops";
private _unitType = _unit getVariable "unitType";
private _index = _troops find _unitType;

if (_index < 0) exitWith { Error_2("Unit type %1 not found in garrison %2", _unitType, _marker) };

// Remove from server garrison data
_troops deleteAt _index;
_unit setVariable ["markerX", nil, true];

// Remove from active garrison if spawned
if (!isNil {A3A_garrisonMachine get _marker}) then {
    ["remUnit", [_marker, _unit]] call A3A_fnc_garrisonOp;
};

Trace("Completed");
