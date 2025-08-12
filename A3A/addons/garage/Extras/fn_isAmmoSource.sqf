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

if (_vehicle isEqualType objNull) then {
    if (isNull _vehicle) exitWith {false};
    if (getAmmoCargo _vehicle > 0) exitWith {true};                                     // vanilla
    if (_vehicle getVariable ["ace_rearm_currentSupply", 0] < 0) exitWith {false};          // ACE but used up
    if (_vehicle getVariable ["ace_rearm_isSupplyVehicle", false]) exitWith {true};
    if (getNumber (configOf _vehicle/"ace_rearm_defaultSupply") > 0) exitWith {true};
    false;
} else {
    private _vehCfg = configFile/"CfgVehicles"/_vehicle;
    if (!isClass _vehCfg) exitWith {false}; //invalid class string passed
    if (getNumber (_vehCfg/"transportAmmo") > 0) exitWith {true};                       // vanilla
    if (getNumber (_vehCfg/"ace_rearm_defaultSupply") > 0) exitWith {true};
    false;
};
