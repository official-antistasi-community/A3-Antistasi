/*
    Author: [Ayla (Alsekwolf), Spoffy, Håkon, CalebSerafin]
    [Description]
        Modifies the mass of a vehicle with the mass of the object being added or removed

    Arguments:
    0. <Object> Vehicle you want to change mass of
    1. <Object> Object your loading onto vehicle
    2. <Bool>   If your removing the object from the vehicle
    3. <Bool>   Block load info message

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example:

    License: MIT License
*/
params["_vehicle","_object", ["_removeObject", false, [true]], ["_dontMsg", false, [true]]];

//------------------\\
//-- Set new mass --\\
//------------------\\
private _defaultMass = _vehicle getVariable "default_mass";
if (isNil "_defaultMass") then {
    _defaultMass = getMass _vehicle;
    _vehicle setVariable ["default_mass", _defaultMass, true];
};

private _cargo = (attachedObjects _vehicle) select { !isNil {_x getVariable "AttachmentOffset"}};

//Figure out our new mass value
private _newMass = _defaultMass;
{
    _newMass = _newMass + getMass _x;
} forEach _cargo;
_newMass = _newMass max _defaultMass; //never set it bellow the default mass

[_vehicle, _newMass] remoteExec ["setMass", _vehicle];
if (_dontMsg) exitWith {};

//------------------\\
//-- Send message --\\
//------------------\\

//Pull data on available nodes, so we can display it to the user.
private _nodes = _vehicle getVariable ["logisticsCargoNodes",[]];
private _availableNodes = { (_x#0) isEqualTo 1 } count _nodes;

private _objectName = getText (configFile >> "cfgVehicles" >> typeOf _object >> "displayName");
private _vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
//Mass of all cargo attached to the vehicle.
private _cargoMass = _newMass - _defaultMass;

//Output the final message.
private _msg = "";
if (!_removeObject) then{
    if (_availableNodes == 0) then {
        _msg = Format ["<t color='#00fff3'>"+localize"STR_antistasi_logistics_loaded_noSpace"+"</t>", _objectName, _vehicleName, _availableNodes];
    } else {
        _msg = Format ["<t color='#00fff3'>"+localize"STR_antistasi_logistics_loaded_free"+"</t>", _objectName, _vehicleName, _availableNodes];
    };
} else {
    _msg = Format ["<t color='#00fff3'>"+localize"STR_antistasi_logistics_unloaded"+"</t>", _objectName, _vehicleName, _availableNodes];
};

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
    getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture"),
    getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName"),
    _defaultMass,
    _cargoMass,
    _defaultMass + _cargoMass
];
_text = _text + _msg;

["LogisticsInfo", parseText _text] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner];
["LogisticsInfo", parseText _text] remoteExec ["A3A_fnc_customHint", crew _vehicle];

nil;
