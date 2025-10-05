/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Remarks dialog config setup
*/

class A3A_createRemark
{
    idd = A3A_IDD_REMARKS;
    onLoad = "[""onLoad""] spawn (uinamespace getvariable ""A3A_GUI_fnc_remarksDialog"")";
    onUnload = "[""onUnload""] spawn (uinamespace getvariable ""A3A_GUI_fnc_remarksDialog"")";

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(100);
            y = CENTER_Y(78) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };
        class MainBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_BACKGROUND;
            x = CENTER_X(100);
            y = CENTER_Y(78);
            w = 100 * GRID_W;
            h = 72 * GRID_H;
        };
    };

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = "REMARKS";
            x = CENTER_X(100);
            y = CENTER_Y(78) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };

        class MainContent : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_REMARK_MAINCONTENT;

            x = CENTER_X(100);
            y = CENTER_Y(78);
            w = 100 * GRID_W;
            h = 78 * GRID_H;

            class Controls
            {
                class RemarkTargetText : A3A_Text
                {
                    idc = A3A_IDC_REMARK_TARGETTEXT;
                    x = 2 * GRID_W;
                    y = 2 * GRID_H;
                    w = 22 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Remark about:";
                };
                class RemarkTargetCombobox : A3A_Combobox
                {
                    idc = A3A_IDC_REMARK_TARGETCOMBOBOX;
                    x = 24 * GRID_W;
                    y = 2 * GRID_H;
                    w = 38 * GRID_W;
                    h = 5 * GRID_H;
                    onLBSelChanged = "[""targetSelChanged""] spawn (uinamespace getvariable ""A3A_GUI_fnc_remarksDialog"")";
                };
                
                class RemarkTargetCurrent : A3A_Text
                {
                    idc = A3A_IDC_REMARK_TARGETCURRENT;
                    x = 2 * GRID_W;
                    y = 10 * GRID_H;
                    w = 50 * GRID_W;
                    h = 5 * GRID_H;
                };

                class RemarkTargetEdit : A3A_Edit
                {
                    idc = A3A_IDC_REMARK_TARGETEDIT;
                    x = 24 * GRID_W;
                    y = 10 * GRID_H;
                    w = 38 * GRID_W;
                    h = 5 * GRID_H;
                    maxChars = 24;
                };

                class RemarkTypeText : A3A_Text
                {
                    idc = A3A_IDC_REMARK_TYPETEXT;
                    x = 2 * GRID_W;
                    y = 18 * GRID_H;
                    w = 22 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Remark type: ";
                };
                class RemarkTypeCombobox : A3A_Combobox
                {
                    idc = A3A_IDC_REMARK_TYPECOMBOBOX;
                    x = 24 * GRID_W;
                    y = 18 * GRID_H;
                    w = 38 * GRID_W;
                    h = 5 * GRID_H;
                };

                class RemarkEditText : A3A_Text
                {
                    idc = A3A_IDC_REMARK_EDITTEXT;
                    x = 2 * GRID_W;
                    y = 26 * GRID_H;
                    w = 25 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Remark details: ";
                };
                class RemarkEditBox : A3A_Edit
                {
                    idc = A3A_IDC_REMARK_EDITBOX;
                    x = 2 * GRID_W;
                    y = 32 * GRID_H;
                    w = 96 * GRID_W;
                    h = 38 * GRID_H;
                    colorBackground[] = {0.1,0.1,0.1,0.5};
                    maxChars = 900;
                    style = ST_LEFT + ST_MULTI;
                    sizeEx = GUI_TEXT_SIZE_SMALL;
                };

                class RemarkAdminsText : A3A_StructuredText
                {
                    idc = A3A_IDC_REMARK_ADMINSTEXT;
                    x = 68 * GRID_W;
                    y = 2 * GRID_H;
                    w = 30 * GRID_W;
                    h = 18 * GRID_H;
                    colorBackground[] = {0.1,0.1,0.1,0.8};
                    text = "If a situation is urgent, reach out to an admin on Teamspeak or file a report on Discord.";
                };

                class BackButton : A3A_Button 
                {
                    idc = A3A_IDC_REMARK_BACKBUTTON;
                    x = 0 * GRID_W;
                    y = 73 * GRID_H;
                    w = 15 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Back";
                    onButtonClick = "['handleBackButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_remarksDialog')";
                };
                class SendButton : A3A_Button 
                {
                    idc = A3A_IDC_REMARK_SENDBUTTON;
                    x = 75 * GRID_W;
                    y = 73 * GRID_H;
                    w = 25 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Send Remark";
                    onButtonClick = "['handleSendButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_remarksDialog')";
                };
            };
        };
    };
};