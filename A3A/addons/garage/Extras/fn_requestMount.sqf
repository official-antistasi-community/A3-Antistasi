/*
    Author: [Håkon]
    [Description]
        Request reservation/release of a type of static from the server

    Arguments:
    0. <Control> ExtrasMounts control from EH

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_requestMount;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_ctrl"];
private _index = lbCurSel _ctrl;
_ctrl lbSetCurSel -1;
if (_index isEqualTo -1) exitWith {};

private _newIconIndex = checkboxTextures findIf { (_x isNotEqualTo (_ctrl lbPicture _index)) };

//check if can load static
private _class = _ctrl lbData _index;
private _vehUID = _ctrl lbValue _index;
private _nodes = if (_newIconIndex isEqualTo 1) then { //load static
    private _static = _class createVehicleLocal [0,0,41764];
    _static enableSimulation false;
    _static allowDamage false;
    _nodes = [HR_GRG_previewVeh, _static] call A3A_Logistics_fnc_canLoad;
    deleteVehicle _static;
    _nodes;
} else { [] }; //unload static
if (_nodes isEqualType 0) exitWith { ["STR_HR_GRG_Feedback_requestMount_Denied"] call HR_GRG_fnc_Hint };

HR_GRG_ReloadMounts = true;
[false] call HR_GRG_fnc_toggleConfirmBttn;
[HR_GRG_PlayerUID, _vehUID, _newIconIndex, clientOwner, player] remoteExecCall ["HR_GRG_fnc_findMount",2];
