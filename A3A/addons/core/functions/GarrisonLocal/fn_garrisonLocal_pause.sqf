
params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
_garrison set ["paused", true];

// don't bother with buildings? or hideobject only?
private _toChange = (_garrison get "troops") + (_garrison get "civs") + (_garrison get "statics") + (_garrison get "vehicles");

{ _x hideObjectGlobal true } forEach _toChange;
[_toChange, { { _x enableSimulationGlobal false } forEach _this }] remoteExecCall ["call", 2];
