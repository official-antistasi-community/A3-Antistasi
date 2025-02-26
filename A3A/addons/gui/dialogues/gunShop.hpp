#include "ids.inc"

class A3A_gunShop: A3A_DefaultDialog
{
    idd = A3A_IDD_GUN_SHOP;
    onLoad = "[""onLoad"", _this] spawn A3A_GUI_fnc_gunShop";
    movingenable = false;

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H)  - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 21.4 * GRID_H;
        };

        class  Background : A3A_Background
        {
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H - GRID_H * 6.4;
            colorBackground[] = {0.0, 0.0, 0.0, 1.0};
        };
    };
    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_gun_shop_title;
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H)  - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        //list button
        class listButton: A3A_ActivePicture 
        {
            idc = -1;
            text = A3A_Icon_list;
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H);
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        }; 
        //filter button
        class filterButton: A3A_ActivePicture 
        {
            idc = -1;
            onButtonClick = "[""switchTabRight"", [""Filters""]] call A3A_GUI_fnc_gunShop";
            text = A3A_Icon_filter;
            x = CENTER_X(DIALOG_W) + (130 * GRID_W);
            y = CENTER_Y(DIALOG_H);
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        }; 
        //shopping cart button
        class shoppingCartButton: A3A_ActivePicture 
        {
            idc = -1;
            onButtonClick = "[""switchTabRight"", [""Shopping""]] call A3A_GUI_fnc_gunShop";
            text = A3A_Icon_shopping_cart;
            x = CENTER_X(DIALOG_W) + (136.4 * GRID_W);
            y = CENTER_Y(DIALOG_H);  
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        }; 

        // tab pictures
        class primaryTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + 6.4 * GRID_H;  //1
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        }; 

        class handgunTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\handgun_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 2); //2
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        }; 

        class secondaryTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 3); //3
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        }; 

        class grenadesTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\cargothrow_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 4); //4
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class explosivesTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoput_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 5); //5
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class magazinesTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\cargomagall_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 6); //6
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class opticsTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 7); //7
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class railTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 8); //8
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class muzzleTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 9); //9
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class bipodTabPicture: A3A_Picture 
        {
            idc = -1;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\itembipod_ca.paa";
            x = CENTER_X(DIALOG_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 10); //10
            w = 6.4 * GRID_W;
            h = 6.4 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
        };

        // buttons
        class primaryTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Primary""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_rifle_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + 6.4 * GRID_H + (1.6 * GRID_H);  //1
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        }; 

        class handgunTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Handguns""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_handguns_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 2) + (1.6 * GRID_H); //2
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        }; 

        class secondaryTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Secondary""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_launchers_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 3) + (1.6 * GRID_H); //3
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        }; 

        class grenadesTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Grenades""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_grenades_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 4) + (1.6 * GRID_H); //4
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class explosivesTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Explosives""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_explosives_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 5) + (1.6 * GRID_H); //5
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class magazinesTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Magazines""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_magazines_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 6) + (1.6 * GRID_H); //6
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class opticsTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Optics""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_optics_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 7) + (1.6 * GRID_H); //7
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class railTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Rails""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_rails_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 8) + (1.6 * GRID_H); //8
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class muzzleTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Muzzles""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_muzzles_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 9) + (1.6 * GRID_H); //9
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class bipodTabButton: A3A_Button 
        {
            idc = -1;
            onButtonClick = "[""switchTab"", [""Bipods""]] call A3A_GUI_fnc_gunShop";
            text = $STR_antistasi_gun_shop_bipods_tab_button;
            x = CENTER_X(DIALOG_W) + (7.4 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (6.4 * GRID_H * 10) + (1.6 * GRID_H); //10
            w = 18 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorBackground[] = A3A_COLOR_TRANSPARENT;
        };

        class primaryTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_PRIMARY_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class primaryTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_PRIMARY_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };
        };

        class handgunsTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_HANDGUN_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class handgunsTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_HANDGUN_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };
        };

        class secondaryTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_SECONDARY_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class secondaryTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_SECONDARY_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };
        };

        class grenadesTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_GRENADES_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class grenadesTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_GRENADES_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };            
        };

        class explosivesTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;   

            class Controls
            {
                class explosivesTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_EXPLOSIVES_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };          
        };

        class magazinesTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_MAGAZINES_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class magazinesTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_MAGAZINES_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };            
        };

        class opticsTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_OPTICS_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class opticsTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_OPTICS_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };            
        };

        class railsTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_RAILS_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class railsTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_RAILS_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };         
        };

        class muzzlesTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_MUZZLES_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class muzzlesTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_MUZZLES_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };        
        };

        class bipodsTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_BIPODS_TAB;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 100;
            h = GRID_H * 93.6;

            class Controls
            {
                class bipodsTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_BIPODS_TAB_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 100;
                    h = GRID_H * 93.6;
                };
            };    
        };

        class searchField: A3A_Edit
        {
            idc = A3A_IDC_GUN_SHOP_SEARCH_FIELD;
            x = CENTER_X(DIALOG_W) + GRID_W * 30;
            y = CENTER_Y(DIALOG_H);
            w = GRID_W * 100;
            h = GRID_H * 6.4;
            onMouseButtonDown = "";
            onKeyDown = "_this call A3A_GUI_fnc_handleSearchEvents";
        };

        class cartNumber: A3A_InfoTextLeft
        {
            show = false;
            idc = A3A_IDC_GUN_SHOP_CART_NUMBER;
            x = CENTER_X(DIALOG_W) + (136.4 * GRID_W) + (3.2 * GRID_W);
            y = CENTER_Y(DIALOG_H) + (3.2 * GRID_H);
            w = 3.2 * GRID_W;
            h = 3.2 * GRID_H;
            sizeEx = GUI_TEXT_SIZE_SMALL;
            colorText[] = {0.84,0.15,0.04,1};
        };

        class shoppingCart: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_SHOPPING_CART;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 130;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 30;
            h = GRID_H * 80.8;

            class Controls
            {
                class bipodsTabControlsGroup: A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_GUN_SHOP_SHOPPING_CART_CONTROL;
                    x = 0;
                    y = 0;
                    w = GRID_W * 30;
                    h = GRID_H * 80.8;
                };
            };    
        };

        class filters: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_GUN_SHOP_FILTERS;
            show = false;
            x = CENTER_X(DIALOG_W) + GRID_W * 130;
            y = CENTER_Y(DIALOG_H) + GRID_H * 6.4;
            w = GRID_W * 30;
            h = GRID_H * 80.8;

            class Controls
            {
                class modSort: A3A_ComboBox_Small
                {
                    idc = A3A_IDC_GUN_SHOP_SORT_MOD;
                    x = GRID_W * 1;
                    y = 0;
                    w = GRID_W * 28;
                    h = GRID_H * 3;
                };


                class priceSort: A3A_ComboBox_Small
                {
                    idc = A3A_IDC_GUN_SHOP_SORT_PRICE;
                    x = GRID_W * 1;
                    y = GRID_H * 3;
                    w = GRID_W * 28;
                    h = GRID_H * 3;
                };

                class compatMags: A3A_CheckBox
                {
                    idc = A3A_IDC_GUN_SHOP_SORT_COMPAT_MAGS;
                    x = GRID_W * 1;
                    y = GRID_H * 6;
                    w = GRID_W * 3;
                    h = GRID_H * 3;
                };

                class sortWeaponType: A3A_CheckBox
                {
                    idc = A3A_IDC_GUN_SHOP_SORT_WEAPON_TYPE;
                    x = GRID_W * 1;
                    y = GRID_H * 9;
                    w = GRID_W * 3;
                    h = GRID_H * 3;
                };
            };    
        };

        class checkout: A3A_Button
        {
            idc = -1;
            onButtonClick = "[] spawn A3A_GUI_fnc_checkOut";
            text = $STR_antistasi_gun_shop_checkout_button_text;
            x = CENTER_X(DIALOG_W) + GRID_W * 130;
            y = CENTER_Y(DIALOG_H) + GRID_H * 93.6;
            w = 30 * GRID_W;
            h = 6.4 * GRID_H;
        };

        class totalCost: A3A_InfoTextLeft
        {
            idc = A3A_IDC_GUN_SHOP_TOTAL_COST;
            x = CENTER_X(DIALOG_W) + GRID_W * 130;
            y = CENTER_Y(DIALOG_H) + GRID_H * 87.2;
            w = 30 * GRID_W;
            h = 6.4 * GRID_H;
            colorText[] = {0.32,0.82,0.45,1};
        };
    };
};