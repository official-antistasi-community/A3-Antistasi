/*
    Author: [654wak654, Håkon]
    [Description]
        Handles chage of selection in pylons magazine combo box

        modified from ace pylons by: 654wak654

    Arguments:
    0. <Control> Pylon mag combo control
    1. <Int>     Index of selected mag

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_PylonsChanged;

    License: GNU General Public License
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_ctrl", "_index"];
Trace_2("Pylon changed Ctrl: %1 | Index: %2",_ctrl , _index);
{
    _x params ["_combo", "_mirroredIndex", "", "_originalIndex"];
    if (_ctrl == _combo) exitWith {
        if (_mirroredIndex == -1) then {
            private _indexOf = _forEachIndex;
            {
                _x params ["_combo", "_mirroredIndex"];
                if (_mirroredIndex == _indexOf && {!ctrlEnabled _combo}) exitWith {
                    _combo lbSetCurSel _index;
                    (HR_GRG_PylonData#_forEachIndex) set [3, _index];
                };
            } forEach HR_GRG_PylonData;
        };
        (HR_GRG_PylonData#_forEachIndex) set [3, _index];
    };
} forEach HR_GRG_PylonData;

HR_GRG_UpdatePylons = true;
