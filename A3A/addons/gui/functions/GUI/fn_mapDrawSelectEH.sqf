/*
Maintainer: Caleb Serafin, DoomMetal
    Event Handler for drawing select markers to maps.

    Draws a pulsing selection marker on the position specified in
    the "selectMarkerData" array saved to the map control.
    To stop drawing the marker overwrite it with an empty array.

Arguments:
    <CONTROL> Map control for drawing

Return Value:
    None

Scope: Internal
Environment: Unscheduled
Public: No
Dependencies:
    Dialog with map must be open

Example:
    _commanderMap ctrlAddEventHandler ["Draw","_this call A3A_GUI_fnc_mapDrawSelectEH"];

License: APL-ND

*/

#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_map"];

// Pulsing settings
private _minRadius = 48;
private _maxRadius = 64;
private _pulseSpeed = 0.5;

// Get select marker data
private _data = _map getVariable ["selectMarkerData", []];

// If only position is specified, initialize radius and pulse direction
if (count _data == 1) then
{
    _data pushBack _minRadius;
    _data pushBack 0;
};

// Exit if no/wrong data
if (count _data != 3) exitWith {nil};
_data params ["_position", "_radius", "_dir"];

// Update pulsing
if (_dir == 0) then
{
    _radius = _radius - _pulseSpeed;
    if (_radius < _minRadius) then {
        _dir = 1; // Reverse direction
    };
} else {
    _radius = _radius + _pulseSpeed;
    if (_radius > _maxRadius) then
    {
        _dir = 0;
    };
};
_map setVariable ["selectMarkerData", [_position, _radius, _dir]];

private _color = [A3A_COLOR_SELECT_MARKER] call FUNC(configColorToArray);

_map drawIcon [
A3A_Select_Marker,
_color,
_position,
_radius,
_radius,
0
];
