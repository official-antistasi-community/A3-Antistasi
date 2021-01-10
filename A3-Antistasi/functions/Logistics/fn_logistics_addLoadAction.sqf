params ["_object", ["_action", "load"]];

if (isNil "logistics_vehicleHardpoints") then {
	call A3A_fnc_logistics_initNodes;
};

_nonSupportedStatic = false;
if (_object isKindOf "StaticWeapon") then {
	private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
	if (({(_X#0) isEqualTo _model } count logistics_weapons) isEqualTo 0) then {_nonSupportedStatic = true};
};
if (_nonSupportedStatic) exitWith {};

[_object , _action] remoteExec ["A3A_fnc_logistics_addAction", 0, _object];