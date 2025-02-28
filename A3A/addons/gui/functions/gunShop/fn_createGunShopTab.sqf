#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"


params ["_selectedTab"];


private _display = findDisplay A3A_IDD_GUN_SHOP;

private _selectedTabIDC = -1;
private _selectedTabCtrl = -1;
private _config = configFile >> "CfgWeapons";

private _columnCount = 2;
private _columnWidth = 50;
private _columnHeight = 50; 

private _pictureX = 0;
private _pictureY = 0;
private _pictureWidth = 50;
private _pictureHeight = 20;

private _displayX = 1;
private _displayY = 22;
private _displayWidth = 46;
private _displayHeight = 8;

private _priceX = 1;
private _priceY = 28;
private _priceWidth = 46;
private _priceHeight = 6;

private _logoX = 43;
private _logoY = 34;
private _logoWidth = 6;
private _logoHeight = 6;

private _addX = 1;
private _addY = 40;
private _addWidth = 46;
private _addHeight = 8;

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

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;

    };

    case ("Explosives"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;
    };

    case ("Magazines"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_MAGAZINES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_MAGAZINES_TAB_CONTROL;
        _config = configFile >> "CfgMagazines";

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;
    };

    case ("Optics"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_OPTICS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_OPTICS_TAB_CONTROL;

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;
    };

    case ("Rails"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_RAILS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_RAILS_TAB_CONTROL;

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;

    };

    case ("Muzzles"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_MUZZLES_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_MUZZLES_TAB_CONTROL;

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;

    };

    case ("Bipods"): {
        _selectedTabIDC = A3A_IDC_GUN_SHOP_BIPODS_TAB;
        _selectedTabCtrl = A3A_IDC_GUN_SHOP_BIPODS_TAB_CONTROL;

        _columnCount = 1;
        _columnWidth = 100;
        _columnHeight = 6;

        _pictureWidth = 6;
        _pictureHeight = 6;

        _addX = 76;
        _addY = 0;
        _addWidth = 24;
        _addHeight = 6;

        _displayX = 7.5;
        _displayY = 0;
        _displayWidth = 55.5;
        _displayHeight = 3;

        _priceX = 13;
        _priceY = 3;
        _priceWidth = 61;
        _priceHeight = 3;

        _logoX = 70;
        _logoY = 0;
        _logoWidth = 6;
        _logoHeight = 6;
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
    private _modName = _configClass call A3A_fnc_getModOfConfigClass;
    private _modPicture = modParams [_modName, ["logo"]];


    private _itemXPos = (_forEachIndex % _columnCount) * (_columnWidth * GRID_W);
    private _itemYPos =  (floor (_forEachIndex / _columnCount)) * (_columnHeight * GRID_H);


    private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -100, _controlsGroup];
    _itemControlsGroup ctrlSetPosition[_itemXPos, _itemYpos, _columnWidth * GRID_W, _columnHeight * GRID_H];
    _itemControlsGroup ctrlSetFade 1;
    _itemControlsGroup ctrlCommit 0;

    private _previewButton = _display ctrlCreate ["A3A_ActivePicture", A3A_IDC_GUN_SHOP_ITEM_PREVIEW, _itemControlsGroup];
    _previewButton ctrlSetPosition [_pictureX, _pictureY, _pictureWidth * GRID_W, _pictureHeight * GRID_H];
    _previewButton ctrlSetText _picturePreview;
    _previewButton ctrlCommit 0;


    private _button = _display ctrlCreate ["A3A_Button_Small", -1, _itemControlsGroup];
    _button ctrlSetPosition [_addX * GRID_W, _addY * GRID_H, _addWidth * GRID_W,  _addHeight * GRID_H];
    if(_columnCount > 4) then {
        // 4 is the default height, we scale to that height
        _button ctrlSetFontHeight ((ctrlFontHeight _button) * (4 / _columnCount));
    };
    _button ctrlSetText localize "STR_antistasi_gun_shop_add_to_cart_button_text";
    _button ctrlCommit 0;


    private _displayText = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayText ctrlSetPosition [_displayX * GRID_W, _displayY * GRID_H, _displayWidth * GRID_W, _displayHeight * GRID_H];
    if(_columnCount > 4) then {
        // 4 is the default height, we scale to that height
        _displayText ctrlSetStructuredText parseText (format ["<t size='%1' align='left' valign='middle' color='#E5C454' shadow='2'>%2</t>", 0.65 *(4 / _columnCount), _displayName]);
    };
    _displayText ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#E5C454' shadow='2'>%1</t>", _displayName]);
    _displayText ctrlSetTooltip _className;
    _displayText ctrlCommit 0;

    private _itemPrice = [_className] call A3A_GUI_fnc_calculateItemPrice;
    private _displayPrice = _display ctrlCreate ["A3A_StructuredText", -1, _itemControlsGroup];
    _displayPrice ctrlSetPosition [_priceX * GRID_W, _priceY * GRID_H, _priceWidth * GRID_W, _priceHeight * GRID_H];
    if(_columnCount > 4) then {
        // 4 is the default height, we scale to that height
        _displayText ctrlSetStructuredText parseText (format ["<t size='%1' align='left' valign='middle' color='#52D273' shadow='2'>€ %2</t>", 0.65 * (4 / _columnCount), _itemPrice]);
    } else {
        _displayPrice ctrlSetStructuredText parseText (format ["<t size='0.65' align='left' valign='middle' color='#52D273' shadow='2'>€ %1</t>", _itemPrice]);
    };
    _displayPrice ctrlCommit 0;

    private _modLogo = _display ctrlCreate ["A3A_PictureStroke", -1, _itemControlsGroup];
    _modLogo ctrlSetPosition [_logoX * GRID_W, _logoY * GRID_H, _logoWidth * GRID_W, _logoHeight * GRID_H];
    _modLogo ctrlSetText (_modPicture param [0,""]);
    _modLogo ctrlCommit 0;


    _itemControlsGroup setVariable ["className", _className];
    _itemControlsGroup setVariable ["displayName", _displayName];
    _itemControlsGroup setVariable ["price", _itemPrice];
    _itemControlsGroup setVariable ["mod", _modName];
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
_display setVariable [(_selectedTab + "Ctrls" + "Meta"), [ _columnCount, _columnWidth, _columnHeight ]];