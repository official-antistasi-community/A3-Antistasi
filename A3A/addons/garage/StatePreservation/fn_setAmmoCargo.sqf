/*
    Author: Tiny
    Description:
        Sets the ammo cargo state of a vehicle based on its ammo cargo data

    Arguments:
    0. <Object> Vehicle to restore ammo cargostate
    1. <Array>
        <Int> Vanilla ammo cargo
        <Int> ACE ammo cargo
    ] Ammo cargo data

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_vehicle, _ammoData] call HR_GRG_fnc_setAmmoData;

    License: APL-ND
*/


params ["_vehicle", "_ammoCargoData"];
if !(local _vehicle) exitWith {};

if (_ammoCargoData isNotEqualTo []) then { // may be the case on older saves
    _vehicle setAmmoCargo _ammoCargoData#0; // no effect if not ammo vic
    if (A3A_hasACE && (_ammoCargoData#1 > -1)) then {
        [_vehicle, _ammoCargoData#1] call ace_rearm_fnc_setSupplyCount;
    };
};