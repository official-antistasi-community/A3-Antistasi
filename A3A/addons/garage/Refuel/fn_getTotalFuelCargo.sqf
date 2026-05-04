/*
Author: Håkon
Description:
    Sums the total available fuel from sources in the garage

Arguments: <nil>

Return Value:
<Number> The total fuel from sources in the garage (in liters)

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example:

License: APL-ND
*/

#include "defines.inc"
FIX_LINE_NUMBERS()

private _totalFuelCargo = 0;
{
    private _sourceUID = _x;
    private _vehData = (HR_GRG_Vehicles#HR_GRG_SOURCEINDEX) get _sourceUID;
    if (isNil "_vehData") exitWith {
        Error_1("Fuel source vehicle %1 not found in source category", _sourceUID);
    };

    private _fuelData = _vehData#4#0;
    _totalFuelCargo = _totalFuelCargo + (if (A3A_hasAce) then {
        private _aceFuelCargo = _fuelData#2;
        if (isNil "_aceFuelCargo") then {0} else {0 max _aceFuelCargo}
    } else {
        private _transportFuel = getNumber (configFile/"CfgVehicles"/_vehData#1/"transportFuel");
        (0 max _fuelData#1) * _transportFuel
    });
} forEach (HR_GRG_Sources#1);

_totalFuelCargo;
