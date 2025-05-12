private ["_truckX","_objectsX","_todo","_proceed","_boxX","_weaponsX","_ammunition","_items","_backpcks","_containers","_countX","_exists"];

_truckX = vehicle player;
_objectsX = [];
_todo = [];
_proceed = false;

[driver _truckX,"remove"] remoteExec ["A3A_fnc_flagaction",driver _truckX];

_objectsX = nearestObjects [_truckX, ["ReammoBox_F"], 20];

if (count _objectsX == 0) exitWith {};
_boxX = _objectsX select 0;

if ((_boxX == boxX) and (player!=theBoss)) exitWith {[localize "STR_A3A_fn_ammo_cargo", localize "STR_A3A_fn_ammo_transfer_commander_only"] call A3A_fnc_customHint; [driver _truckX,"truckX"] remoteExec ["A3A_fnc_flagaction",driver _truckX]};


_weaponsX = weaponCargo _boxX;
_ammunition = magazineCargo _boxX;
_items = itemCargo _boxX;
_backpcks = [];
/*
if (count weaponsItemsCargo _truckX > 0) then
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
			if ((_thingX select 0) isEqualType []) then {_ammunition pushBack (_thingX select 0)};
			}
		};
	} forEach weaponsItemsCargo _boxX;
	};

if (count backpackCargo _boxX > 0) then
	{
	{
	_backpcks pushBack (_x call A3A_fnc_basicBackpack);
	} forEach backpackCargo _boxX;
	};
_containers = everyContainer _boxX;
if (count _containers > 0) then
	{
	for "_i" from 0 to (count _containers - 1) do
		{
		_weaponsX = _weaponsX + weaponCargo ((_containers select _i) select 1);
		_ammunition = _ammunition + magazineCargo ((_containers select _i) select 1);
		_items = _items + itemCargo ((_containers select _i) select 1);
		};
	};
*/
_todo = _weaponsX + _ammunition + _items + _backpcks;
_countX = count _todo;

if (_countX < 1) then
	{
	[localize "STR_A3A_fn_ammo_cargo", localize "STR_A3A_fn_ammo_transfer_box_empty"] call A3A_fnc_customHint;
	_proceed = true;
	};

if (_countX > 0) then
	{
	if (_boxX == boxX) then
		{
		if ("DEF_HQ" in A3A_activeTasks) then {_countX = round (_countX / 10)} else {_countX = round (_countX / 100)};
		}
	else
		{
		_countX = round (_countX / 5);
		};
	if (_countX < 1) then {_countX = 1};
	while {(_truckX == vehicle player) and (speed _truckX == 0) and (_countX > 0)} do
		{
		[localize "STR_A3A_fn_ammo_cargo", format [localize "STR_A3A_fn_ammo_transfer_loading", _countX]] call A3A_fnc_customHint;
		_countX = _countX -1;
		sleep 1;
		if (_countX == 0) then
			{
			[_boxX,_truckX] remoteExec ["A3A_fnc_ammunitionTransfer",2];
			_proceed = true;
			};
		if ((_truckX != vehicle player) or (speed _truckX != 0)) then
				{
				[localize "STR_A3A_fn_ammo_cargo", localize "STR_A3A_fn_ammo_transfer_cancelled"] call A3A_fnc_customHint;
				_proceed = true;
				};
		};
	};

if (_proceed) then {[driver _truckX,"truckX"] remoteExec ["A3A_fnc_flagaction",driver _truckX]};
