/*
Author: Håkon
Description:
    function to handle await (target side)

    Await: await responce from a different machine.

Arguments:
0. <String> variable to store return in
1. <Any>    Arguments for the function to be run on server
2. <String> String of function name

Return Value: <nil>

Scope: Any
Environment: Any
Public: No
Dependencies:

Example: ["someTempGlobVar_time_randomNum", ["Some","Arguments"], "A3A_fnc_someFunc"] remoteExecute ["A3A_fnc_handleAwait", _target];

License: MIT License
*/
params ["_varName", "_args", "_functionName"];

private _ret = _args call (missionNamespace getVariable _functionName);
missionNamespace setVariable [_varName, _ret, remoteExecutedOwner];
