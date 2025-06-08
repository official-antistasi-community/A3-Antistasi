// Server-side function to dispatch a garrison op to appropriate machine

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_opType", "_params"];
private _marker = _params # 0;

Trace_1("Called with params %1", _this);

isNil {
    private _machineID = A3A_garrisonMachine get _marker;
    if (_opType == "spawn") then {
        _machineID = call A3A_fnc_chooseMachineForGarrison;
        A3A_garrisonMachine set [_marker, _machineID];
    };
    if (_opType == "despawn") then {
        if (_side != teamPlayer) then {
            // If it's an enemy marker then cleanup old/misplaced vehicles on despawn
            _marker call A3A_fnc_garrisonServer_cleanup;
        } else {
            // If it's a rebel marker then update vehicle fuel/ammo state
            _marker call A3A_garrisonServer_updateVehData;
        };
        A3A_garrisonMachine deleteAt _marker;       // clear machine ID
    };

    // TODO: add sequence number?
    [[_opType, _params], { A3A_garrisonOps pushBack _this }] remoteExecCall ["call", _machineID];
};

Trace("Completed");
