/*
Maintainer: Tiny
    Builds the context menu on the main player page based on a variety of conditions

Arguments:
    <OBJ> Target vehicle, if a custom param is needed. Usually not used.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Unscheduled, probably
Public: No
Dependencies:
    None

Example:
    [cursorObject] call FUNC(buildContextMenu);

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define CONSTRUCTIMAGE "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Land_WoodenCrate_01_F.jpg"
#define HQIMAGE "\A3\EditorPreviews_F\Data\CfgVehicles\Flag_FIA_F.jpg"

params [["_vehicle", cursorObject, [objNull]]];

// Vehicle section
private _contextGroup = _display displayCtrl A3A_IDC_CONTEXTGROUP;
private _noActionsGroup = _display displayCtrl A3A_IDC_NOACTIONSGROUP;

private _contextSingle1Button = _display displayCtrl A3A_IDC_CONTEXTSINGLE1BUTTON;
private _contextSingle2Button = _display displayCtrl A3A_IDC_CONTEXTSINGLE2BUTTON;
private _contextSingle3Button = _display displayCtrl A3A_IDC_CONTEXTSINGLE3BUTTON;
private _contextSingle4Button = _display displayCtrl A3A_IDC_CONTEXTSINGLE4BUTTON;

private _contextHoriz1Button = _display displayCtrl A3A_IDC_CONTEXTHORIZ1BUTTON;
private _contextHoriz2Button = _display displayCtrl A3A_IDC_CONTEXTHORIZ2BUTTON;

private _vehicleNameLabel = _display displayCtrl A3A_IDC_VEHICLENAMELABEL;
private _vehicleNameBackground = _display displayCtrl A3A_IDC_VEHICLENAMEBACKGROUND;
private _vehiclePicture = _display displayCtrl A3A_IDC_VEHICLEPICTURE;

private _containerLabel = _display displayCtrl A3A_IDC_CONTEXTLABEL;

private _disableAll = [_contextSingle1Button, _contextSingle2Button, _contextSingle3Button, _contextSingle4Button, _contextHoriz1Button, _contextHoriz2Button, _noActionsGroup];
{_x ctrlShow false; _x ctrlEnable false;} forEach _disableAll;

private _vehType = if ( !isClass (configFile >> "CfgVehicles" >> typeOf _vehicle) ) then { -1 } else {[typeOf _vehicle] call HR_GRG_fnc_getCatIndex};
private _containerTitle = "";

// First case: Has valid vehicle as cursorObject
// Second case: Has building (built or unbuild) under cursor
// Third case: Is near HQ
// Last case: idk just default to nothing LOL

switch (true) do {
    case (!(isNull _vehicle) && {(_vehicle distance player < 25) && { // Check if vehicle is eligible for garage / sell, not a dude or house etc.
        (_vehType >= 0) ||
        (_vehicle getVariable ['A3A_canGarage', false])
    }}): {
        private _className = typeOf _vehicle;
        private _configClass = configFile >> "CfgVehicles" >> _className;
        private _displayName = getText (_configClass >> "displayName");
        private _editorPreview = getText (_configClass >> "editorPreview");

        _vehicleNameLabel ctrlSetText _displayName;
        // For some reason the text control becomes active showing an ugly
        // white border, we disable it here to avoid that
        _vehicleNameLabel ctrlEnable false;

        _vehiclePicture ctrlSetText _editorPreview;

        // button type decisions
        // all vehicles: garage
        // aircraft: add to air support, repair/rearm
        // statics: block AI usage
        // all other vehicles: add to garrison
        // Commander only actions to bottom right where possible
        // button layout: single buttons
        //  1 2
        //  3 4
        // button layout: horiz buttons
        //   1
        //   2
        private _garageContextOptions = switch (true) do {
            case (_vehType in [3,4]): {
                _containerTitle = localize "STR_antistasi_dialogs_main_context_title_aircraft";
                [["garage", _contextHoriz1Button], ["RRR", _contextSingle3Button], ["airSupport", _contextSingle4Button]];
            };
            _containerTitle = localize "STR_antistasi_dialogs_main_context_title_vehicle";
            case ((_vehType != 7) && {(_vehicle isNil "markerX")}): {
                [["garage", _contextHoriz1Button], ["addToGarrison", _contextHoriz2Button]];
            };
            case ((_vehType == 7) || {!(_vehicle isNil "markerX")}): {
                [["garage", _contextHoriz1Button], ["toggleAI", _contextHoriz2Button]];
            };
            default {
                [["garage", _contextHoriz1Button], ["empty", _contextHoriz2Button]];
            };
        };

        {
            _x params ["_action", "_button"];
            _button ctrlShow true;
            switch (_action) do {
                case ("garage"): {
                    _button ctrlSetText localize "STR_antistasi_dialogs_main_context_button_garage";
                    // Garage check
                    private _friendlyMarkers = (["Synd_HQ"] +outposts + seaports + airportsX + factories + resourcesX) select {sidesX getVariable [_x,sideUnknown] == teamPlayer}; //rebel locations with a flag
                    private _inArea = _friendlyMarkers findIf { count ([player, _vehicle] inAreaArray _x) > 1 };
                    if !(_inArea > -1) exitWith {
                        _button ctrlEnable false;
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_garage_away";
                    };
                    if (_vehicle getVariable ['A3A_canGarage', false]) then {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_garage_utility";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    _button ctrlAddEventHandler ["ButtonClick", {closeDialog 0; [(_this#0) getVariable "vehicle", clientOwner, call HR_GRG_dLock, player] remoteExecCall ['HR_GRG_fnc_addVehicle',2];}];
                    _button ctrlEnable true;
                };
                case ("RRR"): {
                    _button ctrlSetText "RRR";
                    _button ctrlSetTooltip "Coming soon";
                };
                case ("airSupport"): {
                    _button ctrlSetText localize "STR_antistasi_dialogs_main_context_button_addBombRun";
                    // Disable "add to air support" button if vehicle is not eligible
                    if (player isNotEqualTo theBoss) exitWith {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_only_tooltip";
                    };
                    //Valid area to convert to air support
                    private _friendlyMarkers = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] == teamPlayer}; //rebel locations with a flag
                    private _inArea = _friendlyMarkers findIf { count ([player, _vehicle] inAreaArray _x) > 1 };
                    if (!(_inArea > -1) && (_vehicle isKindOf "Air")) exitWith { 
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_addBombRun_nearValid";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    _button ctrlAddEventHandler ["ButtonClick", {closeDialog 0; [(_this#0) getVariable "vehicle"] call A3A_fnc_addBombRun}];
                    _button ctrlEnable true;
                };
                case ("toggleAI"): {
                    _button ctrlSetText localize "STR_antistasi_dialogs_main_context_button_toggleAI1";
                    private _isLocked = !(_vehicle isNil "lockedForAI");
                    if (_vehicle getVariable ['ownerSide', teamPlayer] != teamPlayer) exitWith {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_gen_notRebVic";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    if (_isLocked) then {
                        _button ctrlAddEventHandler ["ButtonClick", {closeDialog 0; [(_this#0) getVariable "vehicle"] call A3A_fnc_unlockStatic}];
                    } else {
                        _button ctrlSetText localize "STR_antistasi_dialogs_main_context_button_toggleAI2";
                        _button ctrlAddEventHandler ["ButtonClick", {closeDialog 0; [(_this#0) getVariable "vehicle"] call A3A_fnc_lockStatic}];
                    };
                    _button ctrlEnable true;
                };
                case ("addToGarrison"): {
                    _button ctrlSetText "Add to garrison";
                    if (_vehicle getVariable ['ownerSide', teamPlayer] != teamPlayer) exitWith {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_gen_notRebVic";
                    };
                    if !(_vehicle isNil 'markerX') exitWith {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_addToGarrison_alreadyIn";
                    };
                    private _marker = [getPosATL _vehicle] call A3A_fnc_getMarkerForPos;
                    if (_marker == "" or { sidesX getVariable _marker != teamPlayer }) then {
                        _button ctrlSetTooltip localize "STR_A3A_garrison_vehicle_outside";
                    };
                    if (crew _vehicle isNotEqualTo []) exitWith {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_addToGarrison_crewed";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    _button ctrlAddEventHandler ["ButtonClick", {closeDialog 0; [(_this#0) getVariable "vehicle", player] call A3A_fnc_actionGarrisonVehicle}];
                    _button ctrlEnable true;
                };
                case ("empty");
                default {

                };
            };

        } forEach _garageContextOptions;
    };
    case (cursorObject in A3A_unbuiltObjects || {cursorobject getvariable ["A3A_building", false]}): {
        _containerTitle = localize "STR_antistasi_dialogs_main_context_title_construction";

        _vehiclePicture ctrlSetText CONSTRUCTIMAGE;
        _vehicleNameLabel ctrlSetText localize "STR_antistasi_dialogs_main_context_label_construction";
        _hideIconsButton = _contextHoriz1Button;
        _hideActionsButton = _contextHoriz2Button;
        _hideIconsButton ctrlShow true;
        _hideActionsButton ctrlShow true;
        _hideIconsButton ctrlSetText localize (["STR_antistasi_dialogs_main_context_button_showIcons","STR_antistasi_dialogs_main_context_button_hideIcons"] select A3A_drawBuilderIcons);
        _hideActionsButton ctrlSetText localize (["STR_antistasi_dialogs_main_context_button_showActions", "STR_antistasi_dialogs_main_context_button_hideActions"] select A3A_showBuilderActions);
        if !(player call A3A_fnc_isEngineer) exitWith {
            _hideIconsButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_construction_needEngineer";
            _hideActionsButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_construction_needEngineer";
        };
        _hideIconsButton ctrlEnable true;
        _hideActionsButton ctrlEnable true;
        _hideIconsButton ctrlAddEventHandler ["ButtonClick", {closeDialog 0; A3A_drawBuilderIcons = !A3A_drawBuilderIcons;}];
        _hideActionsButton ctrlAddEventHandler ["ButtonClick", {closeDialog 0; A3A_showBuilderActions = !A3A_showBuilderActions;}]; // hm. dialogs too slow to refresh entire thing
    };
    case (markerpos "Synd_HQ" distance player < 75): {
        _containerTitle = localize "STR_antistasi_dialogs_main_context_title_HQ";

        _vehiclePicture ctrlSetText HQIMAGE;
        _vehicleNameLabel ctrlSetText localize "STR_antistasi_dialogs_main_context_label_HQ";
        // two fixed buttons
        _roleSelectButton = _contextHoriz1Button;
        _vehArsenalButton = _contextHoriz2Button;
        _roleSelectButton ctrlShow true;
        _vehArsenalButton ctrlShow true;
        _roleSelectButton ctrlSetText localize "STR_antistasi_dialogs_main_context_HQ_changeRole";
        _vehArsenalButton ctrlSetText localize "STR_antistasi_dialogs_main_context_HQ_vehArsenal";

        _roleSelectButton ctrlAddEventHandler ["ButtonClick", {createDialog "A3A_RoleSelectDialog";}];
        _roleSelectButton ctrlEnable true;
        private _veh = objectParent player;
        if ((_veh == player) || {player != (driver _veh)}) exitWith {
            _vehArsenalButton ctrlSetTooltip localize "STR_antistasi_dialogs_main_context_HQ_beDriver";
        };
        _vehArsenalButton ctrlAddEventHandler ["ButtonClick", {closeDialog 0; call JN_fnc_arsenal_handleAction}];
        _vehArsenalButton ctrlEnable true;
    };
    default {
        _contextGroup ctrlShow false;
        _noActionsGroup ctrlShow true;
        _vehicleNameBackground ctrlShow false;
    };
};

if (_containerTitle != "") then {
    _containerLabel ctrlSetText ([localize "STR_antistasi_dialogs_main_context_title_main",_containerTitle] joinString ": ");
};
