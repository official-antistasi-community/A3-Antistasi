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
private _textLeftCtrl = displayCtrl A3A_IDC_SETUP_TRANSFERINFOLEFTTEXT;
private _editCtrl = _display displayCtrl A3A_IDC_SETUP_TRANSFERTEXTBOX;
private _textCenterCtrl = _display displayCTRL A3A_IDC_SETUP_TRANSFERINFOCENTERTEXT;

switch (_mode) do
{
    case ("onLoad"):
    {
        // get run mode from parent
        _mode = _parent getVariable "transferMode";
        [_mode] call A3A_GUI_fnc_setupTransferDialog;
    };

    case ("export"):
    {
        _textLeftCtrl ctrlShow true;
        _textCenterCtrl ctrlShow false;
        _editCtrl ctrlShow true;
        _importButton ctrlShow false;
        private _saveData = _parent getVariable "exportSave";
        _textLeftCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_downloading",_saveData get "name",_saveData get "gameID"];
        [_saveData, {
            private _saveData = _this;
            _oldSaveTarget = A3A_saveTarget;
            A3A_saveTarget = [_saveData get "serverID", _saveData get "gameID", _saveData get "map"];
            private _rawJSON = (["JSON",true] call A3A_fnc_returnSavedStat);
            A3A_jsonSaveDataHM = fromJSON _rawJSON;
            A3A_jsonSaveDataHM set ["headerData",_saveData];
            A3A_saveTarget = _oldSaveTarget;
            remoteExecutedOwner publicVariableClient "A3A_jsonSaveDataHM";
            ["exportDataRecieved"] remoteExec ["A3A_GUI_fnc_setupTransferDialog", remoteExecutedOwner]
        }] remoteExec ["call", 2];
    };

    case ("exportDataRecieved"):
    {
        _textLeftCtrl ctrlShow true;
        _textCenterCtrl ctrlShow false;
        _editCtrl ctrlShow true;
        _importButton ctrlShow false;
        // SCHEDULED !!!!!!!!!!
        waitUntil {sleep 0.1; (count A3A_jsonSaveDataHM > 0) };
        if (isNull _display) exitWith {}; // if display is closed during
        private _saveData = _parent getVariable "exportSave";
        _editCtrl ctrlSetText (toJSON A3A_jsonSaveDataHM);
        _textLeftCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_exportReady",_saveData get "name",_saveData get "gameID"];
    };

    case ("import"):
    {
        _textLeftCtrl ctrlShow true;
        _textCenterCtrl ctrlShow false;
        _editCtrl ctrlShow true;
        _importButton ctrlShow true;
        _textLeftCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_importReady",localize "STR_antistasi_dialogs_setup_importButton"];
    };

    case ("importButtonPressed"):
    {
        _textLeftCtrl ctrlShow false;
        _textCenterCtrl ctrlShow true;
        _editCtrl ctrlShow false;
        _importButton ctrlShow true;
        if (_parent getVariable ["importStage","asking"] == "asking") then { // first click asks
            _importButton ctrlEnable false;
            private _inputText = ctrlText _editCtrl;
            _textCenterCtrl ctrlSetText "Working, please wait...";
            
            A3A_jsonSaveDataHM = fromJSON _inputText;
            _header = A3A_jsonSaveDataHM get "headerData";
            private _name = A3A_jsonSaveDataHM get "name";
            private _id = _header get "gameID";
            if (isNil "_name" || isNil "_id") exitWith {_textCenterCtrl ctrlSetText "Invalid save data"; Debug("Failed to parse input data")}; // also trips if JSON conversion fails, e.g. malformed data
            private _isOverwrite = "";
            {
                if (_x get "gameID" == _id) then {_isOverwrite = _x get "name"};
            } forEach A3A_setup_saveData;
            if !(_isOverwrite == "") then {
                _textCenterCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_importConfirm1",_name, _id, _isOverwrite];
            } else {
                _textCenterCtrl ctrlSetStructuredText parseText format [localize "STR_antistasi_dialogs_setup_transfer_importConfirm2",_name, _id];
            };
            
            _importButton ctrlEnable true;
            _parent setVariable ["importStage","confirmed"];
            _parent setVariable ["importIsOverwrite",_isOverwrite];
        } else { // second click confirms
            closeDialog 0;
            private _import = A3A_jsonSaveDataHM;
            private _saveData = A3A_jsonSaveDataHM get "headerData";
            private _id = _saveData get "gameID";
            if !(_parent getVariable ["importIsOverwrite",""] == "") then {
                Debug_1("Overwriting existing save %1 with import",_id);
                _saveIndex = (A3A_setup_saveData findIf { (_x get "gameID") == _id });
                A3A_setup_saveData set [_saveIndex, _saveData];
            } else {
                Debug_1("Adding save %1 to list with import",_id);
                //A3A_setup_saveData insert [0,_saveData];
                reverse A3A_setup_saveData; //apparently its a hashmap whenever it feels like it
                A3A_setup_saveData pushBack _saveData;
                reverse A3A_setup_saveData;
            };
            [_import, {
                params ["_import"];
                A3A_jsonSaveDataHM = _import;
                _saveData = A3A_jsonSaveDataHM get "headerData";
                private _serverID = _saveData get "serverID";
                private _campaignID = _saveData get "gameID";
                private _map = _saveData get "map";
                _oldSaveTarget = A3A_saveTarget;
                A3A_saveTarget = [_serverID, _campaignID, _map];
                Debug_1("Foreign save [%1] imported by client",A3A_saveTarget);
                ["JSON",toJSON A3A_jsonSaveDataHM,true] call A3A_fnc_setStatVariable;
                A3A_saveTarget = _oldSaveTarget;
                private _saveToNewNamespace = _serverID isEqualType false;
                private _namespace = [profileNamespace, missionProfileNamespace] select _saveToNewNamespace;
                private _saveList = [_namespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
                _saveList deleteAt (_saveList findIf { _x select 0 == _campaignID });
                _saveList pushBack [_campaignID, worldName, "Greenfor"];
                _namespace setVariable ["antistasiSavedGames", _saveList];
                if (_saveToNewNamespace) then { saveMissionProfileNamespace } else { saveProfileNamespace };
            }] remoteExecCall ["call",2];

            _parent setVariable ["importStage",nil];
            _parent setVariable ["importIsOverwrite",nil];
            waitUntil { dialog };
            ["setSaveData"] call A3A_GUI_fnc_setupLoadgameTab;
        };
    };

    case ("importConfirmed"):
    {
        private _confirmData = _parent getVariable "confirmData";
        [_confirmData#2] spawn (_confirmData#1);            // Needs to be spawn otherwise displayCtrl doesn't always work? wack
        closeDialog 0;
    };
};
