#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeX"];

private _costs = 0;

if (isNil "_typeX") then
{
	Error_1("Vehicle does not exist.");
	_costs = 0;
}
else
{
	_costs = server getVariable _typeX;
};

if (isNil "_costs") then
{
	Error_1("Invalid vehicle price :%1.", _typeX);
	_costs = 0;
}
else
{
	if (count seaports > 3) then
	{
		private _numFriendlySeaports = ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports) min 6;
		_costs = round (_costs - (_costs * 0.05 * _numFriendlySeaports));
	}
	else
	{
		_discount = 0 max ((tierWar - 4) * 0.5);	//4 is the last war tier before discounts, the 0.5 makes the discount go from 0-3 instead of 0-6.
		_costs = 5 * round ((_costs - (_costs * 0.1 * _discount))/5); //Applies the discount, rounds to the nearest 5€
	};
};

_costs
