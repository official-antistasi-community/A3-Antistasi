params ["_marker", "_unit"];

private _troops = A3A_activeGarrison get _marker get "troops";
_troops deleteAt (_troops find _unit);

// sanity check?
