/*
  Main Dialog - aka the Y-menu
*/

#include "ids.inc"
class ctrlStaticPictureKeepAspect;

class A3A_VehServiceDialog
{
    idd = A3A_IDD_VEHSERVICEDIALOG;
    onLoad = "[""onLoad""] spawn A3A_GUI_fnc_vehServiceDialog";
    onUnload = "[""onUnload""] call A3A_GUI_fnc_vehServiceDialog";

    #define DIALOG_W 90
    #define DIALOG_H 113
    #define DIALOG_X CENTER_X(DIALOG_W) // Global x pos of dialog
    #define DIALOG_Y CENTER_Y(DIALOG_H) // Global y pos of dialog

    class ControlsBackground {
        class Background : A3A_Background
        {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H;
        };
        class PylonPicture : A3A_Picture
        {
            idc = A3A_IDC_VEHSERVICE_PYLONPICTURE;
            text = "";
            onLoad = "_this#0 ctrlEnable false";
            x = DIALOG_X + 2 * GRID_W;
            y = DIALOG_Y + 16 * GRID_H;
            w = 86 * GRID_W;
            h = 86 * GRID_H;
        };
    };

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = A3A_IDC_VEHSERVICE_TITLEBARTEXT;
            text = "VEHICLE SERVICE";
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class Controls : A3A_DefaultControlsGroup
        {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H;


            class Controls
            {
                class AmmoTabButton : A3A_Button
                {
                    idc = A3A_IDC_VEHSERVICE_AMMOTABBUTTON;
                    text = "AMMO";
                    onButtonClick = "[""switchTab"", [""ammo""]] call A3A_GUI_fnc_vehServiceDialog;";
                    x = 2 * GRID_W;
                    y = 2 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                };

                class PylonTabButton : A3A_Button
                {
                    idc = A3A_IDC_VEHSERVICE_PYLONTABBUTTON;
                    text = "PYLONS";
                    onButtonClick = "[""switchTab"", [""pylon""]] call A3A_GUI_fnc_vehServiceDialog;";
                    x = 24 * GRID_W;
                    y = 2 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                };

                class RepairTabButton : A3A_Button
                {
                    idc = A3A_IDC_VEHSERVICE_REPAIRTABBUTTON;
                    text = "REPAIR";
                    onButtonClick = "[""switchTab"", [""repair""]] call A3A_GUI_fnc_vehServiceDialog;";
                    x = 46 * GRID_W;
                    y = 2 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                };

                class RefuelTabButton : A3A_Button
                {
                    idc = A3A_IDC_VEHSERVICE_REFUELTABBUTTON;
                    text = "REFUEL";
                    onButtonClick = "[""switchTab"", [""refuel""]] call A3A_GUI_fnc_vehServiceDialog;";
                    x = 68 * GRID_W;
                    y = 2 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                };

                class ResourceVehicleLabel : A3A_Text
                {
                    idc = -1;
                    text = "Resource vehicle:";
                    x = 2 * GRID_W;
                    y = 9 * GRID_H;
                    w = 22 * GRID_W;
                    h = 5 * GRID_H;
                };

                class ResourceVehicleData : A3A_Text
                {
                    idc = A3A_IDC_VEHSERVICE_RESOURCEVEHICLEDATA;
                    text = "HEMTT Ammo (573 points remaining)";
                    style = ST_RIGHT;
                    x = 26 * GRID_W;
                    y = 9 * GRID_H;
                    w = 62 * GRID_W;
                    h = 5 * GRID_H;
                };

                class FullRestoreButton : A3A_Button
                {
                    idc = -1;
                    text = "Full Rearm";
                    onButtonClick = "[""fullRestore""] call A3A_GUI_fnc_vehServiceDialog;";
                    x = 2 * GRID_W;
                    y = 104 * GRID_H;
                    w = 30 * GRID_W;
                    h = 7 * GRID_H;
                };

                class ApplyButton : A3A_Button
                {
                    idc = A3A_IDC_VEHSERVICE_APPLYBUTTON;
                    text = "Apply (cost: 573 points)";
                    onButtonClick = "[""apply""] call A3A_GUI_fnc_vehServiceDialog;";
                    x = 58 * GRID_W;
                    y = 104 * GRID_H;
                    w = 30 * GRID_W;
                    h = 7 * GRID_H;
                };

                class PylonPresets : A3A_Combobox
                {
                    idc = A3A_IDC_VEHSERVICE_PYLONPRESETS;
                    x = 36 * GRID_W;
                    y = 104 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                };

                // data box is 86x86. factor top and bottom space

                // repair + ammo

                class DynamicTableBackground : A3A_Background {
                    idc = A3A_IDC_VEHSERVICE_DYNAMICTABLEBACKGROUND;
                    x = 2 * GRID_W;
                    y = 16 * GRID_H;
                    w = 86 * GRID_W;
                    h = 86 * GRID_H;
                };
                class DynamicTable : A3A_ControlsGroup
                {
                    idc = A3A_IDC_VEHSERVICE_DYNAMICTABLE;
                    x = 2 * GRID_W;
                    y = 16 * GRID_H;
                    w = 86 * GRID_W;
                    h = 86 * GRID_H;
                };

                // refuel

                // pylons

                
                
            };
        };

        // Close button

        class CloseButton : A3A_CloseButton
        {
            idc = -1;
            x = DIALOG_X + DIALOG_W * GRID_W - 5 * GRID_W;
            y = DIALOG_Y - 10 * GRID_H;
        };
    };
};
