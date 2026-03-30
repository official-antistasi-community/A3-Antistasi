// Uses hintC on clients & blocks until acknowledged
// Returns immediately on server/HC, server publishes A3A_serverBadMods

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _blacklistedHM = createHashMapFromArray [ // ["Mod Name As Seen On Steam", [{condition}, "Dev Comment"],
    // All of these strings dont need to be localized
    ["LAMBS_Danger", [{isClass (configfile >> "CfgPatches" >> "lambs_danger")}, "Causes AI to walk away from garrisons and ignore tasks assigned by Antistasi"]],
    ["Vcom", [{isClass (configfile >> "CfgPatches" >> "VCOM_AI")}, "Breaks Antistasi AI and also causes AI to attempt to steal random vehicles"]],
    ["ALiVE", [{isClass (configfile >> "CfgVehicles" >> "ALiVE_require")}, "Antistasi has its own save system and AI command system, stops game from starting entirely"]], // also hard breaks game start LOL
    ["MCC Sandbox 4", [{missionNamespace getVariable ["MCC_isMode",false]}, ""]], // blocked from a while ago, could find no solid info
    ["ASR AI3", [{"asr_ai3_main" in activatedAddons}, ""]], // blocked from a while ago, could find no solid info
    ["Project Injury Reaction (PiR)", [{isClass (configfile >> "CfgPatches" >> "PiR")}, "Breaks the death / unconscious states for Antistasi medical. May work fine with ACE Medical."]],
    ["Zulu Headless Client (ZHC)", [{isClass (configfile >> "CfgPatches" >> "zhc_main")}, "Antistasi is reliant on its own scripts for using headless clients"]],
    ["Werthles' Headless Module", [{isClass (configfile >> "CfgPatches" >> "Werthles_WHK")}, "Antistasi is reliant on its own scripts for using headless clients"]],
    ["Advanced Rappelling", [{isClass (configfile >> "CfgPatches" >> "AR_AdvancedRappelling") && (isServer && (productVersion # 6) isEqualTo "Linux")}, "Breaks AI movement on Linux servers"]],
    ["Advanced Urban Rappelling", [{isClass (configfile >> "CfgPatches" >> "AUR_AdvancedUrbanRappelling") && (isServer && (productVersion # 6) isEqualTo "Linux")}, "Breaks AI movement on Linux servers"]],
    ["ACE Medical", [{isClass (configFile >> "CfgSounds" >> "ACE_heartbeat_fast_3") && {!isMultiplayer}}, "Breaks respawning in singleplayer. Download the ACE No Medical mod to get the rest of the ACE features without the broken medical"]], // broken only in real sp
    ["Antistasi Plus", [{isClass (configFile >> "CfgPatches" >> "A3A_scrt") && (!isClass (configFile >> "CfgPatches" >> "A3A_ultimate"))}, "Multiple versions of Antistasi cannot be ran at once. Please remove Antistasi Plus from your modlist to play"]],
    ["Antistasi Ultimate - Mod", [{isClass (configFile >> "CfgPatches" >> "A3A_ultimate")}, "Multiple versions of Antistasi cannot be ran at once. Please remove Antistasi Ultimate - Mod from your modlist to play"]]
];

// First show bad mods running on server, if there are any
if (hasInterface and !isServer and !isNil "A3A_serverBadMods") then {
    {
        private _mod = _x;
        private _devComment = (_blacklistedHM get _mod)#1;
        if (_devComment isEqualTo "") then {_devComment = "None"};
        localize "STR_A3A_mod_blacklist_titleServer" hintC parseText format [localize "STR_A3A_mod_blacklist_textServer", _mod, _devComment];
        waitUntil {sleep 0.01; isNull findDisplay 72};
        hintSilent "";
    } forEach A3A_serverBadMods;
};

private _badMods = [];

{
    if (call (_y#0)) then {_badMods pushBack _x};
} forEach _blacklistedHM;

if (count _badMods == 0) exitWith {};
private _formattedBadMods = _badMods joinString ", ";

Error_1("Blacklisted mods detected: %1. Removing these mods is recommended.", _formattedBadMods)

// this can be a single case for right now
if ("LAMBS_Danger" in _badMods) then {
    // disable lambs danger fsm entrypoint
    // lambs also has cba dependency
    ["CAManBase", "InitPost", {
        params ["_unit"];
        (group _unit) setVariable ["lambs_danger_disableGroupAI", true];
        _unit setVariable ["lambs_danger_disableAI", true];
    }] call CBA_fnc_addClassEventHandler;
};

if !(hasInterface) exitWith {
    if !(isServer) exitWith {};         // Don't show UI stuff for HCs. Should probably end the mission but whatever.
    A3A_serverBadMods = _badMods;
    publicVariable "A3A_serverBadMods";
};

{
    private _mod = _x;
    private _devComment = (_blacklistedHM get _mod)#1;
    if (_devComment isEqualTo "") then {_devComment = "None"};
    localize "STR_A3A_mod_blacklist_title" hintC parseText format [localize "STR_A3A_mod_blacklist_text", _mod, _devComment];
    waitUntil {sleep 0.01; isNull findDisplay 72};
    hintSilent "";
} forEach _badMods;
