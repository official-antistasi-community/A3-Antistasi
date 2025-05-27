// Only used to remove dead unit from records
// _unit is object

params ["_marker", "_unit"];

private _troops = A3A_activeGarrison get _marker get "troops";
_troops deleteAt (_troops find _unit);
