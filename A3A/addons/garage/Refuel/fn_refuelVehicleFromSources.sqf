#include "defines.inc"
FIX_LINE_NUMBERS()

params [["_vehicle", objNull, [objNull]]];
if (isNull _vehicle) exitWith {false};
if (!isServer) exitWith {false};

/*
    Refueling translation logic:

    fuelCargo with ace == one ticks worth of fuel
    one tick is rate * dT
    which refuels tick / fuel capacity worth of fuel

    (1 /fuel capacity) gives us the precentage refueled per tick
    so a offroad at 50% fuel would require...
    0.5/(1/60) = 30 ticks of fuel

    and a kamaz fuel truck from the same level...
    0.5/(1/400) = 200 ticks of fuel
*/

private _cfg = configOf _vehicle;

//get max fuel, if ace then ace max fuel else vanilla max fuel
private _maxFuel = getNumber (_cfg/"ace_refuel_fuelCapacity");
if (_maxFuel == 0) then {
    _maxFuel = getNumber (_cfg/"fuelCapacity");
};
if (_maxFuel == 0) exitWith {false};

private _fuel = fuel _vehicle;
private _missingFuel = 1 - _fuel;
if (_missingFuel == 0) exitWith {true};

private _neededCapacity = _missingFuel * _maxFuel; //convert from precentage to liters
private _sourceEmptied = false;
private _stateChanges = [];
while {count (HR_GRG_Sources#1) > 0} do {
    if (_neededCapacity == 0) exitWith {};
    Trace_1("Needed capacity: %1", _neededCapacity);

    private _sourceUID = HR_GRG_Sources#1#0;
    private _sourceData = (HR_GRG_Vehicles#HR_GRG_SOURCEINDEX) get _sourceUID;
    if (isNil "_sourceData") exitWith {
        // Shouldn't happen, but don't 10,000-cycle loop if it does
        Error_1("Fuel source vehicle %1 not found in source category", _sourceUID);
    };

    private _fuelData = _sourceData#4#0; //vehicle data >> statePreservation data >> Fuel data
    private _transportFuel = getNumber (configFile/"CfgVehicles"/_sourceData#1/"transportFuel");
    private _fuelCargo = if (A3A_hasAce) then {
        _fuelData # 2;
    } else {
        (_fuelData # 1) * _transportFuel;
    };
    Trace_1("Fuel cargo: %1", _fuelCargo);

    if (_fuelCargo < _neededCapacity) then {
        _neededCapacity = _neededCapacity - _fuelCargo;
        _fuelData set [if (A3A_hasAce) then {2} else {1}, 0];
        (HR_GRG_Sources#1) deleteAt ((HR_GRG_Sources#1) find _sourceUID);
        _sourceEmptied = true;
    } else {
        if (A3A_hasAce) then {
            _fuelData set [2, _fuelCargo - _neededCapacity]; //ace store fuel cargo as liters
        } else {
            _fuelData set [1, (_fuelCargo - _neededCapacity) / _transportFuel]; //vanilla stores fuel cargo as percentage
        };
        _neededCapacity = 0;
    };
    _stateChanges pushBack [_sourceUID, _fuelData, 0];
};

//broadcast source vehicle changes to clinets
{ _x call HR_GRG_fnc_broadcastStateUpdate; } forEach _stateChanges;
if (_sourceEmptied) then { [1] call HR_GRG_fnc_declairSources; };

[
    _vehicle, 1 - (_neededCapacity / _maxFuel)/*convert needed fuel to precentage so fuel can be applied*/
] remoteExecCall ["setFuel", owner _vehicle];

Trace_1("setting vehicle fuel to %1", 1 - (_neededCapacity/_maxFuel));
true;
