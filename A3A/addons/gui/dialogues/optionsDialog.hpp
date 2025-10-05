class A3A_ClientOptions
{
    idd = A3A_IDD_CLIENTOPTIONS;
    onLoad = "[""onLoad""] spawn (uinamespace getvariable ""A3A_GUI_fnc_optionsDialog"")";
    onUnload = "[""onUnload""] spawn (uinamespace getvariable ""A3A_GUI_fnc_optionsDialog"")";

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(100);
            y = CENTER_Y(73) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };
        class MainBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_BACKGROUND;
            x = CENTER_X(100);
            y = CENTER_Y(73);
            w = 100 * GRID_W;
            h = 67 * GRID_H;
        };
    };

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = "ANTISTASI OPTIONS";
            x = CENTER_X(100);
            y = CENTER_Y(73) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };

        class MainContent : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_OPTIONS_MAINCONTENT;

            x = CENTER_X(100);
            y = CENTER_Y(73);
            w = 100 * GRID_W;
            h = 73 * GRID_H;

            class Controls
            {
                class OptionsTable : A3A_ControlsGroup
                {
                    idc = A3A_IDC_OPTIONS_TABLE;
                    x = 1 * GRID_W;
                    y = 1 * GRID_H;
                    w = 98 * GRID_W;
                    h = 64 * GRID_H;
                };
                class CloseButton : A3A_Button 
                {
                    idc = A3A_IDC_OPTIONS_CLOSEBUTTON;
                    x = 0 * GRID_W;
                    y = 68 * GRID_H;
                    w = 15 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Back";
                    onButtonClick = "['handleCloseButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_optionsDialog')";
                };
                class SaveButton : A3A_Button 
                {
                    idc = A3A_IDC_OPTIONS_SAVEBUTTON;
                    x = 85 * GRID_W;
                    y = 68 * GRID_H;
                    w = 15 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Save";
                    onButtonClick = "['handleSaveButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_optionsDialog')";
                };
            };
        };
    };
};