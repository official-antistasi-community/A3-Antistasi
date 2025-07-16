/*
    Author: [Håkon]
    [Description]
        adds logistics load action to objects

    Arguments:
    0. <Object> Cargo that you want to be able to load in a vehicle
    1. <String> "load" or "unload" action (optional - should not really be used)
    2. <Bool> Whether loading the object should break undercover

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_object] call A3A_Logistics_fnc_addLoadAction;
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_object", objNull, [objNull]], ["_action", "load"],["_breakUC",false]];

if (isNull _object) exitWith {
    Error("No object passed, aborting");
    nil
};

if (!alive _object) exitWith {
    Error("Destroyed object passed, aborting");
    nil
};

if (([_object] call A3A_Logistics_fnc_getCargoNodeType) isEqualTo -1) exitWith {nil};

private _jipKey = "A3A_Logistics_" + _action + ((str _object splitString ":") joinString "");
[_object, _action, _jipKey,_breakUC] remoteExec ["A3A_Logistics_fnc_addAction", 0, _jipKey];
nil
