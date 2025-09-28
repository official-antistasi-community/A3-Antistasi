/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Handles all interaction to the Role Selection menu.
	Should only really be called from buttons

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

params ["_mode", "_params"];

Debug_1("Role select dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_ROLESELECTDIALOG;

private _bannerImage = _display displayCtrl A3A_IDC_ROLEBANNERPICTURE;
private _infoLine1 = _display displayCtrl A3A_IDC_ROLEINFOTEXT1;
private _infoLine2 = _display displayCtrl A3A_IDC_ROLEINFOTEXT2;
private _infoLine3 = _display displayCtrl A3A_IDC_ROLEINFOTEXT3;
private _infoLine4 = _display displayCtrl A3A_IDC_ROLEINFOTEXT4;
private _mainInfoButton = _display displayCtrl A3A_IDC_ROLEMAININFOBUTTON;
private _setRoleButton = _display displayCtrl A3A_IDC_ROLEINFOSELECTROLE;
private _listOfIcons = [
	["rifleman", A3A_IDC_ROLERIFLEMANICON],
	["autorifleman", A3A_IDC_ROLEAUTORIFLEMANICON],
	["grenadier", A3A_IDC_ROLEGRENADIERICON],
	["medic", A3A_IDC_ROLEMEDICICON],
	["engineer", A3A_IDC_ROLEENGINEERICON],
	["teamleader", A3A_IDC_ROLETLICON],
	["commander", A3A_IDC_ROLECOMMANDICON]
];

switch (_mode) do
{
    case ("onLoad"):
    {
		["openInfo"] call FUNC(roleSelectDialog);
    };
	case ("update"):
	{
		{
			_x params ["_roleName", "_icon"];
			_icon = _display displayCtrl _icon;
			private _currentCount = {_x getVariable ["A3A_Role", "none"] == _roleName} count allPlayers;
			private _maxCount = [_roleName] call FUNCMAIN(getRoleCap);
			if (_currentCount < _maxCount || {_roleName == "rifleman" || {_roleName == "commander" && {theBoss isEqualTo objNull}}}) then {
				_icon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            	_icon ctrlSetTooltip "";
			} else {
				_icon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            	_icon ctrlSetTooltip localize "STR_antistasi_dialogs_roleselect_cannotTakeRoleFull";
			};
		} forEach _listOfIcons;
	};
    case ("openRole"):
    {
		["update"] call A3A_GUI_fnc_roleSelectDialog;

		_infoLine2 ctrlShow true;
		_infoLine3 ctrlShow true;
		_infoLine4 ctrlShow false;
		_mainInfoButton ctrlShow true;
		_setRoleButton ctrlShow true;
        private _roleName = _params#0;
		_display setVariable ["displayState",_roleName];

		private _imagePath = format ["x\A3A\addons\GUI\dialogues\textures\banner_%1.jpg",_roleName];
		_bannerImage ctrlSetText _imagePath;
		private _currentCount = {_x getVariable ["A3A_Role", "none"] == _roleName} count allPlayers;
		private _maxCount = [_roleName] call FUNCMAIN(getRoleCap);
		private _firstLineText = localize format ["STR_antistasi_dialogs_roleselect_info_%1", _roleName];
		private _secondLineText = localize format ["STR_antistasi_dialogs_roleselect_utility_%1", _roleName];
		private _fullSlotsText = format [localize "STR_antistasi_dialogs_roleselect_slots", localize format ["STR_antistasi_dialogs_roleselect_role_%1",_roleName], _currentCount, str _maxCount];
		private _slotExplanation = localize "STR_antistasi_dialogs_roleselect_capExplanation";
		if (tolower _roleName in ["rifleman", "commander"]) then { // special counting cases
			if (_roleName == "rifleman") then {
				_fullSlotsText = format [localize "STR_antistasi_dialogs_roleselect_slotsRifleman",_currentCount];
				_slotExplanation = localize "STR_antistasi_dialogs_roleselect_capExplanationRifleman";
			} else {
				if (player == theBoss) then {
					_fullSlotsText = localize "STR_antistasi_dialogs_roleselect_slotsCommanderSelf";
				} else {
					_fullSlotsText = format [localize "STR_antistasi_dialogs_roleselect_slotsCommander",name theBoss];
				};
				_slotExplanation = localize "STR_antistasi_dialogs_roleselect_capExplanationCommander";
			};
		};
		if ((_currentCount >= _maxCount || (_roleName == "commander")) && {_roleName != "rifleman"}) then {
			_setRoleButton ctrlEnable false;
			if (_roleName == "commander") then {
				_setRoleButton ctrlSetTooltip localize "STR_antistasi_dialogs_roleselect_capExplanationCommander";
			} else {
				_setRoleButton ctrlSetTooltip localize "STR_antistasi_dialogs_roleselect_cannotTakeRoleFull";
			};
		} else {
			_setRoleButton ctrlEnable true;
			_setRoleButton ctrlSetTooltip "";
		};
		
		_infoLine1 ctrlSetText _firstLineText;
		_infoLine2 ctrlSetText _secondLineText;
		_infoLine3 ctrlSetText _fullSlotsText;
		_infoLine3 ctrlSetTooltip _slotExplanation;
    };
	
	case ("openInfo"):
	{
		["update"] call A3A_GUI_fnc_roleSelectDialog;

		_infoLine2 ctrlShow false;
		_infoLine3 ctrlShow false;
		_infoLine4 ctrlShow true;
		_mainInfoButton ctrlShow false;
		_setRoleButton ctrlShow false;
		_display setVariable ["displayState","info"];

		_bannerImage ctrlSetText A3A_MainBannerImage; // TODO DEFINE
		_infoLine1 ctrlSetText (localize "STR_antistasi_dialogs_roleselect_welcome");
		private _playerRole = player getVariable ["A3A_Role","none"];
		if (_playerRole == "none") then {
			_infoLine4 ctrlSetText (localize "STR_antistasi_dialogs_roleselect_welcomeNew");
		} else {
			private _text = format [localize "STR_antistasi_dialogs_roleselect_hasRole", localize format ["STR_antistasi_dialogs_roleselect_role_%1", _playerRole]];
			if (player isEqualTo theBoss) then {
				_text = [_text, localize "STR_antistasi_dialogs_roleselect_isCommander"] joinString " ";
			};
			_infoLine4 ctrlSetText _text;
		};
		// Welcome to Antisasi! To get started, select a role from the list on the left and use "set role". You can revisit this screen any time by opening the Battle Menu with Y.
		// Each role has different traits and quirks, so it is recommended to start as a rifleman if you are new to the game.
		// Your current role is: %1.
		// However, since you are the commander, you have the traits listed in the "Commander" tab until you resign.
	};
	case ("selectRole"):
	{
		private _roleName = _display getVariable ["displayState","none"];
		
		[_roleName] call FUNCMAIN(unitTraits);
		closeDialog 0;
	};
	case ("closeDialog"):
	{
		// if player leaves, they become rifleman by default
		if (player getVariable ["A3A_Role","none"] == "none") then {
			["rifleman"] call FUNCMAIN(unitTraits);
		};
		closeDialog 0;
	};
};

