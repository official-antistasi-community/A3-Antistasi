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
private _arsenalLimitsButton = _display displayCtrl A3A_IDC_ARSENALLIMITSBUTTON;
private _customizeLoadoutsButton = _display displayCtrl A3A_IDC_CUSTOMIZELOADOUTSBUTTON;
private _recruitSquadButton = _display displayCtrl A3A_IDC_RECRUITSQUADCMDBUTTON;
private _requestMissionButton = _display displayCtrl A3A_IDC_MISSIONREQUESTBUTTON;
private _createWatchpostButton = _display displayCtrl A3A_IDC_ADDWATCHPOSTBUTTON;
private _removeGarrisonButton = _display displayCtrl A3A_IDC_REMOVEGARRISONBUTTON;
private _HCSquadsButton = _display displayCtrl A3A_IDC_HCSQUADSBUTTON;
private _baseButtons = [_airSupportButton,_garbageCleanButton,_arsenalLimitsButton,_customizeLoadoutsButton,_recruitSquadButton,_requestMissionButton,_createWatchpostButton,_removeGarrisonButton,_HCSquadsButton];

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

        // Show base buttons
        {_x ctrlShow true} forEach _baseButtons;

        // Check for radio, most of this isn't usable without one
        if !([player] call A3A_fnc_hasRadio) exitWith
        {
            // TODO UI-update: Fix the UI overlay order
            /*
            _noRadioControlsGroup ctrlShow true;
            _airSupportButton ctrlEnable false;
            _airSupportButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_no_radio";
            */
            {
                _x ctrlEnable false;
                _x ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_no_radio";
            } forEach [_airSupportButton,_recruitSquadButton,_requestMissionButton,_createWatchpostButton,_removeGarrisonButton,_HCSquadsButton];
        };

        // Check for selected groups
        private _selectedGroup = _commanderMap getVariable ["selectedGroup", grpNull];
        private _doAutoSwitch = _commanderMap getVariable ["doAutoSwitch", false];
        private _doAutoSwitchArty = _commanderMap getVariable ["doAutoSwitchArty", false];
        private _hasGroup = !(_selectedGroup isEqualTo grpNull);
        private _isMortarVic = false;
        if (_hasGroup) then {
            {
                private _veh = vehicle _x;
                if (_veh isEqualTo _x) then {continue};
                if (( "Artillery" in (getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "availableForSupportTypes")))) then
		        {
		            _isMortarVic = true;
                };
            } forEach (units _selectedGroup);
        };

        // Initialize fire mission vars
        _fireMissionControlsGroup setVariable ["roundsNumber", 1];
        _fireMissionControlsGroup setVariable ["availableHeRounds", 0];
        _fireMissionControlsGroup setVariable ["availableSmokeRounds", 0];
        _fireMissionControlsGroup setVariable ["startPos", nil];
        _fireMissionControlsGroup setVariable ["endPos", nil];
        _fireMissionControlsGroup setVariable ["mortarGroup", _selectedGroup];

        // Set map to group selection mode
        _commanderMap setVariable ["selectFireMissionPos", false];
        _commanderMap setVariable ["selectFireMissionEndPos", false];

        // Check for valid marker for dismissal
        if (_commanderMap getVariable ["selectedMarker",""] isEqualTo "") then {
            _removeGarrisonButton ctrlEnable false;
            _removeGarrisonButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_no_marker";
        } else {
            _removeGarrisonButton ctrlEnable true;
            _removeGarrisonButton ctrlSetTooltip "";
        };

        switch (true) do 
        {
            case (_doAutoSwitchArty && _isMortarVic): { // If all is valid show fire mission view
                {_x ctrlShow false} forEach _baseButtons; // expected to be done through single group view
                ["updateFireMissionView"] call FUNC(commanderTab);
            };
            case (_hasGroup): { // If a group is selected show the single group view
                 ["updateSingleGroupView"] call FUNC(commanderTab);
            };
            case (_doAutoSwitchArty): { // If no group is selected show the multiple groups view
                ["updateMultipleGroupsView"] call FUNC(commanderTab);
            };
            default {
                
            };
        };
        _commanderMap setVariable ["doAutoSwitch", false];
        _commanderMap setVariable ["doAutoSwitchArty", false];
    };

    case ("updateSingleGroupView"):
    {
        _multipleGroupsView ctrlShow false;
        _multipleGroupsBackground ctrlShow false;
        _multipleGroupsLabel ctrlShow false;
        {_x ctrlShow false} forEach _baseButtons;
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
            _groupFastTravelButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_fast_travel"; // TODO: descriptive tooltip?
        } else {
            _groupFastTravelButton ctrlEnable false;
            // ShortcutButtons doesn't change texture color when disabled so we have to use fade
            _groupFastTravelButton ctrlSetFade 0.5;
            _groupFastTravelButton ctrlCommit 0;
            private _prettyString = _fastTravelBlockers apply {localize format ["STR_A3A_fn_dialogs_ftradio_" + _x]};
            _groupFastTravelButton ctrlSetTooltip (_prettyString joinString ",\n\n");
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
        private _groupVehicleName = getText(configfile >> "CfgVehicles" >> typeOf _groupVehicle >> "displayName");
        _groupVehicleText ctrlSetStructuredText parseText format ["<t align='right'>%1</t>", _groupVehicleName]; 

        // Pan to group location
        _commanderMap ctrlMapAnimAdd [0.2, ctrlMapScale _commanderMap, getPos _groupLeader];
        ctrlMapAnimCommit _commanderMap;
    };

    case ("updateMultipleGroupsView"):
    {
        _singleGroupView ctrlShow false;
        {_x ctrlShow false} forEach _baseButtons;
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
        _params params [["_selection",""]];

        // Hide group views
        _multipleGroupsView ctrlShow false;
        _singleGroupView ctrlShow false;

        // Show fire mission view if not already shown
        if !(ctrlShown _fireMissionControlsGroup) then {
            _fireMissionControlsGroup ctrlShow true;
            // can also be used for first-update stuff
            _commanderMap setVariable ["selectFireMissionPos", true];
        };

        // Update rounds count
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _fireMissionControlsGroup getVariable ["mortarGroup", grpNull];
        _commanderMap setVariable ["selectedGroup", grpNull];
        private _units = units _group;

        private _mortarObjs = [];
        private _shellCounts = createHashMap;
        private _artyDictionary = createHashMap;
        {
            private _veh = vehicle _x;
            if ((_veh != _x) and (not(_veh in _mortarObjs))) then
            {
                if (( "Artillery" in (getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "availableForSupportTypes")))) then
                {
                    if ((canFire _veh) and (alive _veh)) then
                    {
                        {
                            _x params ["_type","_currentCount"];
                            private _existingCount = _shellCounts getOrDefault [_type,0];
                            _shellCounts set [_type, _currentCount + _existingCount];
                            diag_log format ["foreachindex %1 type %2 count %3", _forEachIndex, _type, _currentCount];
                        } forEach magazinesAmmo _veh;
                        private _dict = [typeOf _veh] call A3A_fnc_getMortarMags;
                        {_artyDictionary set [_x,_y];} forEach _dict; // automatically covers repeats
                        _mortarObjs pushBackUnique _veh;
                    }; // [["8Rnd_82mm_Mo_shells",8],["8Rnd_82mm_Mo_shells",8],["8Rnd_82mm_Mo_shells",8],["8Rnd_82mm_Mo_shells",8],["8Rnd_82mm_Mo_Flare_white",8],["8Rnd_82mm_Mo_Smoke_white",8]]
                };
            };
        } forEach _units;
        diag_log format ["mortarobjs %1",_mortarObjs];
        _fireMissionControlsGroup setVariable ["mortarObjs", _mortarObjs];
        diag_log format ["shellcounts %1", _shellCounts];
        _fireMissionControlsGroup setVariable ["shellCounts", _shellCounts];
        diag_log format ["artyDictionary %1", _artyDictionary];
        _fireMissionControlsGroup setVariable ["artyDictionary", _artyDictionary];

        // TODO UI-update: check if unit is ready to fire etc, or do we already do that?

        // States for selecting shell type, mission type and round counts are initialized
        // in update, we get them here
        private _roundsCount = _fireMissionControlsGroup getVariable ["roundsNumber", 1];
        private _startPos = _fireMissionControlsGroup getVariable ["startPos", nil];
        private _endPos = _fireMissionControlsGroup getVariable ["endPos", nil];


        // Update controls based on what is selected
        private _shellTypeBox = _display displayCtrl A3A_IDC_SHELLTYPEBOX;
        private _pointStrikeButton = _display displayCtrl A3A_IDC_POINTSTRIKEBUTTON;
        private _barrageButton = _display displayCtrl A3A_IDC_BARRAGEBUTTON;
        private _suppressButton = _display displayCtrl A3A_IDC_SUPPRESSBUTTON;
        private _contButton = _display displayCtrl A3A_IDC_CONTBUTTON;
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

        private _radiusControlsGroup = _display displayCtrl A3A_IDC_RADIUSCONTROLSGROUP;
        private _radiusLabel = _display displayCtrl A3A_IDC_RADIUSLABEL;
        private _radiusEditBox = _display displayCtrl A3A_IDC_RADIUSEDITBOX;

        private _timingControlsGroup = _display displayCtrl A3A_IDC_TIMINGCONTROLSGROUP;
        private _timingPosLabel = _display displayCtrl A3A_IDC_TIMINGLABEL;
        private _timingPosEditBox = _display displayCtrl A3A_IDC_TIMINGEDITBOX;
        private _timingPosEditSlider = _display displayCtrl A3A_IDC_TIMINGEDITSLIDER;

        private _fireButton = _display displayCtrl A3A_IDC_FIREBUTTON;

        // Disable fire button initially
        _fireButton ctrlEnable false;
        
        // Add shells to listbox
        lbClear A3A_IDC_SHELLTYPEBOX;
        private _lbEntryHM = createHashMap;
        private _lbNames = [];
        {
            private _mag = _x;
            private _count = _y;
            private _description = (_artyDictionary get _mag)#2;
            private _text = format ["%1: %2",_description,_count];
            _lbNames pushBack _text;
            _lbEntryHM set [_text, _mag];
            diag_log format ["index %1 type %2 text %3", _forEachIndex, _mag, _text];
        } forEach _shellCounts;
        _lbNames sort true;
        {
            private _index = _shellTypeBox lbAdd _x;
            _shellTypeBox lbSetData [_index, _lbEntryHM get _x];
        } forEach _lbNames;
        if (lbCurSel A3A_IDC_SHELLTYPEBOX == -1) then {
            private _heMagsDict = _artyDictionary apply {if (_y#0 == "HE") then {_x} else {""}};
            diag_log _heMagsDict;
            private _heMagsCount = _shellCounts apply {_x};
            diag_log _heMagsCount;
            private _heMags = _heMagsCount arrayIntersect _heMagsDict;
            diag_log _heMags;
            private _lbTargetIndex = -1;
            for "_i" from 0 to (lbSize A3A_IDC_SHELLTYPEBOX - 1) do {
                if (_shellTypeBox lbData _i == (_heMags#0)) exitWith {_lbTargetIndex = _i}
            };
            diag_log _lbTargetIndex;
            _shellTypeBox lbSetCurSel _lbTargetIndex;
        };
        
        private _shellType = _shellTypeBox lbData lbCurSel _shellTypeBox;
        private _shellDict = _artyDictionary get _shellType;
        private _roundsRem = _shellCounts get _shellType;

        private _strikeType = _fireMissionControlsGroup getVariable ["strikeType", "point"];

        private _attributeLabel = _display displayCtrl A3A_IDC_ATTRIBUTELABEL;
        private _attributeText = _display displayCtrl A3A_IDC_ATTRIBUTETEXT;
        private _attribute = _shellDict#3;
        private _label = switch (_shellDict#0) do {
            case ("HE"): { "Impact radius" };
            case ("SMOKE"): { "Cover time" };
            case ("FLARE"): { "Burn time" };
            default { "???" }
        };
        private _textFormat = format ["%1%2",_attribute,["s","m"] select (_shellDict#0 == "HE")];
        _attributeLabel ctrlSetText _label;
        _attributeText ctrlSetText _textFormat;
        _pointStrikeButton ctrlEnable !(_strikeType == "point");
        _barrageButton ctrlEnable !(_strikeType == "barrage");
        _suppressButton ctrlEnable !(_strikeType == "suppress");
        _contButton ctrlEnable !(_strikeType == "cont");

        _startPosLabel ctrlSetText ([localize "STR_antistasi_dialogs_main_hc_fire_mission_position_label",localize "STR_antistasi_dialogs_main_hc_fire_mission_position_start_label"] select (_strikeType == "barrage"));

        _endPosControlsGroup ctrlShow (_strikeType == "barrage");
        _radiusControlsGroup ctrlShow (_strikeType == "suppress");
        _timingControlsGroup ctrlShow (_strikeType == "cont");

        if (_strikeType == "barrage") then {
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
                _fireMissionControlsGroup setVariable ["roundsNumber", _roundsCount];
            };
        } else {
            // Enable rounds buttons, remove tooltips
            _addRoundsButton ctrlEnable true;
            _addRoundsButton ctrlSetTooltip "";
            _subRoundsButton ctrlEnable true;
            _subRoundsButton ctrlSetTooltip "";
            _roundsEditBox ctrlSetTooltip "";
        };
        if (_roundsCount > _roundsRem) then {
            _roundsCount = _roundsRem;
            _fireMissionControlsGroup setVariable ["roundsNumber", _roundsCount];
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

        Trace("Updating radius boxes...");
        private _radius = _fireMissionControlsGroup getVariable ["strikeRadius", 200];
        _radiusEditBox ctrlSetText str _radius;

        Trace("Updating interval boxes...");
        
        private _interval = _fireMissionControlsGroup getVariable ["strikeDelay", 45];
        _timingPosEditSlider sliderSetRange [30,90];
        _timingPosEditSlider sliderSetSpeed [5,5,5];
        if (_selection in ["roundType", "cont"]) then {
            if (_shellDict#0 == "FLARE") then {_interval = (_shellDict#3 - 5)};
            _timingPosEditSlider sliderSetPosition _interval;
            _fireMissionControlsGroup setVariable ["strikeDelay", _interval];
        };
        _timingPosEditBox ctrlSetText format ["%1s", _interval];


        // Add tooltip to fire button when unable to fire
        private _firebuttonTooltipText = "";
        private _isInRange = call {
            if (isNil "_startPos") exitWith {false};
            _startPos inRangeOfArtillery [[_mortarObjs#0],_shellType];
        };
        switch (true) do
        {
            case (isNil "_startPos" || ((_strikeType == "barrage") && isNil "_endPos")):
            {
                _firebuttonTooltipText = localize "STR_antistasi_dialogs_main_hc_fire_mission_position_not_set_tooltip"
            };
            case (_roundsCount > _roundsRem):
            {
                _firebuttonTooltipText = localize "STR_antistasi_dialogs_main_hc_fire_mission_no_ammo_tooltip"
            };
            case !(_isInRange):
            {
                _firebuttonTooltipText = localize "STR_antistasi_dialogs_main_hc_fire_mission_out_of_range_tooltip"
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

        /*
        if (count hcAllGroups player < 1) exitWith {
            Debug("CommanderMap clicked but there are no HC groups to select.");
            _commanderMap setVariable ["selectedGroup", grpNull];
        };
        */

        // Find closest HC squad or marker to the clicked position
        private _selectableMarkers = airportsX + resourcesX + factories + outposts + seaports + citiesX + outpostsFIA + ["Synd_HQ"];
        private _selectableGroups = hcAllGroups player;
        private _selectOptions = _selectableMarkers + _selectableGroups;
        private _selectedItem = [_selectOptions, _clickedWorldPosition] call BIS_fnc_nearestPosition;
        private _selectedItemPosition = if (_selectedItem isEqualType grpNull) then {getPos leader _selectedItem;} else {getMarkerPos _selectedItem;};
        private _selectedItemMapPos = _commanderMap ctrlMapWorldToScreen _selectedItemPosition;
        private _maxDistance = 6 * GRID_W; // TODO UI-update: Move somewhere else?
        private _distance = _selectedItemMapPos distance _clickedPosition;
        Trace_4("_selectedGroupMapPos %1, _clickedPosition %2, _maxDistance %3, _distance %4", _selectedGroupMapPos, _clickedPosition, _maxDistance, _distance);
        if (_distance > _maxDistance) exitWith {
                Debug("Distance too large, deselecting item");
                _commanderMap setVariable ["selectedGroup", grpNull];
                _commanderMap setVariable ["selectedMarker", locationNull];
            };
        if (_selectedItem isEqualType grpNull) then {
            _commanderMap setVariable ["selectedGroup", _selectedItem];
            _commanderMap setVariable ["selectedMarker", locationNull];
            ["update"] call FUNC(commanderTab); // Update single group view if applicable
        } else {
            _commanderMap setVariable ["selectedMarker", _selectedItem];
            _commanderMap setVariable ["selectMarkerData", [_selectedItemPosition]];
            _commanderMap setVariable ["selectedGroup", grpNull];
        };  
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

    case ("groupMountButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        ["mount",[_group]] spawn A3A_fnc_vehStats;
    };

    case ("groupAddVehicleButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        [_group] spawn A3A_fnc_addSquadVeh;
    };

    case ("groupGarrisonButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;
        private _group = _commanderMap getVariable ["selectedGroup", grpNull];
        closeDialog 1;
        [[_group]] spawn A3A_fnc_addToGarrison;
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
            case ("roundType"):
            {
                private _shellTypeBox = _display displayCtrl A3A_IDC_SHELLTYPEBOX;
                private _index = lbCurSel _shellTypeBox;
                private _shellData = _shellTypeBox lbData _index;
                _fireMissionControlsGroup setVariable ["shellType", _shellData];
            };

            case ("point"):
            {
                _fireMissionControlsGroup setVariable ["strikeType", "point"];
                // Set rounds number back to 1
                _fireMissionControlsGroup setVariable ["roundsNumber", 1];
            };

            case ("barrage"):
            {
                _fireMissionControlsGroup setVariable ["strikeType", "barrage"];
                // Set rounds number to 0, nubmer decided by barrage length
                _fireMissionControlsGroup setVariable ["roundsNumber", 0];
            };

            case ("suppress"):
            {
                _fireMissionControlsGroup setVariable ["strikeType", "suppress"];
                // Set rounds number back to 1
                _fireMissionControlsGroup setVariable ["roundsNumber", 1];
            };

            case ("cont"):
            {
                _fireMissionControlsGroup setVariable ["strikeType", "cont"];
                // Set rounds number back to 1
                _fireMissionControlsGroup setVariable ["roundsNumber", 1];
            };

            case ("addround"):
            {
                // Check for available ammo
                private _shellTypeBox = _display displayCtrl A3A_IDC_SHELLTYPEBOX;
                private _shellCounts = _fireMissionControlsGroup getVariable ["shellCounts", createHashMap];
                private _shellType = _shellTypeBox lbData lbCurSel _shellTypeBox;
                diag_log _shellCounts;
                diag_log _shellType;
                private _availableAmmo = 0;
                {
                    if (_x == _shellType) exitWith {_availableAmmo = _y};
                } forEach _shellCounts;

                Trace_1("Available ammo: %1", _availableAmmo);

                // Add 1
                private _previousNumber = _fireMissionControlsGroup getVariable ["roundsNumber", 1];
                private _newNumber = _previousNumber + 1;

                // Check if num exceeds available ammo
                if (_newNumber > _availableAmmo) then {_newNumber = _availableAmmo};

                // Set new rounds count-
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

            case ("addradius"):
            {
                // Add 1
                private _previousNumber = _fireMissionControlsGroup getVariable ["strikeRadius", 200];
                private _newNumber = _previousNumber + 25;

                // Clamp value between 100 and 400
                if (_newNumber > 400) then {_newNumber = 400};

                // Set new rounds count
                _fireMissionControlsGroup setVariable ["strikeRadius", _newNumber];

                Trace_1("Radius now at %1", _newNumber);
            };

            case ("subradius"):
            {
                // Subtract 1
                private _previousNumber = _fireMissionControlsGroup getVariable ["strikeRadius", 100];
                private _newNumber = _previousNumber - 25;

                // Clamp value between 100 and 400
                if (_newNumber < 100) then {_newNumber = 100};

                // Set new rounds count
                _fireMissionControlsGroup setVariable ["strikeRadius", _newNumber];

                Trace_1("Radius now at %1", _newNumber);
            };

            case ("edittiming"):
            {
                private _slider = _display displayCtrl A3A_IDC_TIMINGEDITSLIDER;
                // Slider is already clamped between 30 and 90 seconds
                private _position = sliderPosition _slider;

                _fireMissionControlsGroup setVariable ["strikeDelay", _position];

                Trace_1("Radius now at %1", _newNumber);
            };
        };

        /*
        if (_selection != "edittiming") then { // slider updates happen every frame basically
            // Update fire mission view to show changes
            ["updateFireMissionView"] call FUNC(commanderTab);
        };
        */
        ["updateFireMissionView", [_selection]] call FUNC(commanderTab);
    };

    case ("fireMissionButtonClicked"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _fireMissionControlsGroup = _display displayCtrl A3A_IDC_FIREMISSONCONTROLSGROUP;
        private _commanderMap = _display displayCtrl A3A_IDC_COMMANDERMAP;

        // Get params for fire mission from controlsGroup
        
        private _shellTypeBox = _display displayCtrl A3A_IDC_SHELLTYPEBOX;
        private _index = lbCurSel _shellTypeBox;
        private _shellType = _shellTypeBox lbData _index;
        private _vics = _fireMissionControlsGroup getVariable ["mortarObjs", []];
        diag_log _vics;
        private _units = _vics select {((magazinesAmmo _x) findIf {(_x#0 == _shellType)}) > -1};
        private _artyDictionary = _fireMissionControlsGroup getVariable ["artyDictionary", createHashMap];
        private _shellDict = _artyDictionary get _shellType;
        private _shortName = _shellDict#2;
        private _strikeType = _fireMissionControlsGroup getVariable ["strikeType", "point"];
        private _roundsNumber = _fireMissionControlsGroup getVariable ["roundsNumber", 0];
        private _startPos = _fireMissionControlsGroup getVariable ["startPos", []];

        private _endPos = _fireMissionControlsGroup getVariable ["endPos", []];
        private _strikeRadius = _fireMissionControlsGroup getVariable ["strikeRadius", 200];
        private _strikeDelay = _fireMissionControlsGroup getVariable ["strikeDelay", 45];
        private _detail = switch (_strikeType) do {
            case ("barrage"): {_fireMissionControlsGroup getVariable ["endPos", []]};
            case ("suppress"): {_fireMissionControlsGroup getVariable ["strikeRadius", 200]};
            case ("cont"): {_fireMissionControlsGroup getVariable ["strikeDelay", 45]};
            default {0};
        };

        [_units,_shellType,_shortName,_strikeType,_roundsNumber,_startPos,_detail] spawn A3A_fnc_artySupportFire;
    };

    case ("removeGarrisonButtonClicked"):
    {
        Trace("Dismissing garrison");
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _selectedMarker = _commanderMap getVariable ["selectedMarker", ""];
        if !(_selectedMarker call A3A_fnc_canEditGarrison) exitWith {};     // throws hints on failure
    	[_selectedMarker, true, true] remoteExecCall ["A3A_fnc_garrisonServer_clear", 2];
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
            ["Garbage Cleaner", localize "STR_antistasi_dialogs_main_commanderOnly"] call A3A_fnc_customHint;
        };
    };

    case ("garbageCleanHqButtonClicked"):
    {
        closedialog 1;
        if (player == theBoss) then
        {
            [] remoteExec ["A3A_fnc_HQgarbageClean",2];
        } else {
            ["Garbage Cleaner", localize "STR_antistasi_dialogs_main_commanderOnly"] call A3A_fnc_customHint;
        };
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Commander tab mode does not exist: %1", _mode);
    };
};
