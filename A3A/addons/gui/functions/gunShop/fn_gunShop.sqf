#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];
private _display = findDisplay A3A_IDD_GUN_SHOP;

switch (_mode) do
{
    case ("onLoad"):
    {
        //create the shopping cart hashmap
        A3A_shoppingCart = createHashMap;

		// we need to get a list of all the buyable items
        if (isNil "A3A_GunShopData") then 
        {
            call A3A_GUI_fnc_gatherGunShopLists;
        };

        // the rest depend on the data in gunShopData
        waitUntil {sleep 1; !isNil "A3A_GunShopData"};

        //we need to create all of the tabs
        ["Primary"] call A3A_GUI_fnc_createGunShopTab;
        ["Handguns"] call A3A_GUI_fnc_createGunShopTab;
        ["Secondary"] call A3A_GUI_fnc_createGunShopTab;
        ["Grenades"] call A3A_GUI_fnc_createGunShopTab;
        ["Explosives"] call A3A_GUI_fnc_createGunShopTab;
        ["Magazines"] call A3A_GUI_fnc_createGunShopTab;
        ["Optics"] call A3A_GUI_fnc_createGunShopTab;
        ["Rails"] call A3A_GUI_fnc_createGunShopTab;
        ["Muzzles"] call A3A_GUI_fnc_createGunShopTab;
        ["Bipods"] call A3A_GUI_fnc_createGunShopTab;

    };

    case ("switchTab"):
    {
        private _selectedTab = _params select 0;

        private _selectedTabIDC = -1;

        switch(_selectedTab) do 
        {
            case ("Primary"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_PRIMARY_TAB};
            case ("Handguns"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_HANDGUN_TAB};
            case ("Secondary"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_SECONDARY_TAB};
            case ("Grenades"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_GRENADES_TAB};
            case ("Explosives"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB};
            case ("Magazines"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_MAGAZINES_TAB};
            case ("Optics"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_OPTICS_TAB};
            case ("Rails"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_RAILS_TAB};
            case ("Muzzles"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_MUZZLES_TAB};
            case ("Bipods"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_BIPODS_TAB};
        };

        if (_selectedTabIDC == -1) ExitWith {
            Error("Tried to access a tab, might not exist: %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_GUN_SHOP_PRIMARY_TAB,
            A3A_IDC_GUN_SHOP_HANDGUN_TAB,
            A3A_IDC_GUN_SHOP_SECONDARY_TAB,
            A3A_IDC_GUN_SHOP_GRENADES_TAB,
            A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB,
            A3A_IDC_GUN_SHOP_MAGAZINES_TAB,
            A3A_IDC_GUN_SHOP_OPTICS_TAB,
            A3A_IDC_GUN_SHOP_RAILS_TAB,
            A3A_IDC_GUN_SHOP_MUZZLES_TAB,
            A3A_IDC_GUN_SHOP_BIPODS_TAB
        ];


        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach _allTabs;

        private _controls = (_display getVariable ((_selectedTab) + "Ctrls"));
        (_display getVariable ((_selectedTab) + "Ctrls" + "Meta")) params ["_columnCount", "_gridWidthConst", "_gridHeightConst"];
        //_display setVariable [(_selectedTab + "Ctrls" + "Meta"), [ _columnCount, _gridWidthConst, _gridHeightConst ]];
        // resort because we are changing tabs
        {
            private _itemXPos = (_forEachIndex % _columnCount) * (_gridWidthConst * GRID_W);
            private _itemYPos =  (floor (_forEachIndex / _columnCount)) * (_gridHeightConst * GRID_H);
            _x ctrlSetPositionX _itemXPos;
            _x ctrlSetPositionY _itemYPos;
            _x ctrlCommit 0.1;
        } forEach _controls;

        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;

        A3A_selectedTab = [_selectedTabIDC, _selectedTab];

        // update filters
        call A3A_GUI_fnc_updateFilters;

    };

    case ("switchTabRight"):
    {
        private _selectedTab = _params select 0;

        private _selectedTabIDC = -1;

        switch(_selectedTab) do 
        {
            case ("Filters"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_FILTERS};
            case ("Shopping"): {_selectedTabIDC = A3A_IDC_GUN_SHOP_SHOPPING_CART};
        };

        if (_selectedTabIDC == -1) ExitWith {
            Error("Tried to access a tab, might not exist: %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_GUN_SHOP_FILTERS,
            A3A_IDC_GUN_SHOP_SHOPPING_CART   
        ];

        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach _allTabs;

        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;
    };
};