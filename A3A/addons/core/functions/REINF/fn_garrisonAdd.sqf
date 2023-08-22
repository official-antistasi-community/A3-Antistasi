// Client-side single unit type garrison adding from dialog
// Adding is a zero-information operation. We just ask server to add units and it responds

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unitType"];

private _marker = A3A_editingGarrison;
if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith {
	[localize "STR_A3A_garrison_header", "Garrison lost"];
	closeDialog 0;
};

// Sends customHint back to client with results
[_marker, _unitType, clientOwner] remoteExecCall ["A3A_fnc_addUnitTypeToGarrison", 2];
