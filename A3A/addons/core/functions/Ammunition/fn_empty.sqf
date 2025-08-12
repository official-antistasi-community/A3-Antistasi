private ["_trucksX","_truckX","_weaponsX","_ammunition","_items","_backpcks","_containers","_todo"];

_truckX = objNull;

if (count _this > 0) then
	{
	_truckX = _this select 0;
	if (_truckX isKindOf "StaticWeapon") then {_truckX = objNull};
	}
else
	{
	_trucksX = nearestObjects [boxX, ["Helicopter","Plane","LandVehicle","ReammoBox_F"], 20];
	_trucksX = _trucksX select {not (_x isKindOf "StaticWeapon")};
	// Prevent trolling by hiding small UAVs near the arsenal
	_trucksX = _trucksX select {getNumber (configFile >> "CfgVehicles" >> (typeof _x) >> "isUAV") == 0};
	_trucksX = _trucksX - [boxX,vehicleBox];
	if (count _trucksX < 1) then {_truckX = vehicleBox} else {_truckX = _trucksX select 0};
	};

if (isNull _truckX) exitWith {};

_weaponsX = weaponCargo _truckX;
_ammunition = magazineCargo _truckX;
_items = itemCargo _truckX;
_backpcks = backpackCargo _truckX;

_todo = _weaponsX + _ammunition + _items + _backpcks;

private _vehName = getText (configFile >> "CfgVehicles" >> (typeof _truckX) >> "displayName");

if (count _todo < 1) exitWith
	{
	if (count _this == 0) then {[localize "STR_A3A_fn_ammo_cargo", format [localize "STR_A3A_fn_ammo_empty_vehicle_empty", _vehName]] call A3A_fnc_customHint;};
	if (count _this == 2) then {deleteVehicle _truckX};
	};

if (count _this == 0) then {
	[localize "STR_A3A_fn_ammo_cargo", format [localize "STR_A3A_fn_ammo_empty_cargo_transferred", _vehName]] call A3A_fnc_customHint;
};

if (count _this == 2) then {
	[_truckX,boxX,true] remoteExec ["A3A_fnc_ammunitionTransfer",2];
}
else {
	[_truckX,boxX] remoteExec ["A3A_fnc_ammunitionTransfer",2];
};
