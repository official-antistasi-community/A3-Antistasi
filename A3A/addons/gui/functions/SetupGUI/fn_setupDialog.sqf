/*
    Handles the initialization and tab switching on the setup dialog.
    This function should only be called from setupDialog onLoad and control activation EHs.

Environment: Scheduled for onLoad, sendData and serverClose modes. Unscheduled for everything else.

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params["_mode", "_params"];

Debug_1("Setup dialog called with mode %1", _mode);

// Function to give a short time difference string from two serverTimeUTC inputs
private _fnc_getTimeDiffString = {
    params ["_oldTime", "_newTime"];
    private _text = ["yr", "mon", "day", "hr", "min"];
    private _range = [0, 12, 30, 24, 60];		// lazy but close enough

    private _diffTime = [0, 0, 0, 0, 0];
    for "_i" from 4 to 0 step -1 do {
        _diffTime set [_i, _diffTime#_i + _newTime#_i - _oldTime#_i];
        if (_i == 0 or _diffTime#_i >= 0) then { continue };
        _diffTime set [_i, _diffTime#_i + _range#_i];
        _diffTime set [_i-1, -1];
    };

    // now find first non-zero
    private _nzi = _diffTime findif {_x!=0};
    if (_nzi == -1) exitWith { "0min" };									// zero time diff
    if (_diffTime#_nzi < 0) exitWith { "???" };							// negative time diff
    if (_nzi == 4) exitWith { format ["%1min", _diffTime#4] };		// just minutes
    format ["%1%2 %3%4", _diffTime#_nzi, _text#_nzi, _diffTime#(_nzi+1), _text#(_nzi+1)];
};


// Get display
private _display = findDisplay A3A_IDD_SETUPDIALOG;

switch (_mode) do
{
    case ("onLoad"):
    {
        if (isNil "A3A_setup_saveData") exitWith { Error("onLoad somehow called without save data") };
        ["fillFactions", [true]] call A3A_GUI_fnc_setupFactionsTab;
        ["setSaveData"] call A3A_GUI_fnc_setupLoadgameTab;
        ["switchTab", ["loadgame"]] call A3A_GUI_fnc_setupDialog;
    };

    case ("onUnload"):
    {
        // Restart if it wasn't server-closed
        if (isNil "A3A_setup_saveData") exitWith {};
        0 spawn {
            sleep 4;
            Debug("Waiting until escape menu is closed");
            waitUntil { sleep 1; isNull findDisplay 49 and !dialog };       // escape menu or user dialog
            if (isNil "A3A_setup_saveData") exitWith {};                        // might have been server-closed during the sleep
            Debug("Restarting setup dialog");
            createDialog "A3A_setupDialog";
        };
    };

    case ("switchTab"):
    {
        _params params ["_selectedTab"];

        Debug_1("SetupDialog switching tab to %1.", _selectedTab);

        private _selectedTabIDC = switch (_selectedTab) do
        {
            case ("loadgame"): { A3A_IDC_SETUP_LOADGAMETAB };
            case ("factions"): { A3A_IDC_SETUP_FACTIONSTAB };
            case ("params"): { A3A_IDC_SETUP_PARAMSTAB };
        };

        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow (_x == _selectedTabIDC);
        } forEach [A3A_IDC_SETUP_LOADGAMETAB, A3A_IDC_SETUP_FACTIONSTAB, A3A_IDC_SETUP_PARAMSTAB];

        switch (_selectedTab) do
        {
            case ("loadgame"): { ["update"] call A3A_GUI_fnc_setupLoadgameTab };
            case ("factions"): { ["update"] call A3A_GUI_fnc_setupFactionsTab };
            case ("params"): { ["update"] call A3A_GUI_fnc_setupParamsTab };
        };
    };

    case ("sendData"):
    {
        _params params ["_saveData", "_loadedPatches", "_loadedDLC"];

        // Generate user map names
        private _prettyMapHM = createHashMapFromArray [
            ["vt7", "Virolahti"]
            ,["sara", "Sahrani"]
            ,["Cam_Lao_Nam", "Cam Lao Nam"]
            ,["vn_khe_sanh", "Khe Sanh"]
            ,["chernarus_autumn", "Chernarus (A)"]
            ,["chernarus_summer", "Chernarus (S)"]
            ,["chernarus_winter", "Chernarus (W)"]
            ,["Enoch", "Livonia"]
            ,["tem_anizay", "Anizay"]
            ,["cup_chernarus_A3", "Cherno 2020"]
            ,["SPE_Normandy", "Normandy"]
            ,["SPE_Mortain", "Mortain"]
        ];
        {
            private _realMap = _x get "map";
            _x set ["mapStr", _prettyMapHM getOrDefault [_realMap, _realMap]];
            _x set ["fileStr", ["Old", "New"] select ((_x get "serverID") isEqualType false)];
            if (!isNil {_x get "ended"}) then { _x set ["timeStr", "Ended"]; continue };
            if (!isNil {_x get "saveTime"}) then {
                _x set ["timeStr", [_x get "saveTime", systemTimeUTC] call _fnc_getTimeDiffString];
            };
            if (!isNil {_x get "version"}) then {
                _x set ["verStr", (_x get "version") splitString "." select [0, 3] joinString "."];        // cap to a.b.c
            };
        } forEach _saveData;

        A3A_setup_saveData = _saveData;
        A3A_setup_loadedPatches = _loadedPatches;
        A3A_setup_loadedDLC = _loadedDLC;

        if (!isNull _display) exitWith {
            Error("Server sent data while dialog is open? Curious");
            ["onLoad"] spawn A3A_GUI_fnc_setupDialog;                                // Should rebuild dialog with new data. Hopefully.
        };

        if (isNull findDisplay 46 or !isNull findDisplay 49 or dialog) then {
            Debug("Waiting until main game display is open and other dialogs are closed");
            waitUntil { sleep 1; !isNull findDisplay 46 and isNull findDisplay 49 and !dialog };
        };
        Debug("Creating setup dialog");
        createDialog "A3A_setupDialog";
    };

    case ("serverClose"):
    {
        Debug("Server requested dialog close");
        A3A_setup_saveData = nil;
        if (!isNull _display) then { closeDialog 0 };
    };

    default {
    // Log error if attempting to call a mode that doesn't exist
        Error_1("Mode %1 does not exist", _mode);
    };
};
