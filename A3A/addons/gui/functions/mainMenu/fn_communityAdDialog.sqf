/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Handles all interaction to the community ad menu.
	Should only be called from the menu.
	This function is pre-loaded and uses different function calls because it runs in the main menu without a mission.

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

FIX_LINE_NUMBERS()

#define MAINADDRESS "217.217.30.252"
#define TSADDRESS "217.217.30.250"

private _thisFunc = (uiNamespace getVariable "A3A_GUI_fnc_communityAdDialog");

params ["_mode", "_params"];

_display = findDisplay A3A_IDD_COMMUNITYADVERTISEMENT;
private _picture = _display displayCtrl A3A_IDC_COMMAD_PICTURE;
private _mainText = _display displayCtrl A3A_IDC_COMMAD_MAINTEXT;
private _toggleButton = _display displayCtrl A3A_IDC_COMMAD_TOGGLEBUTTON;
private _joinMainServer1Button = _display displayCtrl A3A_IDC_COMMAD_JOINMAINSERVER1;
private _joinMainServer2Button = _display displayCtrl A3A_IDC_COMMAD_JOINMAINSERVER2;
private _joinTestServer1Button = _display displayCtrl A3A_IDC_COMMAD_JOINTESTSERVER1;
private _joinTestServer2Button = _display displayCtrl A3A_IDC_COMMAD_JOINTESTSERVER2;
private _testCB = _display displayCtrl A3A_IDC_COMMAD_SHOWTESTCB;
private _ports = [
    ["Main 1", 2472],
    ["Main 2", 2482],
    ["Test 1", 2392],
    ["Test 2", 2402]
];

switch (_mode) do
{
    case ("onLoad"):
    {
        _picture ctrlSetText QPATHTOFOLDER(dialogues\textures\banner\communityBanner.jpg);
        _display setVariable ["mode", "links"];
        ["handleToggleButton"] call _thisFunc;
        ["testCBChecked"] call _thisFunc;
    };
    case ("handleToggleButton"):
    {
        private _currentMode = _display getVariable ["mode", "info"];
        private _newMode = ["info","links"] select (_currentMode == "info");
        _display setVariable ["mode", _newMode];
        if (_newMode == "info") then {
            _toggleButton ctrlSetText "Links";
            _mainText ctrlSetStructuredText parseText localize "STR_antistasi_commad_splashText";
        } else {
            _toggleButton ctrlSetText "Info";
            _mainText ctrlSetStructuredText parseText format [localize "STR_antistasi_commad_linkText", TSADDRESS, MAINADDRESS, (_ports apply {format ["%1: %2", _x#0, _x#1]}) joinString ", "];
        };
    };
    case ("testCBChecked"):
	{
        private _state = cbChecked _testCB;
        _joinMainServer1Button ctrlShow !_state;
        _joinMainServer2Button ctrlShow !_state;
        _joinTestServer1Button ctrlShow _state;
        _joinTestServer2Button ctrlShow _state;
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