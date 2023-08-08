#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _possibleMarkers = [];
private _controlsX = [controlsX] call FUNC(nearHostileMarkers);
private _nearbyFriendlyMarkers = call FUNC(nearFriendlyMarkers);
{
    private _pos = getmarkerPos _x;
    if !(isOnRoad _pos) then {
        if (_nearbyFriendlyMarkers findIf {getMarkerPos _x distance _pos < distanceSPWN} != -1) then {_possibleMarkers pushBack _x};
    };
}forEach _controlsX;

if (_possibleMarkers isEqualTo []) exitWith {false};
selectRandom _possibleMarkers;
