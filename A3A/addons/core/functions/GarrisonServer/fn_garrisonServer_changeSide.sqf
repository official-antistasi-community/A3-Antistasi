// Handle server garrison contents on side change. Probably only used by markerChange?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_newSide"];

Trace_1("Called with params %1", _this);

// Other stuff is left alone?
private _garrison = A3A_garrison get _marker;
_garrison set ["troops", [[0,0], []] select (_newSide == teamPlayer)];

private _machineID = A3A_garrisonMachine get _marker;
if (!isNil "_machineID") then {
    ["changeSide", [_marker, _newSide]] call A3A_fnc_garrisonOp;
};

Trace("Completed");
