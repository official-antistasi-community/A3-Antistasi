/*
Author: Håkon
Description:
    Validates the arguments of a triggered event

Arguments:
0. <String> Event identifier
1. <Array>  Event arguments

Return Value:
<Bool> Event arguments valid

Scope: Any
Environment: unscheduled
Public: No
Dependencies:

Example: private _valid = ["AIVehInit", _arguments] call A3A_Events_fnc_validateEventArguments;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_event","",[""]], ["_args", [], [[]]]];
if (_event isEqualTo "") exitWith {
    Error_1("Event type missing/invalid: %1", _this#0);
    false;
};

private _eventCfg = (configFile/"A3A"/"Events"/_event);
private _argC = count _args;
private _valid = true;
{
    private _index = parseNumber (configName _x select [1]); //strip the "_"
    private _types = (getArray (_x/"types")) apply {tolower _x};
    private _optional = getNumber (_x/"optional") > 0;

    // tiny bit of sanity checking that theres not unexpected
    if (_index isNotEqualTo _forEachIndex) exitWith {
        Error_1("Bad event config detected | Event: %1", configName _eventCfg);
        _valid = false;
    };

    if !(_forEachIndex < _argC) then {
        if (!_optional) then { //missing required argument
            Error_1("Required argument missing | Index: %1", _forEachIndex);
            _valid = false;
            continue;
        } else { //missing optional argument
            continue;
        };
    };

    if ("ANY" in _types) then { continue }; //custom allow any type

    if !(tolower typeName (_args#_forEachIndex) in _types || {_optional && isNil {_args#_forEachIndex}}) then { //wrong type
        Error_3("Invalid argument type passed | Index: %1 | Expected types: %2 | Optional: %3", _forEachIndex, _types joinString ", ", _optional);
        _valid = false;
        continue;
    };

} forEach ("true" configClasses (_eventCfg/"params"));

_valid;
