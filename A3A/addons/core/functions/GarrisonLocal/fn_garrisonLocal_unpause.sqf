// Local function to reveal and re-enable sim on garrison units & vehicles

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
_garrison set ["paused", false];

// don't bother with buildings? or hideobject only?
private _toChange = (_garrison get "troops") + (_garrison get "civs") + (_garrison get "vehicles");

{ _x enableSimulationGlobal true; _x allowDamage true } forEach _toChange;
[_toChange, { { _x hideObjectGlobal false } forEach _this }] remoteExecCall ["call", 2];
