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
    private _markerPolyline = markerPolyline _x;
    if (_markerPolyline isEqualto []) then
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

        // Convert polyLine array to coordinates
        _lineCoords = [];
        for [{ _i = 0 }, { _i < ((count _markerPolyline) - 1)}, { _i = _i + 2 }] do
        {
            _lineCoords pushBack [_markerPolyline # _i, _markerPolyline # (_i + 1)];
        };

        // Draw line Segments
        for [{ _i = 0 }, { _i < ((count _lineCoords) - 2)}, { _i = _i + 1 }] do
        {
            _map drawLine [_lineCoords # _i, _lineCoords # (_i + 1), _markerColor];
        };
    };
} forEach allMapMarkers;
