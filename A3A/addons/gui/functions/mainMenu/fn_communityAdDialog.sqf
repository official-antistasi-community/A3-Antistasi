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

private _forwardButton = _display displayCtrl A3A_IDC_COMMAD_IMAGEFORWARD;
private _backButton = _display displayCtrl A3A_IDC_COMMAD_IMAGEBACK;
private _numberText = _display displayCtrl A3A_IDC_COMMAD_IMAGENUMBER;
private _images = [
    ["mainBanner", ["Hombre", "Tiny", "Plaquer", "badmotherz"]],
    ["medec1", ["Medec"]],
    ["anonymous1", ["Anonymous"]],
    ["tiny1", ["Tiny"]],
    ["tiny2", ["Tiny"]],
    ["badmotherz1", ["badmotherz"]],
    ["tiny3", ["Tiny"]],
    ["tiny4", ["Tiny"]],
    ["enfield1", ["Enfield"]]
];

switch (_mode) do
{
    case ("onLoad"):
    {
        _picture ctrlSetTooltip "test3";
        _display setVariable ["mode", "links"];
        private _imageSwitchPrompt = "Use the arrows to switch between pictures from the community servers";
        _forwardButton ctrlSetTooltip _imageSwitchPrompt;
        _backButton ctrlSetTooltip _imageSwitchPrompt;
        _numberText ctrlSetTooltip _imageSwitchPrompt;
        ["handleImageChange", ["none"]] call _thisFunc;
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
    case ("handleImageChange"):
	{
		_params params ["_mode"];
        private _imagesFolder = QPATHTOFOLDER(dialogues\textures\banner);
        private _countImages = count _images;
        private _currentImage = _display getVariable ["currentImage", 0];
        private _newImage = _currentImage;
        if (_mode == "forward") then {
            _newImage = _currentImage + 1;
        } else {
            if (_mode == "back") then {
                _newImage = _currentImage - 1;
            };
        };
        if ((_newImage < 0) || (_newImage >= _countImages)) then {_newImage = _currentImage};
        _display setVariable ["currentImage", _newImage];
        _numberText ctrlSetText format ["%1/%2", _newImage + 1, _countImages];
        (_images select _newImage) params ["_path", "_credits"];
        _picture ctrlSetText format ["%1\%2%3.jpg", _imagesFolder, ["submission_", ""] select (_newImage isEqualTo 0), _path];
        _fullCreditsText = if (_newImage == 0) then {
            format (["Use the forward and backward buttons to view images from the community servers.\n\nAntistasi Banner\nComposed by %1\nImages by %1, %2\nSoldiers from %3, %4"] + _credits);
        } else {
            format ["Credits: %1", _credits joinString ", "];
        };
        _picture ctrlSetTooltip _fullCreditsText;
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