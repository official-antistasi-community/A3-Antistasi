/*
Copyright Ian Feickert, used with permission by the Antistasi Community project
Replication and distribution of this file or parts of it without written permission by the author is strictly prohibited.
*/

#define DIALOG_X CENTER_X(80) // Global x pos of dialog
#define DIALOG_Y CENTER_Y(72) // Global y pos of dialog

// icons start 2 end 8
// text starts 10 ends 32
// gap starts 32 ends 35
// gap2 starts 35 ends 37
// picture starts 37 ends 78
// gap3 starts 78 ends 80
// ehhh....works?
// picture is as close to 1920x1080 as is worth getting
// actually fuck the padding, cut it to 2 on each side
// check if its possible to put a divider line on y 34-35
// or otherwise seperate the two controls sections somehow

class A3A_RoleSelectDialog : A3A_DefaultDialog
{
    idd = A3A_IDD_ROLESELECTDIALOG;
    onLoad = "[""onLoad""] spawn A3A_GUI_fnc_roleSelectDialog";
    onUnoad = "[""onUnload""] spawn A3A_GUI_fnc_roleSelectDialog";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = "ROLE SELECTION";
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        // Left hand role buttons
        class RoleButtons : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_ROLESELECTTABS;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = 35 * GRID_W;
            h = DIALOG_Y * GRID_H;


            class Controls
            {
                class RiflemanIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLERIFLEMANICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Rifleman;
                    x = 2 * GRID_W;
                    y = 2 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class RiflemanButton : A3A_Button
                {
                    idc = A3A_IDC_ROLERIFLEMANBUTTON;
                    text = "Rifleman";
                    onButtonClick = "[""openRole"", [""rifleman""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 2 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };

                class AutoriflemanIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEAUTORIFLEMANICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Autorifleman;
                    x = 2 * GRID_W;
                    y = 12 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class AutoriflemanButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEAUTORIFLEMANBUTTON;
                    text = "Autorifleman";
                    onButtonClick = "[""openRole"", [""autorifleman""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 12 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };

                class GrenadierIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEGRENADIERICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Grenadier;
                    x = 2 * GRID_W;
                    y = 22 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class GrenadierButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEGRENADIERBUTTON;
                    text = "Grenadier";
                    onButtonClick = "[""openRole"", [""grenadier""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 22 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };

                class MedicIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEMEDICICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Heal;
                    x = 2 * GRID_W;
                    y = 32 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class MedicButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEMEDICBUTTON;
                    text = "Medic";
                    onButtonClick = "[""openRole"", [""medic""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 32 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };

                class EngineerIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLEENGINEERICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Construct;
                    x = 2 * GRID_W;
                    y = 42 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class EngineerButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEENGINEERBUTTON;
                    text = "Engineer";
                    onButtonClick = "[""openRole"", [""engineer""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 42 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };

                class TLIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLETLICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_AT;
                    x = 2 * GRID_W;
                    y = 52 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class TLButton : A3A_Button
                {
                    idc = A3A_IDC_ROLETLBUTTON;
                    text = "Team Leader";
                    onButtonClick = "[""openRole"", [""teamleader""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 52 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };

                class CommandIcon : A3A_Picture
                {
                    idc = A3A_IDC_ROLECOMMANDICON;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = A3A_Icon_Has_AT;
                    x = 2 * GRID_W;
                    y = 62 * GRID_H;
                    w = 6 * GRID_W;
                    h = 6 * GRID_H;
                };
                class CommanderButton : A3A_Button
                {
                    idc = A3A_IDC_ROLECOMMANDERBUTTON;
                    text = "Commander";
                    onButtonClick = "[""openRole"", [""commander""]] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 10 * GRID_W;
                    y = 62 * GRID_H;
                    w = 22 * GRID_W;
                    h = 8 * GRID_H;
                };
            };
        };

        // Right hand content with selection buttons, image, description
        // type shit?
        class BodyContent: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_ROLESELECTTABS;
            x = DIALOG_X + 35;
            y = DIALOG_Y;
            w = 51 * GRID_W;
            h = DIALOG_Y * GRID_H;

            class Controls
            {
                class BannerPicture : A3A_Picture
                {
                    idc = A3A_IDC_ROLEBANNERPICTURE;
                    colorText[]= A3A_COLOR_TEXT_DARKER;
                    text = "";
                    x = 2 * GRID_W;
                    y = 2 * GRID_H;
                    w = 41 * GRID_W;
                    h = 23 * GRID_H;
                };
                // end of picture is height 25
                // add text boxes 5 units down?
                // yeah, got plenty of space to kill here
                class InfoLine1 : A3A_Text
                {
                    idc = A3A_IDC_ROLEINFOTEXT1;
                    text = "";
                    x = 2 * GRID_W;
                    y = 30 * GRID_H;
                    w = 41 * GRID_W;
                    h = 8 * GRID_H;
                };
                class InfoLine2 : A3A_Text
                {
                    idc = A3A_IDC_ROLEINFOTEXT2;
                    text = "";
                    x = 2 * GRID_W;
                    y = 42 * GRID_H;
                    w = 41 * GRID_W;
                    h = 8 * GRID_H;
                };
                class InfoLine3 : A3A_Text
                {
                    idc = A3A_IDC_ROLEINFOTEXT3;
                    text = "";
                    x = 2 * GRID_W;
                    y = 54 * GRID_H;
                    w = 41 * GRID_W;
                    h = 4 * GRID_H;
                };
                class MainInfoButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEINFOTEXT3;
                    text = "Main Info";
                    onButtonClick = "[""openInfo""] call A3A_GUI_fnc_roleSelectDialog;";
                    x = 2 * GRID_W;
                    y = (DIALOG_Y - 2) * GRID_H;
                    w = 41 * GRID_W;
                    h = 12 * GRID_H;
                };
                class SetRoleButton : A3A_Button
                {
                    idc = A3A_IDC_ROLEINFOTEXT3;
                    text = "Set Role";
                    onButtonClick = "[""selectRole""] call A3A_GUI_fnc_roleSelectDialog;";
                    x = (DIALOG_X - 22) * GRID_W;
                    y = (DIALOG_Y - 2) * GRID_H;
                    w = 18 * GRID_W;
                    h = 12 * GRID_H;
                };
            };
        };
    };
};
