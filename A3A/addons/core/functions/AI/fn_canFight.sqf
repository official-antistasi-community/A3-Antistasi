params ["_unit"];

if (!alive _unit) exitWith {false};         // also works as a null check
if (captive _unit) exitWith {false};
if (_unit getVariable ["incapacitated",false]) exitWith {false};
if !(_unit isNil "retreating") exitWith {false};
//if (_unit getVariable ["surrendered",false]) exitWith {false};        // surrendered units are captive
//if (getSuppression _unit == 1) exitWith {false};
true
