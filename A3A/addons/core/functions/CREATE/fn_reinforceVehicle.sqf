/*  
Maintainer: John Jordan
    Simulate vehicle reinforcements to enemy garrison by adding vehicle type to garrison after a delay

Scope: Server
Environment: Scheduled (sleeps)

Arguments:
    <SIDE> Side of enemy faction
    <STRING> Target marker name
    <STRING> Garrison slot type (eg "vehicleAA", "staticMortar")
    <STRING> Vehicle classname to add

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_marker", "_slotType", "_vehClass"];

sleep 300;          // lazy code, should check nearest base

isNil {

// Now check if garrison has enemies nearby
private _nearRebels = units teamPlayer inAreaArray [markerPos _marker, 700, 700];
if (-1 != _nearRebels findIf { _x getVariable ["spawner", false] }) exitWith {
    Info_2("Reinf of %1 type %2 blocked by rebels", _marker, _slotType);
};
if (sidesX getVariable _marker != _side) exitWith {
    Info_2("Reinf of %1 type %2 blocked by side change", _marker, _slotType);
};

private _success = [_marker, _vehClass, _slotType] call A3A_fnc_garrisonServer_addVehicleType;
if (!_success) exitWith {};
[-(A3A_vehicleResourceCosts get _vehClass), _side, "defence"] call A3A_fnc_addEnemyResources;
Info_2("Reinforced %1 with vehicle %2", _marker, _vehClass);

};
