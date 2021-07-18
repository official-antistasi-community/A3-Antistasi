#include "..\..\Includes\common.inc"
#include "..\..\Includes\async.inc"
params ["_function", "_target", ["_nameSpace", missionNamespace, [missionNamespace]], ["_timeOut", 5, [0]]];

if (!canSuspend) exitWith { Error("Suspension not allowed, spawn this function") };

//prep variable for responce
private _varName = genVarName("await");
missionNamespace setVariable [_varName, nil];

//run function on target
[_varName, _this, _function] remoteExec ["A3A_fnc_handleAwait", _target];

//await responce
private _awaitTimeout = time + _timeOut;
waitUntil {!isNil _varName || time > _awaitTimeout};

//handle return or fail
if (isNil _varName) then {Error("Await timed out after "+ str _timeOut +" secounds | Function: "+ str _function +" | Target "+ str _target); [_varName] call A3A_fnc_handleAwaitFail};
private _return = missionNamespace getVariable _varName;
missionNamespace setVariable [_varName, nil];
_return
