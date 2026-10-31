/*
    Author: [Håkon]
    [Description]
        Handles the change in the pylon preset combo box

    Arguments:
    0. <Control> unused
    1. <Int>     new index of the preset combo box
    2. <Bool>    Block this function from altering the pylons (update selected from changeing pylons)

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [controlNull, -1, true] call HR_GRG_fnc_PylonsPresetChanged;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_ctrl", "_index", ["_blockPylonChange", false]];
Trace("Updating preset selection");
if (_index isEqualTo 0) exitWith {Trace("Custom preset");};//custom preset, dont change anything with the pylons

//get all preset loudouts
private _presetCtrl = (HR_GRG_Pylon_GeneralCtrls#1);
private _loudouts = [[0]];
for "_i" from 1 to lbSize _presetCtrl -1 do {
    _loudouts pushBack call compile (_presetCtrl lbData _i);
};

private _equiped = [];
{ _equiped pushBack (_x#1) } forEach HR_GRG_Pylons;
if ( ( { (_x isNotEqualTo "") } count _equiped ) isEqualTo 0 ) then { _equiped = [] };

//if we are updating from new pylons
if (_blockPylonChange) exitWith {
    Trace("Pylon change blocked, only preset control updated");
    _selIndex = _loudouts findIf { _x isEqualTo _equiped};
    _presetCtrl lbSetCurSel _selIndex;
};

//selecting a preset
private _selectedLoudout = _loudouts#_index;
if (_equiped isEqualTo _selectedLoudout) exitWith {Trace("Preset already sett");};//already equiped

Trace("Applying a preset");
    //empty preset
if (_selectedLoudout isEqualTo []) exitWith {
    Trace("Empty preset applied");
    {
        _x params ["_combo", "_mirrorIndex", "_button", "_comboIndex"];

        //update selected turret
        private _turret = [HR_GRG_previewVeh, _forEachIndex] call HR_GRG_fnc_getPylonTurret;
        private _icon = [GunnerIcon, DriverIcon] select (_turret isEqualTo []);
        _button ctrlSetText _icon;
        _button setVariable ["HR_GRG_turret", [[0],[]] select (_turret isEqualTo [])];

        //update pylon magazine
        _combo lbSetCurSel 0;
    } forEach HR_GRG_PylonData;
};

    //All other presets
private _dataCount = (count HR_GRG_PylonData) -1;
{
    if (_dataCount < _forEachIndex) exitWith {//some presets have more entries that there is pylons for some reason
        _selectedLoudout = _selectedLoudout select [0, _dataCount + 1];
        _presetCtrl lbSetData [_index, str _selectedLoudout]; //sets the preset to the bounds of pylons
    };

    (HR_GRG_PylonData#_forEachIndex) params ["_combo", "_mirrorIndex", "_button", "_comboIndex"];

    //find the magazine index in the combo box
    private _selIndex = -1;
    for "_i" from 0 to lbSize _combo -1 do {
        if ( (_combo lbData _i) isEqualTo _x ) exitWith {_selIndex = _i};
    };

    //update selected turret
    private _turret = [HR_GRG_previewVeh, _forEachIndex] call HR_GRG_fnc_getPylonTurret;
    private _icon = [GunnerIcon, DriverIcon] select (_turret isEqualTo []);
    _button ctrlSetText _icon;
    _button setVariable ["HR_GRG_turret", [[0],[]] select (_turret isEqualTo [])];

    //update pylon magazine
    _combo lbSetCurSel _selIndex;
} forEach _selectedLoudout;
Trace("Preset applied");
