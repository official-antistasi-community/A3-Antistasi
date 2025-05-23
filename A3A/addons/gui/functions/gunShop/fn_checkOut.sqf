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

if (_totalCost <= 0) exitWith {};		// If we hit checkout with nothing in the cart, just ignore

// check if you can afford here.

if((player == theBoss && server getVariable ["resourcesFIA", 0] < _totalCost)) exitWith {
    [localize "STR_A3A_Utility_Items_Purchase_Title", localize "STR_A3A_Utility_Items_Insufficient_Funds"] call A3A_fnc_customHint;
};

if (player == theBoss) then { [0, -_totalCost] remoteExec ["A3A_fnc_resourcesFIA", 2] };
private _shoppingCartList = [];
{
	private _key = _x;
	private _map = _y;
    private _amount = _map get "_amount";
	_shoppingCartList pushBackUnique [_key, _amount];

} forEach A3A_shoppingCart;

[[_totalCost, _shoppingCartList], {A3A_shoppingList = _this}] remoteExec ["call", 2];

A3A_shoppingCart = nil;

closeDialog 1;