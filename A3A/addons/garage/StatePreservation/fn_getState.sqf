/*
    Author: [Håkon]
    [Description]
        gets the fuel, damage, and ammo state of a vehicle

    Arguments:
        0. <Objet> Vehicle

    Return Value:
        <Array> [

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

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params [["_vehicle", objNull, [objNull]]];
if (isNull _vehicle) exitWith {};
[
    [_vehicle] call HR_GRG_fnc_getFuel,
    [_vehicle] call HR_GRG_fnc_getDamage,
    [_vehicle] call HR_GRG_fnc_getAmmoData,
    [_vehicle] call HR_GRG_fnc_getAmmoCargo
];
