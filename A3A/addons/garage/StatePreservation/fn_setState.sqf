/*
    Author: [Håkon]
    [Description]
        sets the fuel, damage, and ammo state of a vehicle

    Arguments:
        0. <Object> Vehicle
        1. <Array> [

            <Array> [
                <Int> Fuel
                <Int> Fuel cargo
                <Int> Ace Fuel cargo
            ] Fuel state

            <Array> [
                <Int> Overall damage
                <Array> Hitpoint damage
                <Int> Repair cargo
            ] Damage state

            <Array> [
                <Struct> [
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

            <Array>
                <Int> Vanilla ammo cargo
                <Int> ACE ammo cargo
            ] Ammo cargo data

        ] State Data

    Return Value: <ni>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params [["_vehicle", objNull, [objNull]], ["_state", [], [[]]]];
if (isNull _vehicle) exitWith {};
_state params [["_fuelStats", [], [[]]], ["_dmgStats", [], [[]]], ["_ammoStats", [], [[]]], ["_ammoCargo", [], [[]]]];

[_vehicle, _fuelStats] call HR_GRG_fnc_setFuel;
[_vehicle, _dmgStats] call HR_GRG_fnc_setDamage;
[_vehicle, _ammoStats] call HR_GRG_fnc_setAmmoData;
[_vehicle, _ammoCargo] call HR_GRG_fnc_setAmmoCargo;
