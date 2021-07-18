params ["_tempGVar", ["_varName", "", [""]], ["_nameSpace", missionNamespace]];

private _tempVar = _nameSpace getVariable [_varName, nil];
missionNamespace setVariable [_tempGVar, _tempVar, remoteExecutedOwner];
