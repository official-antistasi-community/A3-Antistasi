// Server-side despawn function for both military and civ garrisons

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

Trace_1("Called with params %1", _this);

if !(_marker in A3A_garrisonMachine) exitWith {
    Error_1("Garrison %1 not spawned", _marker);
};

spawner setVariable [_marker, 2, true];

if ("_civ" in _marker) exitWith {
    ["despawnCiv", [_marker]] call A3A_fnc_garrisonOp;
    A3A_garrisonMachine deleteAt _marker;       // clear machine ID
    Trace("Completed");
};


// Things to clean up on despawn
if (_side != teamPlayer) then {
    // If it's an enemy marker then cleanup old/misplaced vehicles on despawn
    [_marker, false, false] call A3A_fnc_garrisonServer_cleanup;
} else {
    // If it's a rebel marker then update vehicle fuel/ammo state
    _marker call A3A_garrisonServer_updateVehData;
};

["despawn", [_marker]] call A3A_fnc_garrisonOp;
A3A_garrisonMachine deleteAt _marker;       // clear machine ID
