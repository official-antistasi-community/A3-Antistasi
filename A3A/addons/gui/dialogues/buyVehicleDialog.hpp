class A3A_BuyVehicleDialog : A3A_TabbedDialog
{
    idd = A3A_IDD_BUYVEHICLEDIALOG;
    onLoad = "[""onLoad""] spawn A3A_GUI_fnc_buyVehicleDialog";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_buy_vehicle_titlebar;
            x = DIALOG_X;
            y = DIALOG_Y - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAINDIALOGTABBUTTONS;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
                class civilianVehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_civ;
                    onButtonClick = "[""switchTab"", [""civilian""]] call A3A_GUI_fnc_buyVehicleDialog";
                    x = 0;
                    y = 0;
                    w = 26 * GRID_W;
                    h = 5 * GRID_H;
                };

                 class rebelVehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_reb;
                    onButtonClick = "[""switchTab"", [""rebel""]] call A3A_GUI_fnc_buyVehicleDialog";
                    x = 26.5 * GRID_W;
                    y = 0;
                    w = 26 * GRID_W;
                    h = 5 * GRID_H;
                };

                class staticsTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_static;
                    onButtonClick = "[""switchTab"", [""static""]] call A3A_GUI_fnc_buyVehicleDialog";
                    x = 53 * GRID_W;
                    y = 0;
                    w = 26 * GRID_W;
                    h = 5 * GRID_H;
                };

                class OthersTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_other;
                    onButtonClick = "[""switchTab"", [""other""]] call A3A_GUI_fnc_buyVehicleDialog";
                    x = 79.5 * GRID_W;
                    y = 0;
                    w = 26 * GRID_W;
                    h = 5 * GRID_H;
                };

                class TownUpgradesTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_buy_town_upgrades_tab_button;
                    onButtonClick = "[""switchTab"", [""townupgrades""]] call A3A_GUI_fnc_buyVehicleDialog";
                    x = 106 * GRID_W;
                    y = 0;
                    w = 26 * GRID_W;
                    h = 5 * GRID_H;
                };

                class SiteUpgradesTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_buy_site_upgrades_tab_button;
                    onButtonClick = "[""switchTab"", [""siteupgrades""]] call A3A_GUI_fnc_buyVehicleDialog";
                    x = 132.5 * GRID_W;
                    y = 0;
                    w = 26 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        // Main content
        class civilianVehicleTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLEMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUP;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

        class rebelVehicleTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUP;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

        class staticsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSTATICMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_STATICSGROUP;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

        class OtherTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYOTHERMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_OTHERGROUP;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

        // Town upgrade kits, bound to a town picked in the combo box. Cards are built by A3A_GUI_fnc_townUpgradesTab
        class TownUpgradesTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYTOWNUPGRADESMAIN;
            show = false;

            class Controls
            {
                class TownLabel : A3A_InfoTextLeft
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_buy_town_upgrades_town_label;
                    x = 7 * GRID_W;
                    y = 1 * GRID_H;
                    w = 13 * GRID_W;
                    h = 4 * GRID_H;
                };

                class TownCombo : A3A_ComboBox_Small
                {
                    idc = A3A_IDC_TOWNUPGRADESTOWNCOMBO;
                    onLBSelChanged = "[""townSelected""] call A3A_GUI_fnc_townUpgradesTab;";
                    x = 20 * GRID_W;
                    y = 1 * GRID_H;
                    w = 40 * GRID_W;
                    h = 4 * GRID_H;
                };

                class InfoText : A3A_InfoTextLeft
                {
                    idc = A3A_IDC_TOWNUPGRADESINFO;
                    text = "";
                    x = 64 * GRID_W;
                    y = 1 * GRID_H;
                    w = 90 * GRID_W;
                    h = 4 * GRID_H;
                };

                class CardsControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_TOWNUPGRADESGROUP;
                    x = 0;
                    y = 6 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 10 * GRID_H;
                };
            };
        };

        // Site upgrade kits for resources, factories and seaports. The left panel is this group, the map is
        // SiteUpgradesMap below: a map must not sit inside or under a controls group, so this group stops left of it.
        // A3A_GUI_fnc_siteUpgradesTab fills the panel, A3A_GUI_fnc_buyVehicleDialog "switchTab" shows and hides both.
        class SiteUpgradesTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSITEUPGRADESMAIN;
            show = false;
            w = 52 * GRID_W;

            class Controls
            {
                class SiteTitle : A3A_SectionLabelRight
                {
                    idc = A3A_IDC_SITEUPGRADESTITLE;
                    text = "";
                    x = 2 * GRID_W;
                    y = 3 * GRID_H;
                    w = 48 * GRID_W;
                    h = 5 * GRID_H;
                };

                // Overlaps the factory production controls below on purpose: fn_siteUpgradesTab "update" shrinks it
                // to h = 36 * GRID_H while a factory is selected, and sets it back to 72 for other sites
                class SiteInfo : A3A_StructuredText
                {
                    idc = A3A_IDC_SITEUPGRADESINFO;
                    text = "";
                    x = 2 * GRID_W;
                    y = 10 * GRID_H;
                    w = 48 * GRID_W;
                    h = 72 * GRID_H;
                };

                // Factory production, shown by fn_siteUpgradesTab "update" only while a factory is selected.
                // All five start hidden, "update" sets the visibility of each one after the tab group is shown.
                class BuildLabel : A3A_Text
                {
                    idc = A3A_IDC_SITEBUILDLABEL;
                    show = false;
                    text = $STR_antistasi_dialogs_buy_site_upgrades_build_label;
                    x = 2 * GRID_W;
                    y = 47 * GRID_H;
                    w = 48 * GRID_W;
                    h = 4 * GRID_H;
                };

                // Shares its rectangle with BuildStatus: BuildSearch and BuildList are shown when the factory can
                // build, BuildStatus instead when it is busy or cannot build (fn_siteUpgradesTab "update")
                class BuildSearch : A3A_Edit
                {
                    idc = A3A_IDC_SITEBUILDSEARCH;
                    show = false;
                    onKeyUp = "[""searchChanged""] call A3A_GUI_fnc_siteUpgradesTab; false";
                    x = 2 * GRID_W;
                    y = 52 * GRID_H;
                    w = 48 * GRID_W;
                    h = 5 * GRID_H;
                };

                // Shares its rectangle with BuildStatus, see BuildSearch
                class BuildList : A3A_Listbox
                {
                    idc = A3A_IDC_SITEBUILDLIST;
                    show = false;
                    onLBSelChanged = "[""listChanged""] call A3A_GUI_fnc_siteUpgradesTab";
                    x = 2 * GRID_W;
                    y = 58 * GRID_H;
                    w = 48 * GRID_W;
                    h = 20 * GRID_H;
                };

                // Shares its rectangle with BuildSearch and BuildList, see BuildSearch
                class BuildStatus : A3A_StructuredText
                {
                    idc = A3A_IDC_SITEBUILDSTATUS;
                    show = false;
                    text = "";
                    x = 2 * GRID_W;
                    y = 52 * GRID_H;
                    w = 48 * GRID_W;
                    h = 26 * GRID_H;
                };

                class BuildButton : A3A_Button
                {
                    idc = A3A_IDC_SITEBUILDBUTTON;
                    show = false;
                    text = $STR_antistasi_dialogs_buy_site_upgrades_build;
                    onButtonClick = "[""buildClicked""] call A3A_GUI_fnc_siteUpgradesTab";
                    x = 2 * GRID_W;
                    y = 79 * GRID_H;
                    w = 48 * GRID_W;
                    h = 6 * GRID_H;
                };

                class BuyButton : A3A_Button
                {
                    idc = A3A_IDC_SITEUPGRADESBUY;
                    text = "";
                    onButtonClick = "[""buyClicked""] call A3A_GUI_fnc_siteUpgradesTab";
                    x = 2 * GRID_W;
                    y = 86 * GRID_H;
                    w = 48 * GRID_W;
                    h = 8 * GRID_H;
                };
            };
        };

        // Site picker of the Site upgrades tab, right of SiteUpgradesTab. Top level on purpose, see A3A_MapControl.
        // Hidden with the tabs in "switchTab", shown only together with SiteUpgradesTab.
        class SiteUpgradesMap : A3A_MapControl
        {
            idc = A3A_IDC_SITEUPGRADESMAP;
            show = false;
            onMouseButtonClick = "if (_this select 1 == 0) then { [""mapClicked"", [[_this select 2, _this select 3]]] call A3A_GUI_fnc_siteUpgradesTab }";
            x = DIALOG_X + 54 * GRID_W;
            y = DIALOG_Y + 2 * GRID_H;
            w = 104 * GRID_W;
            h = 96 * GRID_H;

            maxSatelliteAlpha = 0.75;
            alphaFadeStartScale = 3.0;
            alphaFadeEndScale = 3.0;
        };

        class CloseButton : A3A_CloseButton
        {
            idc = -1;
            x = DIALOG_X + DIALOG_W * GRID_W - 5 * GRID_W;
            y = DIALOG_Y - 10 * GRID_H;
        };
    };

    // Used for preview renders. Has to be defined inline. Class inheritance incompatible. ctrlCreate incompatible.
    class Objects
    {
        class VehiclePreview
        {
            idc = A3A_IDC_BUYOBJECTRENDER;

            type = 82;
            model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
            scale = 0.00001;  // Hide unless there is a mouse hover. This is overwritten by proper ctrlShow command on initialisation.

            direction[] = {0, -0.35, -0.65};
            up[] = {0, 0.65, -0.35};

            x = 0.5;
            y = 0.5;
            z = 0.2;

            xBack = 0.5;
            yBack = 0.5;
            zBack = 1.2;

            inBack = 1;
            enableZoom = 1;
            zoomDuration = 0.001;
        };
    };
};
