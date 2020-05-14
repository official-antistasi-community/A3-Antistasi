private _crate = _this select 0;
private _gearType = _this select 1;
private _amount = _this select 2;

/** Names as variables */
private _expLight = "expLight";
private _expHeavy = "expHeavy";
private _aCache = "aCache";
private _aSRifles = "ASRifles";
private _pistols = "Pistols";
private _machineguns = "Machineguns";
private _sniperRifles = "Sniper Rifles";
private _launchers = "Launchers";
private _random = "Random";
/** END */

private _costMap = [
	[_expLight, 300, 800], // [_gearType, cost for "some", cost for "many", [amount of item (for "some"), amount of 2nd item, ...],[amount of item (for "many"), amount of 2nd item, ...], amount of magazine]
	[_expHeavy, 300, 800],
	[_aCache, 500, 5000],
	[_aSRifles, 1000, 2500],
	[_pistols, 1000, 2500],
	[_machineguns, 1000, 2500],
	[_sniperRifles, 1000, 2500],
	[_launchers, 1000, 2500],
	[_random, 1000, 2500]
];
private _costMapIndex = _costMap findIf { _x select 0 == _gearType; };
private _amountSelect = [2, 1] select (_amount == "some"); // Indexes of 'cost for "some"' and 'cost for "many"' inside the _costMap array
private _cost = (_costMap select _costMapIndex) select _amountSelect; // This gives us the price for "some" or "many" for the selected gearType

private _resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < _cost) exitWith {
	[Dealer,"localChat","Get lost ya cheap wanker!"] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
};

// TODO: Find a more stable solution for this
// If crate is completely full, exit
if (!(dealerCrate canAdd "H_Hat_Tinfoil_F")) exitWith { // Item has a `mass` of 1, so if that doesn't fit nothing will
	[Dealer,"localChat","There is no room in the crate, take some stuff out and try again."] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
};

/** Create item lists */
// TODO: These should actually be categorized in "mines" or "charges"
// TODO: If that is hard, you should edit the UI to reflect these categories
private _lockedLightMines = [];
private _lockedHeavyMines = [];
{
	private _ammoClassName = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
	private _hitValue = getNumber (configFile >> "CfgAmmo" >> _ammoClassName >> "hit");
	if (_hitValue > 200) then {
		_lockedHeavyMines pushBack _x;
	} else {
		_lockedLightMines pushBack _x;
	};
} forEach ((missionNamespace getVariable "allexplosives") - (missionNamespace getVariable "unlockedexplosives"));
private _lockedAttachments = [];
{
	private _unlockedAttachments = (missionNamespace getVariable format ["unlocked%1", _x]);
	if(isNil "_unlockedAttachments") then { _unlockedAttachments = []; }; // Sometimes var is nil?
	private _allAttachments = (missionNamespace getVariable format ["all%1", _x]);
	_lockedAttachments append (_allAttachments - _unlockedAttachments);
} forEach ["pointerattachments", "muzzleattachments", "lightattachments", "laserattachments"];
private _lockedASRifles = ((missionNamespace getVariable "allrifles") - (missionNamespace getVariable "unlockedrifles"));
private _lockedPistols = ((missionNamespace getVariable "allhandguns") - (missionNamespace getVariable "unlockedhandguns"));
private _lockedMachineguns = ((missionNamespace getVariable "allmachineguns") - (missionNamespace getVariable "unlockedmachineguns"));
private _lockedSniperRifles = ((missionNamespace getVariable "allsniperrifles") - (missionNamespace getVariable "unlockedsniperrifles"));
private _lockedLaunchers = ((missionNamespace getVariable "allmissilelaunchers") - (missionNamespace getVariable "unlockedmissilelaunchers")) + ((missionNamespace getVariable "allrocketlaunchers") - (missionNamespace getVariable "unlockedrocketlaunchers"));
/** END */

/** Prepare the order */
private _stuffToAddToCrate = [
	[], // items
	[]  // magazines
];
private _stuffItemIndex = 0;
private _stuffMagazineIndex = 1;
private _itemMap = [
	[_expLight, _lockedLightMines, [2,3], [3,8,8], 0], // [_gearType, item list, amounts for "some" items, amounts for "many" items, amount of magazines (for weapons)]
	[_expHeavy, _lockedHeavyMines, [2,3], [3,8,8], 0],
	[_aCache, _lockedAttachments, [2,3], [3,8,8], 0],
	[_aSRifles, _lockedASRifles, [2,3], [3,8,8], 4],
	[_pistols, _lockedPistols, [2,3], [3,8,8], 4],
	[_machineguns, _lockedMachineguns, [2,3], [3,8,8], 4],
	[_sniperRifles, _lockedSniperRifles, [2,3], [3,8,8], 4],
	[_launchers, _lockedLaunchers, [2,3], [3,8,8], 4],
	[_random, (_lockedASRifles+_lockedPistols+_lockedMachineguns+_lockedSniperRifles+_lockedLaunchers), [2,3], [3,8,8], 4]
];
private _itemMapIndex = _itemMap findIf { _x select 0 == _gearType; };
private _itemList = (_itemMap select _itemMapIndex) select 1;
private _itemAmountSelect = [3, 2] select (_amount == "some");
private _itemAmounts = (_itemMap select _itemMapIndex) select _itemAmountSelect;
private _magazineAmount = (_itemMap select _itemMapIndex) select 4;

{
	private _item = selectRandom _itemList;
	for "_i" from 1 to _x do {
		(_stuffToAddToCrate select _stuffItemIndex) pushBack _item;
	};

	if (_magazineAmount > 0) then {
		private _magazineTypes = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");
		if (count _magazineTypes > 0) then {
			private _magazine = (selectRandom _magazineTypes);
			for "_i" from 1 to _magazineAmount do {
				(_stuffToAddToCrate select _stuffMagazineIndex) pushBack _magazine;
			};
		};
	};
} forEach _itemAmounts;
/** END */

/** Check if the order didn't turn op empty */
private _amountOfStuff = count _stuffToAddToCrate;
if (_amountOfStuff == 0) exitWith {
	[Dealer,"localChat","Sorry, lad. Don't have any of that stuff right now. Check back later."] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
};
/** END */

/** Check if we can fit all requested stuff in the crate */
private _canAdd = true;
{
	_canAdd = dealerCrate canAdd _x;
	if (!_canAdd) exitWith {};
} forEach ((_stuffToAddToCrate select _stuffItemIndex) + (_stuffToAddToCrate select _stuffMagazineIndex));

if (!_canAdd) exitWith {
	[Dealer,"localChat","There is no room in the crate, take some stuff out and try again."] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
};
/** END */

/** Add requested stuff to the crate */
_stuffToAddToCrate pushBack "B_Carryall_oli"; // Free backpack with every purchase
{ dealerCrate addItemCargoGlobal [_x, 1]; } forEach (_stuffToAddToCrate select 0);
{ dealerCrate addMagazineCargoGlobal [_x, 1]; } forEach (_stuffToAddToCrate select 1);

[Dealer,"localChat","Aye, the market for explosives is boomin'. They be hard to get a hold of, don't ya know."] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
[Dealer,"localChat","You can find yer stuff in the crates."] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
/** END */

[0, (-1 * _cost)] remoteExec ["A3A_fnc_resourcesFIA",2];