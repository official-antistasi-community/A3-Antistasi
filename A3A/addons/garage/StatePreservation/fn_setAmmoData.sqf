/*
    Author: [Håkon]
    Description:
        Sets restores the ammo state of a vehicle based on its ammo data

    Arguments:
    0. <Object> Vehicle to restore ammo state
    1. <Array>
        <Struct>[
            <Bool> if is pylon

            <Struct> [ //if not pylon
                <String> Magazine name
                <Array> Turret path
                <Int> Ammo count
            ] Weapon Data

            or

            <Struct> [ //if pylon
                <Int> pylon index
                <String> pylon name
                <Array> Turret path
                <String> Magazine name
                <Int> Magazine ammo count
            ] Pylon data
        ]
    ] Ammo Data

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_vehicle, _ammoData] call HR_GRG_fnc_setAmmoData;

    License: APL-ND
*/
params ["_vehicle", "_ammoData"];
if !(local _vehicle) exitWith {};
if (_ammoData isEqualTo []) exitWith {};
if (HR_GRG_hasAmmoSource && !HR_GRG_ServiceDisabled_Rearm) exitWith {};
private _weaponData = _ammoData select {_x#0 == "TURRET"};
private _pylonData = _ammoData select {_x#0 == "PYLON"};
private _cargoData = _ammoData select {_x#0 == "CARGO"};

{_vehicle removeMagazinesTurret [_x#0,_x#1];} forEach (magazinesAllTurrets _vehicle select {!("pylon" in toLower (_x#0))}); //remove non pylon mags
{_vehicle addMagazineTurret (_x#1)} forEach _weaponData; //restore non pylon magazines

{
    (_x#1) params ["_index", "", "_turret", "_mag", "_count"];
    _vehicle setPylonLoadOut [_index, _mag, false, _turret]; //claims effect local, actually global
    _vehicle setAmmoOnPylon [_index, _count]; //global effect
} forEach _pylonData;

if (_cargoData isNotEqualTo []) then { // may be the case on older saves
    _vehicle setAmmoCargo _cargoData#0#1; // no effect if not ammo vic
    private _aceAmmo= _cargoData#0#2;
    if (isNil "_aceAmmo") exitWith {};
    [_vehicle, _cargoData#0#2] call ace_rearm_fnc_setSupplyCount;
};
