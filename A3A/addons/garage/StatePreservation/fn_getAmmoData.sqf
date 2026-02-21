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
        or
        <Int> Scalar vehicle ammo
    ] Ammo Data

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_getAmmoData;

    License: APL-ND
*/
params [["_veh", objNull, [objNull]]];

private _pylonsCfg = (configOf _veh >> "Components" >> "TransportPylonsComponent");

scopeName "main";
if (!isClass _pylonsCfg and HR_GRG_reduceState) then {
    private _blacklistMags = ["FakeWeapon", "FakeMagazine"];
    private _originalMags = (typeOf _veh call HR_GRG_fnc_getDefaultMags) select {!(_x#0 in _blacklistMags)};
    if (count _originalMags == 0) then { [] breakOut "main" };        // may as well keep this one

    private _curMags = magazinesAllTurrets _veh select {!(_x#0 in _blacklistMags)};
    private _totalRounds = 0;
    { _totalRounds = _totalRounds + _x#2 } forEach _curMags;
    private _maxRounds = 0;
    { _maxRounds = _maxRounds + _x#2 } forEach _originalMags;

    // If the ammo can be set with setVehicleAmmo (no pylons, [0, 1] or all same magazine), just return scalar
    private _magName = _originalMags#0#0;
    if (_totalRounds in [0, _maxRounds] or _originalMags findIf {_magName != _x#0} == -1) then {
        _totalRounds / (_maxRounds max 1) breakOut "main";
    };
};

private _nonPylon = magazinesAllTurrets _veh select {!("pylon" in toLower (_x#0))} apply { [false, [_x#0,_x#1,_x#2]] }; //[is Pylon, [magName, path, ammo]]

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
