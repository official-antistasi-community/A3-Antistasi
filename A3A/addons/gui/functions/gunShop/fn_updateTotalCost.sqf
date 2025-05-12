#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"


private _display = findDisplay A3A_IDD_GUN_SHOP;
private _control = _display displayCtrl A3A_IDC_GUN_SHOP_TOTAL_COST;

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


_control ctrlSetText format ["%1 € %2",localize "STR_antistasi_gun_shop_total_cost_text" ,_totalCost];
_control ctrlSetFade 0;
_control ctrlCommit 0;

if !(ctrlShown _control) then {_control ctrlShow true};