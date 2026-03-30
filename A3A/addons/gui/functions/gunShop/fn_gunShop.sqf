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
        // Request gunshop data from the server and wait for it
        [clientOwner] remoteExec ["A3A_GUI_fnc_fetchGunshopLists", 2];

        waitUntil {sleep 0.01; !isNil "A3A_gunShopData" and {count A3A_gunShopData > 0}};

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

        // Create the shopping cart hashmap if it doesn't exist
        if (isNil "A3A_shoppingCart") then { A3A_shoppingCart = createHashMap };

        // Rebuild the shopping cart UI if there are already items
        if (count A3A_shoppingCart != 0) then {
            private _oldCart = A3A_shoppingCart;
            A3A_shoppingCart = createHashMap;
            {
                private _className = _x;
                private _amount = _y get "_amount";
                private _price = _y get "_price";
                private _stock = _y get "_stock";
                [_className, _price, _amount, _stock] call A3A_GUI_fnc_addToCart;
            } forEach _oldCart;
        };

        _display setVariable ["initDone", true];

        ["switchTab", ["Primary"]] call A3A_GUI_fnc_gunShop;
        ["switchTabRight", ["Shopping"]] call A3A_GUI_fnc_gunShop;
    };

    case ("switchTab"):
    {
        if !(_display getVariable ["initDone", false]) exitWith {};

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
        if !(_display getVariable ["initDone", false]) exitWith {};

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