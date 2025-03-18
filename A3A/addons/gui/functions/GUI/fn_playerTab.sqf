/*
Maintainer: Caleb Serafin, DoomMetal
    Handles updating and controls on the Player tab of the Main dialog.

Arguments:
    <STRING> Mode
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for control changes / Unscheduled for update
Public: No
Dependencies:
    None

Example:
    ["update"] spawn FUNC(playerTab);

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","update"], ["_params",[]]];

switch (_mode) do
{
    case ("update"):
    {
        Trace("Updating Player tab");
        private _display = findDisplay A3A_IDD_MAINDIALOG;

        // Disable buttons for functions that are unavailable

        // Undercover
        private _undercoverButton = _display displayCtrl A3A_IDC_UNDERCOVERBUTTON;
        private _undercoverIcon = _display displayCtrl A3A_IDC_UNDERCOVERICON;
        ([] call A3A_fnc_canGoUndercover) params ["_canUndercover", "_reasonNotEnum", "_shortReasonNot", "_longReasonNot"];
        private _isUndercover = _reasonNotEnum == 2; // Already undercover
        if (_isUndercover) then {
            // TEMPORARILY DISABLED Due to undercover system not allowing going to "not undercover" without reporting the player for 30 minutes.
            // _undercoverButton ctrlEnable true;
            // _undercoverButton ctrlSetTooltip "";
            // _undercoverButton ctrlSetText "Go Overt";
            // _undercoverButton ctrlRemoveAllEventHandlers "MouseButtonClick";
            // _undercoverButton ctrlAddEventHandler ["MouseButtonClick", {player setCaptive false; ["update"] spawn FUNC(playerTab)}];
            // _undercoverIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            // _undercoverIcon ctrlSetTooltip "";
            // STAND IN CODE
            _undercoverButton ctrlEnable false;
            _undercoverButton ctrlSetTooltip "Already Undercover";
            _undercoverButton ctrlSetText "Go Undercover";
            _undercoverButton ctrlRemoveAllEventHandlers "MouseButtonClick";
            _undercoverButton ctrlAddEventHandler ["MouseButtonClick", {[] spawn {
                [] spawn A3A_fnc_goUndercover;
                sleep 2;  // https://github.com/official-antistasi-community/A3-Antistasi/pull/3229#issuecomment-2110708172
                ["update"] spawn FUNC(playerTab);
            }}];
            _undercoverIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _undercoverIcon ctrlSetTooltip "Already Undercover";
        } else {
            if (_canUndercover) then {
                _undercoverButton ctrlEnable true;
                _undercoverButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_undercover";
                _undercoverButton ctrlSetText localize "STR_antistasi_dialogs_main_undercover";
                _undercoverButton ctrlRemoveAllEventHandlers "MouseButtonClick";
                _undercoverButton ctrlAddEventHandler ["MouseButtonClick", {[] spawn {
                    [] spawn A3A_fnc_goUndercover;
                    sleep 2;  // https://github.com/official-antistasi-community/A3-Antistasi/pull/3229#issuecomment-2110708172
                    ["update"] spawn FUNC(playerTab)
                }}];
                _undercoverIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
                _undercoverIcon ctrlSetTooltip localize "STR_antistasi_dialogs_main_undercover";
            } else {
                _undercoverButton ctrlEnable false;
                _undercoverButton ctrlSetTooltip (_shortReasonNot);
                _undercoverButton ctrlSetText localize "STR_antistasi_dialogs_main_undercover";
                _undercoverButton ctrlRemoveAllEventHandlers "MouseButtonClick";
                _undercoverIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
                _undercoverIcon ctrlSetTooltip (_shortReasonNot);
            };
        };

        // Fast travel
        private _fastTravelButton = _display displayCtrl A3A_IDC_FASTTRAVELBUTTON;
        private _fastTravelIcon = _display displayCtrl A3A_IDC_FASTTRAVELICON;
        [player, player] call A3A_fnc_canFastTravel params ["_isFastTravelAllowed","_fastTravelBlockers"];
        if (_isFastTravelAllowed) then {
            _fastTravelButton ctrlEnable true;
            _fastTravelButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_fast_travel_tooltip";
            _fastTravelIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            _fastTravelIcon ctrlSetTooltip localize "STR_antistasi_dialogs_main_fast_travel_tooltip";

        } else {
            _fastTravelButton ctrlEnable false;
            _fastTravelButton ctrlSetTooltip (_fastTravelBlockers joinString ", ");
            _fastTravelIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _fastTravelIcon ctrlSetTooltip (_fastTravelBlockers joinString ", ");
        };

        // Construct
        private _constructButton = _display displayCtrl A3A_IDC_CONSTRUCTBUTTON;
        private _constructIcon = _display displayCtrl A3A_IDC_CONSTRUCTICON;
        private _canBuild = [false,"Walk here"];// [] call A3A_fnc_canBuild;  // ToDo define.
        if (_canBuild # 0) then
        {
            _constructButton ctrlEnable true;
            _constructButton ctrlSetTooltip "";
            _constructIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            _constructIcon ctrlSetTooltip "";
        } else {
            _constructButton ctrlEnable false;
            _constructButton ctrlSetTooltip (_canBuild # 1);
            _constructIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _constructIcon ctrlSetTooltip (_canBuild # 1);
        };

        // AI Management
        // TODO UI-update: split checks to A3A_fnc_canManageAI
        _aiManagementTooltipText = "";
        _canManageAi = false;

        // Check if AI Management is available
        switch (true) do
        {
            case !(leader player == player):
            {
                _aiManagementTooltipText = localize "STR_antistasi_dialogs_main_ai_management_sl_tooltip";
            };

            case ({!isPlayer _x} count units group player < 1):
            {
                _aiManagementTooltipText = localize "STR_antistasi_dialogs_main_ai_management_no_ai_tooltip";
            };

            default
            {
                _canManageAi = true;
            };
        };

        private _aiManagementButton = _display displayCtrl A3A_IDC_AIMANAGEMENTBUTTON;
        private _aiManagementIcon = _display displayCtrl A3A_IDC_AIMANAGEMENTICON;

        if (_canManageAi) then {
            _aiManagementButton ctrlEnable true;
            _aiManagementButton ctrlSetTooltip "";
            _aiManagementIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
        } else {
            _aiManagementButton ctrlEnable false;
            _aiManagementButton ctrlSetTooltip _aiManagementTooltipText;
            _aiManagementIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
        };


        // Player info/stats section

        private _playerNameText = _display displayCtrl A3A_IDC_PLAYERNAMETEXT;
        private _playerRankText = _display displayCtrl A3A_IDC_PLAYERRANKTEXT;
        private _playerRankPicture = _display displayCtrl A3A_IDC_PLAYERRANKPICTURE;
        private _aliveText = _display displayCtrl A3A_IDC_ALIVETEXT;
        private _missionsText = _display displayCtrl A3A_IDC_MISSIONSTEXT;
        private _killsText = _display displayCtrl A3A_IDC_KILLSTEXT;
        private _commanderPicture = _display displayCtrl A3A_IDC_COMMANDERPICTURE;
        private _commanderText = _display displayCtrl A3A_IDC_COMMANDERTEXT;
        private _commanderButton = _display displayCtrl A3A_IDC_COMMANDERBUTTON;
        private _moneyText = _display displayCtrl A3A_IDC_MONEYTEXT;

        _playerNameText ctrlSetText name player;

        _playerRankText ctrlSetText ([player, "displayName"] call BIS_fnc_rankParams);
        _playerRankPicture ctrlSetText ([player, "texture"] call BIS_fnc_rankParams);

        private _time = time; // TODO UI-update: get time at session start, not mission start, aka after you've loaded in, and on respawns etc...
        _aliveText ctrlSetText format [[_time,1,1,false,2,false,true] call A3A_fnc_timeSpan_format];

        // TODO UI-update: Make function for getting num of completed missions
        private _missions = 0;
        // private _missions = player getVariable "missionsCompleted";
        _missionsText ctrlSetText str _missions;

        // TODO UI-update: Make function for getting number of kills
        private _kills = 0;
        // private _kills = player getVariable "kills";
        _killsText ctrlSetText str _kills;

        // Update commander icon/text/button
        // TODO UI-update: Add member check
        if (theBoss == player) then {
            // Player is commander
            // Update icon
            _commanderPicture ctrlSetText A3A_Icon_PlayerCommander;
            _commanderPicture ctrlSetTextColor ([A3A_COLOR_COMMANDER] call FUNC(configColorToArray));
            // Update text
            _commanderText ctrlSetText localize "STR_antistasi_dialogs_main_commander_text_commander";
            _commanderText ctrlSetTextColor ([A3A_COLOR_COMMANDER] call FUNC(configColorToArray));
            // Update button
            _commanderButton ctrlSetText localize "STR_antistasi_dialogs_main_commander_button_resign";
        } else {
            if (player getVariable ["eligible", false]) then {
                // Player is eligible for commander
                // Update icon
                _commanderPicture ctrlSetText A3A_Icon_PlayerEligible;
                _commanderPicture ctrlSetTextColor ([A3A_COLOR_ELIGIBLE] call FUNC(configColorToArray));
                // Update text
                _commanderText ctrlSetText localize "STR_antistasi_dialogs_main_commander_text_eligible";
                _commanderText ctrlSetTextColor ([A3A_COLOR_ELIGIBLE] call FUNC(configColorToArray));
                // Update button
                _commanderButton ctrlSetText localize "STR_antistasi_dialogs_main_commander_button_set_ineligible";
            } else {
                // Player is not eligible for commander
                // Update icon
                _commanderPicture ctrlSetText A3A_Icon_PlayerIneligible;
                _commanderPicture ctrlSetTextColor ([A3A_COLOR_INELIGIBLE] call FUNC(configColorToArray));
                // Update text
                _commanderText ctrlSetText localize "STR_antistasi_dialogs_main_commander_text_ineligible";
                _commanderText ctrlSetTextColor ([A3A_COLOR_INELIGIBLE] call FUNC(configColorToArray));
                // Update button
                _commanderButton ctrlSetText localize "STR_antistasi_dialogs_main_commander_button_set_eligible";
            };

        };

        // Update money
        private _money = player getVariable "moneyX";
        _moneyText ctrlSetText format[localize "STR_antistasi_dialogs_main_player_money_text", _money];

        // Vehicle section
        private _vehicleGroup = _display displayCtrl A3A_IDC_PLAYERVEHICLEGROUP;
        private _noVehicleGroup = _display displayCtrl A3A_IDC_NOVEHICLEGROUP;

        // Vehicle section is only available to members
        if ([player] call A3A_fnc_isMember) then {

            // Attempt to get vehicle from cursorObject
            _vehicle = cursorObject; // was cursorTarget
            // TODO UI-update: Add fallback to select the closest eligible vehicle in sight
            // TODO UI-update: Add check for distance

            if !(isNull _vehicle) then {
                // Check if vehicle is eligible for garage / sell, not a dude or house etc.
                if (_vehicle isKindOf "Air" or _vehicle isKindOf "LandVehicle") then {
                    private _className = typeOf _vehicle;
                    private _configClass = configFile >> "CfgVehicles" >> _className;
                    private _displayName = getText (_configClass >> "displayName");
                    private _editorPreview = getText (_configClass >> "editorPreview");

                    private _vehicleNameLabel = _display displayCtrl A3A_IDC_VEHICLENAMELABEL;
                    _vehicleNameLabel ctrlSetText _displayName;
                    // For some reason the text control becomes active showing an ugly
                    // white border, we disable it here to avoid that
                    _vehicleNameLabel ctrlEnable false;

                    private _vehiclePicture = _display displayCtrl A3A_IDC_VEHICLEPICTURE;
                    _vehiclePicture ctrlSetText _editorPreview;

                    // TODO UI-update: Disable garage, sell and add to air support buttons
                    // if player is not in range of a friendly location

                    // Change label on lock/unlock depending on vehicle lock state
                    // To be removed, vehicle locking isn't a thing anymore
                    /* private _unlockVehicleButton = _display displayCtrl A3A_IDC_UNLOCKVEHICLEBUTTON;
                    private _vehicleOwner = _vehicle getVariable ["ownerX", nil];
                    private _vehicleIsLocked = !(isNil "_vehicleOwner");
                    if (_vehicleIsLocked) then {
                        _unlockVehicleButton ctrlSetText localize "STR_antistasi_dialogs_main_unlock_vehicle";
                        _unlockVehicleButton ctrlSetTooltip format ["Vehicle is locked by %1", _vehicleOwner]; // TODO UI-update: localize
                    } else {
                        _unlockVehicleButton ctrlSetText localize "STR_antistasi_dialogs_main_lock_vehicle";
                        _unlockVehicleButton ctrlSetTooltip "";
                    }; */

                    if (player == theBoss) then {
                        // Disable "add to air support" button if vehicle is not eligible
                        if !(_vehicle isKindOf "Air") then {
                            private _addToAirSupportButton = _display displayCtrl A3A_IDC_ADDTOAIRSUPPORTBUTTON;
                            _addToAirSupportButton ctrlEnable false;
                            _addToAirSupportButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_not_eligible_vehicle_tooltip";
                        };
                    } else {
                        // Enable only "garage" and "lock/unlock" buttons to regular players
                        private _sellVehicleButton = _display displayCtrl A3A_IDC_SELLVEHICLEBUTTON;
                        _sellVehicleButton ctrlEnable false;
                        _sellVehicleButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_only_tooltip";
                        private _addToAirSupportButton = _display displayCtrl A3A_IDC_ADDTOAIRSUPPORTBUTTON;
                        _addToAirSupportButton ctrlEnable false;
                        _addToAirSupportButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_only_tooltip";
                    };
                    // Show vehicle group
                    _noVehicleGroup ctrlShow false;
                    _vehicleGroup ctrlShow true;
                } else {
                    // Show no vehicle message
                    _vehicleGroup ctrlShow false;
                    _noVehicleGroup ctrlShow true;
                };
            } else {
                // Show no vehicle message
                _vehicleGroup ctrlShow false;
                _noVehicleGroup ctrlShow true;
            };
        } else {
            // Show not member message
            _vehicleGroup ctrlShow false;
            _noVehicleGroup ctrlShow true;
            private _noVehicleText = _display displayCtrl A3A_IDC_NOVEHICLETEXT;
            _noVehicleText ctrlSetText localize "STR_antistasi_dialogs_main_members_only";
        };
    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Player tab mode does not exist: %1", _mode);
    };
};
