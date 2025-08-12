/*
    Author: [Håkon]
    Description:
        Checks if vehicle is a fuel source, ace compatible

    Arguments:
    0. <Object> Vehicle your checking if is source

    Return Value:
    <Bool> is fuel source

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: <Bool> A3A_hasAce

    Example: [_veh] call HR_GRG_fnc_isFuelSource;

    License: APL-ND
*/
params [ ["_vehicle", objNull, [objNull,""]] ];

if (_vehicle isEqualType objNull) then {
    if (isNull _vehicle) exitWith {false};
    if (getFuelCargo _vehicle > 0) exitWith {true};                                     // vanilla
    private _fuelCargo = getNumber (configOf _vehicle/"ace_refuel_fuelCargo");
    if (_vehicle getVariable ["ace_refuel_currentFuelCargo", _fuelCargo] > 0) exitWith {true};
    false;
} else {
    private _vehCfg = configFile/"CfgVehicles"/_vehicle;
    if (!isClass _vehCfg) exitWith {false}; //invalid class string passed
    if (getNumber (_vehCfg/"transportFuel") > 0) exitWith {true};                       // vanilla
    if (getNumber (_vehCfg/"ace_refuel_fuelCargo") > 0) exitWith {true};
    false;
};
