/*
Author: [Killerswin2]
    creates the buildable object list on clients.
Arguments:
    None
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
call A3A_fnc_initBuildableObjects;
*/

private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};
A3A_buildableObjects = getArray (_mapInfo/"buildObjects");
