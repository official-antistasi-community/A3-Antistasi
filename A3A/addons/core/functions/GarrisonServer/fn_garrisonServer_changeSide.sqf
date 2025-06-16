// Handle server garrison contents on side change. Probably only used by markerChange?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_newSide"];

Trace_1("Called with params %1", _this);

// Other stuff is left alone?
private _garrison = A3A_garrison get _marker;
_garrison set ["troops", [[0,0], []] select (_newSide == teamPlayer)];

// Refresh loot & intel cooldowns if converted to enemy
if (_newSide != teamPlayer) then {
    if (_marker in resourcesX or {_marker in factories}) exitWith {};
    private _lootCD = 120*16 / (A3A_garrisonSize get _marker);
    _garrison set ["lootCD", _lootCD];
    _garrison set ["intelCD", _lootCD];
} else {
    _garrison deleteAt "lootCD";
    _garrison deleteAt "intelCD";
};

if (_marker in A3A_garrisonMachine) then {
    ["changeSide", [_marker, _newSide]] call A3A_fnc_garrisonOp;
};

Trace("Completed");
