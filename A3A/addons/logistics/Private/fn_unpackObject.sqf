/*
Author: Killerswin2
    Handles unpacking objects and converting them to the correct type
Arguments:
    0.<Object> Object that we are converting
Return Value:
    <nil>
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [_object] call A3A_Logistics_fnc_unpackObject; 
*/
#include "..\script_component.hpp"

params  [
    ["_package", objNull, [objNull]]
];

// don't unpack if attached.
if !(isNull attachedTo _package) exitWith {};

//get data 
private _object = _package getVariable "A3A_packedObject";
if (isNil "_object") exitwith { Error_1("No packed object for item type %1", typeof _package) };

private _fnc_placed = {
    params ["_placedItem", "_package", "_object"];
    if (isNull _placedItem) exitWith { _package hideObject false };          // placement cancelled

    isNil {
        detach _object;
        _object setPosWorld getPosWorld _placedItem;
        _object setVectorDirAndUp [vectorDir _placedItem, vectorUp _placedItem];
        deleteVehicle _placedItem;
        deleteVehicle _package;
    };

// It's already initialised
//    _item call A3A_fnc_initObject;
};

_package hideObject true;
[typeof _object, _fnc_placed, {[false]}, [_package, _object]] call HR_GRG_fnc_confirmPlacement;
