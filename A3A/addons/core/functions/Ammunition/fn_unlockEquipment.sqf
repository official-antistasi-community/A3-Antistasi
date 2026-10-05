/**
	Unlocks the specified item of equipment for use in the arsenal.

	Updates the appropriate global arrays for quick reference.
	You can also find unlockedRifles and other variables constructed here. - FrostsBite.

	All functional variants of the item (see A3A_fnc_buildItemVariants) are unlocked with it.
	Unlocking a magazine also unlocks smaller magazines with the same ammo that share a weapon.

	Params:
		_className - Class of the equipment to unlock.
		_noPublish - If true, don't broadcast the unlockedXXX arrays. For internal use.
		_dontAddToArsenal - Avoid adding the item to the arsenal, and simply updates the appropriate variables. DO NOT USE UNLESS YOU HAVE A *VERY* GOOD REASON. Primarily used in save/loads.
		_noCascade - If true, don't unlock smaller magazines. For internal use.

	Returns:
		Array of categories for item
**/
#include "..\..\script_component.hpp"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
FIX_LINE_NUMBERS()
params ["_className", ["_noPublish", false], ["_dontAddToArsenal", false], ["_noCascade", false]];

private _categories = +(_className call A3A_fnc_equipmentClassToCategories);		// copy, the result is cached

if (!_dontAddToArsenal) then {
	//Add the equipment to the arsenal.
	private _arsenalTab = _className call jn_fnc_arsenal_itemType;
	[_arsenalTab,_className,-1] call jn_fnc_arsenal_addItem;
	if (!isNil "serverInitDone") then {ServerDebug_1("Item unlocked: %1", _className)};
};

// Variants can be in different categories (eg. rifle vs MG, which Antistasi derives from the crosshair)
{
	private _variant = _x;
	private _variantCategories = _variant call A3A_fnc_equipmentClassToCategories;
	{
		private _unlocked = missionNamespace getVariable ("unlocked" + _x);
		if (isNil "_unlocked") then { continue };			// not every category is unlockable
		_unlocked pushBackUnique _variant;
		_categories pushBackUnique _x;
	} forEach _variantCategories;
} forEach ([_className] call A3A_fnc_itemVariants);
if (!_noPublish) then { { publicVariable ("unlocked" + _x) } forEach _categories };

if (!_noCascade and !_dontAddToArsenal and {"Magazines" in _categories} and {!isNil "A3A_magUnlockCascade"}) then {
	private _arsenalMags = jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL;
	{
		if ([_arsenalMags, _x] call jn_fnc_arsenal_itemCount == -1) then { continue };
		if (!isNil "serverInitDone") then {ServerDebug_2("Magazine %1 unlocked by %2", _x, _className)};
		private _cascadeCategories = [_x, _noPublish, false, true] call A3A_fnc_unlockEquipment;
		{ _categories pushBackUnique _x } forEach _cascadeCategories;
	} forEach (A3A_magUnlockCascade getOrDefault [_className call A3A_fnc_itemVariantRep, []]);
};

_categories;
