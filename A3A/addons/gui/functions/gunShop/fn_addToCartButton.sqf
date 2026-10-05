/*
    Adds an amount of a gun shop item to the cart, limited by stock and by what the faction can afford.

Arguments:
    0. <CONTROL> The item's add to cart button, with className/price/stock variables
    1. <NUMBER> Amount to add

Environment:
    Unscheduled, gun shop dialog
*/

params ["_control", "_amount"];

private _className = _control getVariable ["className", ""];
private _price = _control getVariable ["price", 0];
private _stockGS = _control getVariable ["stock", 0];
if (_className isEqualTo "" or _amount < 1) exitWith {};

if (isNil "A3A_shoppingCart") then { A3A_shoppingCart = createHashMap };
private _cartCost = 0;
{ _cartCost = _cartCost + (_y get "_price") * (_y get "_amount") } forEach A3A_shoppingCart;
private _inCart = (A3A_shoppingCart getOrDefault [_className, createHashMap]) getOrDefault ["_amount", 0];

private _affordable = if (_price > 0) then { floor (((server getVariable ["resourcesFIA", 0]) - _cartCost) / _price) } else { _amount };
_amount = _amount min (_stockGS - _inCart) min _affordable;
if (_amount < 1) exitWith {};

[_className, _price, _amount, _stockGS] call A3A_GUI_fnc_addToCart;
call A3A_GUI_fnc_updateCartNumber;
