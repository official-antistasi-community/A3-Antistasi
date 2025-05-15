// Set up marker info for enemy roadblock or camp

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_pos", "_type", "_side", "_ref"];

private _name = _type + mapGridPosition _pos;
A3A_minorSitesHM set [_name, [_pos, _type, _side, _ref]];

Info_3("Added %1 %2 for %3", _type, _name, _side);

private _mrkSize = [30, 300] select (_type == "camp");
createMarkerLocal [_name, _pos];
_name setMarkerSizeLocal [_mrkSize, _mrkSize];
_name setMarkerShapeLocal "ELLIPSE";
_name setMarkerAlpha 0;

sidesX setVariable [_name, _side, true];
controlsX pushBack _name;
spawner setVariable [_name, 2, true];

// Don't publish controlsX here to avoid spam
_name
