// This is now server-only

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params["_marker"];

private _garrison = A3A_garrison get _marker;
private _limit = [_marker] call A3A_fnc_getGarrisonLimit;

//sort garrison into unit types
private _units = [ [],[],[],[],[],[],[],[],[],[],[] ];
{
    _units # (switch _x do {
        case (FactionGet(reb,"unitSL")): {0};
        case (FactionGet(reb,"unitCrew")): {1};
        case (FactionGet(reb,"unitRifle")): {2};
        case (FactionGet(reb,"unitMG")): {3};
        case (FactionGet(reb,"unitMedic")): {4};
        case (FactionGet(reb,"unitGL")): {5};
        case (FactionGet(reb,"unitSniper")): {6};
        case (FactionGet(reb,"unitLAT")): {7};
        case (FactionGet(reb,"unitAT")): {8};
        case (FactionGet(reb,"unitAA")): {9};
        default {10};
    }) pushBack _x;
} forEach (_garrison get "troops");

private _textX = format [
    "Garrison units: %1%15<br/><br/>Squad Leaders: %2<br/>Static crew: %3<br/>Riflemen: %4<br/>Autoriflemen: %5<br/>Medics: %6<br/>Grenadiers: %7<br/>Marksmen: %8<br/>AT Men: %9<br/>AT Missile Men: %10<br />AA Missile Men: %11<br />Other: %12<br/>Static Weap: %13"
    , count (_garrison get "troops")
    , count (_units#0)
    , count (_units#1)
    , count (_units#2)
    , count (_units#3)
    , count (_units#4)
    , count (_units#5)
    , count (_units#6)
    , count (_units#7)
    , count (_units#8)
    , count (_units#9)
    , count (_units#10)
    , count (_garrison get "statics")
    , count (_garrison get "vehicles")
    , if (_limit != -1) then {format ["/%1", _limit]} else {""}
];

_textX
