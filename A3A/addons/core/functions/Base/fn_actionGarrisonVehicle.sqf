params ["_vehicle", "_player"];           // actually action params: ["_target", "_caller", "_actionId", "_arguments"];

[_marker, _vehicle] remoteExecCall ["A3A_fnc_garrisonServer_addVehicle", 2];

[_titleStr, localize "STR_A3A_garrison_vehicle_added"] call A3A_fnc_customHint;
