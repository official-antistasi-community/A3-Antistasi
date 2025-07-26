/*
 * File: fn_loadout_itemList_miscEssentials.sqf
 * Author: Spoffy
 * Description:
 *    Generates list of miscellaneous essential items needed by each soldier
 * Params:
 *    None
 * Returns:
 *    None
 * Example Usage:
 *    Example usage goes here
 */

private _items = [];

if (A3A_hasACE) then {
	_items append [
		["ACE_EarPlugs", 1],
		["ACE_MapTools", 1],
		["ACE_CableTie", 1],
		["ACE_Flashlight_XL50", 1]
	];
};

if (A3A_hascTab) then {
	_items append [
		["ItemcTabHCam", 1]
	];
};

_items