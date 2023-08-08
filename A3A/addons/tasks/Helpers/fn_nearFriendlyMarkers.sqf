/*
Author: Håkon
Description:
    Returns all friendly markers within mission distance

Arguments: <Nil>

Return Value:
<Array> Friendly markers within mission distance

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
private _nearbyFriendlyMarkers = markersX select {
    (getMarkerPos _x inArea [getMarkerPos respawnTeamPlayer, distanceMission+distanceSPWN, distanceMission+distanceSPWN, 0, false])
    and (sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer)
};
_nearbyFriendlyMarkers deleteAt (_nearbyFriendlyMarkers find "Synd_HQ");
_nearbyFriendlyMarkers;
