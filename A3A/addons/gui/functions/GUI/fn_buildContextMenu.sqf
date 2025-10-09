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
    ["update"] spawn FUNC(playerTab);

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

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

private _disableAll = [_contextSingle1Button, _contextSingle2Button, _contextSingle3Button, _contextSingle4Button, _contextHoriz1Button, _contextHoriz2Button, _vehicleNameLabel];
{_x ctrlShow false; _x ctrlEnable false;} forEach _disableAll;

// First case: Has valid vehicle as cursorObject
// Second case: Is near HQ
// Third case: idk just default to nothing LOL
_vehType = if (_vehicle isEqualTo objNull) then { -1 } else {[typeOf _vehicle] call HR_GRG_fnc_getCatIndex};
diag_log (markerpos "Synd_HQ" distance player < 75);

switch (true) do {
    case (!(isNull _vehicle) && {(_vehicle distance player < 25) && { // Check if vehicle is eligible for garage / sell, not a dude or house etc.
        (_vehType >= 0) ||
        (_vehicle getVariable ['A3A_canGarage', false])
    }}): {
        
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
        private _garageContextOptions = switch (_vehType) do {
            case 3;
            case 4: {
                [["garage", _contextHoriz1Button], ["airSupport", _contextSingle3Button], ["RRR", _contextSingle4Button]];
            };
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
            switch (_button) do {
                case ("garage"): {
                    // Garage check
                    private _friendlyMarkers = (["Synd_HQ"] +outposts + seaports + airportsX + factories + resourcesX) select {sidesX getVariable [_x,sideUnknown] == teamPlayer}; //rebel locations with a flag
                    private _inArea = _friendlyMarkers findIf { count ([player, _vehicle] inAreaArray _x) > 1 };
                    if !(_inArea > -1) exitWith {
                        _button ctrlEnable false;
                        _button ctrlSetTooltip "Must be near friendly marker to garage";
                    };
                    if (_vehicle getVariable ['A3A_canGarage', false]) then {
                        _button ctrlSetTooltip "Garaging this will delete it and refund the full cost";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    _button ctrlAddEventHandler ["ButtonClick", {[_this getVariable "vehicle", clientOwner, call HR_GRG_dLock, player] remoteExecCall ['HR_GRG_fnc_addVehicle',2];}];
                    _button ctrlEnable true;
                };
                case ("RRR"): {
                    _button ctrlSetTooltip "Coming soon";
                };
                case ("airSupport"): {
                    // Disable "add to air support" button if vehicle is not eligible
                    _button ctrlSetText "Add to air support";
                    if (player isNotEqualTo theBoss) exitWith {
                        _button ctrlSetTooltip localize "STR_antistasi_dialogs_main_commander_only_tooltip";
                    };
                    //Valid area to convert to air support
                    private _friendlyMarkers = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] == teamPlayer}; //rebel locations with a flag
                    private _inArea = _friendlyMarkers findIf { count ([player, _vehicle] inAreaArray _x) > 1 };
                    if (!(_inArea > -1) && (_vehicle isKindOf "Air")) exitWith { 
                        _button ctrlSetTooltip "Must be near airbase or HQ to add to air support";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    _button ctrlAddEventHandler ["ButtonClick", {[_this getVariable "vehicle"] call A3A_fnc_addBombRun}];
                    _button ctrlEnable true;
                };
                case ("toggleAI"): {
                    _button ctrlSetText "Allow AI to use";
                    private _isLocked = (_vehicle isNil "lockedForAI");
                    if (_target getVariable ['ownerSide', teamPlayer] != teamPlayer) exitWith {
                        _button ctrlSetTooltip "Vehicle is not a rebel vehicle";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    if (_isLocked) then {
                        _button ctrlAddEventHandler ["ButtonClick", {[_this getVariable "vehicle"] call A3A_fnc_unlockStatic}];
                    } else {
                        _button ctrlSetText "Block AI from using";
                        _button ctrlAddEventHandler ["ButtonClick", {[_this getVariable "vehicle"] call A3A_fnc_lockStatic}];
                    }
                };
                case ("addToGarrison"): {
                    _button ctrlSetText "Add to garrison";
                    if (_vehicle getVariable ['ownerSide', teamPlayer] != teamPlayer) exitWith {
                        _button ctrlSetTooltip "Vehicle is not a rebel vehicle";
                    };
                    if !(_vehicle isNil 'markerX') exitWith {
                        _button ctrlSetTooltip "Vehicle is already in garrison";
                    };
                    private _marker = [getPosATL _vehicle] call A3A_fnc_getMarkerForPos;
                    if (_marker == "" or { sidesX getVariable _marker != teamPlayer }) then {
                        _button ctrlSetTooltip localize "STR_A3A_garrison_vehicle_outside";
                    };
                    if (crew _vehicle isNotEqualTo []) exitWith {
                        _button ctrlSetTooltip "Vehicle must be uncrewed";
                    };
                    _button setVariable ["vehicle", _vehicle];
                    _button ctrlAddEventHandler ["ButtonClick", {[_this getVariable "vehicle", player] call A3A_fnc_actionGarrisonVehicle}];
                    _button ctrlEnable true;
                };
                case ("empty");
                default {

                };
            };

        } forEach _garageContextOptions;
    };
    case {markerpos "Synd_HQ" distance player < 75}: {
        diag_log "ran near hq";
        // two fixed buttons
        _roleSelectButton = _contextHoriz1Button;
        _vehArsenalButton = _contextHoriz2Button;
        _roleSelectButton ctrlShow true;
        _vehArsenalButton ctrlShow true;
        _roleSelectButton ctrlSetText "Change Role";
        _vehArsenalButton ctrlSetText "Vehicle Arsenal";

        _roleSelectButton ctrlAddEventHandler ["ButtonClick", {createDialog "A3A_RoleSelectDialog";}];
        _roleSelectButton ctrlEnable true;

        if (player != (driver vehicle player)) exitWith {
            _vehArsenalButton ctrlSetTooltip "Must be driver of a vehicle to modify its inventory";
        };
        _vehArsenalButton ctrlAddEventHandler ["ButtonClick", JN_fnc_arsenal_handleAction];
        _vehArsenalButton ctrlEnable true;
    };
    default {
        _contextGroup ctrlShow false;
        _noActionsGroup ctrlShow true;
    };
};
