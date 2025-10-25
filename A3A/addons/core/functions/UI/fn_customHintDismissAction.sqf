/*
Function:
    A3A_fnc_customHintDismissAction

Description:
    Runs specialized actions when specific hints are dismissed, signaling player's awareness

Scope:
    <LOCAL> Local to the client that dismissed the hint

Environment:
    <UNSCHEDULED>

Parameters:
    <STRING> hint title [DEFAULT=""]
    <STRING> hint text [DEFAULT=""]
    <BOOLEAN> if the hint is silent [DEFAULT=false]

Returns:
    Nothing

Examples:
    [localize "STR_antistasi_dialogs_toggle_info_bar_body_on"] call A3A_fnc_customHintDismiss; // Disables top bar-info popups

Author: Tiny
*/

params [["_hintTitle",""], ["_hintText",""], ["_isSilent",false]];

switch (true) do {
    case ((_hintTitle isEqualTo (localize "STR_antistasi_dialogs_toggle_info_bar_title")) || (_hintText in [localize "STR_antistasi_dialogs_toggle_info_bar_body_off", localize "STR_antistasi_dialogs_toggle_info_bar_body_on"])): {
        profileNamespace setVariable ["A3A_doInfobarHint", true];
        saveProfileNamespace;
    };
};