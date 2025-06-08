// Server-side, unscheduled
// Just a passthrough to local garrison, because only the server knows where it is

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

Trace_1("Called with params %1", _this);

if (!isNil {A3A_garrisonMachine get _marker}) then {
    ["updateStatics", [_marker]] call A3A_fnc_garrisonOp;
};

Trace("Completed");
