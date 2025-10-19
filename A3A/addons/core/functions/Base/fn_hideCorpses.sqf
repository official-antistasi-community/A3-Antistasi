// Hide corpses further than XXm away for performance

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_radius", 0]];
if (!isNil "A3A_hideCorpses_handler") then {terminate A3A_hideCorpses_handler};
A3A_hideCorpses_handler = _thisScript;

A3A_hideBodies = (_radius > 0);
if !(A3A_hideBodies) exitWith {};

while {A3A_hideBodies} do {
    private _corpses = alldeadmen;
    private _nearCorpses = allDeadMen inAreaArray [player, _radius, _radius];
    private _corpsesToHide = _corpses - _nearCorpses;
    {
        if !(isObjectHidden _x) then {_x hideObject true};
    } forEach _corpsesToHide;
    {
        if (isObjectHidden _x) then {_x hideObject false};
    } forEach _nearCorpses;

    sleep 1;
};