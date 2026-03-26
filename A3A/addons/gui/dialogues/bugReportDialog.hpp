/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    bug report dialog config setup
*/

class A3A_createBugReport
{
    idd = A3A_IDD_BUGREPORT;
    onLoad = "[""onLoad""] spawn (uinamespace getvariable ""A3A_GUI_fnc_bugReportDialog"")";
    onUnload = "[""onUnload""] spawn (uinamespace getvariable ""A3A_GUI_fnc_bugReportDialog"")";

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
            text = "FEEDBACK FORM";
            x = CENTER_X(100);
            y = CENTER_Y(78) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };

        class MainContent : A3A_DefaultControlsGroup
        {
            idc = -1;

            x = CENTER_X(100);
            y = CENTER_Y(78);
            w = 100 * GRID_W;
            h = 78 * GRID_H;

            class Controls
            {
                class BugReportTypeText : A3A_Text
                {
                    idc = -1;
                    x = 2 * GRID_W;
                    y = 2 * GRID_H;
                    w = 12 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Type:";
                };
                class BugReportTypeCombobox : A3A_Combobox
                {
                    idc = A3A_IDC_BUGREPORT_TYPECOMBOBOX;
                    x = 14 * GRID_W;
                    y = 2 * GRID_H;
                    w = 28 * GRID_W;
                    h = 5 * GRID_H;
                };

                class BugReportEditText : A3A_Text
                {
                    idc = -1;
                    x = 2 * GRID_W;
                    y = 26 * GRID_H;
                    w = 25 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Information:";
                };
                class BugReportEditBox : A3A_Edit
                {
                    idc = A3A_IDC_BUGREPORT_EDITBOX;
                    x = 2 * GRID_W;
                    y = 32 * GRID_H;
                    w = 96 * GRID_W;
                    h = 38 * GRID_H;
                    colorBackground[] = {0.1,0.1,0.1,0.5};
                    maxChars = 860;
                    style = ST_LEFT + ST_MULTI;
                    sizeEx = GUI_TEXT_SIZE_SMALL;
                };

                class BugReportWarningText : A3A_StructuredText
                {
                    idc = -1;
                    x = 46 * GRID_W;
                    y = 2 * GRID_H;
                    w = 52 * GRID_W;
                    h = 22 * GRID_H;
                    colorBackground[] = {0.1,0.1,0.1,0.8};
                    text = "If you have a clip or other images, send it in the #bug-report-gameplay-feedback channel in Discord. This form goes directly to the devs; we may reach out for further information.";
                };

                class BackButton : A3A_Button 
                {
                    idc = -1;
                    x = 0 * GRID_W;
                    y = 73 * GRID_H;
                    w = 15 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Back";
                    onButtonClick = "['handleBackButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_bugReportDialog')";
                };
                class SendButton : A3A_Button 
                {
                    idc = -1;
                    x = 68 * GRID_W;
                    y = 73 * GRID_H;
                    w = 32 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Send Feedback";
                    onButtonClick = "['handleSendButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_bugReportDialog')";
                };
            };
        };
    };
};