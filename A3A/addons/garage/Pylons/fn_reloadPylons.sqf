/*
    Author: [Håkon, DoomMetal]
    [Description]
        Reloads the pylons menu for a new vehicle selection

    Arguments:
    0. <nil>

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [] call HR_GRG_fnc_reloadPylons;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
Trace("Reloading pylons menu");
private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrlGroup = _disp displayCtrl HR_GRG_IDC_ExtraPylons;

////////////////////
//clear old ctrls //
////////////////////
Trace("Clearing old pylon controls");
{ //ToDo: find a better way to clear the controls under this control group
    if (ctrlParentControlsGroup _x isEqualTo _ctrlGroup) then {ctrlDelete _x};
} forEach allControls _disp;

///////////////
// Base menu //
///////////////
Trace("Prepping base info");
private _baseOffset = 0;
private _IDCCount = 1;
private _pylonsCfg = (configFile >> "CfgVehicles" >> typeOf HR_GRG_previewVeh >> "Components" >> "TransportPylonsComponent");
HR_GRG_PylonData = [];
HR_GRG_Turrets = [];
private _fullCrew = fullCrew [HR_GRG_previewVeh,"",true];
{
    if (
        ((_x#2) isEqualTo -1) //not cargo turret
        && !((_x#3) isEqualTo [])
    ) then { HR_GRG_Turrets pushBack (_x#3) };
} forEach _fullCrew;

//////////////////
//mirror button //
//////////////////
Trace("Creating mirror functionality");
private _cbCtrl = _disp displayCtrl HR_GRG_IDC_ExtraPylonsMirrorCheckbox;
_cbCtrl ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call HR_GRG_fnc_pylonToggleMirror}];

private _cbTextCtrl = _disp displayCtrl HR_GRG_IDC_ExtraPylonsMirrorLabel;
_cbTextCtrl ctrlSetText localize "STR_HR_GRG_Pylons_Mirror";

////////////////////
//preset loudouts //
////////////////////
Trace("Get preset control and add preset data");
private _presetComboCtrl = _disp displayCtrl HR_GRG_IDC_ExtraPylonsPresetsCombo;

lbClear _presetComboCtrl;
private _index = _presetComboCtrl lbAdd localize "STR_HR_GRG_Pylons_CustomPreset";
_presetComboCtrl lbSetData [_index, "[]"];
HR_GRG_DefaultMags = [];
{
    private _displayName = getText (_x >> "displayName");
    private _attachement = getArray (_x >> "attachment");
    private _index = _presetComboCtrl lbAdd _displayName;
    _presetComboCtrl lbSetData [_index, str _attachement];

    //get all mags used by default presets
    _loadoutMags = _attachement apply { getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") };
    {HR_GRG_DefaultMags pushBackUnique _x} forEach _loadoutMags;

} forEach (configProperties [(_pylonsCfg >> "Presets")]);

_presetComboCtrl lbSetCurSel 0;
_presetComboCtrl ctrlAddEventHandler ["LBSelChanged", {_this call HR_GRG_fnc_PylonsPresetChanged}];

HR_GRG_Pylon_GeneralCtrls = [_cbCtrl, _presetComboCtrl];

////////////////////
// Dynamic pylons //
////////////////////
Trace("Starting to add pylons controls, consists of controls for text, turret button and pylon mag combo box");
private _curPylons = getPylonMagazines HR_GRG_previewVeh;
{
    Trace_1("Adding pylon controls for pylon: %1", configName _x);
    //general info
    private _mags = HR_GRG_previewVeh getCompatiblePylonMagazines (_forEachIndex + 1);
    private _pylonMag = _curPylons#_forEachIndex;

    //Header text
    private _textCtrl = _disp ctrlCreate ["HR_GRG_RscTextNoBG", -1, _ctrlGroup];
    _textCtrl ctrlSetPosition [
        0
        , _baseOffset
        , 10 * GRID_NOUISCALE_W
        , 3 * GRID_NOUISCALE_H
    ];
    _textCtrl ctrlCommit 0;

    _textCtrl ctrlSetText format [localize "STR_HR_GRG_Pylons_PylonText", _forEachIndex + 1];

    //Turret button
    private _btnCtrl = _disp ctrlCreate ["ctrlButtonPictureKeepAspect", HR_GRG_IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
    _IDCCount = _IDCCount +1;
    _btnCtrl ctrlSetPosition [
        1 * GRID_NOUISCALE_W
        , _baseOffset + 4 * GRID_NOUISCALE_H
        , 3 * GRID_NOUISCALE_W
        , 3 * GRID_NOUISCALE_H
    ];
    _btnCtrl ctrlCommit 0;

    private _turret = [HR_GRG_previewVeh, _forEachIndex] call HR_GRG_fnc_getPylonTurret;
    [_btnCtrl, false, _turret] call HR_GRG_fnc_PylonsTurretToggle;
    _btnCtrl ctrlAddEventHandler ["ButtonClick", {[_this#0, true, []] call HR_GRG_fnc_PylonsTurretToggle}];

    //Pylon magazine selection
    private _comboCtrl = _disp ctrlCreate ["HR_GRG_RscComboBlckBG", HR_GRG_IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
    _IDCCount = _IDCCount +1;
    _comboCtrl ctrlSetPosition [
        7 * GRID_NOUISCALE_W
        , _baseOffset + 4 * GRID_NOUISCALE_H
        , 30 * GRID_NOUISCALE_W
        , 3 * GRID_NOUISCALE_H
    ];
    _comboCtrl ctrlCommit 0;

    private _index = _comboCtrl lbAdd localize "STR_HR_GRG_Pylons_Empty";
    private _selected = 0;
    {
        private _index = _comboCtrl lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _comboCtrl lbSetTooltip [_index, getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort")];
        _comboCtrl lbSetData [_index, _x];
        if (_pylonMag isEqualTo _x) then {_selected = _index};
    } forEach _mags;
    _comboCtrl lbSetCurSel _selected;
    _comboCtrl ctrlAddEventHandler ["LBSelChanged", {_this call HR_GRG_fnc_PylonsChanged}];

    //Add to data array
    private _mirroredIndex = getNumber (_x >> "mirroredMissilePos");
    HR_GRG_PylonData pushBack [_comboCtrl, _mirroredIndex - 1, _btnCtrl, _selected];
    _baseOffset = _baseOffset + 8 * GRID_NOUISCALE_H;
} forEach ("true" configClasses (_pylonsCfg >> "Pylons"));
Trace("Done adding pylons controls");


///////////////////////////
// Handle no pylons case //
///////////////////////////
if (_IDCCount isEqualTo 1) then {
    Trace("No pylons were found, creating hint text");
    private _textCtrl = _disp ctrlCreate ["HR_GRG_RscStructuredTextNoBG", -1, _ctrlGroup];
    _textCtrl ctrlSetPosition [
        1 * GRID_NOUISCALE_W
        , 1 * GRID_NOUISCALE_H
        , 37 * GRID_NOUISCALE_W
        , 37 * GRID_NOUISCALE_H
    ];
    _textCtrl ctrlSetStructuredText composeText [localize "STR_HR_GRG_Pylons_noPylons", lineBreak,"    ", cfgDispName(typeOf HR_GRG_previewVeh)];
    _textCtrl ctrlCommit 0;
};

HR_GRG_UpdatePylons = true;
Trace("Pylons menu reloaded");
