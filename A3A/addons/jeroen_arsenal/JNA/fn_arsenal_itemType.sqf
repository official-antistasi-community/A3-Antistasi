/*
    By: Jeroen Notenbomer

	Get the index of which item is part of

    Inputs:
        1: item			"name"
        2: (list)		[1,3,10]	index to search in, optional

    Outputs
        index or -1 if not found
*/

#define INITTYPES\
		_types = [];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,["Launcher","MissileLauncher","RocketLauncher"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,["Handgun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,["Uniform"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VEST,["Vest"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,["Backpack"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,["Headgear"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,["Glasses"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_NVGS,["NVGoggles"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,["Binocular","LaserDesignator"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_MAP,["Map"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GPS,["GPS","UAVTerminal"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_RADIO,["Radio"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_COMPASS,["Compass"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_WATCH,["Watch"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_FACE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VOICE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,["AccessorySights"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,["AccessoryMuzzle"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,["AccessoryPointer"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,["AccessoryBipod"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,["Magazine"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,["Throwable"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,["Placeable"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC,["MiscItem"]];

// weapon types
#define TYPE_WEAPON_PRIMARY 1
#define TYPE_WEAPON_HANDGUN 2
#define TYPE_WEAPON_SECONDARY 4
// magazine types
#define TYPE_MAGAZINE_HANDGUN_AND_GL 16 // mainly
#define TYPE_MAGAZINE_PRIMARY_AND_THROW 256
#define TYPE_MAGAZINE_SECONDARY_AND_PUT 512 // mainly
// more types
#define TYPE_BINOCULAR_AND_NVG 4096
#define TYPE_WEAPON_VEHICLE 65536
#define TYPE_ITEM 131072
// item types
#define TYPE_DEFAULT 0
#define TYPE_MUZZLE 101
#define TYPE_OPTICS 201
#define TYPE_FLASHLIGHT 301
#define TYPE_BIPOD 302
#define TYPE_FIRST_AID_KIT 401
#define TYPE_FINS 501 // not implemented
#define TYPE_BREATHING_BOMB 601 // not implemented
#define TYPE_NVG 602
#define TYPE_GOGGLE 603
#define TYPE_SCUBA 604 // not implemented
#define TYPE_HEADGEAR 605
#define TYPE_FACTOR 607
#define TYPE_RADIO 611
#define TYPE_HMD 616
#define TYPE_BINOCULAR 617
#define TYPE_MEDIKIT 619
#define TYPE_TOOLKIT 620
#define TYPE_UAV_TERMINAL 621
#define TYPE_VEST 701
#define TYPE_UNIFORM 801
#define TYPE_BACKPACK 901

#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private ["_item","_return","_data"];
params ["_item"];

_return = -1;

private ["_weaponType","_weaponTypeCategory"];
/*
  We're gonna use ACE's item detection code, but modified.
  Thanks ACE!
	(https://github.com/acemod/ACE3, this code was authored by Alganthe and Dedmen)
*/

private _configCfgWeapons = configFile >> "CfgWeapons";
private _weaponConfig = configFile >> "CfgWeapons" >> _item;
private _itemInfoConfig = _weaponConfig >> "ItemInfo";
private _magazineConfig = configFile >> "CfgMagazines" >> _item;
private _itemType = switch true do {
	case (isClass _weaponConfig): {getNumber (_weaponConfig >> "type")};
	case (isClass _magazineConfig): {getNumber (_magazineConfig >> "type")};
	default {-1};
};
private _itemInfoType =	if (isClass _itemInfoConfig) then {(getNumber (_itemInfoConfig >> "type"))} else {-1};
private _simulationType = getText (_weaponConfig >> "simulation");

private _itemCategory = switch true do {
	case (isClass _weaponConfig): {
		switch true do {
			//Weapon accessories
			case (_itemInfoType in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD]
			      && {!(_item isKindOf ["CBA_MiscItem", (_configCfgWeapons)])}): {
				switch (_itemInfoType) do {
					case TYPE_OPTICS: { "AccessorySights" };
					case TYPE_FLASHLIGHT: { "AccessoryPointer" };
					case TYPE_MUZZLE: { "AccessoryMuzzle" };
					case TYPE_BIPOD: { "AccessoryBipod" };
				};
			};
			case (_itemInfoType == TYPE_HEADGEAR): { "Headgear" };
			case (_itemInfoType == TYPE_UNIFORM): { "Uniform" };
			case (_itemInfoType == TYPE_VEST): { "Vest" };
			case (_simulationType == "NVGoggles"): { "NVGoggles" };
			//Binos after NVGs to avoid accidentally catching them;
			case (_simulationType == "Binocular" ||	{_simulationType == "Weapon" && _itemType == TYPE_BINOCULAR_AND_NVG}): { "Binocular" };
			case (_simulationType == "ItemMap"): { "Map" };
			case (_simulationType == "ItemCompass"): { "Compass" };
			case (_simulationType == "ItemRadio"): { "Radio" };
			case (_simulationType == "ItemWatch"): { "Watch" };
			case (_simulationType == "ItemGPS"): { "GPS" };
			case (_itemInfoType == TYPE_UAV_TERMINAL): { "UAVTerminal" };
			//Weapon, at the bottom to avoid adding binoculars
			case (isClass (_weaponConfig >> "WeaponSlotsInfo") && _itemType != TYPE_BINOCULAR_AND_NVG): {
				(_item call BIS_fnc_itemType) select 1;
			};
			//Community Base Addon Misc Items
			case (_itemInfoType in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD] && _item isKindOf ["CBA_MiscItem", (_configCfgWeapons)]);
			//Base game misc items
			case (_itemInfoType in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT] ||	_simulationType == "ItemMineDetector"): {
				"MiscItem";
			};
			default {
				diag_log format ["[Arsenal] Unknown item in item type script: %1", _item];
				"MiscItem";
			};
		};
	};
	
	case (isClass _magazineConfig): {
		// Lists to check against
		private _grenadeList = [];
		{
			_grenadeList append getArray (_configCfgWeapons >> "Throw" >> _x >> "magazines");
			false
		} count getArray (_configCfgWeapons >> "Throw" >> "muzzles");

		private _putList = [];
		{
			_putList append getArray (_configCfgWeapons >> "Put" >> _x >> "magazines");
			false
		} count getArray (_configCfgWeapons >> "Put" >> "muzzles");
		
		// Check what the magazine actually is
		switch true do {
			// Rifle, handgun, secondary weapons mags
//			case (
//			       (getNumber (configFile >> "CfgMagazines" >> _item >> "type") in [TYPE_MAGAZINE_PRIMARY_AND_THROW,TYPE_MAGAZINE_SECONDARY_AND_PUT,1536,TYPE_MAGAZINE_HANDGUN_AND_GL]) &&
//			       {!(_item in _grenadeList)} &&
//			       {!(_item in _putList)}
//			     ): {
//						"Magazine";
//				};
			// Grenades
			case (_item in _grenadeList): {
				"Throwable";
			};
			// Put
			case (_item in _putList): {
				"Placeable";
			};
			// Everything else
			default {
				// haaaaack
				if (_item isKindOf ["SPE_MUZZLE_FAKEMAG", configFile >> "CfgMagazines"]) exitWith {"Junk"};
				if (_item isKindOf ["LIB_MUZZLE_FAKEMAG", configFile >> "CfgMagazines"]) exitWith {"Junk"};
				"Magazine";
			};
		};
	};

	case (isClass (configFile >> "CfgVehicles" >> _item)): {
		if (getNumber (configFile >> "CfgVehicles" >> _item >> "isBackpack") == 1) then {
			"Backpack";
		};
	};
	case (isClass (configFile >> "CfgGlasses" >> _item)): {
		"Glasses";
	};
	default { "Junk" };			// Loadout code can send empty strings. Possibly other rubbish.
};

if (_itemCategory == "Junk") exitWith {-1};

INITTYPES

{
	if (_itemCategory in _x) exitwith {_return = _foreachindex;};
} foreach _types;


if(_return == -1)then{
	private _data = (missionnamespace getvariable "bis_fnc_arsenal_data");
	{
		private _index = _x;
		private _dataSet = _data select _index;

		{
			if((tolower _item)isEqualTo (tolower _x))exitWith{_return = _index};
		} forEach _dataSet;

		if(_return != -1)exitWith{};
	}forEach [
		IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,
		IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
		IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,
		IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC,
		IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,
		IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,
		IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,
		IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD
	];
//if (_return == -1) then {diag_log format ["Index%1. Item:%2.Amount:%3",_item,1,1]};
};

_return;