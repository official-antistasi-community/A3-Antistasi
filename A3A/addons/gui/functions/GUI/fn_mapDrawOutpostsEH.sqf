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

// Get marker data
private _outpostIconData = [];
{
    private _marker = _x;
    private _type = "outpost";//_marker call A3A_fnc_getLocationMarkerType;  // ToDo define
    private _name = "Outpost";//[_marker] call A3A_fnc_getLocationMarkerName;  // ToDo define
    private _pos = getMarkerPos _marker;
    private _side = sidesX getVariable [_marker,sideUnknown];
    private _color = [1,1,1,1];

    // TODO UI-update: add color for dead cities
    switch (_side) do {
        case (teamPlayer): {
            _color = ["Map", "Independent"] call BIS_fnc_displayColorGet;
        };

        case (Occupants): {
            _color = ["Map", "BLUFOR"] call BIS_fnc_displayColorGet;
        };

        case (Invaders): {
            _color = ["Map", "OPFOR"] call BIS_fnc_displayColorGet;
        };

        case (civilian): {
            _color = ["Map", "Civilian"] call BIS_fnc_displayColorGet;
        };

        case (sideUnknown): {
            _color = ["Map", "Unknown"] call BIS_fnc_displayColorGet;
        };
    };

    private _fadedColor = [_color # 0, _color # 1, _color # 2, _alpha];
    private _icon = A3A_Icon_Map_Blank;
    if (_mapScale < _fadeEnd) then {
        _icon = switch (_type) do {
            case ("hq"): {
                A3A_Icon_Map_HQ;
            };

            case ("city"): {
                A3A_Icon_Map_City;
            };

            case ("factory"): {
                A3A_Icon_Map_Factory;
            };

            case ("resource"): {
                A3A_Icon_Map_Resource;
            };

            case ("seaport"): {
                A3A_Icon_Map_Seaport;
            };

            case ("airport"): {
                A3A_Icon_Map_Airport;
            };

            case ("outpost"): {
                A3A_Icon_Map_Outpost;
            };

            case ("watchpost"): {
                A3A_Icon_Map_Watchpost;
            };

            case ("roadblock"): {
                A3A_Icon_Map_Roadblock;
            };

            default {
                "\A3\ui_f\data\Map\Markers\Military\flag_CA.paa";
            };
        };
    };

    _outpostIconData pushBack [_name, _pos, _type, _icon, _color, _fadedColor];
} forEach airportsX + resourcesX + factories + outposts + seaports + citiesX + outpostsFIA + ["Synd_HQ"];

// TODO UI-update: add warning symbol for outposts under attack/enemies near

{
    // Draw icon
    _x params ["_name", "_pos", "_type", "_icon", "_color", "_fadedColor"];
    _map drawIcon [
        _icon, // texture
        _color,
        _pos,
        _markerSize, // width
        _markerSize, // height
        0, // angle
        "", // text
        0 // shadow (outline if 2)
    ];

    // Draw text
    if !(_type isEqualTo "city") then {_color = _fadedColor};
    _map drawIcon [
        "#(rgb,1,1,1)color(0,0,0,0)", // the icon itself is transparent
        _color, // colour
        _pos, // position
        _markerSize, // width
        _markerSize, // height
        0, // angle
        _name, // text
        2 // shadow (outline if 2)
    ];
} forEach _outpostIconData;
