#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"


params ["_selectedTab"];


private _display = findDisplay A3A_IDD_GUN_SHOP;

private _selectedTabIDC = -1;
private _selectedTabCtrl = -1;
private _config = configFile >> "CfgWeapons";

private _modulus = 2;
private _gridWidthConst = 50;
private _gridHeightConst = 50; 

private _previewButtonWidthConst = 50;
private _previewButtonHeightConst = 20;

private _addToCartButtonYConst = 40;
private _addToCartButtonWidthConst = 46;
private _addToCartButtonHeightConst = 8;

private _displayTextYConst = 22;
private _displayTextWidthConst = 46;
private _displayTextHeightConst = 8;

private _displayPriceYConst = 28;
private _displayPriceWidthConst = 46;
private _displayPriceHeightConst = 6;

switch(_selectedTab) do 
{
    case ("Primary"): 
    {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_PRIMARY_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_PRIMARY_TAB_CONTROL;
    };

    case ("Handguns"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_HANDGUN_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_HANDGUN_TAB_CONTROL;
    };

    case ("Secondary"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_SECONDARY_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_SECONDARY_TAB_CONTROL;
    };

    case ("Grenades"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_GRENADES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_GRENADES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;

    };

    case ("Explosives"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;
    };

    case ("Magazines"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_MAGAZINES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_MAGAZINES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;

    };

    case ("Optics"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_OPTICS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_OPTICS_TAB_CONTROL;

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;
    };

    case ("Rails"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_RAILS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_RAILS_TAB_CONTROL;

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;

    };

    case ("Muzzles"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_MUZZLES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_MUZZLES_TAB_CONTROL;

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;

    };

    case ("Bipods"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_BIPODS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_BIPODS_TAB_CONTROL;

        _modulus = 4;
        _gridWidthConst = 25;
        _gridHeightConst = 25;

        _previewButtonWidthConst = 25;
        _previewButtonHeightConst = 10;

        _addToCartButtonYConst = 20;
        _addToCartButtonWidthConst = 23;
        _addToCartButtonHeightConst = 4;

        _displayTextYConst = 11;
        _displayTextWidthConst = 23;
        _displayTextHeightConst = 3;

        _displayPriceYConst = 14;
        _displayPriceWidthConst = 23;
        _displayPriceHeightConst = 3;

    };

};

if (_selectedTabIDC == -1) ExitWith {
    Error("Tried to access a tab, might not exist: %1",_selectedTab);
};
if (_selectedTabCtrl == -1) ExitWith {
    Error("Tried to assign a ctrl group, might not exist: %1",_selectedTab);
};

private _controlsGroup = _display displayCtrl _selectedTabCtrl;


// the ArsenalData doesn't exist
if(isNil "A3A_GunShopData") ExitWith { Error("Arsenal data does not exist")};

// get the items to create
private _gunShopData = A3A_GunShopData getOrDefault [_selectedTabIDC, []];
if (_gunShopData isEqualTo []) ExitWith {};
private _createdCtrls = [];

{
    private _className = _x;

    private _configClass = _config >> _className;
    private _displayName = getText (_configClass >> "displayName");
    private _picturePreview = getText (_configClass >> "picture");


    private _itemXPos = (_forEachIndex % _modulus) * (_gridWidthConst * GRID_W);
    private _itemYPos =  (floor (_forEachIndex / _modulus)) * (_gridHeightConst * GRID_H);


    private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -100, _controlsGroup];
    _itemControlsGroup ctrlSetPosition[_itemXPos, _itemYpos, _gridWidthConst * GRID_W, _gridHeightConst * GRID_H];
    _itemControlsGroup ctrlSetFade 1;
    _itemControlsGroup ctrlCommit 0;

    private _previewButton = _display ctrlCreate ["A3A_ActivePicture", A3A_IDC_GUN_SHOP_ITEM_PREVIEW, _itemControlsGroup];
    _previewButton ctrlSetPosition [0, 0, _previewButtonWidthConst * GRID_W, _previewButtonHeightConst * GRID_H];
    _previewButton ctrlSetText _picturePreview;
    _previewButton ctrlCommit 0;


    private _button = _display ctrlCreate ["A3A_Button_Small", -1, _itemControlsGroup];
    _button ctrlSetPosition [1 * GRID_W, _addToCartButtonYConst * GRID_H, _addToCartButtonWidthConst * GRID_W,  _addToCartButtonHeightConst * GRID_H];
    if(_modulus > 4) then {
        // 4 is the default height, we scale to that height
        _button ctrlSetFontHeight ((ctrlFontHeight _button) * (4 / _modulus));
    };
    _button ctrlSetText localize "STR_antistasi_gun_shop_add_to_cart_button_text";
    _button ctrlCommit 0;


    private _displayText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayText ctrlSetPosition [1 * GRID_W, _displayTextYConst * GRID_H, _displayTextWidthConst * GRID_W, _displayTextHeightConst * GRID_H];
    if(_modulus > 4) then {
        // 4 is the default height, we scale to that height
        _displayText ctrlSetStructuredText parseText (format ["<t size='%1' align='left' valign='middle' shadow='2'>%2</t>", 0.65 *(4 / _modulus), _displayName]);
    };
    _displayText ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' shadow='2'>%1</t>", _displayName]);
    _displayText ctrlSetTooltip _className;
    _displayText ctrlCommit 0;

    private _itemPrice = [_className] call A3A_GUI_fnc_calculateItemPrice;
    private _displayPrice = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayPrice ctrlSetPosition [1 * GRID_W, _displayPriceYConst * GRID_H, _displayPriceWidthConst * GRID_W, _displayPriceHeightConst * GRID_H];
    if(_modulus > 4) then {
        // 4 is the default height, we scale to that height
        _displayText ctrlSetStructuredText parseText (format ["<t size='%1' align='left' valign='middle' color='#085F16' shadow='2'>€ %2</t>", 0.65 * (4 / _modulus), _itemPrice]);
    } else {
        _displayPrice ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#085F16' shadow='2'>€ %1</t>", _itemPrice]);
    };
    _displayPrice ctrlCommit 0;


    _itemControlsGroup setVariable ["className", _className];
    _itemControlsGroup setVariable ["displayName", _displayName];
    _itemControlsGroup setVariable ["price", _itemPrice];
    _button setVariable ["className", _className];
    _button setVariable ["selectedTabIDC", _selectedTabIDC];
    _button setVariable ["price", _itemPrice];

    _button ctrladdeventhandler ["ButtonClick", {
        params ["_control"];
        private _className = _control getVariable ["className", ""];
        private _selectedTabIDC = _control getVariable ["selectedTabIDC", ""];
        private _price = _control getVariable ["price", ""];
        if(_className isEqualTo "" || _selectedTab isEqualTo "") exitwith {};

        [_className, _price] call A3A_GUI_fnc_addToCart;

        call A3A_GUI_fnc_updateCartNumber;

        //[_selectedTab, _className] call A3A_fnc_addItems;
    }];

    _itemControlsGroup ctrlSetFade 0;
    _itemControlsGroup ctrlCommit 0.1;

    _createdCtrls pushBack _itemControlsGroup;


} forEach _gunShopData;

//copyToClipboard str _createdCtrls;
_display setVariable [(_selectedTab + "Ctrls"), _createdCtrls];
_display setVariable [(_selectedTab + "Ctrls" + "Meta"), [ _modulus, _gridWidthConst, _gridHeightConst ]];