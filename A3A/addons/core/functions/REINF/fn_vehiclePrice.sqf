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
	// Workshop (factory site upgrade level 3): 10% more off whichever discount below applies, at most 40% together
	private _workshop = 0;
	if (!isNil "A3A_siteLevels" and {factories findIf { [_x] call A3A_fnc_siteLevel >= 3 } != -1}) then {
		_workshop = A3A_siteUpgradeWorkshopDiscount;
	};
	if (count seaports > 3) then
	{
		private _numFriendlySeaports = ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports) min 6;
		_costs = round (_costs - (_costs * ((0.05 * _numFriendlySeaports + _workshop) min A3A_siteUpgradeVehicleDiscountCap)));
	}
	else
	{
		_discount = 0 max ((tierWar - 4) * 0.5);	//4 is the last war tier before discounts, the 0.5 makes the discount go from 0-3 instead of 0-6.
		_costs = 5 * round ((_costs - (_costs * ((0.1 * _discount + _workshop) min A3A_siteUpgradeVehicleDiscountCap)))/5); //Applies the discount, rounds to the nearest 5 €
	};
};

_costs
