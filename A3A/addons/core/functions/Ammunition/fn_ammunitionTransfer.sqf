#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};
private ["_subObject","_ammunition","_originX","_destinationX"];
_originX = _this select 0;
if (isNull _originX) exitWith {};
_destinationX = _this select 1;

if (isNil {	// Run in unschedule scope.
	if (_originX getVariable ["A3A_JNA_ammunitionTransfer_busy",false]) then {
		nil;  // will lead to exit.
	} else {
		_originX setVariable ["A3A_JNA_ammunitionTransfer_busy",true];
		0;  // not nil, will allow script to continue.
	};
}) exitWith {};  // Silent exit, likely due to spamming


_ammunition= [];
_items = [];
_ammunition = magazineCargo _originX;
_items = itemCargo _originX;
_weaponsX = [];
_weaponsItemsCargo = weaponsItemsCargo _originX;
_backpcks = [];

if (count backpackCargo _originX > 0) then
	{
	{
	_backpcks pushBack (_x call A3A_fnc_basicBackpack);
	} forEach backpackCargo _originX;
	};
_containers = everyContainer _originX;
if (count _containers > 0) then
	{
	for "_i" from 0 to (count _containers) - 1 do
		{
		_subObject = magazineCargo ((_containers select _i) select 1);
		if (!isNil "_subObject") then {_ammunition = _ammunition + _subObject} else {Error_1("Error from %1",magazineCargo (_containers select _i))};
		//_ammunition = _ammunition + (magazineCargo ((_containers select _i) select 1));
		_items = _items + (itemCargo ((_containers select _i) select 1));
		_weaponsItemsCargo = _weaponsItemsCargo + weaponsItemsCargo ((_containers select _i) select 1);
		};
	};
if (!isNil "_weaponsItemsCargo") then
	{
	if (count _weaponsItemsCargo > 0) then
		{
		{
		_weaponsX pushBack ([(_x select 0)] call BIS_fnc_baseWeapon);
		for "_i" from 1 to (count _x) - 1 do
			{
			_thingX = _x select _i;
			if (_thingX isEqualType "") then
				{
				if (_thingX != "") then {_items pushBack _thingX};
				}
			else
				{
				if (_thingX isEqualType []) then
					{
					if (count _thingX > 0) then
						{
						_ammunition pushBack (_thingX select 0);
						};
					};
				};
			};
		} forEach _weaponsItemsCargo;
		};
	};

_weaponsFinal = [];
_weaponsFinalCount = [];
{
_weaponX = _x;
if ((not(_weaponX in _weaponsFinal)) and (not(_weaponX in unlockedWeapons))) then
	{
	_weaponsFinal pushBack _weaponX;
	_weaponsFinalCount pushBack ({_x == _weaponX} count _weaponsX);
	};
} forEach _weaponsX;

if (count _weaponsFinal > 0) then
	{
	for "_i" from 0 to (count _weaponsFinal) - 1 do
		{
		_destinationX addWeaponCargoGlobal [_weaponsFinal select _i,_weaponsFinalCount select _i];
		};
	};

_ammunitionFinal = [];
_ammunitionFinalCount = [];
if (isNil "_ammunition") then
	{
        Error_4("Ammunition transmission error. I had this: %1 and these containers: %2, the originX was a %3 and the objectX is defined as: %4", magazineCargo _originX, everyContainer _originX,typeOf _originX,_originX);
	}
else
	{
	{
	_weaponX = _x;
	if ((not(_weaponX in _ammunitionFinal)) and (not(_weaponX in unlockedMagazines))) then
		{
		_ammunitionFinal pushBack _weaponX;
		_ammunitionFinalCount pushBack ({_x == _weaponX} count _ammunition);
		};
	} forEach  _ammunition;
	};


if (count _ammunitionFinal > 0) then
	{
	for "_i" from 0 to (count _ammunitionFinal) - 1 do
		{
		_destinationX addMagazineCargoGlobal [_ammunitionFinal select _i,_ammunitionFinalCount select _i];
		};
	};

_itemsFinal = [];
_itemsFinalCount = [];
{
_weaponX = _x;
if ((not(_weaponX in _itemsFinal)) and (not(_weaponX in unlockedItems))) then
	{
	_itemsFinal pushBack _weaponX;
	_itemsFinalCount pushBack ({_x == _weaponX} count _items);
	};
} forEach _items;

if (count _itemsFinal > 0) then
	{
	for "_i" from 0 to (count _itemsFinal) - 1 do
		{
		_destinationX addItemCargoGlobal [_itemsFinal select _i,_itemsFinalCount select _i];
		};
	};

_backpcksFinal = [];
_backpcksFinalCount = [];
{
_weaponX = _x;
if ((not(_weaponX in _backpcksFinal)) and (not(_weaponX in unlockedBackpacks))) then
	{
	_backpcksFinal pushBack _weaponX;
	_backpcksFinalCount pushBack ({_x == _weaponX} count _backpcks);
	};
} forEach _backpcks;

if (count _backpcksFinal > 0) then
	{
	for "_i" from 0 to (count _backpcksFinal) - 1 do
		{
		_destinationX addBackpackCargoGlobal [_backpcksFinal select _i,_backpcksFinalCount select _i];
		};
	};

if (count _this == 3) then
	{
	deleteVehicle _originX;
	}
else
	{
	clearMagazineCargoGlobal _originX;
	clearWeaponCargoGlobal _originX;
	clearItemCargoGlobal _originX;
	clearBackpackCargoGlobal _originX;
	};

if (_destinationX == boxX) then
	{
//	{if (_x distance boxX < 10) then {[petros,"hint","Ammobox Loaded", "Cargo"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach (call A3A_fnc_playableUnits);
	if ((_originX isKindOf "ReammoBox_F") and (_originX != vehicleBox)) then {deleteVehicle _originX};
	_updated = [] call A3A_fnc_arsenalManage;
	if (_updated != "") then
		{
		_updated = format ["<t size='0.5' color='#C1C0BB'>" + localize "STR_A3A_fn_init_resourceCheck_arsenal" + "<br/><br/>%1</t>",_updated];
		[petros,"income",_updated] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
		};
	}
else
	{
	[petros,"hint",localize "STR_A3A_fn_ammo_truckLoaded", localize "STR_A3A_fn_ammo_cargo"] remoteExec ["A3A_fnc_commsMP",driver _destinationX];
	};

if (!isNull _originX) then {
	_originX setVariable ["A3A_JNA_ammunitionTransfer_busy",false];
};
