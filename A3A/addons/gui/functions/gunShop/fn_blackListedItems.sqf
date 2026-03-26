/*
 * File: fn_blackedListedItems.sqf
 * Function: 
 * Author: <author>
 * Function description
 * returns an array of the blocked items
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call afm_main_fnc_example
 *
 * Public: No
 */

#include "..\..\script_component.hpp"

// get the items from the json file
// A3A\addons\gui\functions\gunShop\blackedListedItems.json
if(isNil "A3A_GS_blockeditemsJson") then {
    A3A_GS_blockeditemsJson = fromJSON loadFile QPATHTOFOLDER(functions\gunShop\blackListedItems.json);
};

// clear the array
A3A_GS_blockedItems = [];
// deep copy to avoid duplicates
A3A_GS_blockedItems = +(A3A_GS_blockeditemsJson get "default");

// admins can block items on the fly with A3A_GS_adminBlockedItems
if(!isNil "A3A_GS_adminBlockedItems") then {A3A_GS_blockedItems append A3A_GS_adminBlockedItems};
