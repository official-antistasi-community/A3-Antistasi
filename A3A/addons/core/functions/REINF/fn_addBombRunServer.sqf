// Server-side unscheduled code to convert a vehicle into bomb runs

params ["_vehicle", "_pointsX"];

if !(_vehicle isNil "markerX") then { [_vehicle] call A3A_fnc_garrisonServer_remVehicle };     // must be done before deletion

deleteVehicle _vehicle;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";

[] remoteExec ["A3A_fnc_statistics",theBoss];
