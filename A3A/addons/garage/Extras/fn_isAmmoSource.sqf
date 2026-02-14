/*
    Author: [Håkon]
    Description:
        Checks if vehicle is a ammo source, ace compatible

    Arguments:
    0. <Object> Vehicle your checking if is source

    Return Value:
    <Bool> is ammo source

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: <Bool> A3A_hasAce

    Example: [_veh] call HR_GRG_fnc_isAmmoSource;

    License: APL-ND
*/
params [ ["_vehicle", objNull, [objNull,""]] ];

private _vehCfg = if (_vehicle isEqualType objNull) then {
    configOf _vehicle
} else {
    configFile/"CfgVehicles"/_vehicle;
};

if (getNumber (_vehCfg/"transportAmmo") > 0) exitWith {true};           // vanilla
if (getNumber (_vehCfg/"ace_rearm_defaultSupply") > 0) exitWith {true}; // ace

if (_vehicle isEqualType objNull) then {
    if (isNull _vehicle) exitWith {false};
    if (_vehicle getVariable ["ace_rearm_isSupplyVehicle", false]) exitWith {true};
    false;
} else {
    if (!isClass _vehCfg) exitWith {false}; //invalid class string passed
    false;
};
