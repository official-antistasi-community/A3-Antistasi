#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"


diag_log format ["Creating gun shop lists"];
private _types = [];
_types set [0,["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun","Shotgun"]];
_types set [1,["Launcher","MissileLauncher","RocketLauncher"]];
_types set [2,["Handgun"]];
_types set [3,["AccessorySights"]]; // Optics
_types set [4,["AccessoryPointer"]]; // Rails
_types set [5,["AccessoryMuzzle"]]; // Muzzles
_types set [6,["AccessoryBipod"]]; // Bipods

// create this array to hold the classnames. We want to use a hashmap later.
private _gunShopArray = [];
_gunShopArray set [0, []];
_gunShopArray set [1, []];
_gunShopArray set [2, []];
_gunShopArray set [3, []];
_gunShopArray set [4, []];
_gunShopArray set [5, []];
_gunShopArray set [6, []];


private _gunShopData = createHashMap;
private _cfgMagazines = (configFile >> "CfgMagazines");
private _cfgWeapons = (configFile >> "CfgWeapons");
private _weapVecConfig = (
	("true" configClasses (configFile >> "CfgWeapons")) +
	("true" configClasses (configFile >> "CfgVehicles"))
	);
call A3A_fnc_getSaveDataFactions;
waitUntil {sleep 1; !isNil "A3A_factionsDataGS"};

// since the boss can be any client, we will need to send the factions to them, also the dlc.
// A3A_factionsDataGS = [factions, allowedDLC];
private _factions = A3A_factionsDataGS#0;

// do we allow vanilla items
private _occFacPar = [configFile/"A3A"/"Templates"/(_factions#0), true] call BIS_fnc_returnParents;
private _invFacPar = [configFile/"A3A"/"Templates"/(_factions#1), true] call BIS_fnc_returnParents;

private _isOccVanilla = false;
private _isInvVanilla = false;

{
	if(((toLower _x) find "vanilla") isNotEqualTo -1) exitwith {_isOccVanilla = true};
} foreach _occFacPar;

{
	if(((toLower _x) find "vanilla") isNotEqualTo -1) exitwith {_isInvVanilla = true};
} foreach _invFacPar;

// CDLC and BASE ONLY!!!!
A3A_GS_allowedMods = [A3A_factionsDataGS#1, A3A_factionsDataGS#2,(_isOccVanilla && _isInvVanilla)];



private _fnc_isAllowed = 
{
	params ["_config"];
	private _mod = _config call A3A_fnc_getModOfConfigClass;
	if (_mod in A3A_GS_allowedMods#1 || {_mod isEqualTo "a3" && !(A3A_GS_allowedMods#2)} ) exitWith {false};

	true;
};

private _fnc_setHashMap = 
{
	params ["_key", "_className"];

	private _keyArray = _gunShopArray select _key;
	_keyArray pushBackUnique _className;
	_gunShopArray set [_key, _keyArray];
};

{
	private _className = configName _x;				
	private _itemScope = if (isNumber (_x >> "scopeArsenal")) then { getNumber (_x >> "scopeArsenal") } else { getNumber (_x >> "scope") };
	
	if (
		_itemScope == 2 
		&& 
		{ getText (_x >> "model") != "" } 
		&& 
		{ if (isArray (_x >> "muzzles")) then { _className call bis_fnc_baseWeapon == _className } else { true } } //-- Check if base weapon (true for all entity types)
	) 
	then 
	{
		_className call bis_fnc_itemType params ["_weaponTypeCategory", "_weaponTypeSpecific"];
		if (_weaponTypeCategory != "VehicleWeapon" && [_x] call _fnc_isAllowed) then 
		{						
			private _typesDataIndex = _types findIf { _weaponTypeSpecific in _x }; // _types is part of macro
			if (_typesDataIndex > -1) then { [_typesDataIndex, _className] call _fnc_setHashMap };
		};
	};
} foreach _weapVecConfig;


private _magazinesThrowPut = [];
private _magThrow = [];
private _magPut = [];
{
	_x params ["_weapon"];
	private _magazines = [];
	{
		{
			private _mag = toLower _x;
			if (_magazines pushBackUnique _mag > -1) then
			{
				private _cfgMag = _cfgMagazines >> _mag;
				private _itemAdded = false;
				private _className = configName _cfgMag;
													
			if (getNumber (_cfgMag >> "scope") == 2 || getNumber (_cfgMag >> "scopeArsenal") == 2 && [_cfgMag] call _fnc_isAllowed) then 
				{
					if (_weapon isEqualTo "throw") then 
					{
						_magThrow pushBack _mag;
					} else {
						_magPut pushBack _mag;
					};
				};
			};
		} foreach getarray (_x >> "magazines");
	}  foreach ("true" configClasses (_cfgWeapons >> _weapon));
} foreach ["throw","put"];

_magazinesThrowPut = (_magThrow + _magPut);

private _magconfig = ("true" configClasses (configFile >> "CfgMagazines"));
private _mags = [];
{
	private _className = configName _x;
	if (
		getNumber (_x >> "type") > 0 
		&& 
	{ 
		(getNumber (_x >> "scope") == 2 || getNumber (_x >> "scopeArsenal") == 2) 
		&& 
		{ !(toLower _className in _magazinesThrowPut) }
	} && [_x] call _fnc_isAllowed
	) then 
	{
		_mags pushBackUnique _className;
	};
} forEach _magconfig;

_gunShopData set [A3A_IDC_GUN_SHOP_PRIMARY_TAB, (_gunShopArray # 0)];
_gunShopData set [A3A_IDC_GUN_SHOP_HANDGUN_TAB, (_gunShopArray # 2)];

_gunShopData set [A3A_IDC_GUN_SHOP_SECONDARY_TAB, (_gunShopArray # 1)];
_gunShopData set [A3A_IDC_GUN_SHOP_GRENADES_TAB, _magThrow];
_gunShopData set [A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB, _magPut];
_gunShopData set [A3A_IDC_GUN_SHOP_MAGAZINES_TAB, _mags];

_gunShopData set [A3A_IDC_GUN_SHOP_OPTICS_TAB, (_gunShopArray # 3)];
_gunShopData set [A3A_IDC_GUN_SHOP_RAILS_TAB, (_gunShopArray # 4)];
_gunShopData set [A3A_IDC_GUN_SHOP_MUZZLES_TAB, (_gunShopArray # 5)];
_gunShopData set [A3A_IDC_GUN_SHOP_BIPODS_TAB, (_gunShopArray # 6)];

A3A_GunShopData = _gunShopData;
_gunShopData;