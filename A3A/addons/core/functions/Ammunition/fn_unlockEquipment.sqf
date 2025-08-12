/**
	Unlocks the specified item of equipment for use in the arsenal.

	Updates the appropriate global arrays for quick reference.
	You can also find unlockedRifles and other variables constructed here. - FrostsBite.

	Params:
		_className - Class of the equipment to unlock.
		_noPublish - If true, don't broadcast the unlockedXXX arrays. For internal use.
		_dontAddToArsenal - Avoid adding the item to the arsenal, and simply updates the appropriate variables. DO NOT USE UNLESS YOU HAVE A *VERY* GOOD REASON. Primarily used in save/loads.

	Returns:
		Array of categories for item
**/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_className", ["_noPublish", false], ["_dontAddToArsenal", false]];

private _categories = _className call A3A_fnc_equipmentClassToCategories;

if (!_dontAddToArsenal) then {
	//Add the equipment to the arsenal.
	private _arsenalTab = _className call jn_fnc_arsenal_itemType;
	[_arsenalTab,_className,-1] call jn_fnc_arsenal_addItem;
	if (!isNil "serverInitDone") then {ServerDebug_1("Item unlocked: %1", _className)};
};

{
	(missionNamespace getVariable ("unlocked" + _x)) pushBackUnique _className;
	if (!_noPublish) then { publicVariable ("unlocked" + _x) };
} forEach _categories;

_categories;
