#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"
FIX_LINE_NUMBERS()


params ["_selectedTab"];


private _display = findDisplay A3A_IDD_GUN_SHOP;

private _selectedTabIDC = -1;
private _selectedTabCtrl = -1;
private _config = configFile >> "CfgWeapons";

private _columnCount = 2;
private _columnWidth = 50;
private _columnHeight = 34;

private _pictureBox = [0, 0, 50, 20];
private _displayBox = [1, 22, 30, 4];
private _stockBox = [1, 26, 20, 4];
private _priceBox = [1, 30, 20, 4];
private _logoBox = [1, 14, 6, 6];
private _addBox = [25, 27, 25, 6];

switch(_selectedTab) do 
{
    case ("Primary"): {
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

    _columnCount = 1;
    _columnWidth = 100;
    _columnHeight = 6;

    _pictureBox = [0, 0, 6, 6];
    _displayBox = [7.5, 0, 55.5, 3];
    _priceBox = [13, 3, 61, 3];
    _stockBox = [20, 3, 54, 3];
    _logoBox = [70, 0, 6, 6];
    _addBox = [76, 0, 24, 6];

    case ("Grenades"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_GRENADES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_GRENADES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";
    };

    case ("Explosives"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";
    };

    case ("Magazines"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_MAGAZINES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_MAGAZINES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";
    };

    case ("Optics"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_OPTICS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_OPTICS_TAB_CONTROL;
    };

    case ("Rails"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_RAILS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_RAILS_TAB_CONTROL;
    };

    case ("Muzzles"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_MUZZLES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_MUZZLES_TAB_CONTROL;
    };

    case ("Bipods"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_BIPODS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_BIPODS_TAB_CONTROL;
    };

};

{
    _x set [0, (_x#0)*GRID_W];
    _x set [1, (_x#1)*GRID_H];
    _x set [2, (_x#2)*GRID_W];
    _x set [3, (_x#3)*GRID_H];
} forEach [_pictureBox, _displayBox, _priceBox, _stockBox, _logoBox, _addBox];


if (_selectedTabIDC == -1) ExitWith {
    Error("Tried to access a tab, might not exist: %1",_selectedTab);
};
if (_selectedTabCtrl == -1) ExitWith {
    Error("Tried to assign a ctrl group, might not exist: %1",_selectedTab);
};

private _controlsGroup = _display displayCtrl _selectedTabCtrl;


if(isNil "A3A_GunShopData") ExitWith { Error("Gunshop data does not exist")};

// get the items to create
private _gunShopData = A3A_GunShopData getOrDefault [_selectedTabIDC, createHashMap];
if (count _gunShopData == 0) ExitWith { Error_1("IDC %1 not in gunshop hashmap", _selectedTabIDC) };
private _createdCtrls = [];

{
    private _className = _x;
    _y params ["_itemPrice", "_stock"];

    private _configClass = _config >> _className;
    private _displayName = getText (_configClass >> "displayName");
    private _picturePreview = getText (_configClass >> "picture");
    private _modName = _configClass call A3A_fnc_getModOfConfigClass;
    private _modPicture = modParams [_modName, ["logo"]];


    private _itemXPos = (_forEachIndex % _columnCount) * (_columnWidth * GRID_W);
    private _itemYPos =  (floor (_forEachIndex / _columnCount)) * (_columnHeight * GRID_H);


    private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -100, _controlsGroup];
    _itemControlsGroup ctrlSetPosition [_itemXPos, _itemYpos, _columnWidth * GRID_W, _columnHeight * GRID_H];
    _itemControlsGroup ctrlSetFade 1;
    _itemControlsGroup ctrlCommit 0;

    private _previewButton = _display ctrlCreate ["A3A_Picture", A3A_IDC_GUN_SHOP_ITEM_PREVIEW, _itemControlsGroup];
    _previewButton ctrlSetPosition _pictureBox;
    _previewButton ctrlSetText _picturePreview;
    _previewButton ctrlCommit 0;


    private _button = _display ctrlCreate ["A3A_Button_Small", -1, _itemControlsGroup];
    _button ctrlSetPosition _addBox;
    // wrong anyway, should be have been the box height
    //if(_columnCount > 4) then {
        // 4 is the default height, we scale to that height
        //_button ctrlSetFontHeight ((ctrlFontHeight _button) * (4 / _columnCount));
    //};
    _button ctrlSetText localize "STR_antistasi_gun_shop_add_to_cart_button_text";
    _button ctrlCommit 0;


    private _displayText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayText ctrlSetPosition _displayBox;
    _displayText ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#E5C454' shadow='2'>%1</t>", _displayName]);
    _displayText ctrlSetTooltip _className;
    _displayText ctrlCommit 0;

    private _displayStock = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayStock ctrlSetPosition _stockBox;
    private _stockStr = str _stock + " in stock";           // TODO: stringtable
    _displayStock ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#63DDFF' shadow='2'>%1</t>", _stockStr]);
    _displayStock ctrlCommit 0;

    private _displayPrice = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayPrice ctrlSetPosition _priceBox;
    _displayPrice ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#52D273' shadow='2'>€ %1</t>", _itemPrice]);
    _displayPrice ctrlCommit 0;

    private _modLogo = _display ctrlCreate ["A3A_PictureStroke", -1, _itemControlsGroup];
    _modLogo ctrlSetPosition _logoBox;
    _modLogo ctrlSetText (_modPicture param [0,""]);
    _modLogo ctrlCommit 0;


    _itemControlsGroup setVariable ["className", _className];
    _itemControlsGroup setVariable ["displayName", _displayName];
    _itemControlsGroup setVariable ["price", _itemPrice];
    _itemControlsGroup setVariable ["mod", _modName];
    _button setVariable ["className", _className];
    _button setVariable ["selectedTabIDC", _selectedTabIDC];
    _button setVariable ["price", _itemPrice];
    _button setVariable ["stock", _stock];

    _button ctrladdeventhandler ["ButtonClick", {
        params ["_control"];
        private _className = _control getVariable ["className", ""];
        private _selectedTabIDC = _control getVariable ["selectedTabIDC", ""];
        private _price = _control getVariable ["price", ""];
        private _stock = _control getVariable ["stock", 0];
        if(_className isEqualTo "" || _selectedTab isEqualTo "") exitwith {};

        [_className, _price, 1, _stock] call A3A_GUI_fnc_addToCart;

        call A3A_GUI_fnc_updateCartNumber;

        //[_selectedTab, _className] call A3A_fnc_addItems;
    }];

    _itemControlsGroup ctrlSetFade 0;
    _itemControlsGroup ctrlCommit 0.1;

    _createdCtrls pushBack _itemControlsGroup;

} forEach _gunShopData;

//copyToClipboard str _createdCtrls;
_display setVariable [(_selectedTab + "Ctrls"), _createdCtrls];
_display setVariable [(_selectedTab + "Ctrls" + "Meta"), [ _columnCount, _columnWidth, _columnHeight ]];