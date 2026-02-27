params ["_veh", "_mode", "_data"];

private _turretPath = _data#1;
private _turretOwner = _veh turretOwner _turretPath;

_this remoteExec ["A3A_GUI_fnc_serviceVehicleTurret", _turretOwner];