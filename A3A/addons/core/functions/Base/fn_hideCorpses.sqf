// Hide corpses further than 50m away for performance

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define SHOWRADIUS 50

params [["_state", 0]];
A3A_hideBodies = (_state isEqualTo 1);
if !(A3A_hideBodies) exitWith {};

while {A3A_hideBodies} do {
    private _corpses = alldeadmen;
    private _nearCorpses = allDeadMen inAreaArray [player, SHOWRADIUS, SHOWRADIUS];
    private _corpsesToHide = _corpses - _nearCorpses;
    {
        if !(isObjectHidden _x) then {_x hideObject true};
    } forEach _corpsesToHide;
    {
        if (isObjectHidden _x) then {_x hideObject false};
    } forEach _nearCorpses;

    sleep 1;
};