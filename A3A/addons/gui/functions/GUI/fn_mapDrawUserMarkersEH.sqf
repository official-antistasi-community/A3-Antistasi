/*
Maintainer: Caleb Serafin, DoomMetal
    Draws user markers to map controls
    Used for cases where we want only user created markers, not editor placed ones

Arguments:
    None

Return Value:
    None

Scope: internal
Environment: Unscheduled
Public: No
Dependencies:
None

Example:
    _commanderMap ctrlAddEventHandler ["Draw", "_this call A3A_GUI_fnc_mapDrawUserMarkersEH"];

License: APL-ND

*/

#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_map"];

// Loop through all map markers
{
    // Check for user markers
    if !("_USER_DEFINED" in _x) then {continue};

    // Check marker channel, draw only global, command and side markers (0, 1, 2)
    private _channel = markerChannel _x;
    if !(_channel in [0,1,2]) then {continue};

    // Get marker color and covert to RGBA array
    _markerColor = (configFile >> "CfgmarkerColors" >> getmarkerColor _x >> "color") call BIS_fnc_colorConfigToRGBA;

    // Check for line markers
    private _polyline = markerPolyline _x;
    if (_polyline isEqualto []) then
    {
        // not a line marker
        // Get marker data
        _markerTexture = (getmarkertype _x) call BIS_fnc_textureMarker;
        _markerPos = getmarkerPos _x;
        _markertext = markertext _x;

        // Draw marker
        _map drawIcon [
            _markerTexture, // texture
            _markerColor,
            _markerPos,
            32, // width
            32, // height
            0, // angle
            _markertext, // text
            1 // shadow (outline if 2)
        ];
    } else {
        // Marker is a line marker
        private _lastPoint = [_polyLine#0, _polyLine#1];
        for "_i" from 2 to (count _polyline - 2 min 200) step 2 do {
            private _newPoint = [_polyLine#_i, _polyLine#(_i+1)];
            _map drawLine [_lastPoint, _newPoint, _markerColor];
            _lastPoint = _newPoint;
        };
    };
} forEach allMapMarkers;
