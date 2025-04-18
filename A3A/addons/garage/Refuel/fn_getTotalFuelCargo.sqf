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
private _totalFuelCargo = 0;
{
    private _fuelSources = _x;
    private "_vehData";
    {_vehData = _x get _fuelSources; if (!isNil "_vehdata") exitWith {}; } forEach HR_GRG_Vehicles; //find vehicles in categorys, typically cat 0 "cars"
    private _fuelData = _vehData#4#0;
    _totalFuelCargo = _totalFuelCargo + (if (A3A_hasAce) then {
        private _aceFuelCargo = _fuelData#2;
        if (isNil "_aceFuelCargo") then {0} else {_aceFuelCargo}
    } else {
        private _transportFuel = getNumber (configFile/"CfgVehicles"/_vehData#1/"transportFuel");
        (_fuelData#1) * _transportFuel
    });
} forEach (HR_GRG_Sources#1);

_totalFuelCargo;
