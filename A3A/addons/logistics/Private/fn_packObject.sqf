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

#include "..\script_component.hpp"

params  [
    ["_object", objNull, [objNull]]
];

if(!(isNull attachedTo _object)) exitWith {};

//search the object will be the package
private _packageClassName = getText (configFile >> "A3A" >> "A3A_Logistics_Packable" >> typeOf _object >> "packObject"); 
if (_packageClassName isEqualTo "") then {_packageClassName = "CargoNet_01_box_F"};

private _objectPrice = _object getVariable ['A3A_itemPrice', 0];
//create package
private _package = objNull;
isNil {
    _package = createVehicle [_packageClassName, getPosATL _object, [], 0, "CAN_COLLIDE"];
    _package setVariable ["A3A_packedObject", typeOf _object, true]; 
    _package allowDamage false;
    if(A3A_hasAce) then { [_package, 4] call ACE_cargo_fnc_setSize };
    deleteVehicle _object;
};

[_package] call A3A_fnc_initObject;
_package setVariable ["A3A_itemPrice", _objectPrice, true]; 
