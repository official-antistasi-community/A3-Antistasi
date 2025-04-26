#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
#include "..\..\gui\dialogues\ids.inc" // include new UI ids
params ["_key"];
if !(isClass (missionConfigFile/"A3A")) exitWith {}; //not a3a mission

switch (_key) do {
    case QGVAR(customHintDismiss): {
        [] call A3A_fnc_customHintDismiss;
    };

    // Actions below here aren't valid until the game is started and client init is complete
    if (isNil "initClientDone") exitWith {};

    case QGVAR(battleMenu): {
        if (player getVariable ["incapacitated",false]) exitWith {};
        if (player getVariable ["owner",player] != player) exitWith {};
        GVAR(keys_battleMenu) = true; //used to block certain actions when menu is open
    #ifdef UseDoomGUI
        ERROR("Disabled due to UseDoomGUI Switch.")
    #else
        closeDialog 0;
        private _dialog = ["radio_comm","A3A_MainDialog"] select A3A_GUIDevPreview;
        createDialog _dialog;
    #endif
        [] spawn { sleep 1; GVAR(keys_battleMenu) = false; };
    };

    case QGVAR(artyMenu): {
        if (player getVariable ["incapacitated",false]) exitWith {};
        if (player getVariable ["owner",player] != player) exitWith {};
        if (player isEqualTo theBoss) then {
            if (A3A_GUIDevPreview) then {
                /*
                player setVariable ["accessingArtyMenu",true];
                createDialog "A3A_MainDialog";
                [] spawn { sleep 1; player setVariable ["accessingArtyMenu",false];};
                */
                [] spawn {
                    player setVariable ["selHcGroups",hcSelected player];
                    showCommandingMenu "";                          // clear the command menu so that we have the scroll wheel  
                    private _timeout = time;  
                    waitUntil { hcSelected player isEqualTo [] or time - _timeout > 1 };  
                    createDialog "A3A_MainDialog";  
                    sleep 1;  
                    player setVariable ["selHcGroups",[]];  
                };  
            } else {
                GVAR(keys_battleMenu) = true; //used to block certain actions when menu is open
                [] spawn A3A_fnc_artySupport;
                [] spawn { sleep 1; GVAR(keys_battleMenu) = false;};
            };
        };
    };

    case QGVAR(infoBar): {
    #ifdef UseDoomGUI
        ERROR("Disabled due to UseDoomGUI Switch.")
    #else
        if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};

        private _display = uiNameSpace getVariable "H8erHUD";
        private _infoBarControl = _display displayCtrl 1001;
        private _keyName = actionKeysNames QGVAR(infoBar);
        _keyName = _keyName select [1, count _keyName - 2];

        if (ctrlShown _infoBarControl) then {
            ["KEYS", true] call A3A_fnc_disableInfoBar;
            [localize "STR_antistasi_dialogs_toggle_info_bar_title", format [localize "STR_antistasi_dialogs_toggle_info_bar_body_off", _keyName], false] call A3A_fnc_customHint;
        } else {
            ["KEYS", false] call A3A_fnc_disableInfoBar;
            [localize "STR_antistasi_dialogs_toggle_info_bar_title", format [localize "STR_antistasi_dialogs_toggle_info_bar_body_on", _keyName] , false] call A3A_fnc_customHint;
        };
    #endif
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
