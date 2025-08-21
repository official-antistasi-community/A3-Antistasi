/*
    Select suitable vehicle type for garrison slot

    Environment: Any

    Parameters:
    <HASHMAP> Faction to use
    <STRING> Place type, "staticMG", "vehicle" etc.
    <BOOL> True if it's for an airport (could generalize to site type?)

    Return value:
    <STRING> Vehicle class, or nil if nothing suitable available in this faction

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_faction", "_placeType", "_isAirport"];

/*
private _fnc_selectFromLists = {
    for "_i" from 0 to (count _this - 2) do {
        if !(_this#_i in _faction) then { _this set [_i+1, 0] };
    };
    private _list = selectRandomWeighted _this;
    if (isNil "_list") exitWith {};
    selectRandom _list;
};
*/

// Weighted select from multiple lists. Will return non-nil if any list isn't empty.
private _fnc_selectFromLists = {
    params ["_lists", "_weights"];
    { if (_faction get _x isEqualTo []) then { _weights set [_forEachIndex, 0] } } forEach _lists;
    private _list = _lists selectRandomWeighted _weights;
    if (isNil "_list") exitWith {};
    selectRandom (_faction get _list);
};

if (_placeType == "staticMG") exitWith { selectRandom (_faction get "staticMGs") };
if (_placeType == "vehicleTruck") exitWith {
    if (random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesRepairTrucks") };
    if (random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesFuelTrucks") };
    private _types = (_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks");
    _types = _types select { _x in FactionGet(all,"vehiclesCargoTrucks") };         // avoid troops-only trucks. Should prebuild?
    selectRandom _types;
};
if (_placeType == "vehicle") exitWith {
    if (random 1 < 0.2) exitWith { [["vehiclesRepairTrucks","vehiclesFuelTrucks","vehiclesAmmoTrucks"], [1,1,1]] call _fnc_selectFromLists };
    private _effTier = [tierWar, tierWar+2] select _isAirport;
    if (random 1 < 0.5) exitWith { selectRandomWeighted ([_side, _effTier] call A3A_fnc_getVehiclesGroundSupport) };
    selectRandomWeighted ([_side, _effTier] call A3A_fnc_getVehiclesGroundTransport);
};
if (_placeType == "vehicleAA") exitWith { selectRandom (_faction get "vehiclesAA") };
if (_placeType == "vehiclePolice") exitWith { selectRandom (_faction get "vehiclesPolice") };
if (_placeType == "staticMortar") exitWith { selectRandom (_faction get "staticMortars") };
if (_placeType == "staticAA") exitWith { selectRandom (_faction get "staticAA") };
if (_placeType == "heli") exitWith { 
    if (!_isAirport) exitWith { [["vehiclesHelisLightAttack", "vehiclesHelisTransport", "vehiclesHelisLight"], [0,1,2]] call _fnc_selectFromLists };
    [["vehiclesHelisAttack", "vehiclesHelisLightAttack", "vehiclesHelisTransport", "vehiclesHelisLight"], [1,2,5,3]] call _fnc_selectFromLists;
};
if (_placeType == "plane") exitWith {
    [["vehiclesPlanesAA", "vehiclesPlanesCAS"], [1,2]] call _fnc_selectFromLists;
};
if (_placeType == "runway") exitWith {
    [["vehiclesPlanesAA", "vehiclesPlanesCAS", "vehiclesPlanesTransport"], [1,2,3]] call _fnc_selectFromLists;
};
if (_placeType == "boat") exitWith { selectRandom (_faction get "vehiclesGunBoats") };

Error_1("Place type %1 does not exist", _placeType);
nil;
