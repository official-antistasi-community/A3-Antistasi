/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Advertisement for community servers
*/

class A3A_CommunityAdvertisement
{
    idd = A3A_IDD_COMMUNITYADVERTISEMENT;
    onLoad = "[""onLoad""] spawn (uinamespace getvariable ""A3A_GUI_fnc_communityAdDialog"")";
    onUnload = "[""onUnload""] spawn (uinamespace getvariable ""A3A_GUI_fnc_communityAdDialog"")";

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(100);
            y = CENTER_Y(100) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };
        class MainBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_BACKGROUND;
            x = CENTER_X(100);
            y = CENTER_Y(100);
            w = 100 * GRID_W;
            h = 88 * GRID_H;
        };
    };

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = "ANTISTASI";
            x = CENTER_X(100);
            y = CENTER_Y(100) - 5 * GRID_H;
            w = 100 * GRID_W;
            h = 5 * GRID_H;
        };

        class MainContent : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_COMMAD_MAINCONTENT;

            x = CENTER_X(100);
            y = CENTER_Y(100);
            w = 100 * GRID_W;
            h = 100 * GRID_H;

            class Controls
            {
                class Picture : A3A_Picture 
                {
                    idc = A3A_IDC_COMMAD_PICTURE;
                    x = 2 * GRID_W;
                    y = 2 * GRID_H;
                    w = 96 * GRID_W;
                    h = 54 * GRID_H;
                };
                class MainText : A3A_StructuredText 
                {
                    idc = A3A_IDC_COMMAD_MAINTEXT;
                    x = 2 * GRID_W;
                    y = 57 * GRID_H;
                    w = 96 * GRID_W;
                    h = 27 * GRID_H;
                    text = $STR_antistasi_commad_splashText;
                };
                class ShowTestServerCB: A3A_Checkbox {
                    idc = A3A_IDC_COMMAD_SHOWTESTCB;
                    x = 76 * GRID_W;
                    y = 84 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                    onCheckedChanged = "['testCBChecked'] spawn (uinamespace getvariable 'A3A_GUI_fnc_communityAdDialog')";
                };
                class ShowTestServerText: A3A_Text {
                    idc = A3A_IDC_COMMAD_SHOWTESTTEXT;
                    x = 80 * GRID_W;
                    y = 84 * GRID_H;
                    w = 20 * GRID_W;
                    h = 4 * GRID_H;
                    sizeEx = GUI_TEXT_SIZE_SMALL;
                    text = $STR_antistasi_commad_showTestServers;
                };
                class BackButton : A3A_Button 
                {
                    idc = A3A_IDC_COMMAD_BACKBUTTON;
                    x = 0 * GRID_W;
                    y = 89 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                    text = $STR_antistasi_commad_back;
                    onButtonClick = "['handleBackButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_communityAdDialog')";
                };
                class ToggleButton : A3A_Button 
                {
                    idc = A3A_IDC_COMMAD_TOGGLEBUTTON;
                    x = 51 * GRID_W;
                    y = 89 * GRID_H;
                    w = 14 * GRID_W;
                    h = 5 * GRID_H;
                    text = $STR_antistasi_commad_links;
                    onButtonClick = "['handleToggleButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_communityAdDialog')";
                };
                class MainServer1Button : A3A_Button
                {
                    idc = A3A_IDC_COMMAD_JOINMAINSERVER1;
                    x = 66 * GRID_W;
                    y = 89 * GRID_H;
                    w = 34 * GRID_W;
                    h = 5 * GRID_H;
                    onButtonClick = "connectToServer ['217.217.30.252', 2472, '']";
                    text = $STR_antistasi_commad_joinMain1;
                };
                class TestServer1Button : A3A_Button
                {
                    idc = A3A_IDC_COMMAD_JOINTESTSERVER1;
                    x = 66 * GRID_W;
                    y = 89 * GRID_H;
                    w = 34 * GRID_W;
                    h = 5 * GRID_H;
                    onButtonClick = "connectToServer ['217.217.30.252', 2392, '']";
                    text = $STR_antistasi_commad_joinTest1;
                };
                class MainServer2Button : A3A_Button
                {
                    idc = A3A_IDC_COMMAD_JOINMAINSERVER2;
                    x = 66 * GRID_W;
                    y = 95 * GRID_H;
                    w = 34 * GRID_W;
                    h = 5 * GRID_H;
                    onButtonClick = "connectToServer ['217.217.30.252', 2382, '']";
                    text = $STR_antistasi_commad_joinMain2;
                };
                class TestServer2Button : A3A_Button
                {
                    idc = A3A_IDC_COMMAD_JOINTESTSERVER2;
                    x = 66 * GRID_W;
                    y = 95 * GRID_H;
                    w = 34 * GRID_W;
                    h = 5 * GRID_H;
                    onButtonClick = "connectToServer ['217.217.30.252', 2402, '']";
                    text = $STR_antistasi_commad_joinTest2;
                };
            };
        };
    };
};