/*
    Author: [Håkon]
    [Description]
        Switches the current selected vehicle category

    Arguments:
    0. <Control>    Category list control
    1. <Int>        Index of new active category

    Return Value:
    <>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_switchCategory;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_index"];
if (_index isEqualTo -1) exitWith {};
private _disp = findDisplay HR_GRG_IDD_Garage;

//disables current category
for "_i" from 0 to 7 do {
    private _ctrl = _disp displayCtrl (HR_GRG_IDC_CatUndercoverCar + _i);
    if (ctrlEnabled _ctrl) exitWith {
        _ctrl ctrlShow false;
        _ctrl ctrlEnable false;
    };
};

//refresh new category
private _disp = findDisplay HR_GRG_IDD_Garage;
_newCtrl = _disp displayCtrl (HR_GRG_IDC_CatUndercoverCar + _index);
[_newCtrl, _index] call HR_GRG_fnc_reloadCategory;

//activate new category
_newCtrl ctrlEnable true;
_newCtrl ctrlShow true;
//case 2: {localize "STR_HR_GRG_Generic_Unmanned"};
//case 3: {localize "STR_HR_GRG_Generic_VTOL"};
//update category text
private _text = switch _index do {
    case 0: {localize "STR_HR_GRG_Generic_Cars_Сivilian"};
    case 1: {localize "STR_HR_GRG_Generic_Cars"};
    case 2: {localize "STR_HR_GRG_Generic_APC"};
    case 3: {localize "STR_HR_GRG_Generic_Armored"};
    case 4: {localize "STR_HR_GRG_Generic_Heli"};
    case 5: {localize "STR_HR_GRG_Generic_Plane"};
    case 6: {localize "STR_HR_GRG_Generic_Boat"};
    case 7: {localize "STR_HR_GRG_Generic_Static"};
    default {""};
};
_textCtrl = _disp displayCtrl HR_GRG_IDC_CatText;
_textCtrl ctrlSetStructuredText text _text;

[true] spawn HR_GRG_fnc_toggleConfirmBttn;
