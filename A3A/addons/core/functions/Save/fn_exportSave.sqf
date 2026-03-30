
params ["_saveHeader"];

_oldSaveTarget = A3A_saveTarget;
A3A_saveTarget = [_saveHeader get "serverID", _saveHeader get "gameID", _saveHeader get "map", false];
private _json = ["json"] call A3A_fnc_returnSavedStat;        // existence should be guaranteed?
A3A_saveTarget = _oldSaveTarget;

["exportDataReceived", _json] remoteExecCall ["A3A_GUI_fnc_setupTransferDialog", remoteExecutedOwner];
