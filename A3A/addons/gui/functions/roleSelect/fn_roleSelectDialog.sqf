/*
Copyright Ian Feickert, used with permission by the Antistasi Community project
Replication and distribution of this file or parts of it without written permission by the author is strictly prohibited.
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
private _infoLine2 = _display displayCtrl A3A_IDC_ROLEINFOTEXT1;
private _infoLine3 = _display displayCtrl A3A_IDC_ROLEINFOTEXT1;
private _mainInfoButton = _display displayCtrl A3A_IDC_ROLEMAININFOBUTTON;
private _setRoleButton = _display displayCtrl A3A_IDC_ROLESETROLEBUTTON;

switch (_mode) do
{
    case ("onLoad"):
    {
        // Open main info page
		// but first! double check player count. dont want to bother new players with an intro screen when they're command by default
		// actually we can do this when we're spawning the dialog
		/*
		_allPlayers = (allPlayers - (entities "HeadlessClient_F"));
		if (count _allPlayers <= 1) exitWith {
			_allPlayers#0 setVariable ["A3A_Role", "rifleman", true];
			["closeDialog"] call
		};
		*/
		["openInfo"] call FUNC(roleSelectDialog);
    };

    case ("openRole"):
    {
		_mainInfoButton ctrlShow true;
		_setRoleButton ctrlShow true;


        _roleName = _params#0;
		_display setVariable ["displayState",_roleName];
		_imagePath = format ["x\A3A\addons\GUI\dialogues\textures\banner_%1.paa",_roleName];
		_bannerImage ctrlSetText _imageName;
		_currentCount = allPlayers count {getVariable ["A3A_Role", "none"] == _roleName};
		_maxCount = [_roleName] call FUNCMAIN(getRoleCap);
		_firstLineText = localize format ["STR_antistasi_dialogs_roleselect_info_%1", _roleName];
		_secondLineText = localize format ["STR_antistasi_dialogs_roleselect_utility_%1", _roleName];
		if (_roleName in ["rifleman, commander"]) then { // special counting cases
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
		} else {
			_fullSlotsText = format [localize "STR_antistasi_dialogs_roleselect_slots", format ["STR_antistasi_dialogs_roleselect_role_%1",_roleName], _currentCount, str _maxCount];
			_slotExplanation = localize "STR_antistasi_dialogs_roleselect_capExplanation";
		};
		if (_currentCount >= _maxCount || (_roleName == "commander")) then {
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
		_mainInfoButton ctrlShow false;
		_setRoleButton ctrlShow false;
		_display setVariable ["displayState","info"];

		_bannerImage ctrlSetText MainBannerImage; // TODO DEFINE
		_infoLine1 ctrlSetText (localize "STR_antistasi_dialogs_roleselect_welcome");
		private _playerRole = player getVariable ["A3A_Role","none"];
		if (_playerRole == "none") then {
			_infoLine2 ctrlSetText (localize "STR_antistasi_dialogs_roleselect_welcomeNew");
		} else {
			private _text = format [localize "STR_antistasi_dialogs_roleselect_hasRole", localize format ["STR_antistasi_dialogs_roleselect_role_%1", _playerRole]];
			if (player isEqualTo theBoss) then {
				_text = [_text, localize "STR_antistasi_dialogs_roleselect_isCommander"] joinString " ";
			};
			_infoLine2 ctrlSetText _text;
		};
		_infoLine3 ctrlSetText "";
		_infoLine3 ctrlSetTooltip "";
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

