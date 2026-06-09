
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_importHM", "_saveToNewNamespace"];

private _map = _importHM get "map";
private _name = _importHM get "name";
private _campaignID = call A3A_fnc_uniqueID;
private _serverID = profileNamespace getVariable ["ss_serverID", ""];
_serverID = [_serverID, false] select _saveToNewNamespace;

private _oldSaveTarget = A3A_saveTarget;
A3A_saveTarget = [_serverID, _campaignID, _map, _importHM];
call A3A_fnc_finalizeSave;
A3A_saveTarget = _oldSaveTarget;

Info_1("Foreign save %1 imported by client", _name);

// Signal setupMonitor to update & reopen the dialog on the client side
A3A_setupPlayer = objNull;
