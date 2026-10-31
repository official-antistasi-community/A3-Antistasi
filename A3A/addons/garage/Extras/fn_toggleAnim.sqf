/*
    Author: [Håkon]
    [Description]
        Toggles animation on/off from ExtrasAnim list

    Arguments:
    0. <Control> ExtrasAnim control

    Return Value:
    <Bool> Successful animation change

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_toggleAnim;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
Trace("Toggling a animation");
params ["_ctrl"];
private _index = lbCurSel _ctrl;
_ctrl lbSetCurSel -1;
if (_index isEqualTo -1) exitWith {false};

private _newIconIndex = checkboxTextures findIf { (_x isNotEqualTo (_ctrl lbPicture _index)) };
_ctrl lbSetPicture [_index, checkboxTextures#_newIconIndex];
private _anims = [];
for "_i" from 0 to (lbSize _ctrl - 1) do {
    _anims pushBack (_ctrl lbData _i);
    _anims pushBack (checkboxTextures find (_ctrl lbPicture _i));
};
HR_GRG_curAnims = _anims;

[HR_GRG_previewVeh, HR_GRG_curTexture, HR_GRG_curAnims] call BIS_fnc_initVehicle;
