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
        _mode = _parent getVariable "transferMode";
        [_mode] call A3A_GUI_fnc_setupTransferDialog;
        _parent setVariable ["importStage","asking"];
    };

    case ("export"):
    {
        _textCtrl ctrlShow true;
        _editCtrl ctrlShow true;
        _importButton ctrlShow false;
        _namespaceCB ctrlShow false;
        _namespaceText ctrlShow false;
        _textConfirmCtrl ctrlShow false;
        private _saveData = _parent getVariable "exportSave";
        _textCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_downloading",_saveData get "name",_saveData get "gameID"];
        [_saveData, {
            private _saveData = _this;
            _oldSaveTarget = A3A_saveTarget;
            A3A_saveTarget = [_saveData get "serverID", _saveData get "gameID", _saveData get "map", _saveData get "json"];
            private _rawJSON = (["json",true] call A3A_fnc_returnSavedStat);
            A3A_jsonSaveDataHM = fromJSON _rawJSON;
            A3A_jsonSaveDataHM set ["headerData",_saveData];
            A3A_saveTarget = _oldSaveTarget;
            remoteExecutedOwner publicVariableClient "A3A_jsonSaveDataHM";
            ["exportDataReceived"] remoteExec ["A3A_GUI_fnc_setupTransferDialog", remoteExecutedOwner]
        }] remoteExec ["call", 2];
    };

    case ("exportDataReceived"):
    {
        _textCtrl ctrlShow true;
        _editCtrl ctrlShow true;
        _importButton ctrlShow false;
        _namespaceCB ctrlSHow false;
        _namespaceText ctrlShow false;
        _textConfirmCtrl ctrlShow false;
        // SCHEDULED !!!!!!!!!!
        waitUntil {sleep 0.1; (count A3A_jsonSaveDataHM > 0) };
        if (isNull _display) exitWith {}; // if display is closed during
        private _saveData = _parent getVariable "exportSave";
        _editCtrl ctrlSetText (toJSON A3A_jsonSaveDataHM);
        _textCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_exportReady",_saveData get "name",_saveData get "gameID"];
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
        if (_parent getVariable ["importStage","asking"] == "asking") then { // first click asks
            _textConfirmCtrl ctrlShow true;
            _importButton ctrlEnable false;
            private _inputText = ctrlText _editCtrl;
            _textConfirmCtrl ctrlSetText "Working, please wait...";
            A3A_jsonSaveDataHM = fromJSON _inputText;
            private _name = A3A_jsonSaveDataHM get "name";
            if (isNil "_name") exitWith {_textConfirmCtrl ctrlSetStructuredText parseText "Invalid save data"; Debug("Failed to parse input data")}; // also trips if JSON conversion fails, e.g. malformed data
            _namespaceCB ctrlShow true;
            _namespaceText ctrlShow true;
            _namespaceCB cbSetChecked (!A3A_isLinux);
            _textConfirmCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_importConfirm",_name];
            _importButton ctrlEnable true;
            _parent setVariable ["importStage","confirmed"];
        } else { // second click confirms
            _textConfirmCtrl ctrlShow false;
            private _saveToNewNamespace = cbChecked _namespaceCB;
            _nameSpaceCB ctrlShow false;
            _namespaceText ctrlShow false;
            closeDialog 0;
            private _name = A3A_jsonSaveDataHM get "name";
            private _newName = [localize "STR_antistasi_dialogs_setup_importButton",_name] joinString " "; // needs to happen on client so localize works
            private _newID = call A3A_fnc_uniqueID;
            //A3A_jsonSaveDataHM set ["name",_importName];
            private _saveData = A3A_jsonSaveDataHM get "headerData";
            _saveData set ["name",_newName];
            _saveData set ["gameID", _newID];
            private _serverID = profileNamespace getVariable ["ss_serverID", ""];
            _serverID = [_serverID, false] select _saveToNewNamespace;
            _saveData set ["serverID",_serverID];
            if !(_saveToNewNamespace) then {_saveData set ["fileStr","Old"]};
            private _namespaceText = (["old","new"] select _saveToNewNamespace);
            Info_3("Adding save %1 to list through import with ID %2 to %3 namespace",_newName,_newID,_namespaceText)
            private _newGames = A3A_setup_saveData select {(_x get "serverID") isEqualType false};
            private _oldGames = A3A_setup_saveData - _newGames;
            private _insertIndex = call {
                private _importSaveTime = _saveData get "saveTime";
                private _index = 0;
                {
                    private _selSaveTime = (_x get "saveTime");
                    if (call {
                        private _compare = [_importSaveTime, _selSaveTime];
                        _compare sort false;
                        (_compare#0 isEqualTo _importSaveTime)
                    }) exitWith {_index = _forEachIndex};
                } forEach ([_oldGames,_newGames] select _saveToNewNamespace);
                _index;
            };
            A3A_setup_saveData insert [_insertIndex + ([count _newGames, 0] select (_saveToNewNamespace)), [_saveData]];
            A3A_jsonSaveDataHM set ["headerData", _saveData];
            [[A3A_jsonSaveDataHM, _newID, _saveToNewNamespace, _insertIndex], {
                params ["_importSave","_campaignID", "_saveToNewNamespace", "_insertIndex"];
                A3A_jsonSaveDataHM = _importSave;
                private _saveData = A3A_jsonSaveDataHM get "headerData";
                private _serverID = _saveData get "serverID";
                private _map = _saveData get "map";
                private _name = _saveData get "name";
                _oldSaveTarget = A3A_saveTarget;
                A3A_saveTarget = [_serverID, _campaignID, _map];
                Info_1("Foreign save %1 imported by client",_name);
                ["json",toJSON A3A_jsonSaveDataHM,true] call A3A_fnc_setStatVariable;
                A3A_saveTarget = _oldSaveTarget;
                private _namespace = [profileNamespace, missionProfileNamespace] select _saveToNewNamespace;
                private _saveList = [_namespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
                _saveList insert [(count _saveList - _insertIndex), [[_campaignID, _map, "Greenfor", _saveData]]];
                _namespace setVariable ["antistasiSavedGames", _saveList];
                if (_saveToNewNamespace) then { saveMissionProfileNamespace } else { saveProfileNamespace };
            }] remoteExecCall ["call",2];

            _parent setVariable ["importStage",nil];
            waitUntil { dialog };
            ["setSaveData"] call A3A_GUI_fnc_setupLoadgameTab;
        };
    };
};
