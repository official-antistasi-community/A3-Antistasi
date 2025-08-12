/*
 * File: fn_loadout_addItems.sqf
 * Author: Spoffy
 * Description:
 *    Adds batches of items to a unit incrementally until we run out of space.
 *    The idea is to be able to prioritise items. So batch 1 is more than important than batch 2, etc.
 *    This way, if the last batch doesn't fit, it's not the end of the world.
 * Params:
 *    _loadout - Loadout to add items to
 *    _rawItemBatches - Batches of items, in format [[["class1", 1], ["class2", 1]], [["class 3", 1]]]
 * Returns:
 *    Loadout
 * Example Usage:
 *    Example usage goes here
 */


params ["_loadout", "_rawItemBatches"];

private _fileName = "fn_loadout_addItems";

/*
Create the batches of items that will be added
*/

private _itemBatches = [];

{
	private _rawItems = _x;
	private _items = [];
	private _batchLoadTotal = 0;
	{
		//Create a new array for the item info, we don't accidentally use the same array that was passed into this function.
		private _item = if (_x isEqualType "") then {
			if (isClass (configFile >> "CfgMagazines" >> _x)) then {
				[[_x, 1, 1]]
			} else {
				[[_x, 1]]
			}
		} else {
			[+_x]
		};
		//Add load of a single item to the item array
		_item pushBack ([_item select 0 select 0] call A3A_fnc_loadout_itemLoad);
		//Add total load to the item array
		_item pushBack ((_item select 0 select 1) * (_item select 1));
		//Final array format: [[class, count, ammoInMag?], single item load, all items load]
		_items pushBack _item;
		//Add total load to the overall load of the batch
		_batchLoadTotal = _batchLoadTotal + (_item select 2);
 	} forEach _rawItems;

	 _itemBatches pushBack [_batchLoadTotal, _items];
} forEach _rawItemBatches;


/*
 Calculate how much free load we have in each uniform/vest/backpack
*/

private _uniform = _loadout select 3;
private _vest = _loadout select 4;
private _backpack = _loadout select 5;

private _uniformMaxLoad = 0;
private _uniformCurrentLoad = 0;
private _vestMaxLoad = 0;
private _vestCurrentLoad = 0;
private _backpackMaxLoad = 0;
private _backpackCurrentLoad = 0;

if (count _uniform > 0) then {
	_uniformMaxLoad = getContainerMaxLoad (_uniform select 0);
	{
		_uniformCurrentLoad = _uniformCurrentLoad + ([_x] call A3A_fnc_loadout_itemLoad);
	} forEach (_uniform select 1);
};

if (count _vest > 0) then {
	_vestMaxLoad = getContainerMaxLoad (_vest select 0);
	{
		_vestCurrentLoad = _vestCurrentLoad + ([_x] call A3A_fnc_loadout_itemLoad);
	} forEach (_vest select 1);
};

if (count _backpack > 0) then {
	_backpackMaxLoad = getContainerMaxLoad (_backpack select 0);
	{
		_backpackCurrentLoad = _backpackCurrentLoad + ([_x] call A3A_fnc_loadout_itemLoad);
	} forEach (_backpack select 1);
};

/*
 Attempt to add the items where possible
*/
private _uniformItems = if (_uniform isEqualTo []) then {[]} else {_uniform select 1};
private _vestItems = if (_vest isEqualTo []) then {[]} else {_vest select 1};
private _backpackItems = if (_backpack isEqualTo []) then {[]} else {_backpack select 1};

{
	private _spareLoad = (_uniformMaxLoad + _vestMaxLoad + _backpackMaxLoad) - (_uniformCurrentLoad + _vestCurrentLoad + _backpackCurrentLoad);

	//If we've run out of space, might as well stop trying! 
	//Using '1' instead of '0', in case we have a small, but useless amount of space to fill, and up doing a bunch of work for no reason
	if (_spareLoad <= 1) exitWith {};

	private _batchInfo = _x;
	_batchInfo params ["_batchLoad", "_items"];

	//_itemRemoved is our infinite-loop failsafe.
	//If we're no longer removing items, we can stop looping.
	private _itemRemoved = true;
	while {_batchLoad > _spareLoad && _itemRemoved} do {
		_itemRemoved = false;
		{
			_x params ["_itemInfo", "_unitLoad", "_totalLoad"];
			_itemInfo params ["_class", "_count"];
			//We only remove items that we have more than 1 of, to avoid removing 'critical' equipment.
			if (_count > 1) then {
				_itemInfo set [1, _count - 1];
				_x set [2, _totalLoad - _unitLoad];
				_batchLoad = _batchLoad - _unitLoad;
				_batchInfo set [0, _batchLoad];
				_itemRemoved = true;
			};

			//We can stop trimming if we've got enough space.
			if (_batchLoad <= _spareLoad) exitWith {};
		} forEach _items;
	};

	//Now we're done trimming, we can actually go add the items.
	//This algorithm will overfill the backpacks from time to time, but it saves us lots of iterations.
	//We'll also never overfill a unit - the stuff they carry will always fit in the sum of all their containers.
	//It also makes sure all of one class are in the same container (for better or for worse)
	{
		_x params ["_itemInfo", "_unitLoad", "_totalLoad"];
		_itemInfo params ["_class", "_count"];
		if (_count > 0) then {
			switch (true) do {
				case (_totalLoad < (_uniformMaxLoad - _uniformCurrentLoad)): {
					_uniformItems pushBack _itemInfo;
					_uniformCurrentLoad = _uniformCurrentLoad +	_totalLoad;
				};
				case (_totalLoad < (_vestMaxLoad - _vestCurrentLoad) or _backpackMaxLoad == 0): {
					_vestItems pushBack _itemInfo;
					_vestCurrentLoad = _vestCurrentLoad + _totalLoad;
				};
				default {
					_backpackItems pushBack _itemInfo;
					_backpackCurrentLoad = _backpackCurrentLoad + _totalLoad;
				};
			};
		};
	} forEach _items
} forEach _itemBatches;

_loadout




