/*
    Author: [Håkon]
    Description:
        Returns Ammo data for a vehicle

    Arguments:
    0. <Object> Vehicle

    Return Value:
    <Array>
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

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_getAmmoData;

    License: APL-ND
*/
params [["_veh", objNull, [objNull]]];

private _nonPylon = magazinesAllTurrets _veh select {!("pylon" in toLower (_x#0))} apply { [false, [_x#0,_x#1,_x#2]] }; //[is Pylon, [magName, path, ammo]]

private _pylonsCfg = (configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent");
private _pylonAmmo = [];
private _magName = getPylonMagazines _veh;
{
    private _pylonIndex = _forEachIndex + 1;
    _pylonAmmo pushBack [
        true
        , [
            _pylonIndex
            , configName _x
            , [_veh, _forEachIndex] call HR_GRG_fnc_getPylonTurret
            , _magName#_forEachIndex
            , _veh ammoOnPylon _pylonIndex
        ]
    ];
} forEach ("true" configClasses (_pylonsCfg >> "Pylons"));

_nonPylon + _pylonAmmo
