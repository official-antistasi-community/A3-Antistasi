/*
Maintainer: Caleb Serafin, DoomMetal
    Draws map markers to map controls

Arguments:
    None

Return Value:
    None

Scope: Internal
Environment: Unscheduled
Public: No
Dependencies:
    <ARRAY> airportsX
    <ARRAY> resourcesX
    <ARRAY> factories
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> citiesX

Example:
    _fastTravelMap ctrlAddEventHandler ["Draw","_this call A3A_GUI_fnc_mapDrawOutpostsEH"];

License: APL-ND

*/

#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_map"];

// Calculate zoom level dependent transparency
private _mapScale = ctrlMapScale _map;
private _fadeStart = 0.5; // Zoom level to start fading out
private _fadeEnd = 0.75; // Zoom level where it's completely transparent
private _alpha = ((1 - ((_mapScale - _fadeStart) / (_fadeEnd - _fadeStart))) max 0) min 1;

// Calculate zoom level dependent marker size
private _minMarkerSize = 12;
private _maxMarkerSize = 32;
private _markerSize = ((_maxMarkerSize + (_minMarkerSize - _maxMarkerSize) * ((_mapScale - _fadeStart) / (_fadeEnd - _fadeStart))) max _minMarkerSize) min _maxMarkerSize;

private _mapPos = ctrlMapPosition _map;
private _iconSize = [_markerSize*pixelW/2, _markerSize*pixelH/2];
private _topLeft = _map ctrlMapScreenToWorld [_mapPos#0 - _iconSize#0, _mapPos#1 - _iconSize#1];
private _botRight = _map ctrlMapScreenToWorld [_mapPos#0 + _mapPos#2 + _iconSize#0, _mapPos#1 + _mapPos#3 + _iconSize#1];

private _mapCenter = (_topLeft vectorAdd _botRight) vectorMultiply 0.5;
private _mapWidth = ((_botRight#0) - (_topLeft#0)) / 2;
private _mapHeight = ((_botRight#1) - (_topLeft#1)) / 2;

// Precache all the colours
private _sideColorHM = createHashMapFromArray [
    [teamPlayer, ["Map", "Independent"] call BIS_fnc_displayColorGet],
    [Occupants, ["Map", "BLUFOR"] call BIS_fnc_displayColorGet],
    [Invaders, ["Map", "OPFOR"] call BIS_fnc_displayColorGet],
    [civilian, ["Map", "Civilian"] call BIS_fnc_displayColorGet],
    [sideUnknown, ["Map", "Unknown"] call BIS_fnc_displayColorGet]
];
private _sideFadeHM = keys _sideColorHM createHashMapFromArray (values _sideColorHM apply { [_x#0, _x#1, _x#2, _alpha] });
private _colorBlack = [A3A_COLOR_BLACK] call FUNC(configColorToArray);

private _fnc_drawIcon = {
    params ["_pos", "_color", "_icon", "_name"];
    _map drawIcon [
        _icon, // texture
        _color,
        _pos,
        _markerSize, // width
        _markerSize, // height
        360, // angle: non-zero means it won't be outlined?
        _name, // text
        2 // shadow (outline if 2)
    ];
};

private _fnc_drawMarkers = {
    params ["_markers", "_icon", "_name"];

    // cull to window boundaries
    _markers = _markers inAreaArrayIndexes [_mapCenter, _mapWidth, _mapHeight, 0, true] apply {_markers#_x};
    if (_mapScale >= _fadeEnd) then { _icon = A3A_Icon_Map_Blank; _name = "" };

    {
        private _side = sidesX getVariable _x;
        private _pos = markerPos _x;
        [_pos, _sideColorHM get _side, _icon, _name] call _fnc_drawIcon;
    } forEach _markers;
};

[airportsX, A3A_Icon_Map_Airport, "Airbase"] call _fnc_drawMarkers;
[outposts, A3A_Icon_Map_Outpost, "Outpost"] call _fnc_drawMarkers;
[factories, A3A_Icon_Map_Factory, "Factory"] call _fnc_drawMarkers;
[resourcesX, A3A_Icon_Map_Resource, "Resource"] call _fnc_drawMarkers;
[seaports, A3A_Icon_Map_Seaport, "Seaport"] call _fnc_drawMarkers;

private _roadblocks = outpostsFIA select { isOnRoad markerPos _x };
[_roadblocks, A3A_Icon_Map_Roadblock, "Roadblock"] call _fnc_drawMarkers;
[outpostsFIA - _roadblocks, A3A_Icon_Map_Watchpost, "Watchpost"] call _fnc_drawMarkers;

// Cities are heavily special-case
private _visCities = citiesX inAreaArrayIndexes [_mapCenter, _mapWidth, _mapHeight, 0, true] apply {citiesX#_x};
private _cityIcon = [A3A_Icon_Map_City, A3A_Icon_Map_Blank] select (_mapScale >= _fadeEnd);
{
    private _color = _sideColorHM get (sidesX getVariable _x);
    if (_x in destroyedSites) then { _color = _colorBlack };
    [markerPos _x, _color, _cityIcon, _x] call _fnc_drawIcon;
} forEach _visCities;

[markerPos "Synd_HQ", [0,1,0,1], A3A_Icon_Map_HQ, "HQ"] call _fnc_drawIcon;
