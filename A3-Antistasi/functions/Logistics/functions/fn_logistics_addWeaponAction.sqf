params ["_cargo", "_vehicle"];

//action to get into static
_name = getText (configFile >> "CfgVehicles" >> typeOf _cargo >> "displayName");
_text = format ["Get in %1 as Gunner", _name];

_actionID = _vehicle addAction [
	_text,
	{
		params ["_vehicle", "_caller", "_id", "_static"];
		if !(attachedTo _static isEqualTo _vehicle) exitWith {[_vehilce, _id] remoteExecCall ["removeAction", 0]};// incase of code break in unloading static
		if ((gunner _static) isEqualTo objNull) then  {
			_caller moveInGunner _static;
		} else {["Cargo Load", "Someone is already in the static"] call A3A_fnc_customHint};
	},
	_cargo,
	5.5,
	true,
	true,
	"",
	"(
		((attachedTo _this) isEqualTo objNull)
		and (_this isEqualTo (vehicle _this))
		and ((gunner _target) isEqualTo objNull)
	)",
	5
];
_vehicle setUserActionText [
	_actionID,
	_text,
	"<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa'/></t>"
];
_cargo setVariable ["getInAction", _actionID];

//EH that removes action if static is destroyed
private _KilledEH = _cargo addEventHandler ["Killed", { 
	params ["_cargo"]; 
	private _vehicle = attachedTo _cargo; 
	[_vehicle, _cargo] remoteExecCall ["A3A_fnc_logistics_removeWeaponAction",0]
}];
_cargo setVariable ["KilledEH", _KilledEH];
_cargo enableWeaponDisassembly false;

//moves player to apropriate spot when exiting static
private _GetOutEH = _cargo addEventHandler ["GetOut", {
	params ["_cargo", "_role", "_unit"];
    private _vehicle = attachedTo _cargo;
    private _vehDir = direction _vehicle;
    private _newPos = _unit getPos [2.0, _vehDir-90];
	_unit setPos _newPos;
}];
_cargo setVariable ["GetOutEH", _GetOutEH];

//break undercover of units getting in
private _undercoverBreak = _vehicle addEventHandler ["GetIn", {
	_this spawn {sleep 0.1; (_this#2) setCaptive false};
}];
_vehicle setVariable ["undercoverBreak", _undercoverBreak];

//init unneccesary but nice features
_cargo call A3A_fnc_logistics_initMountedWeapon;