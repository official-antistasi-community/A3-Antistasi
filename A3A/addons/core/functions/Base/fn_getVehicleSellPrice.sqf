/*
    Author: Tiny
    Description
        Get a valid sell price for a given vehicle

    Arguments:
        0. <OBJECT, STRING> Vehicle object / vehicle class

    Return Value:
        <INT> Sell price. 0 if invalid or otherwise not found.

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_vehicle] call A3A_getVehicleSellPrice

    TODO: The sell prices themselves could do with a rework. Not even sure what's balanced
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define OccAndInv(VAR) (FactionGet(occ, VAR) + FactionGet(inv, VAR))

params ["_veh"];

/*
Blacklisted Assets

The array below contains classnames of assets which are not allowed to be sold within Antistasi.
Reason for this is that those items are one or more of the following:
- can be aquired by means that don't cost anything and the ability to sell those would be an infinite money exploit.
- are no proper "statics" in terms of weaponized statics but for example the ACE spotting scoped
- something else

Since we transitioned from a blanket check for statics to a more granular check, all the previous entries on this list
(ACE spotting scopes, remote designators, VN spiderholes) are unsellable. Functionality still exists though
*/
private _blacklistedAssets = [];

private _typeX = if (_veh isEqualType objNull) then {typeOf _veh} else {_veh};

if (_typeX in _blacklistedAssets) exitWith {0};

if (
    _typeX in FactionGet(all,"vehiclesReb") // accounts for friendly statics
    or (_typeX in arrayCivVeh)
    or (_typeX in civBoats)
    or (_typeX in (FactionGet(reb,"vehiclesCivBoat") + FactionGet(reb,"vehiclesCivCar") + FactionGet(reb,"vehiclesCivTruck")))
) exitWith {
    private _vehiclePrice = ([_typeX] call A3A_fnc_vehiclePrice) / 2;
    if (_vehiclePrice == 0) exitWith {25};
    _vehiclePrice;
};

// enemy statics

if (_typeX in (FactionGet(all,"staticMGs"))) exitwith {200};
if (_typeX in (FactionGet(all,"staticAT"))) exitwith {400};
if (_typeX in (FactionGet(all,"staticAA"))) exitwith {400};
if (_typeX in (FactionGet(all,"staticMortars"))) exitwith {400};

if (
    (_typeX in FactionGet(all,"vehiclesLight"))
    or (_typeX in OccAndInv("vehiclesTrucks"))
    or (_typeX in OccAndInv("vehiclesCargoTrucks"))
    or (_typeX in OccAndInv("vehiclesMilitiaTrucks"))
    or (_typeX in FactionGet(reb,"vehiclesTruck"))
) exitWith {100};

if (
    (_typeX in FactionGet(all,"vehiclesBoats"))
    or (_typeX in FactionGet(all,"vehiclesLightAPCs"))
    or (_typeX in OccAndInv("vehiclesAmmoTrucks"))
    or (_typeX in OccAndInv("vehiclesRepairTrucks"))
    or (_typeX in OccAndInv("vehiclesFuelTrucks"))
    or (_typeX in OccAndInv("vehiclesMedical"))
) exitWith {200};

if (_typeX in (FactionGet(all,"vehiclesHelisLight") + FactionGet(reb,"vehiclesCivHeli"))) exitWith {500};

if (
    (_typeX in FactionGet(all,"vehiclesAPCs"))
    || (_typeX in FactionGet(all,"vehiclesIFVs"))
    || (_typeX in FactionGet(all,"vehiclesLightTanks"))
    || (_typeX in FactionGet(all,"vehiclesHelisLightAttack"))
    || (_typeX in FactionGet(all,"vehiclesTransportAir"))
    || (_typeX in FactionGet(all,"vehiclesUAVs"))
) exitWith {1000};

if (
    (_typeX in FactionGet(all,"vehiclesHelisAttack"))
    or (_typeX in FactionGet(all,"vehiclesTanks"))
    or (_typeX in FactionGet(all,"vehiclesAA"))
    or (_typeX in FactionGet(all,"vehiclesArtillery"))
) exitWith {3000};

if (_typeX in (FactionGet(all,"vehiclesPlanesCAS") + FactionGet(all,"vehiclesPlanesAA"))) exitWith {4000};

0;