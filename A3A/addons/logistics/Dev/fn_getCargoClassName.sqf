/*
    Author: [Targetingsnake]
    [Description]
        Gets you the classname of the vehicle given to the script based on the the generateCargoOffset script 

    Arguments:
    0. <Object> Vehicle which would be cargo
    1. <Bool>   definition if model instead of class based (default modelbased)

    Return Value:
    <string> cargo-classname

    Scope: Clients
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [cursorTarget, true] call A3A_Logistics_fnc_getCargoClassName;
*/

params [
  ["_cargo",objNull, [objNull]]
  , ["_modelBased", true, [true]]
];


private _className = if (_modelBased) then { ( (getText ((configOf _cargo)/"model")) splitString "\.") joinString "_" } else {typeOf _cargo};

_className