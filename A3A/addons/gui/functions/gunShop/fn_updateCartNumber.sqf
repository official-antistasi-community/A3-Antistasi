#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"

private _display = findDisplay A3A_IDD_GUN_SHOP;
private _control = _display displayCtrl A3A_IDC_GUN_SHOP_CART_NUMBER;

if(isNil "A3A_shoppingCart") then {
	A3A_shoppingCart = createHashMap;
};

private _count = count A3A_shoppingCart;

_control ctrlSetText format ["%1", _count];
_control ctrlSetFade 0;
_control ctrlCommit 0;

if !(ctrlShown _control) then {_control ctrlShow true};