params ["_vehicle"];

private _type = typeOf _vehicle;

if (_type in vehAPCs || _type in vehTanks || _type in vehAA) exitWith {
	[_vehicle, [localize "STR_antistasi_customHint_breach_veh", A3A_fnc_startBreachVehicle,nil,4,false,true,"","(isPlayer _this) && (_this == vehicle _this)",5]] remoteExec ["addAction", 0, _vehicle];
};