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

private _selCat = HR_GRG_Cats findIf {ctrlShown _x};
private _selVehicleCat = HR_GRG_SelectedVehicles#0;
if ((_selCat in HR_GRG_BLOCKAIRINDEX || _selVehicleCat in HR_GRG_BLOCKAIRINDEX) && {!(call HR_GRG_Cnd_canAccessAir)}) then {
    _ctrlCnfrm ctrlEnable false;
    _ctrlCnfrm ctrlSetTextColor [0.7,0,0,1];
    _ctrlCnfrm ctrlSetTooltip localize "STR_HR_GRG_Generic_AirDisabled";
} else {
    _ctrlCnfrm ctrlEnable _enable;
    _ctrlCnfrm ctrlSetTextColor [1,1,1,1];
    _ctrlCnfrm ctrlSetTooltip "";
};
