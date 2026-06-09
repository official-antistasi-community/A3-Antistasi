/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Handles all interaction to the bug report dialog.
	Should only be called from the menu.
	Used to file bug reports from the main servers; users can fill out the "form" and the results will get logged in a specific format that can then be parsed.

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

// 8 + 3 + 17 + 24 (+3 for delimiters) = 53
// Timestamp length is 85 chars, fixed
// Max diag_log length is 1044
// 1044 - 53 - 85 = 906
#define DETAILSCAP 906
#define DELIMITER "|"

private _thisFunc = (uiNamespace getVariable "A3A_GUI_fnc_bugReportDialog");
private _fnc_hint = {["Bug Report",_this] call A3A_fnc_customHint};

params ["_mode", "_params"];

private _display = findDisplay A3A_IDD_BUGREPORT;
private _types = [
    ["FEE", "Feedback"],
    ["BUG", "Bug Report"],
    ["SUG", "Suggestion"]
];
private _typeCombo = _display displayCtrl A3A_IDC_BUGREPORT_TYPECOMBOBOX;
private _detailsEdit = _display displayCtrl A3A_IDC_BUGREPORT_EDITBOX;

switch (_mode) do
{
    case ("requestOpen"):
	{
        findDisplay 49 closeDisplay 1;
        createDialog "A3A_createBugReport";
	};
    case ("onLoad"):
    {
        {
            _x params ["_type", "_name"];
            private _index = _typeCombo lbAdd _name;
            _typeCombo lbSetData [_index, _type];
        } forEach _types;
        _typeCombo lbSetCurSel 0;
    };
    case ("handleSendButton"):
	{
		private _prefix = "FEEDBACK";
        private _type = _typeCombo lbData lbCurSel _typeCombo;
        private _senderUID = getPlayerUID player;
        private _senderName = profileName splitString DELIMITER joinString "";
        private _details = ctrlText _detailsEdit;
        // filter details for delimiter and then trim
        private _filtered = _details splitString DELIMITER joinString "";
        if (count _filtered == 0) exitWith {"You must provide some sort of context for your feedback" call _fnc_hint};

        private _endStr = [_prefix, _type, _senderUID, _senderName, _filtered] joinString DELIMITER;
        ServerInfo(_endStr)
        _display closeDisplay 0;
	};
	case ("handleBackButton"):
	{
		// close dialog
		_display closeDisplay 0;
	};
	case ("onUnload"):
	{

	};
};