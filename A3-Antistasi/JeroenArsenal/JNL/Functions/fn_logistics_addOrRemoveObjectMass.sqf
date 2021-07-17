/*
 * File: fn_logistics_addOrRemoveObjectMass.sqf
 * Author: Ayla (Alsekwolf) and Spoffy
 * Description:
 *    Adds or removes mass from a vehicle based on the item being loaded into it.
 * Params:
 *    _vehicle - Vehicle the object is being added to
 *    _object - Object being added to the vehicle
 *    _removeObject - Whether the item is being removed from the vehicle, or added.
 * Returns:
 *    None
 * Example Usage:
 *    [vehicle player, _supplyCrate] call jn_fnc_logistics_addOrRemoveObjectMass
 */

params["_vehicle","_object", ["_removeObject", false]];

private _displayVehicleMessage =
{
	params ["_veh", "_msg", "_cargoMass"];

	_veh vehicleChat _msg;
	private _vehDefaultMass = _vehicle getVariable "default_mass";
	
	private _text = format [
"
<img image='%1' size='2' align='left'/>
<t color='#a02e69' size='1.2' shadow='1' shadowColor='#000000' align='center'>%2</t><br/>
<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>"+localize"STR_antistasi_logistics_defaultMass"+" </t>
<t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%3</t><br/>
<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>"+localize"STR_antistasi_logistics_cargoMass"+" </t>
<t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%4</t><br/>
<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>"+localize"STR_antistasi_logistics_currentMass"+" </t>
<t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%5</t><br/>
",
		getText(configFile >> "cfgVehicles" >> typeOf _veh >> "picture"),
		getText(configFile >> "cfgVehicles" >> typeOf _veh >> "displayName"),
		_vehDefaultMass,
		_cargoMass,
		_vehDefaultMass + _cargoMass
	];

	if (vehicle player != _veh) then
	{
		_text = _text + _msg;
	};

	//Don't use customHint, as we've got a lot of custom formatting.
	hint parseText (_text);
};

if (isNil {_vehicle getVariable "default_mass"}) then {
	//Doesn't matter if we're unloading or loading.
	//If this isn't set, the script has never run - so the mass has never changed! So either way, its currently at the default mass.
	_vehicle setVariable ["default_mass", getMass _vehicle, true];
};

private _defaultMass = _vehicle getVariable "default_mass";


private _objectMass = getMass _object;
private _currentMass = getMass _vehicle;

private _newMass = _currentMass;

//Figure out our new mass value
if (_removeObject) then {
	//Never go lower than the base vehicle's mass.
	_newMass = (_currentMass - _objectMass) max _defaultMass;
} else {
	_newMass = _currentMass + _objectMass;
};

[_vehicle, _newMass] remoteExec ["setMass", _vehicle];

//Pull data on available nodes, so we can display it to the user.
private _nodesLoaded = 0;
{
	private _cargoInfo = _x getVariable "jnl_cargo";
	if !(isNil "_cargoInfo") then {
		_cargoInfo params ["_type", "_nodeIndex"];
		//Number of nodes loaded is equal to the attached object with the highest node index.
		_nodesLoaded = (_nodeIndex + 1) max _nodesLoaded;
	};
} forEach attachedObjects _vehicle;

private _typeObject  = _object call jn_fnc_logistics_getCargoType; //get _object type
private _nodeTotal = count ((_vehicle call jn_fnc_logistics_getNodes) select {(_x select 0) == _typeObject});
private _availableNodes = _nodeTotal - _nodesLoaded;

private _objectName = getText (configFile >> "cfgVehicles" >> typeOf _object >> "displayName");
private _vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
//Mass of all cargo attached to the vehicle.
private _cargoMass = _newMass - _defaultMass;

//Output the final message.
if (!_removeObject) then
{
	if (_availableNodes == 0) then
	{
		[_vehicle, Format ["<t color='#00fff3'>"+localize"STR_antistasi_logistics_loaded_noSpace"+"</t>", _objectName, _vehicleName, _availableNodes], _cargoMass] call _displayVehicleMessage;
	}
	else
	{
		[_vehicle, Format ["<t color='#00fff3'>"+localize"STR_antistasi_logistics_loaded_free"+"</t>", _objectName, _vehicleName, _availableNodes], _cargoMass] call _displayVehicleMessage;
	};
}
else
{
	[_vehicle, Format ["<t color='#00fff3'>"+localize"STR_antistasi_logistics_unloaded"+"</t>", _objectName, _vehicleName, _availableNodes], _cargoMass] call _displayVehicleMessage;
};