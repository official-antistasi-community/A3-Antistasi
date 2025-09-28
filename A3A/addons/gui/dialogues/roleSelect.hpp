/*
Copyright Ian Feickert, used with permission by the Antistasi Community project
Replication and distribution of this file or parts of it without written permission by the author is strictly prohibited.
*/

// icons start 2 end 8
// text starts 10 ends 32
// gap starts 32 ends 35
// gap2 starts 35 ends 37
// picture starts 37 ends 78
// gap3 starts 78 ends 80
// check if its possible to put a divider line on y 34-35
// or otherwise seperate the two controls sections somehow
#define DIALOG_W 138
#define DIALOG_H 86

class A3A_RoleSelectDialog
{
    idd = A3A_IDD_ROLESELECTDIALOG;
    onLoad = "[""onLoad""] spawn A3A_GUI_fnc_roleSelectDialog";
    onUnoad = "[""onUnload""] spawn A3A_GUI_fnc_roleSelectDialog";

    #define DIALOG_X CENTER_X(DIALOG_W) // Global x pos of dialog
    #define DIALOG_Y CENTER_Y(DIALOG_H) // Global y pos of dialog

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = "ROLE SELECTION";
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class Background : A3A_Background
        {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H;
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
                class RiflemanIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLERIFLEMANICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Rifleman;
                    x = 2 * GRID_W;
                    y = 3 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class RiflemanButton : A3A_Button
                {
                    idc = A3A_IDC_ROLERIFLEMANBUTTON;
                    text = "Rifleman";
                    onButtonClick = "[""openRole"", [""rifleman""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 2 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class AutoriflemanIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEAUTORIFLEMANICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Autorifleman;
                    x = 2 * GRID_W;
                    y = 15 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class AutoriflemanButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEAUTORIFLEMANBUTTON;
                    text = "Autorifleman";
                    onButtonClick = "[""openRole"", [""autorifleman""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 14 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class GrenadierIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEGRENADIERICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Grenadier;
                    x = 2 * GRID_W;
                    y = 27 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class GrenadierButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEGRENADIERBUTTON;
                    text = "Grenadier";
                    onButtonClick = "[""openRole"", [""grenadier""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 26 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class MedicIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEMEDICICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Heal;
                    x = 2 * GRID_W;
                    y = 39 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class MedicButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEMEDICBUTTON;
                    text = "Medic";
                    onButtonClick = "[""openRole"", [""medic""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 38 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class EngineerIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEENGINEERICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Construct;
                    x = 2 * GRID_W;
                    y = 51 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class EngineerButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEENGINEERBUTTON;
                    text = "Engineer";
                    onButtonClick = "[""openRole"", [""engineer""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 50 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class TLIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLETLICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Dismiss;
                    x = 2 * GRID_W;
                    y = 63 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class TLButton : A3A_Button
                {
                    idc = A3A_IDC_ROLETLBUTTON;
                    text = "Team Leader";
                    onButtonClick = "[""openRole"", [""teamleader""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 62 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class CommandIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLECOMMANDICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_AI_Management;
                    x = 2 * GRID_W;
                    y = 75 * GRID_H;
                    w = 8 * GRID_W;
                    h = 8 * GRID_H;
                };
                class CommanderButton : A3A_Button
                {
                    idc = A3A_IDC_ROLECOMMANDBUTTON;
                    text = "Commander";
                    onButtonClick = "[""openRole"", [""commander""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 12 * GRID_W;
                    y = 74 * GRID_H;
                    w = 26 * GRID_W;
                    h = 10 * GRID_H;
                };

                class BannerPicture : A3A_Picture
                {
                    idc = A3A_IDC_ROLEBANNERPICTURE;
                    text = "";
                    x = 53 * GRID_W;
                    y = 3 * GRID_H;
                    w = 73 * GRID_W;
                    h = 41 * GRID_H;
                };
                class InfoLine1 : A3A_StructuredText
                {
                    idc = A3A_IDC_ROLEINFOTEXT1;
                    text = "Test";
                    x = 43 * GRID_W;
                    y = 48 * GRID_H;
                    w = 93 * GRID_W;
                    h = 24 * GRID_H;
                };
                class InfoLine2 : A3A_StructuredText
                {
                    idc = A3A_IDC_ROLEINFOTEXT2;
                    text = "Test";
                    x = 43 * GRID_W;
                    y = 60 * GRID_H;
                    w = 93 * GRID_W;
                    h = 12 * GRID_H;
                };
                class InfoLine3 : A3A_StructuredText
                {
                    idc = A3A_IDC_ROLEINFOTEXT3;
                    text = "Test";
                    x = 43 * GRID_W;
                    y = 75 * GRID_H;
                    w = 44 * GRID_W;
                    h = 8 * GRID_H;
                };
                class InfoLine4 : A3A_StructuredText
                {
                    idc = A3A_IDC_ROLEINFOTEXT4;
                    text = "Test";
                    x = 43 * GRID_W;
                    y = 68 * GRID_H;
                    w = 93 * GRID_W;
                    h = 12 * GRID_H;
                };
                class MainInfoButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEMAININFOBUTTON;
                    text = "Main Info";
                    onButtonClick = "[""openInfo""] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 90 * GRID_W;
                    y = 74 * GRID_H;
                    w = 22 * GRID_W;
                    h = 10 * GRID_H;
                };
                class SetRoleButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEINFOSELECTROLE;
                    text = "Set Role";
                    onButtonClick = "[""selectRole""] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 114 * GRID_W;
                    y = 74 * GRID_H;
                    w = 22 * GRID_W;
                    h = 10 * GRID_H;
                };
            };
        };
    };
};
