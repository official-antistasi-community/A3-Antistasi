/*
Maintainer: Caleb Serafin, DoomMetal
    Handles updating and controls on the Commander tab of the Main dialog.

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
    ["update"] call FUNC(commanderTab);

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","update"], ["_params",[]]];

// Get display and common controls
private _display = findDisplay A3A_IDD_MAINDIALOG;
private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
private _multipleGroupsView = _display displayCtrl A3A_IDC_HCMULTIPLEGROUPSVIEW;
private _multipleGroupsBackground = _display displayCtrl A3A_IDC_HCMULTIPLEGROUPSBACKGROUND;
private _multipleGroupsLabel = _display displayCtrl A3A_IDC_HCMULTIPLEGROUPSLABEL;
private _singleGroupView = _display displayCtrl A3A_IDC_HCSINGLEGROUPVIEW;
private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;
private _noRadioControlsGroup = _display displayCtrl A3A_IDC_NORADIOCONTROLSGROUP;
private _garbageCleanControlsGroup = _display displayCtrl A3A_IDC_GARBAGECLEANCONTROLSGROUP;
private _airSupportButton = _display displayCtrl A3A_IDC_AIRSUPPORTBUTTON;
private _garbageCleanButton = _display displayCtrl A3A_IDC_GARBAGECLEANBUTTON;

switch (_mode) do
{
    case ("update"):
    {
        Trace("Updating Commander tab");

        // Show map if not already visible
        if (!ctrlShown _commanderMap) then {_commanderMap ctrlShow true;};

        // Hide all views initially
        _multipleGroupsView ctrlShow false;
        _multipleGroupsBackground ctrlShow false;
        _multipleGroupsLabel ctrlShow false;
        _singleGroupView ctrlShow false;
        _fireMissionControlsGroup ctrlShow false;
        _noRadioControlsGroup ctrlShow false;
        _garbageCleanControlsGroup ctrlShow false;

        // Show Air Support and Garbage Clean buttons
        _airSupportButton ctrlShow true;
        _garbageCleanButton ctrlShow true;

        // Check for radio, most of this isn't usable without one
        if !([player] call A3A_fnc_hasRadio) exitWith
        {
            _noRadioControlsGroup ctrlShow true;
            _airSupportButton ctrlEnable false;
            _airSupportButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_no_radio";
        };

        // Initialize fire mission vars
        _fireMissionControlsGroup setVariable ["heSelected", true];
        _fireMissionControlsGroup setVariable ["pointSelected", true];
        _fireMissionControlsGroup setVariable ["roundsNumber", 1];
        _fireMissionControlsGroup setVariable ["availableHeRounds", 0];
        _fireMissionControlsGroup setVariable ["availableSmokeRounds", 0];
        _fireMissionControlsGroup setVariable ["startPos", nil];
        _fireMissionControlsGroup setVariable ["endPos", nil];

        // Set map to group selection mode
        _commanderMap setVariable ["selectFireMissionPos", false];
        _commanderMap setVariable ["selectFireMissionEndPos", false];

        // Check for selected groups
        private _selectedGroup = _commanderMap getVariable ["selectedGroup", grpNull];
        if !(_selectedGroup isEqualTo grpNull) then
        {
            // If a group is selected show the single group view
            ["updateSingleGroupView"] call FUNC(commanderTab);
        } else {
            // If no group is selected show the multiple groups view
            ["updateMultipleGroupsView"] call FUNC(commanderTab);
        };
    };

    case ("updateSingleGroupView"):
    {
        _multipleGroupsView ctrlShow false;
        _multipleGroupsBackground ctrlShow false;
        _multipleGroupsLabel ctrlShow false;
        _singleGroupView ctrlShow true;

        // Hide fire mission button initially
        private _fireMissionButton = _display displayCtrl A3A_IDC_HCFIREMISSIONBUTTON;
        _fireMissionButton ctrlShow false;

        private _groupInfo = [_selectedGroup] call FUNC(getGroupInfo);
        _groupInfo params [
            "_group",
            "_groupID",
            "_groupLeader",
            "_units",
            "_aliveUnits",
            "_ableToCombat",
            "_task",
            "_combatMode",
            "_hasOperativeMedic",
            "_hasAt",
            "_hasAa",
            "_hasMortar",
            "_mortarDeployed",
            "_hasStatic",
            "_staticDeployed",
            "_groupVehicle",
            "_groupIcon",
            "_groupIconColor"
        ];

        private _position = getPos leader _group;

        // Update select marker
        _commanderMap setVariable ["selectMarkerData", [_position]];

        // Update controls
        private _groupNameText = _display displayCtrl A3A_IDC_HCGROUPNAME;
        _groupNameText ctrlSetText _groupID;

        private _groupFastTravelButton = _display displayCtrl A3A_IDC_HCFASTTRAVELBUTTON;
        [player, _group] call A3A_fnc_canFastTravel params ["_isFastTravelAllowed","_fastTravelBlockers"];
        if (_isFastTravelAllowed) then {
            _groupFastTravelButton ctrlEnable true;
            // ShortcutButtons doesn't change texture color when disabled so we have to use fade
            _groupFastTravelButton ctrlSetFade 0;
            _groupFastTravelButton ctrlCommit 0;
            _groupFastTravelButton ctrlSetTooltip ""; // TODO: descriptive tooltip?
        } else {
            _groupFastTravelButton ctrlEnable false;
            // ShortcutButtons doesn't change texture color when disabled so we have to use fade
            _groupFastTravelButton ctrlSetFade 0.5;
            _groupFastTravelButton ctrlCommit 0;
            _groupFastTravelButton ctrlSetTooltip (_fastTravelBlockers joinString ", ");
        };

        private _groupCountText = _display displayCtrl A3A_IDC_HCGROUPCOUNT;
        _groupCountText ctrlSetText format ["%1 / %2", _ableToCombat, _aliveUnits];

        // Delete any previous status icons
        private _iconsControlsGroup = _display displayCtrl A3A_IDC_HCGROUPSTATUSICONS;
        {
            ctrlDelete _x;
        } forEach allControls _iconsControlsGroup;

        // Get the status icons to display
        private _statusIcons = [];
        if _hasOperativeMedic then {_statusIcons pushBack "medic"};
        if _hasAt then {_statusIcons pushBack "at"};
        if _hasAa then {_statusIcons pushBack "aa"};
        if _hasMortar then {
            if _mortarDeployed then {
                _statusIcons pushBack "mortarDeployed";

                // also show fire mission button
                _fireMissionButton ctrlShow true;
            } else {
                _statusIcons pushBack "mortar";

                // show fire mission button, disable and show tooltip
                _fireMissionButton ctrlShow true;
                _fireMissionButton ctrlEnable false;
                _fireMissionButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_hc_fire_mission_not_deployed_tooltip";
            };
        };
        if _hasStatic then {
                if _staticDeployed then {
                _statusIcons pushBack "staticDeployed";
            } else {
                _statusIcons pushBack "static";
            };
        };

        // Create icons, right justified
        {
            private _iconXpos = (30 * GRID_W) - ((count _statusIcons) * 5 * GRID_W) + (_forEachIndex * 5 * GRID_W);
            private _iconPath = "";
            private _toolTipText = "";
            private _iconFade = 0;
            switch (_x) do {
                case ("medic"): {
                    _iconPath = A3A_Icon_Heal;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_medic";
                };

                case ("at"): {
                    _iconPath = A3A_Icon_Has_AT;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_at";
                };

                case ("aa"): {
                    _iconPath = A3A_Icon_Has_AA;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_aa";
                };

                case ("mortarDeployed"): {
                    _iconPath = A3A_Icon_Has_Mortar;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_mortar_deployed";
                };

                case ("mortar"): {
                    _iconPath = A3A_Icon_Has_Mortar;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_mortar_not_deployed";
                    _iconFade = 0.25;
                };

                case ("staticDeployed"): {
                    _iconPath = A3A_Icon_Has_Static;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_static_weapon_deployed";
                };

                case ("static"): {
                    _iconPath = A3A_Icon_Has_Static;
                    _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_static_weapon_not_deployed";
                    _iconFade = 0.25;
                };
            };

            private _icon = _display ctrlCreate ["A3A_Picture", -1, _iconsControlsGroup];
            _icon ctrlSetPosition [_iconXpos, 0, 4 * GRID_W, 4 * GRID_H];
            _icon ctrlSetText _iconPath;
            _icon ctrlSetTooltip _toolTipText;
            _icon ctrlSetFade _iconFade;
            _icon ctrlCommit 0;
        } forEach _statusIcons;

        private _groupCombatModeText = _display displayCtrl A3A_IDC_HCGROUPCOMBATMODE;
        _groupCombatModeText ctrlSetText _combatMode;

        private _groupVehicleText = _display displayCtrl A3A_IDC_HCGROUPVEHICLE;
        _groupVehicleText ctrlSetStructuredText parseText "<t align='right'>Super long vehicle name bla bla</t>"; // TODO UI-update: Update with actual vehicle name

        // Pan to group location
        _commanderMap ctrlMapAnimAdd [0.2, ctrlMapScale _commanderMap, getPos _groupLeader];
        ctrlMapAnimCommit _commanderMap;
    };

    case ("updateMultipleGroupsView"):
    {
        _singleGroupView ctrlShow false;
        _multipleGroupsView ctrlShow true;
        _multipleGroupsBackground ctrlShow true;
        _multipleGroupsLabel ctrlShow true;

        // Get data
        private _hcGroupData = _commanderMap getVariable "hcGroupData";

        // Generate list of groups...

        // Clear controlsGroup first
        {
            ctrlDelete _x;
        } forEach allControls _multipleGroupsView;

        {
            // Get group info
            _x params [
                "_group",
                "_groupID",
                "_groupLeader",
                "_units",
                "_aliveUnits",
                "_ableToCombat",
                "_task",
                "_combatMode",
                "_hasOperativeMedic",
                "_hasAt",
                "_hasAa",
                "_hasMortar",
                "_mortarDeployed",
                "_hasStatic",
                "_staticDeployed",
                "_groupVehicle",
                "_groupIcon",
                "_groupIconColor"
            ];

            private _position = getPos leader _group;

            // Hide select marker
            _commanderMap setVariable ["selectMarkerData", []];

            // Set up controls
            private _itemYpos = 16 * _forEachIndex * GRID_H;
            private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _multipleGroupsView];
            _itemControlsGroup ctrlSetPosition [0, _itemYpos, 54 * GRID_W, 14 * GRID_H];
            _itemControlsGroup ctrlCommit 0;

            // Background
            private _itemBackground = _display ctrlCreate ["A3A_Background", -1, _itemControlsGroup];
            _itemBackground ctrlSetPosition [0, 0, 54 * GRID_W, 14 * GRID_H];
            _itemBackground ctrlCommit 0;

            // Name label / back button
            private _groupNameLabel = _display ctrlCreate ["A3A_Button", -1, _itemControlsGroup];
            _groupNameLabel setVariable ["groupToSelect", _group];
            _groupNameLabel ctrlAddEventHandler ["ButtonClick", {
                params ["_control"];
                private _display = findDisplay A3A_IDD_MAINDIALOG;
                private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
                _commanderMap setVariable ["selectedGroup", _control getVariable "groupToSelect"];
                ["update"] call FUNC(commanderTab);
            }];
            _groupNameLabel ctrlSetPosition [0, 0, 54 * GRID_W, 6 * GRID_H];
            _groupNameLabel ctrlSetBackgroundColor [0,0,0,1];
            _groupNameLabel ctrlSetText _groupID;
            _groupNameLabel ctrlCommit 0;

            // Group icon
            private _ctrlGroupIcon = _display ctrlCreate ["A3A_Picture", -1, _itemControlsGroup];
            _ctrlGroupIcon ctrlSetPosition [0,0, 6 * GRID_W, 6 * GRID_H];
            _ctrlGroupIcon ctrlSetText ("\A3\ui_f\data\Map\Markers\NATO\" + _groupIcon);
            _ctrlGroupIcon ctrlSetTextColor _groupIconColor;
            _ctrlGroupIcon ctrlCommit 0;

            // Group count, able to combat / alive
            private _groupCountIcon = _display ctrlCreate ["A3A_Picture", -1, _itemControlsGroup];
            _groupCountIcon ctrlSetPosition [2 * GRID_W, 8 * GRID_H, 4 * GRID_W, 4 * GRID_H];
            _groupCountIcon ctrlSetText A3A_Icon_GroupUnitCount;
            _groupCountIcon ctrlSetTooltip localize "STR_antistasi_dialogs_main_hc_unit_count_tooltip";
            _groupCountIcon ctrlCommit 0;

            private _groupCountText = _display ctrlCreate ["A3A_Text", -1, _itemControlsGroup];
            _groupCountText ctrlSetPosition [6 * GRID_W, 8 * GRID_H, 16 * GRID_W, 4 * GRID_H];
            _groupCountText ctrlSetText format["%1 / %2", _aliveUnits, count _units];
            _groupCountText ctrlSetTooltip localize "STR_antistasi_dialogs_main_hc_unit_count_tooltip";
            _groupCountText ctrlCommit 0;

            // Subgroup for status icons
            private _iconsControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _itemControlsGroup];
            _iconsControlsGroup ctrlSetPosition [22 * GRID_W, 8 * GRID_H, 30 * GRID_W, 6 * GRID_H];
            _iconsControlsGroup ctrlCommit 0;

            // Get the status icons to display
            private _statusIcons = [];
            if _hasOperativeMedic then {_statusIcons pushBack "medic"};
            if _hasAt then {_statusIcons pushBack "at"};
            if _hasAa then {_statusIcons pushBack "aa"};
            if _hasMortar then {
                if _mortarDeployed then {
                    _statusIcons pushBack "mortarDeployed";
                } else {
                    _statusIcons pushBack "mortar";
                };
            };
            if _hasStatic then {
                if _staticDeployed then {
                    _statusIcons pushBack "staticDeployed";
                } else {
                    _statusIcons pushBack "static";
                };
            };

            // Create icons, right justified
            {
                private _iconXpos = (30 * GRID_W) - ((count _statusIcons) * 5 * GRID_W) + (_forEachIndex * 5 * GRID_W);
                private _iconPath = "";
                private _toolTipText = "";
                switch (_x) do {
                    case ("medic"): {
                        _iconPath = "\A3\ui_f\data\igui\cfg\actions\heal_ca.paa";
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_medic";
                    };

                    case ("at"): {
                        _iconPath = A3A_Icon_Has_AT;
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_at";
                    };

                    case ("aa"): {
                        _iconPath = A3A_Icon_Has_AA;
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_aa";
                    };

                    case ("mortarDeployed"): {
                        _iconPath = A3A_Icon_Has_Mortar;
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_mortar_deployed";
                    };

                    case ("mortar"): {
                        _iconPath = A3A_Icon_Has_Mortar;
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_mortar_not_deployed";
                    };

                    case ("staticDeployed"): {
                        _iconPath = A3A_Icon_Has_Static;
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_static_weapon_deployed";
                    };

                    case ("static"): {
                        _iconPath = A3A_Icon_Has_Static;
                        _toolTipText = localize "STR_antistasi_dialogs_main_hc_has_static_weapon_not_deployed";
                    };
                };

                private _icon = _display ctrlCreate ["A3A_Picture", -1, _iconsControlsGroup];
                _icon ctrlSetPosition [_iconXpos, 0, 4 * GRID_W, 4 * GRID_H];
                _icon ctrlSetText _iconPath;
                _icon ctrlSetTooltip _toolTipText;
                _icon ctrlCommit 0;
            } forEach _statusIcons;

        } forEach _hcGroupData;

        // If no high command groups show how to get them
        if (count _hcGroupData < 1) then
        {
            private _noHcGroupsText = _display ctrlCreate ["A3A_StructuredText", -1, _multipleGroupsView];
            _noHcGroupsText ctrlSetPosition [0, 10 * GRID_H, 54 * GRID_W, 14 * GRID_H];
            _noHcGroupsText ctrlSetStructuredText parseText localize "STR_antistasi_dialogs_main_hc_no_groups";
            _noHcGroupsText ctrlCommit 0;
        };
    };

    case ("updateFireMissionView"):
    {
        Trace("Updating Fire Mission View");
        private _display = findDisplay A3A_IDD_MAINDIALOG;

        // Hide group views
        private _multipleGroupsView = _display displayCtrl A3A_IDC_HCMULTIPLEGROUPSVIEW;
        private _singleGroupView = _display displayCtrl A3A_IDC_HCSINGLEGROUPVIEW;
        _multipleGroupsView ctrlShow false;
        _singleGroupView ctrlShow false;

        // Show fire mission view if not already shown
        private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;
        if !(ctrlShown _fireMissionControlsGroup) then {
            _fireMissionControlsGroup ctrlShow true;
        };


        // Update rounds count
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        private _units = units _group;

        SDKMortarHEMag;
        SDKMortarSmokeMag;

        private _heRoundsCount = 0;
        private _smokeRoundsCount = 0;

        private _checkedVehicles = [];

        {
            private _veh = vehicle _x;
            if ((_veh != _x) and (not(_veh in _checkedVehicles))) then
            {
                if (( "Artillery" in (getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "availableForSupportTypes")))) then
                {
                    if ((canFire _veh) and (alive _veh)) then
                    {
                        {
                            if (_x # 0 == SDKMortarHEMag) then
                            {
                                _heRoundsCount = _heRoundsCount + _x # 1;
                            };

                            if (_x # 0 == SDKMortarSmokeMag) then
                            {
                                _smokeRoundsCount = _smokeRoundsCount + _x # 1;
                            };
                        } forEach magazinesAmmo _veh;

                        _checkedVehicles pushBack _veh;
                    };
                };
            };
        } forEach _units;

        // TODO UI-update: check if unit is ready to fire etc, or do we already do that?

        _fireMissionControlsGroup setVariable ["availableHeRounds", _heRoundsCount];
        _fireMissionControlsGroup setVariable ["availableSmokeRounds", _smokeRoundsCount];

        private _heRoundsText = _display displayCtrl A3A_IDC_HEROUNDSTEXT;
        private _smokeRoundsText = _display displayCtrl A3A_IDC_SMOKEROUNDSTEXT;

        _heRoundsText ctrlSetText str _heRoundsCount;
        _smokeRoundsText ctrlSetText str _smokeRoundsCount;


        // States for selecting shell type, mission type and round counts are initialized
        // in update, we get them here
        private _heShell = _fireMissionControlsGroup getVariable ["heSelected", true];
        private _pointStrike = _fireMissionControlsGroup getVariable ["pointSelected", true];
        private _roundsCount = _fireMissionControlsGroup getVariable ["roundsNumber", 1];
        private _startPos = _fireMissionControlsGroup getVariable ["startPos", nil];
        private _endPos = _fireMissionControlsGroup getVariable ["endPos", nil];


        // Update controls based on what is selected
        private _heButton = _display displayCtrl A3A_IDC_HEBUTTON;
        private _smokeButton = _display displayCtrl A3A_IDC_SMOKEBUTTON;
        private _pointStrikeButton = _display displayCtrl A3A_IDC_POINTSTRIKEBUTTON;
        private _barrageButton = _display displayCtrl A3A_IDC_BARRAGEBUTTON;
        private _roundsControlsGroup = _display displayCtrl A3A_IDC_ROUNDSCONTROLSGROUP;
        private _roundsEditBox = _display displayCtrl A3A_IDC_ROUNDSEDITBOX;
        private _addRoundsButton = _display displayCtrl A3A_IDC_ADDROUNDSBUTTON;
        private _subRoundsButton = _display displayCtrl A3A_IDC_SUBROUNDSBUTTON;

        private _startPosControlsGroup = _display displayCtrl A3A_IDC_STARTPOSITIONCONTROLSGROUP;
        private _startPosLabel = _display displayCtrl A3A_IDC_STARTPOSITIONLABEL;
        private _startPosEditBox = _display displayCtrl A3A_IDC_STARTPOSITIONEDITBOX;

        private _endPosControlsGroup = _display displayCtrl A3A_IDC_ENDPOSITIONCONTROLSGROUP;
        private _endPosLabel = _display displayCtrl A3A_IDC_ENDPOSITIONLABEL;
        private _endPosEditBox = _display displayCtrl A3A_IDC_ENDPOSITIONEDITBOX;

        private _fireButton = _display displayCtrl A3A_IDC_FIREBUTTON;

        // Disable fire button initially
        _fireButton ctrlEnable false;

        if (_heShell) then
        {
            // HE
            _heButton ctrlEnable false;
            _smokeButton ctrlEnable true;

        } else {
            // Smoke
            _smokeButton ctrlEnable false;
            _heButton ctrlEnable true;
        };

        if (_pointStrike) then
        {
            // Point strike

            _pointStrikeButton ctrlEnable false;
            _barrageButton ctrlEnable true;

            // Change text on start position label
            _startPosLabel ctrlSetText localize "STR_antistasi_dialogs_main_hc_fire_mission_position_label";

            // Hide endPos controlsGroup
            _endPosControlsGroup ctrlShow false;

            // Enable rounds buttons, remove tooltips
            _addRoundsButton ctrlEnable true;
            _addRoundsButton ctrlSetTooltip "";
            _subRoundsButton ctrlEnable true;
            _subRoundsButton ctrlSetTooltip "";
            _roundsEditBox ctrlSetTooltip "";


        } else {
            // Barrage

            _barrageButton ctrlEnable false;
            _pointStrikeButton ctrlEnable true;

            // Show endPos controlsGroup
            _endPosControlsGroup ctrlShow true;

            // Change text on start position label
            _startPosLabel ctrlSetText localize "STR_antistasi_dialogs_main_hc_fire_mission_position_start_label";

            // Disable rounds buttons and editBox, show tooltip
            _tooltipText = localize "STR_antistasi_dialogs_main_hc_fire_mission_rounds_barrage_tooltip";
            _addRoundsButton ctrlEnable false;
            _addRoundsButton ctrlSetTooltip _tooltipText;
            _subRoundsButton ctrlEnable false;
            _subRoundsButton ctrlSetTooltip _tooltipText;
            _roundsEditBox ctrlSetTooltip _tooltipText;

            // If mission type is barrage and both positions are set, calculate number of rounds
            // One round per 10m
            // _rounds = round (_positionTel distance _positionTel2) / 10; // <- from Antistasi
            if (!isNil "_startPos" && !isNil "_endPos") then
            {
                _roundsCount = round ((_startPos distance _endPos) / 10);
            };
        };

        _roundsEditBox ctrlSetText str _roundsCount;

        // Update position editBoxes
        Trace("Updating fire mission position edit box...");
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        _selectFireMissionPos = _commanderMap getVariable ["selectFireMissionPos", false];
        _selectFireMissionEndPos = _commanderMap getVariable ["selectFireMissionEndPos", false];

        // Start pos
        switch (true) do
        {
            // Selecting position on map
            case (_selectFireMissionPos):
            {
                _startPosEditBox ctrlSetText localize "STR_antistasi_dialogs_main_hc_fire_mission_click_map";
            };

            // Position is already set
            case (!isNil "_startPos"):
            {
                private _gridPos = mapGridPosition _startPos;
                _startPosEditBox ctrlSetText _gridPos;
            };

            // No position set
            default
            {
                _startPosEditBox ctrlSetText localize "STR_antistasi_dialogs_main_hc_fire_mission_not_set";
            };
        };

        // End pos
        switch (true) do
        {
            case (_selectFireMissionEndPos):
            {
                _endPosEditBox ctrlSetText localize "STR_antistasi_dialogs_main_hc_fire_mission_click_map";
            };

            case (!isNil "_endPos"):
            {
                private _gridPos = mapGridPosition _endPos;
                _endPosEditBox ctrlSetText _gridPos;
            };

            default
            {
                _endPosEditBox ctrlSetText localize "STR_antistasi_dialogs_main_hc_fire_mission_not_set";
            };
        };

        // Add tooltip to fire button when unable to fire
        private _firebuttonTooltipText = "";
        private _availableRounds = [_smokeRoundsCount, _heRoundsCount] select _heShell;
        switch (true) do
        {
            case (isNil "_startPos" || (!_pointStrike && isNil "_endPos")):
            {
                _firebuttonTooltipText = _firebuttonTooltipText + localize "STR_antistasi_dialogs_main_hc_fire_mission_position_not_set_tooltip" + "\n"
            };
            case (_roundsCount > _availableRounds):
            {
                _firebuttonTooltipText = _firebuttonTooltipText + localize "STR_antistasi_dialogs_main_hc_fire_misison_no_ammo_tooltip" + "\n"
            };
        };

        _fireButton ctrlSetTooltip _firebuttonTooltipText;

        // Enable fire button when able to fire
        if (_firebuttonTooltipText isEqualTo "") then
        {
            _fireButton ctrlEnable true;
        };
    };

    case ("commanderMapClicked"):
    {
        Trace("Commander map clicked");
        // Get display and map control
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        _params params ["_clickedPosition"];
        private _clickedWorldPosition = _commanderMap ctrlMapScreenToWorld _clickedPosition;

        // Special cases for selecting fire mission position(s)
        private _selectFireMissionPos = _commanderMap getVariable ["selectFireMissionPos", false];
        if (_selectFireMissionPos) exitWith
        {
            Trace("Selecting fire mission position");
            private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;
            _fireMissionControlsGroup setVariable ["startPos", _clickedWorldPosition];
            _commanderMap setVariable ["selectFireMissionPos", false];
            ["updateFireMissionView"] call FUNC(commanderTab);
            Trace_1("Set fire mission startPos: %1", _clickedWorldPosition);
        };

        private _selectFireMissionEndPos = _commanderMap getVariable ["selectFireMissionEndPos", false];
        if (_selectFireMissionEndPos) exitWith
        {
            Trace("Selecting fire mission end position");
            private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;
            _fireMissionControlsGroup setVariable ["endPos", _clickedWorldPosition];
            _commanderMap setVariable ["selectFireMissionEndPos", false];
            ["updateFireMissionView"] call FUNC(commanderTab);
            Trace_1("Set fire mission endPos: %1", _clickedWorldPosition);
        };

        if (count hcAllGroups player < 1) exitWith {
            Debug("CommanderMap clicked but there are no HC groups to select.");
            _commanderMap setVariable ["selectedGroup", grpNull];
        };

        // Find closest HC squad to the clicked position
        Trace("Selecting HC group");
        private _selectedGroup = [hcAllGroups player, _clickedWorldPosition] call BIS_fnc_nearestPosition;
        Trace_1("_selectedGroup: %1", groupId _selectedGroup);
        private _selectedGroupMapPos = _commanderMap ctrlMapWorldToScreen getPos leader _selectedGroup;
        private _maxDistance = 6 * GRID_W; // TODO UI-update: Move somewhere else?
        private _distance = _selectedGroupMapPos distance _clickedPosition;
        Trace_4("_selectedGroupMapPos %1, _clickedPosition %2, _maxDistance %3, _distance %4", _selectedGroupMapPos, _clickedPosition, _maxDistance, _distance);

        // If clicked position is nowhere near any hc groups, deselect all units
        // and show list view
        if (_distance > _maxDistance) exitWith {
            Debug("Distance too large, deselecting group");
            _commanderMap setVariable ["selectedGroup", grpNull];
            ["update"] call FUNC(commanderTab);
        };

        _commanderMap setVariable ["selectedGroup", _selectedGroup];

        // Update single group view
        ["update"] call FUNC(commanderTab);
    };

    case ("groupNameLabelClicked"):
    {
        // This is here to prevent hardcoded IDCs in the configs
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        _commanderMap setVariable ["selectedGroup", grpNull];
        ["update"] call FUNC(commanderTab);
    };

    case ("groupRemoteControlButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        if (_group isNotEqualTo grpNull) then {
            closeDialog 1;
            [[_group]] spawn A3A_fnc_controlHCSquad;
        }
    };

    case ("groupDismissButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        _commanderMap setVariable ["selectedGroup", grpNull];
        // dismissSquad expects an array of groups since it originally used hcSelected to get them
        [[_group]] spawn A3A_fnc_dismissSquad;
        // TODO UI-update: might need a slight delay here, tab gets updated before squad has been completely dismissed
        // leaving it visible in the list even though it should be gone
        ["update"] call FUNC(commanderTab);
    };

    case ("groupFastTravelButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _fastTravelMap = _display displayCtrl A3A_IDC_FASTTRAVELMAP;
        private _selectedGroup = _commanderMap getVariable "selectedGroup";
        ["setHcMode", [true, _selectedGroup]] call FUNC(fastTravelTab);
        ["switchTab", ["fasttravel"]] call FUNC(mainDialog);
    };

    case ("fireMissionSelectionChanged"):
    {
        private _selection = _params select 0;
        Trace_1("Fire Mission selection changed: %1", _selection);

        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;


        switch (_selection) do
        {
            case ("he"):
            {
                _fireMissionControlsGroup setVariable ["heSelected", true];
                // Set rounds number back to 1 or 0 depending on point/barrage mode
                if (_fireMissionControlsGroup getVariable ["pointSelected", false]) then
                {
                    _fireMissionControlsGroup setVariable ["roundsNumber", 1];
                } else {
                    _fireMissionControlsGroup setVariable ["roundsNumber", 0];
                };
            };

            case ("smoke"):
            {
                _fireMissionControlsGroup setVariable ["heSelected", false];
                // Set rounds number back to 1 or 0 depending on point/barrage mode
                if (_fireMissionControlsGroup getVariable ["pointSelected", false]) then
                {
                    _fireMissionControlsGroup setVariable ["roundsNumber", 1];
                } else {
                    _fireMissionControlsGroup setVariable ["roundsNumber", 0];
                };
            };

            case ("point"):
            {
                _fireMissionControlsGroup setVariable ["pointSelected", true];
                // Set rounds number back to 1
                _fireMissionControlsGroup setVariable ["roundsNumber", 1];
            };

            case ("barrage"):
            {
                _fireMissionControlsGroup setVariable ["pointSelected", false];
                // Set rounds number to 0, nubmer decided by barrage length
                _fireMissionControlsGroup setVariable ["roundsNumber", 0];
            };

            case ("addround"):
            {
                // Check for available ammo
                private _availableAmmo = 0;
                if (_fireMissionControlsGroup getVariable ["heSelected", true]) then {
                    _availableAmmo = _fireMissionControlsGroup getVariable ["availableHeRounds", 0];
                } else {
                    _availableAmmo = _fireMissionControlsGroup getVariable ["availableSmokeRounds", 0];
                };

                Trace_1("Available ammo: %1", _availableAmmo);

                // Add 1
                private _previousNumber = _fireMissionControlsGroup getVariable ["roundsNumber", 1];
                private _newNumber = _previousNumber + 1;

                // Check if num exceeds available ammo
                if (_newNumber > _availableAmmo) then {_newNumber = _availableAmmo};

                // Set new rounds count
                _fireMissionControlsGroup setVariable ["roundsNumber", _newNumber];

                Trace_1("Rounds count now at %1", _newNumber);
            };

            case ("subround"):
            {
                // Subtract 1
                private _previousNumber = _fireMissionControlsGroup getVariable ["roundsNumber", 1];
                private _newNumber = _previousNumber - 1;

                // Check if number is at least 1
                // We clamp it to 1 here and then check if we actually have that 1 round in updateFireMissionView
                if (_newNumber < 1) then {_newNumber = 1};

                // Set new rounds count
                _fireMissionControlsGroup setVariable ["roundsNumber", _newNumber];

                Trace_1("Rounds count now at %1", _newNumber);
            };

            case ("setstart"):
            {
                private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
                _commanderMap setVariable ["selectFireMissionPos", true];
            };

            case ("setend"):
            {
                private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
                _commanderMap setVariable ["selectFireMissionEndPos", true];
            };
        };

        // Update fire mission view to show changes
        ["updateFireMissionView"] call FUNC(commanderTab);
    };

    case ("fireMissionButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;

        // Get params for fire mission from controlsGroup
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        private _heSelected = _fireMissionControlsGroup getVariable ["heSelected", true];
        private _pointSelected = _fireMissionControlsGroup getVariable ["pointSelected", true];
        private _roundsNumber = _fireMissionControlsGroup getVariable ["roundsNumber", 0];
        private _startPos = _fireMissionControlsGroup getVariable ["startPos", []];
        private _endPos = _fireMissionControlsGroup getVariable ["endPos", []];

        // Debug stuff
        private _shell = if (_heSelected) then {"HE"} else {"Smoke"};
        private _type = if (_pointSelected) then {"Point"} else {"Barrage"};

        // private _debugStr = format["FIRE MISSION- Shell: %1, Type: %2, Rounds: %3, StartPos: %4, EndPos: %5", _shell, _type, _roundsNumber, _startPos, _endPos];
        // Debug(_debugStr);

        // Set the necessary global variables
        Debug_1("_heSelected: %1", _heSelected);
        if (_heSelected) then
        {
            typeAmmunition = SDKMortarHEMag;
        } else {
            typeAmmunition = SDKMortarSmokeMag;
        };
        if (_pointSelected) then
        {
            typeArty = "NORMAL";
        } else {
            typeArty = "BARRAGE";
        };
        roundsX = _roundsNumber;

        positionTel = _startPos;
        if (typeArty == "BARRAGE") then {
            positionTel2 = _endPos;
        };

        [[_group]] spawn A3A_fnc_artySupport;
    };

    case ("showGarbageCleanOptions"):
    {
        Trace("Showing garbage clean options");
        private _display = findDisplay A3A_IDD_MAINDIALOG;

        // Hide overlapping buttons
        private _airSupportButton = _display displayCtrl A3A_IDC_AIRSUPPORTBUTTON;
        private _garbageCleanButton = _display displayCtrl A3A_IDC_GARBAGECLEANBUTTON;
        _airSupportButton ctrlShow false;
        _garbageCleanButton ctrlShow false;
        // Show garbage clean controlsGroup
        private _garbageCleanControlsGroup = _display displayCtrl A3A_IDC_GARBAGECLEANCONTROLSGROUP;
        _garbageCleanControlsGroup ctrlShow true;
    };

    case ("garbageCleanMapButtonClicked"):
    {
        closedialog 1;
        if (player == theBoss) then
        {
            [] remoteExec ["A3A_fnc_garbageCleaner",2];
        } else {
            ["Garbage Cleaner", "Only Player Commander has access to this function."] call A3A_fnc_customHint; // TODO UI-update: stringtable this
        };
    };

    case ("garbageCleanHqButtonClicked"):
    {
        closeDialog 2;
        ["Garbage Cleaner", "HQ only garbage clean yet to be implemented."] call A3A_fnc_customHint;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Commander tab mode does not exist: %1", _mode);
    };
};
