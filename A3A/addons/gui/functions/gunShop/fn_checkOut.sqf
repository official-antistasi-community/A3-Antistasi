#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"


if (isNil "A3A_shoppingCart") exitWith {};		// UI timing?

private _totalCost = 0;
{
	private _key = _x;
	private _map = _y;
	
	private _price = _map get "_price";
	private _amount = _map get "_amount";
	
	_totalCost = _totalCost + (_price * _amount);
	
} forEach A3A_shoppingCart;

if (_totalCost <= 0) exitWith {};		// If we hit checkout with nothing in the cart, just ignore

// Check costs here because otherwise the dialog will be closed
if (server getVariable ["resourcesFIA", 0] < _totalCost) exitWith {
    [localize "STR_A3A_Utility_Items_Purchase_Title", localize "STR_A3A_Utility_Items_Insufficient_Funds"] call A3A_fnc_customHint;
};

private _shoppingCartList = [];
{
	private _key = _x;
	private _map = _y;
    private _amount = _map get "_amount";
	_shoppingCartList pushBackUnique [_key, _amount];

} forEach A3A_shoppingCart;

// Send shopping list to server, in case it's no longer possible to buy for some reason
A3A_shoppingList = [_totalCost, _shoppingCartList];
publicVariableServer "A3A_shoppingList";

A3A_shoppingCart = nil;

closeDialog 1;