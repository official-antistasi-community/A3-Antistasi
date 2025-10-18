/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Handles all interaction to the remarks dialog.
	Should only be called from the menu.
	Used to file remarks from the main servers; users can fill out the "form" and the results will get logged in a specific format that can then be parsed.

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "openRole"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

*/
#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"

FIX_LINE_NUMBERS()

// 6 + 3 + 17 + 24 + 17 + 24 (+5 for delimiters) = 94
// Timestamp length is 85 chars, fixed
// Max diag_log length is 1044
// 1044 - 94 - 85 = 865
#define DETAILSCAP 860
#define DELIMITER "|"

private _thisFunc = (uiNamespace getVariable "A3A_GUI_fnc_remarksDialog");
private _fnc_hint = {["Remarks",_this] call A3A_fnc_customHint};

params ["_mode", "_params"];

_display = findDisplay A3A_IDD_REMARKS;
private _types = [
    ["POS", "Positive"],
    ["NEU", "Neutral"],
    ["NEG", "Negative"]
];
private _targetCombo = _display displayCtrl A3A_IDC_REMARK_TARGETCOMBOBOX;
private _targetText = _display displayCtrl A3A_IDC_REMARK_TARGETCURRENT;
private _targetEdit = _display displayCtrl A3A_IDC_REMARK_TARGETEDIT;
private _typeCombo = _display displayCtrl A3A_IDC_REMARK_TYPECOMBOBOX;
private _detailsEdit = _display displayCtrl A3A_IDC_REMARK_EDITBOX;

switch (_mode) do
{
    case ("requestOpen"):
	{
		if !(isNull findDisplay 46) then {
            findDisplay 46 createDisplay "A3A_createRemark";
        } else {
            findDisplay 0 createDisplay "A3A_createRemark";
            Error("Somehow opened createRemark without display 46?");
        };
	};
    case ("onLoad"):
    {
        {
            _x params ["_type", "_name"];
            private _index = _typeCombo lbAdd _name;
            _typeCombo lbSetData [_index, _type];
        } forEach _types;
        _typeCombo lbSetCurSel 0;
        _targetCombo lbAdd "Manually Enter Name";
        _targetCombo lbSetData [0, "MANUAL"];
        {
            private _index = _targetCombo lbAdd (name _x);
            _targetCombo lbSetData [_index, getPlayerUID _x];
        } forEach (allPlayers - (entities "HeadlessClient_F"));
        _targetCombo lbSetCurSel 0;
        private _savedDetails = profileNamespace getVariable ["A3A_lastRemarkDetails",""];
        _detailsEdit ctrlSetText _savedDetails;
    };
    case ("targetSelChanged"):
	{
		private _sel = _targetCombo lbData lbCurSel _targetCombo;
        private _isManual = (_sel == "MANUAL");
        _targetEdit ctrlShow _isManual;
        _targetText ctrlShow !_isManual;
        if (_sel == "MANUAL") then {
            _targetEdit ctrlSetText "";
        } else {
            private _name = name (_sel call BIS_fnc_getUnitByUID); // person can disconnect mid filing
            _display setVariable ["currentName", _name];
            _targetText ctrlSetText format ["%1: %2", _name, _sel];
        };
	};

    case ("handleSendButton"):
	{
		private _prefix = "REMARK";
        private _type = _typeCombo lbData lbCurSel _typeCombo;
        private _senderUID = getPlayerUID player;
        private _senderName = profileName;
        private _targetUID = _targetCombo lbData lbCurSel _targetCombo;
        private _targetName = if (_targetUID == "MANUAL") then {
            ctrlText _targetEdit;
        } else {
            private _target = _targetUID call BIS_fnc_getUnitByUID;
            _name = if (_target isEqualTo objNull) then {
                _display getVariable ["currentName", "NULL"];
            } else {
                name _target;
            };
            _name
        };
        _targetName = _targetName splitString DELIMITER joinString "";
        if (count _targetName == 0) exitWith {"You must select a valid user or submit a name" call _fnc_hint};
        private _details = ctrlText _detailsEdit;
        // filter details for delimiter and then trim
        private _filtered = _details splitString DELIMITER joinString "";
        if (count _filtered == 0) exitWith {"You must provide some sort of context for the remark" call _fnc_hint};

        private _endStr = [_prefix, _type, _senderUID, _senderName, _targetUID, _targetName, _filtered] joinString DELIMITER;
        ServerInfo(_endStr)
        _detailsEdit ctrlSetText "";
        _display closeDisplay 0;
	};
	case ("handleBackButton"):
	{
		// close dialog
		_display closeDisplay 0;
	};
	case ("onUnload"):
	{
        profileNamespace setVariable ["A3A_lastRemarkDetails", ctrlText _detailsEdit];
        saveprofilenamespace;
	};
};