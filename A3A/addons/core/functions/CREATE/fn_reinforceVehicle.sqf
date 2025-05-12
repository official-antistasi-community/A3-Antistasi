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

// Now check if garrison has enemies nearby
private _nearRebels = units teamPlayer inAreaAray [markerPos _marker, 700, 700];
if (_nearRebels findIf { _x getVariable ["spawner", false] }) exitWith {
    Debug_2("Reinf of %1 type %2 blocked by rebels", _marker, _type);
};
if (sidesX getVariable _marker != _side) exitWith {
    Debug_2("Reinf of %1 type %2 blocked by side change", _marker, _type);
};

// Determine free places. Can't re-use reinf code due to delay
private _garrison = A3A_garrison get _marker;
private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);
private _garrisonType = ["vehicles", "statics"] select ("static" in _x);
private _usedPlaces = (_garrison get _garrisonType) apply {_x#1};
private _places = A3A_spawnPlaceStats get _marker select 0 select { !(_x in _usedPlaces) };
if (_places isEqualType []) exitWith {
    Info_2("Reinf of %1 type %2 cancelled because no free places", _marker, _type);
};

private _placeNum = if (_slotType == "vehicle") then { _places # 0 } else { selectRandom _places };
[_marker, _vehClass, _garrisonType, _placeNum] call A3A_fnc_addVehicleTypeToGarrison;
Debug_3("Reinforcing %1 with vehicle %2", _marker, _vehClass);
