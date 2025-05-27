
// Server-side function to add new units to enemy garrison

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitCount", "_quality"];

Trace_1("Called with params %1", _this);

// Add troops to server garrison data, averaging the quality
private _troops = A3A_garrison get _marker get "troops";
private _newQuality = (_troops#0 * _troops#1 + _unitCount * _quality) / (_troops#0 + _unitCount);
_troops set [0, _troops#0 + _unitCount];
_troops set [1, _newQuality];

// Update the marker text if it's rebel
if (sidesX getVariable _marker == teamPlayer) then { [_marker] call A3A_fnc_mrkUpdate };

// Add real unit if garrison is spawned
if (!isNil {A3A_garrisonMachine get _marker}) then {
    ["spawnUnitCount", [_marker, _unitCount, _quality]] call A3A_fnc_garrisonOp;
};

Trace("Completed");
