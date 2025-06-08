/*
    Select suitable vehicle type for garrison slot

    TODO: Lazy vehicle selection, fix it up at some point.

Environment: Any?

Parameters:
    <HASHMAP> Faction to use
    <STRING> Place type, "staticMG", "vehicle" etc.
    <BOOL> True if it's for an airport

Return value:
    <STRING> Vehicle class, or nil if nothing suitable available in this faction
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_faction", "_placeType", "_isAirport"];

if (_placeType == "staticMG") exitWith { selectRandom (_faction get "staticMGs") };
if (_placeType == "vehicleTruck") exitWith {
    if (FactionGet(civ,"vehiclesCivRepair") isEqualTo [] and random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesRepairTrucks") };
    if (FactionGet(civ,"vehiclesCivFuel") isEqualTo [] and random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesFuelTrucks") };
    private _types = (_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks");
    _types = _types select { _x in FactionGet(all,"vehiclesCargoTrucks") };
    selectRandom _types;
};
if (_placeType == "vehicleAA") exitWith { selectRandom (_faction get "vehiclesAA") };
if (_placeType == "vehicle") exitWith {
    if (random 1 < 0.2) exitWith { selectRandom ((_faction get "vehiclesRepairTrucks") + (_faction get "vehiclesFuelTrucks") + (_faction get "vehiclesAmmoTrucks")) };
    private _effTier = [tierWar, tierWar+2] select _isAirport;      // TODO: no upgrade mechanism
    if (random 1 < 0.5) exitWith { selectRandomWeighted ([_side, _effTier] call A3A_fnc_getVehiclesGroundSupport) };
    selectRandomWeighted ([_side, _effTier] call A3A_fnc_getVehiclesGroundTransport);
};
if (_placeType == "staticMortar") exitWith { selectRandom (_faction get "staticMortars") };
if (_placeType == "staticAA") exitWith { selectRandom (_faction get "staticAA") };
if (_placeType == "heli") exitWith { 
    if (_isAirport and random 1 < 0.3) exitWith { selectRandom ((_faction get "vehiclesHelisAttack") + (_faction get "vehiclesHelisLightAttack")) };
    selectRandom ((_faction get "vehiclesHelisTransport") + (_faction get "vehiclesHelisLight"));
};
if (_placeType == "plane") exitWith {
    selectRandom ((_faction get "vehiclesPlanesAA") + (_faction get "vehiclesPlanesCAS"));
};
if (_placeType == "boat") exitWith { selectRandom (_faction get "vehiclesGunBoats") };

Error_1("Place type %1 does not exist", _placeType);
nil;
