// used for enemy garrisons only?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_unitCount", "_unitQuality"];

private _garrison = A3A_activeGarrison get _marker;
private _side = _garrison get "side";

[_garrison, _marker, _side, [_unitCount, _unitQuality], false] call A3A_fnc_spawnGarrisonSquads;

// Hmm
[_marker] call A3A_fnc_garrisonLocal_updateStatics;
