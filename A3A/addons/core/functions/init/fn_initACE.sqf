/*
 * File: fn_initACE.sqf
 * Function: A3A_fnc_initACE
 * Function description
 * Initialization code for ACE3 stuff
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * call A3A_fnc_initACE;
 *
 * Public: No
 */

#include "..\..\script_component.hpp"

if (A3A_hasACEMedical) then { 
    // log atropine, epinephrine, and morphine use
    // Appears to be local to the medic
    ["ace_treatmentSucceded", {
        params ["_caller", "_target", "_selectionName", "_className", "_itemUser", "_usedItem"];
        if (_usedItem in ["ACE_adenosine", "ACE_epinephrine", "ACE_morphine", "ACE_painkillers"]) then {
            private _callerUID = ["AI",getPlayerUID _caller] select (isPlayer _caller);
            private _targetUID = ["AI",getPlayerUID _target] select (isPlayer _target);
            ServerInfo_5("Player %1 [%2] used %3 on %4 [%5]",name _caller,_callerUID,_usedItem,name _target,_targetUID);
        };
    }] call CBA_fnc_addEventHandler;
};

["ace_explosives_place", {
    params ["_explosive","_dir","_pitch","_unit"];
    if (captive player && _unit == player) then { player setCaptive false };
}] call CBA_fnc_addEventHandler;

["ace_throwableThrown", { 
    params ["_unit", "_throwable"]; 
    if (captive player && _unit == player) then { player setCaptive false }; 
}] call CBA_fnc_addEventHandler;

["ace_towing_ropeDeployed", {
    params ["_unit", "_target", "_ropeClass"];
    if (captive player && _unit == player) then { player setCaptive false };
}] call CBA_fnc_addEventHandler;

[boxX, boxX] call ace_common_fnc_claim;	//Disables ALL Ace Interactions
[vehicleBox, VehicleBox] call ace_common_fnc_claim;	//Disables ALL Ace Interactions

if (isNil "ace_interact_menu_fnc_compileMenu" || isNil "ace_interact_menu_fnc_compileMenuSelfAction") exitWith {
    Error("ACE non-public functions have changed, rebel group join/leave actions will not be removed.");
};

// Remove actions from Antistasi unit types
// Need to compile the menus first, because ACE delays creating menus until a unit of that class is created

{
    [_x] call ace_interact_menu_fnc_compileMenu;
    [_x] call ace_interact_menu_fnc_compileMenuSelfAction;
    [_x, 0, ["ACE_ApplyHandcuffs"]] call ace_interact_menu_fnc_removeActionFromClass;
    [_x, 1, ["ACE_SelfActions", "ACE_TeamManagement", "ACE_LeaveGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
    [_x, 0, ["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
} forEach A3A_customUnitClasses;			// TODO: add raw unit types from new templates

