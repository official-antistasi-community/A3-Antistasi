/*
    Handles the menu to allow for the copying and pasting of saves.
    This function should only be called from setupDialog onLoad and control activation EHs.

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "export"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("Transfer dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_SETUPTRANSFERDIALOG;
private _parent = displayParent _display;           // for grabbing save data
private _importButton = _display displayCtrl A3A_IDC_SETUP_TRANSFERIMPORT;
private _textCtrl = _display displayCtrl A3A_IDC_SETUP_TRANSFERINFOTEXT;
private _textConfirmCtrl = _display displayCtrl A3A_IDC_SETUP_TRANSFERCONFIRMTEXT;
private _editCtrl = _display displayCtrl A3A_IDC_SETUP_TRANSFERTEXTBOX;
private _namespaceCB = _display displayCtrl A3A_IDC_SETUP_TRANSFERCB;
private _namespaceText = _display displayCtrl A3A_IDC_SETUP_TRANSFERCBTEXT;

switch (_mode) do
{
    case ("onLoad"):
    {
        // get run mode from parent
        private _mode = ["export", "import"] select (_parent isNil "exportSave");
        [_mode] call A3A_GUI_fnc_setupTransferDialog;
    };

    case ("export"):
    {
        _textCtrl ctrlShow true;
        _editCtrl ctrlShow true;
        _importButton ctrlShow false;
        _namespaceCB ctrlShow false;
        _namespaceText ctrlShow false;
        _textConfirmCtrl ctrlShow false;

        private _saveHeader = _parent getVariable "exportSave";
        _textCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_downloading", _saveHeader get "name", _saveHeader get "gameID"];

        [_saveHeader] remoteExecCall ["A3A_fnc_exportSave", 2];
    };

    case ("exportDataReceived"):
    {
        if (isNull _display) exitWith {};   // if display was closed during transfer

        // Why would we need these again? Click off, click on?
        _textCtrl ctrlShow true;
        _editCtrl ctrlShow true;
        _importButton ctrlShow false;
        _namespaceCB ctrlSHow false;
        _namespaceText ctrlShow false;
        _textConfirmCtrl ctrlShow false;

        _editCtrl ctrlSetText _params;
        private _saveHeader = _parent getVariable "exportSave";
        _textCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_exportReady", _saveHeader get "name", _saveHeader get "gameID"];
    };

    case ("import"):
    {
        _textCtrl ctrlShow true;
        _editCtrl ctrlShow true;
        _importButton ctrlShow true;
        _namespaceCB ctrlShow false;
        _namespaceText ctrlShow false;
        _textConfirmCtrl ctrlShow false;
        _textCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_importReady",localize "STR_antistasi_dialogs_setup_importButton"];
    };

    case ("importButtonPressed"):
    {
        _textCtrl ctrlShow false;
        _editCtrl ctrlShow false;
        _importButton ctrlShow true;

        // first click asks
        if (_display isNil "importData") exitWith
        { 
            private _importData = fromJSON ctrlText _editCtrl;
            private _name = _importData get "name";
            if (isNil "_name") exitWith {_textConfirmCtrl ctrlSetStructuredText parseText "Invalid save data"; Debug("Failed to parse input data")}; // also trips if JSON conversion fails, e.g. malformed data
            _display setVariable ["importData", _importData];

            _namespaceCB ctrlShow true;
            _namespaceText ctrlShow true;
            _namespaceCB cbSetChecked !A3A_setup_isLinux;
            _textConfirmCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_importConfirm",_name];
            _textConfirmCtrl ctrlShow true;
            _importButton ctrlEnable true;
        };

        // second click confirms
        private _importData = _display getVariable "importData";
        private _name = _importData get "name";
        private _newName = [localize "STR_antistasi_dialogs_setup_importButton", _name] joinString " "; // needs to happen on client so localize works
        _importData set ["name", _newName];
        _importData set ["saveTime", systemTimeUTC];            // Plonk it on the top
        [_importData, cbChecked _namespaceCB] remoteExecCall ["A3A_fnc_importSave", 2];

        closeDialog 0;
        A3A_setup_saveData = nil;
        closeDialog 0;              // hopefully closes the parent... 
    };
};
