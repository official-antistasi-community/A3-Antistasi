/*
    Author: [Håkon]
    [Description]
        gets the fuel state of a vehicle

    Arguments:
        0. <Objet> Vehicle

    Return Value:
        <Array> [
            <Int> Fuel
            <Int> Fuel cargo
            <Int> Ace Fuel cargo
        ] Fuel state
        or
        <Int> Fuel if it doesn't have cargo

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params [["_vehicle", objNull, [objNull]]];

private _maxFuelCargo = getNumber (configOf _vehicle/"transportFuel");
private _maxAceFuelCargo = getNumber (configOf _vehicle/"ace_refuel_fuelCargo");
if (HR_GRG_reduceState and (_maxFuelCargo <= 0 and _maxAceFuelCargo <= 0)) exitWith { fuel _vehicle };
[fuel _vehicle, getFuelCargo _vehicle, _vehicle getVariable ["ace_refuel_currentFuelCargo", _maxAceFuelCargo]];
