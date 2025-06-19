// Server-side function to remove unit from garrison
// Currently only used on unit death

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit"];

Trace_1("Called with params %1", _this);

private _marker = _unit getVariable "markerX";
if (isNil "_marker") exitWith { Error_1("Unit %1 not in a garrison", _unit) };

// Don't change marker because local-side reactions might still need it
//_unit setVariable ["markerX", nil, true];

private _troops = A3A_garrison get _marker get "troops";
if (sidesX getVariable _marker != teamPlayer) then {
    // Enemy garrison, just reduce count
    _troops set [0, (_troops#0 - 1) max 0];
} else {
    // Rebel garrison, need to find unit of correct type
    private _unitType = _unit getVariable "unitType";
    private _index = _troops find _unitType;
    if (_index < 0) exitWith { Error_2("Unit type %1 not found in garrison %2", _unitType, _marker) };
    _troops deleteAt _index;
};

// Don't need to do anything on local side, dead units are unambiguous
