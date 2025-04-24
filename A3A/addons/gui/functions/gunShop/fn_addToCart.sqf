#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"


params[["_className",""], ["_price", 0], ["_amountAdd", 1], ["_stock", 0]];

if(isNil "A3A_shoppingCart") then {
	A3A_shoppingCart = createHashMap;
};


private _display = findDisplay A3A_IDD_GUN_SHOP;
private _controlsGroup = _display displayCtrl A3A_IDC_GUN_SHOP_SHOPPING_CART_CONTROL;

//check if the the key already exists
if(_className in A3A_shoppingCart) exitWith 
{
	private _map =  A3A_shoppingCart get _className;
	private _amount = _map getOrDefault ["_amount", 0];
	private _stock = _map getOrDefault ["_stock", 0];		// stock only passed in from initial calls
	_amount = _amount + _amountAdd;
	if (_amount > _stock) then { _amount = _stock };

	// delete the item from the cart
	if(_amount <= 0) exitWith {
		private _itemControlsGroup = _map getOrDefault ["_control", -1];
		A3A_shoppingCart deleteAt _className;

		[_itemControlsGroup] spawn {ctrlDelete (_this#0)};
		call A3A_GUI_fnc_updateCartNumber;
		call A3A_GUI_fnc_updateCartPositions;
		call A3A_GUI_fnc_updateTotalCost;
	};

	private _amountText = _map getOrDefault ["_controlAmount", -1];
	_amountText ctrlSetStructuredText parseText (format ["<t size='0.75' align='left' valign='middle' align='center' color='#E5C454' shadow='2'>%1</t>", _amount]);
	_amountText ctrlCommit 0;
	
	private _totalCost = _map getOrDefault ["_controlCost", -1];
	private _weaponPrice = _map getOrDefault ["_price", -1];
	_totalCost ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#52D273' shadow='2'>€ %1</t>", _weaponPrice * _amount]);
	_totalCost ctrlCommit 0;


	_map set ["_amount", _amount];
	A3A_shoppingCart set [_className, _map];
	call A3A_GUI_fnc_updateTotalCost;
	
};

// createControls

// control position
private _count = count A3A_shoppingCart;
private _itemYPos =  _count * (25 * GRID_H);

private _config = configFile >> "CfgWeapons";
private _configClass = _config >> _className;
private _displayName = getText (_configClass >> "displayName");
private _picturePreview = getText (_configClass >> "picture");

// check if mag.
if("" in [_displayName, _picturePreview]) then {
	_config = configFile >> "CfgMagazines";
	_configClass = _config >> _className;
	_displayName = getText (_configClass >> "displayName");
	_picturePreview = getText (_configClass >> "picture");
};

private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -100, _controlsGroup];
_itemControlsGroup ctrlSetPosition[0, _itemYpos, 25 * GRID_W, 25 * GRID_H];
_itemControlsGroup ctrlSetFade 1;
_itemControlsGroup ctrlCommit 0;

private _previewButton = _display ctrlCreate ["A3A_Picture", A3A_IDC_GUN_SHOP_ITEM_PREVIEW, _itemControlsGroup];
_previewButton ctrlSetPosition [0, 0, 25 * GRID_W, 10 * GRID_H];
_previewButton ctrlSetText _picturePreview;
_previewButton ctrlCommit 0;

private _displayText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
_displayText ctrlSetPosition [1 * GRID_W, 11 * GRID_H, 23 * GRID_W, 3 * GRID_H];
_displayText ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' shadow='2'>%1</t>", _displayName]);
_displayText ctrlSetTooltip _className;
_displayText ctrlCommit 0;

private _totalCost = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
_totalCost ctrlSetPosition [1 * GRID_W, 14 * GRID_H, 11 * GRID_W, 3 * GRID_H];
_totalCost ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#52D273' shadow='2'>€ %1</t>", _price]);
_totalCost ctrlCommit 0;

private _stockText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
_stockText ctrlSetPosition [12 * GRID_W, 14 * GRID_H, 12 * GRID_W, 3 * GRID_H];
_stockText ctrlSetStructuredText parseText (format ["<t size='0.65' align='right' valign='middle' color='#63DDFF' shadow='2'>%1 in stock</t>", _stock]);
_stockText ctrlCommit 0;

private _amountText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
_amountText ctrlSetPosition [6 * GRID_W, 20 * GRID_H, 13 * GRID_W, 5 * GRID_H];
_amountText ctrlSetStructuredText parseText (format ["<t size='0.75' align='left' valign='middle' align='center' shadow='2'>%1</t>", 1]);
_amountText ctrlCommit 0;

private _buttonMinus = _display ctrlCreate ["A3A_Button_Small", -1, _itemControlsGroup];
_buttonMinus ctrlSetPosition [1 * GRID_H , 20 * GRID_H, 5 * GRID_W,  4 * GRID_H];
_buttonMinus ctrlSetText "-";
_buttonMinus ctrlCommit 0;

private _buttonPlus = _display ctrlCreate ["A3A_Button_Small", -1, _itemControlsGroup];
_buttonPlus ctrlSetPosition [19 * GRID_W, 20 * GRID_H, 5 * GRID_W,  4 * GRID_H];
_buttonPlus ctrlSetText "+";
_buttonPlus ctrlCommit 0;

_buttonMinus setVariable ["className", _className];

_buttonPlus setVariable ["className", _className];


_buttonPlus ctrladdeventhandler ["ButtonClick", {
	params ["_control"];
	private _className = _control getVariable ["className", ""];
	if(_className isEqualTo "" || _selectedTab isEqualTo "") exitwith {};

	[_className, 0, 1] call A3A_GUI_fnc_addToCart;

}];

_buttonMinus ctrladdeventhandler ["ButtonClick", {
	params ["_control"];
	private _className = _control getVariable ["className", ""];
	if(_className isEqualTo "" || _selectedTab isEqualTo "") exitwith {};

	[_className, 0, -1] call A3A_GUI_fnc_addToCart;

}];


private _objectMap = createHashMap;
_objectMap set ["_amount", 1];
_objectMap set ["_price", _price];
_objectMap set ["_stock", _stock];
_objectMap set ["_control", _itemControlsGroup];
_objectMap set ["_controlAmount", _amountText];
_objectMap set ["_controlCost", _totalCost];
_objectMap set ["_position", _count];

// add to main shopping cart
A3A_shoppingCart set [_className, _objectMap];


_itemControlsGroup ctrlSetFade 0;
_itemControlsGroup ctrlCommit 0.1;

call A3A_GUI_fnc_updateTotalCost;