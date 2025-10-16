/*
Author: Håkon
Description:
    Filters given array of markers into hostile markers within mission distance

Arguments:
0. <Array<Markers>> Markers to filter

Return Value:
<Array<Markers>> Filtered markers

Scope: Server,Server/HC,Clients,Any
Environment: Scheduled/unscheduled/Any
Public: Yes/No
Dependencies:

Example:

License: MIT License
*/
params ["_Markers"];
_Markers = _Markers select {(getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer < distanceMission) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
_Markers
