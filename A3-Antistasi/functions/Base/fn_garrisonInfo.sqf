#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_siteX","_textX","_garrison","_size","_positionX"];

_siteX = _this select 0;

_garrison = garrison getVariable [_siteX,[]];

_size = [_siteX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _siteX;
_estatic = if (_siteX in outpostsFIA) then {"Technicals"} else {"Mortars"};

//sort garrison into unit types
private _groupData = FactionGet(reb,"groups");
private _units = [ [],[],[],[],[],[],[],[] ];
{
    _units # (switch _x do {
    case (_groupData get "SL"): {0};
    case (_groupData get "staticCrew"): {1};
    case (_groupData get "Mil"): {2};
    case (_groupData get "MG"): {3};
    case (_groupData get "Medic"): {4};
    case (_groupData get "GL"): {5};
    case (_groupData get "Sniper"): {6};
    case (_groupData get "LAT"): {7};
    }) pushBack _x;
} forEach _garrison;

_textX = format [
    "<br/><br/>Garrison men: %1<br/><br/>Squad Leaders: %2<br/>%11: %3<br/>Riflemen: %4<br/>Autoriflemen: %5<br/>Medics: %6<br/>Grenadiers: %7<br/>Marksmen: %8<br/>AT Men: %9<br/>Static Weap: %10"
    , count _garrison
    , count (_units#0)
    , count (_units#1)
    , count (_units#2)
    , count (_units#3)
    , count (_units#4)
    , count (_units#5)
    , count (_units#6)
    , count (_units#7)
    , {_x distance _positionX < _size} count staticsToSave
    , _estatic
];

_textX
