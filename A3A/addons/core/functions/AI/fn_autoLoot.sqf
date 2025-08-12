_unit = _this select 0;
_truckX = _this select 1;

if ((isPlayer _unit) or (player != leader group player)) exitWith {};
if !([_unit] call A3A_fnc_canFight) exitWith {};
//_helping = _unit getVariable "helping";
if (_unit getVariable ["helping",false]) exitWith {_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noHelping"};
_rearming = _unit getVariable "rearming";
if (_rearming) exitWith {_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noDoing"; _unit setVariable ["rearming",false]};
if (_unit == gunner _truckX) exitWith {_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noStatic"};
if (!canMove _truckX) exitWith {_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noRepairs"};

_objectsX = [];
_hasBox = false;
_weaponX = "";
_weaponsX = [];
_bigTimeOut = time + 120;
_objectsX = nearestObjects [_unit, ["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 50];
if (count _objectsX == 0) exitWith {_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noCorpses"};

_target = objNull;
_distanceX = 51;
{
_objectX = _x;
if (_unit distance _objectX < _distanceX) then
	{
	if ((count weaponCargo _objectX > 0) and !(_objectX getVariable ["busy",false])) then
		{
		_weaponsX = weaponCargo _objectX;
		for "_i" from 0 to (count _weaponsX - 1) do
			{
			_potential = _weaponsX select _i;
			_basePossible = [_potential] call BIS_fnc_baseWeapon;
			//if ((not(_basePossible in unlockedWeapons)) and ((_basePossible in allRifles) or (_basePossible in allSniperRifles) or (_basePossible in allMachineGuns) or (_potential in allMissileLaunchers) or (_potential in allRocketLaunchers))) then
			if ((_basePossible in allRifles) or (_basePossible in allSniperRifles) or (_basePossible in allMachineGuns) or (_potential in allMissileLaunchers) or (_potential in allRocketLaunchers)) then
				{
				_target = _objectX;
				_distanceX = _unit distance _objectX;
				_weaponX = _potential;
				};
			};
		};
	};
} forEach _objectsX;

if (isNull _target) exitWith {_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noLoot"};
_target setVariable ["busy",true];
_unit setVariable ["rearming",true];
_unit groupChat localize "STR_A3A_fn_ai_autoLoot_startLoot";

_originalLoadout = getUnitLoadout _unit;

removeBackpackGlobal _unit;
removeVest _unit;
{_unit unlinkItem _x} forEach assignedItems _unit;
removeAllItemsWithMagazines _unit;
{_unit removeWeaponGlobal _x} forEach weapons _unit;
removeHeadgear _unit;
//_Pweapon = primaryWeapon _unit;
//_Sweapon = secondaryWeapon _unit;

_unit action ["GetOut",_truckX];
[_unit] orderGetin false;
//sleep 3;

//if (_Pweapon != "") then {_unit action ["DropWeapon",_truckX,_Pweapon]; sleep 3};
//if (_Sweapon != "") then {_unit action ["DropWeapon",_truckX,_Sweapon]};

_continuar = true;

while {_continuar and ([_unit] call A3A_fnc_canFight) and (_unit getVariable "rearming") and (alive _truckX) and (_bigTimeout > time)} do
	{
	if (isNull _target) exitWith {_continuar = false};
	_target setVariable ["busy",true];
	_unit doMove (getPosATL _target);
	_timeOut = time + 60;
	waitUntil {sleep 1; (!alive _unit) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
	if (_unit distance _target < 3) then
		{
		_unit action ["TakeWeapon",_target,_weaponX];
		sleep 3;
		};
	_target setVariable ["busy",false];
	_tempPrimary = primaryWeapon _unit;
	if (_tempPrimary != "") then
		{
		_magazines = getArray (configFile / "CfgWeapons" / _tempPrimary / "magazines");
		_victims = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
		_hasBox = false;
		_distanceX = 51;
		{
		_victim = _x;
		if (({_x in _magazines} count (magazines _victim) > 0) and (_unit distance _victim < _distanceX)) then
			{
			_target = _victim;
			_hasBox = true;
			_distanceX = _victim distance _unit;
			};
		} forEach _victims;
		if ((_hasBox) and (_unit getVariable "rearming")) then
			{
			_unit stop false;
			_target setVariable ["busy",true];
			_unit doMove (getPosATL _target);
			_timeOut = time + 60;
			waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
			if (_unit distance _target < 3) then
				{
				{if (!(_x in unlockedMagazines) and !(_x in unlockedItems)) then {_unit addItemToUniform _x}} forEach (uniformItems _target);
				if (backPack _target != "") then
					{
					_unit addBackpack ((backpack _target) call A3A_fnc_basicBackpack);
					{if (!(_x in unlockedMagazines) and !(_x in unlockedItems)) then {_unit addItemToBackpack _x}} forEach backpackItems _target;
					removeBackpack _target;
					};
				_unit addVest (vest _target);
				{if (!(_x in unlockedMagazines) and !(_x in unlockedItems)) then {_unit addItemToVest _x}} forEach vestItems _target;
				_unit action ["rearm",_target];
				removeVest _target;
				if (((headgear _target) in allArmoredHeadgear) and !((headgear _target) in unlockedItems)) then
					{
					_unit addHeadgear (headGear _target);
					removeHeadgear _target;
					};
				{if !(_x in unlockedItems) then {_unit linkItem _x}} forEach assignedItems _target;
				{if !(_x in unlockedItems) then {_target unlinkItem _x}} forEach assignedItems _target;
				};
			_target setVariable ["busy",false];
			};
		};

	_unit doMove (getPosATL _truckX);
	_timeOut = time + 60;
	waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (!alive _truckX) or (_unit distance _truckX < 8) or (_timeOut < time)};
	if ((alive _truckX) and ([_unit] call A3A_fnc_canFight)) then
		{
		if (_tempPrimary != "") then
			{
			_unit action ["DropWeapon",_truckX,_tempPrimary];
			sleep 3;
			};
		if (secondaryWeapon _unit != "") then
			{
			_unit action ["DropWeapon",_truckX,secondaryWeapon _unit];
			sleep 3;
			};
		{_truckX addItemCargoGlobal [_x,1]} forEach ((assignedItems _unit) + (vestItems _unit) + (backPackItems _unit) + [headgear _unit,backpack _unit,vest _unit]);
		removeBackpackGlobal _unit;
		removeVest _unit;
		{_unit unlinkItem _x} forEach assignedItems _unit;
		removeAllItemsWithMagazines _unit;
		{_unit removeWeaponGlobal _x} forEach weapons _unit;
		removeHeadgear _unit;
		};
	_target = objNull;
	_distanceX = 51;
	{
	_objectX = _x;
	if (_unit distance _objectX < _distanceX) then
		{
		if ((count weaponCargo _objectX > 0) and !(_objectX getVariable ["busy",false])) then
			{
			_weaponsX = weaponCargo _objectX;
			for "_i" from 0 to (count _weaponsX - 1) do
				{
				_potential = _weaponsX select _i;
				_basePossible = [_potential] call BIS_fnc_baseWeapon;
				if ((not(_basePossible in unlockedWeapons)) and ((_basePossible in allRifles) or (_basePossible in allSniperRifles) or (_basePossible in allMachineGuns) or (_potential in allMissileLaunchers) or (_potential in allRocketLaunchers))) then
					{
					_target = _objectX;
					_distanceX = _unit distance _objectX;
					_weaponX = _potential;
					};
				};
			};
		};
	} forEach _objectsX;
	};
if (!_continuar) then
	{
	_unit groupChat localize "STR_A3A_fn_ai_autoLoot_noWeapons"
	};
//if (primaryWeapon _unit == "") then {_unit action ["TakeWeapon",_truckX,_Pweapon]; sleep 3};
//if ((secondaryWeapon _unit == "") and (_Sweapon != "")) then {_unit action ["TakeWeapon",_truckX,_Sweapon]};
_unit doFollow player;
_unit setVariable ["rearming",false];
_unit setUnitLoadout _originalLoadout;
