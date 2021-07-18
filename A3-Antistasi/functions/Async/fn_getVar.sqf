#include "..\..\Includes\async.inc"
params ["_varName", "_target", ["_nameSpace", missionNamespace]];

private _tempVar = genVar("getVar");
missionNamespace setVariable [_tempVar, nil];

[_tempVar, _varName, _nameSpace] remoteExecCall ["A3A_fnc_handleGetVar", _target];

private _timeOut = time + 5;
waitUntil {!isNil _tempVar or time > _timeOut};

private _ret = missionNamespace getVariable _tempVar;
missionNamespace setVariable [_tempVar, nil];
_ret;
