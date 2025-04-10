/*
    Author: [Håkon]
    [Description]
        Toggles the buttons Confirm and [Un]Lock on/off

    Arguments:
    0. <Bool> Enable controls

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [false] call HR_GRG_fnc_toggleConfirmBttn;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_enable"];

private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrlCnfrm = _disp displayCtrl HR_GRG_IDC_Confirm;
private _ctrlLock = _disp displayCtrl HR_GRG_IDC_tLock;

_ctrlLock ctrlEnable _enable;
// first checks if the currently selected vehicle or category is air; then, checks if air is accessible, and toggles the button accordingly
if ((((HR_GRG_Cats findIf {ctrlShown _x} == 4) || (HR_GRG_SelectedVehicles#0 == 4)) && {!(call HR_GRG_Cnd_canAccessAir)}) || (((HR_GRG_Cats findIf {ctrlShown _x} == 5) || (HR_GRG_SelectedVehicles#0 == 5)) && {!(call HR_GRG_Cnd_canAccessAir)})) then { ///(((HR_GRG_Cats findIf {ctrlShown _x} == 4) || (HR_GRG_SelectedVehicles#0 == 4)) && {!(call HR_GRG_Cnd_canAccessAir)}) || 
    _ctrlCnfrm ctrlEnable false;
    _ctrlCnfrm ctrlSetTextColor [0.7,0,0,1];
    _ctrlCnfrm ctrlSetTooltip localize "STR_HR_GRG_Generic_AirDisabled";
} else {
    _ctrlCnfrm ctrlEnable _enable;
    _ctrlCnfrm ctrlSetTextColor [1,1,1,1];
    _ctrlCnfrm ctrlSetTooltip "";
};
