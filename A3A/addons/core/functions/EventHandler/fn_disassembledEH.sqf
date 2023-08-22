params ["_veh", "_bag1", "_bag2"];

private _marker = _veh getVariable "markerX";
if (isNil "_marker") exitWith {};
[_veh] remoteExecCall ["A3A_fnc_remVehicleFromGarrison", 2];
