#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"



if(isNil "A3A_shoppingCart") then {
	A3A_shoppingCart = createHashMap;
};

private _totalCost = 0;
{
	private _key = _x;
	private _map = _y;
	
	private _price = _map get "_price";
	private _amount = _map get "_amount";
	
	_totalCost = _totalCost + (_price * _amount);
	
} forEach A3A_shoppingCart;


// check if you can afford here.

if((player == theBoss && server getVariable ["resourcesFIA", 0] < _totalCost)) exitWith {
    [_titleStr, localize "STR_A3A_Utility_Items_Insufficient_Funds"] call A3A_fnc_customHint;
};

if (player == theBoss) then { [0, -_totalCost] remoteExec ["A3A_fnc_resourcesFIA", 2] };



// create a object to hold the items.
private _pos = getPosASL player findEmptyPosition [0, 50, "B_supplyCrate_F"];

private _crate = createVehicle ["B_supplyCrate_F", [0,0,0]];
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

[_crate, 999999] remoteExec ["setMaxLoad", 2];

// add items.
{
	private _key = _x;
	private _map = _y;
	private _amount = _map get "_amount";

	_crate addItemCargoGlobal [_key, _amount];

	// sleep here encase someone buys 1000 of something.
	sleep 0.1;
} forEach A3A_shoppingCart;


_crate setPosWorld _pos;

closeDialog 1;