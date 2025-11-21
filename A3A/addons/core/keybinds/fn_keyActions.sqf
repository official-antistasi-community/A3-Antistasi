#include "..\..\gui\dialogues\ids.inc" // include new UI ids
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_key"];
if !(isClass (missionConfigFile/"A3A")) exitWith {}; //not a3a mission

switch (_key) do {
    case QGVAR(customHintDismiss): {
        [] call A3A_fnc_customHintDismiss;
    };

    // Actions below here aren't valid until the game is started and client init is complete
    if (isNil "initClientDone") exitWith {};

    case ("newgui");
    case QGVAR(battleMenu): {
        if (player getVariable ["incapacitated",false]) exitWith {};
        if (player getVariable ["owner",player] != player) exitWith {};
        if (GVAR(keys_battleMenu) && !(_key == "newgui")) exitWith {};         // fucking thing actually refires on closeDialog?
        if (dialog) exitWith {};
        GVAR(keys_battleMenu) = true; //used to block certain actions when menu is open

        // So what the fuck is going on here? Let's see...
        // Problem 1: If you open the dialog with the commanding menu open, the map controls cannot be zoomed.
        // Problem 2: There is no known way to close the commanding menu immediately. It needs to fade out.
        // Problem 3: The commanding menu will not fade out with a dialog open.
        // Problem 4: Unless there's a dialog open, the default Y key bind will also open or ping Zeus.
        // Problem 5: Arma likes to refire the key events when you close a dialog.
        // tl;dr: Do not rearrange this logic or clowns will eat your children.
        if (A3A_GUIDevPreview || (_key == "newgui")) then {
            createDialog "A3A_dummyDialog";
            player setVariable ["autoSwitchGroups", [hcSelected player, false]];
            [] spawn {
                closeDialog 0;
                waitUntil { showCommandingMenu ""; hcSelected player isEqualTo [] };
                createDialog "A3A_MainDialog";
                sleep 1; 
                GVAR(keys_battleMenu) = false;
            };
        } else {
            closeDialog 0;
            createDialog "radio_comm";
            [] spawn { sleep 1; GVAR(keys_battleMenu) = false; };   
        };
    };

    case QGVAR(artyMenu): {
        if (player getVariable ["incapacitated",false]) exitWith {};
        if (player getVariable ["owner",player] != player) exitWith {};
        if (player isEqualTo theBoss) then {
            if (A3A_GUIDevPreview) then {
                [] spawn {
                    player setVariable ["autoSwitchGroups", [hcSelected player, true]];
                    showCommandingMenu "";                          // clear the command menu so that we have the scroll wheel  
                    private _timeout = time;  
                    waitUntil { hcSelected player isEqualTo [] or time - _timeout > 1 };  
                    createDialog "A3A_MainDialog";  
                    sleep 1;  
                    player setVariable ["autoSwitchGroups", []];  
                };  
            } else {
                GVAR(keys_battleMenu) = true; //used to block certain actions when menu is open
                [] spawn A3A_fnc_artySupport;
                [] spawn { sleep 1; GVAR(keys_battleMenu) = false;};
            };
        };
    };

    case QGVAR(infoBar): {
        if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};
        if (isNil "A3A_hideInfobarHints") exitWith {};

        private _display = uiNameSpace getVariable "H8erHUD";
        private _infoBarControl = _display displayCtrl 1001;
        private _keyName = actionKeysNames QGVAR(infoBar);
        _keyName = _keyName select [1, count _keyName - 2];

        private _isShown = ctrlShown _infoBarControl;
        ["KEYS", _isShown] call A3A_fnc_disableInfoBar;
        private _string = ["on", "off"] select _isShown;
        if (A3A_hideInfobarHints) exitWith {};
        [localize "STR_antistasi_dialogs_toggle_info_bar_title", format [localize format ["STR_antistasi_dialogs_toggle_info_bar_body_%1", _string], _keyName], false] call A3A_fnc_customHint;
    };

    case QGVAR(earPlugs): {
        if (!A3A_hasACEHearing) then {
            if (soundVolume <= 0.5) then {
                0.5 fadeSound 1;
                [localize "STR_A3A_keybinds_keyAcc_earplugs_title", localize "STR_A3A_keybinds_keyAcc_earplugs_out", true] call A3A_fnc_customHint;
            } else {
                0.5 fadeSound 0.1;
                [localize "STR_A3A_keybinds_keyAcc_earplugs_title", localize "STR_A3A_keybinds_keyAcc_earplugs_in", true] call A3A_fnc_customHint;
            };
        };
    };

    Default {
        Error_1("Key action not registered: %1", _key)
    };
};
