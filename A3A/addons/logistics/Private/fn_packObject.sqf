/*
Function: A3A_Logistics_fnc_packObjects
Author: Killerswin2
    handles packing objects into a different object for transporting
Arguments:
    0.<Object> object to be packed
Return Value:
    <nil>
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [_object] call A3A_Logistics_fnc_packObject; 
*/

params  [
    ["_object", objNull, [objNull]]
];

if(!(isNull attachedTo _object)) exitWith {};

//search the object will be the package
private _packageClassName = getText (configFile >> "A3A" >> "A3A_Logistics_Packable" >> typeOf _object >> "packObject"); 
if (_packageClassName isEqualTo "") then {_packageClassName = "CargoNet_01_box_F";};

//create package
private _position = (getPos player vectorAdd [3,0,0]) findEmptyPosition [1, 25, _packageClassName];
if (_position isEqualTo []) then {_position = getPos player };
private _package = _packageClassName createVehicle _position;
_package allowDamage false;

//save into package import info
private _price = _object getVariable ["A3A_itemPrice", 0];
private _canOpenDoors = _object getVariable ["A3A_canOpenDoor", false]; 
_package setVariable ["A3A_canGarage", true, true];
_package setVariable ["A3A_itemPrice", _price, true];
_package setVariable ["A3A_canOpenDoor", _canOpenDoors, true]; 
_package setVariable ["A3A_packedObject", typeOf _object, true]; 

// add actions for unpacking but remote for others
[_package] remoteExecCall ["A3A_Logistics_fnc_unpackObjectAction", 0, _package];

// add logi
[_package] call A3A_Logistics_fnc_addLoadAction;
private _jipKey = "A3A_utilityItems_item_" + "A3A_fnc_initMovableObject" + "_" + ((str _package splitString ":") joinString "");
[_package, _jipKey] remoteExecCall ["A3A_fnc_initMovableObject", 0, _jipKey];

//delete object
deleteVehicle _object;