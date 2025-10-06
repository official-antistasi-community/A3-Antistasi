/*
Author: Killerswin2
    Function to initialize buyable items

Arguments:
    0.<Object> Object to initialize. Should be present in A3A_utilityItemHM

Return Value:
    <nil>

Scope: Anywhere
Environment: Unscheduled
Public: No
Dependencies:

Example:
    [_object] call A3A_fnc_initObject;
*/
#include "..\..\script_component.hpp"

params [["_object", objNull, [objNull]]];

if (isNull _object) exitWith { Error("Non-existent object passed") };
if !(typeof _object in A3A_utilityItemHM) exitWith { Error_1("initObject used on object type %1", typeof _object) };
if (!isNil {_object getVariable "A3A_canGarage"}) exitWith { Error_1("Object type %1 already initialized", typeof _object) };

(A3A_utilityItemHM get typeof _object) params ["", "_price", "", "", "_flags"];

// clear inventory. May or may not be done elsewhere
if !("noclear" in _flags) then {
    clearMagazineCargoGlobal _object;
    clearWeaponCargoGlobal _object;
    clearItemCargoGlobal _object;
    clearBackpackCargoGlobal _object;
};

// Double loot crate max load if we're running with no unlocks
if ("loot" in _flags and minWeaps == -1) then {
    [_object, (maxLoad _object) * 2] remoteExecCall ["setMaxLoad", 2];      // setMaxLoad is server-execution
};

_object setVariable ["A3A_canGarage", true, true];
_object setVariable ["A3A_itemPrice", _price, true];

if ("save" in _flags) then {
    ["", _object] remoteExecCall ["A3A_fnc_garrisonServer_addVehicle", 2];
    [_object] remoteExecCall ["A3A_fnc_addVehAttachDetachEH", 2];
};

// Let logistics do its own JIPing for the moment
// Assumption that the object isn't loaded into anything?
if ([typeOf _object] call A3A_Logistics_fnc_isLoadable) then {[_object] call A3A_Logistics_fnc_addLoadAction};

// All other object actions, hopefully
private _jipKey = "A3A_initObject_" + ((str _object splitString ":") joinString "");
[_object, _jipKey] remoteExec ["A3A_fnc_initObjectRemote", 0, _jipKey]; 
