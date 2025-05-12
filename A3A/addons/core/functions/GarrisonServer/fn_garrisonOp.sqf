// Server-side function to dispatch a garrison op to appropriate machine

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
        A3A_garrisonMachine deleteAt _marker;       // clear machine ID
    };

    // TODO: add sequence number?
    [[_opType, _params], { A3A_garrisonOps pushBack _this }] remoteExecCall ["call", _machineID];
};

Trace("Completed", _this);
