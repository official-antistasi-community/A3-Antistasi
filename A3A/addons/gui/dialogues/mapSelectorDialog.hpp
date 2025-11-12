/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Map selector config setup
*/

class A3A_MapSelectorDialog
{
    idd = A3A_IDD_MAPSELECTORDIALOG;
    onLoad = "[""onLoad""] spawn (uinamespace getvariable ""A3A_GUI_fnc_mapSelectorDialog"")";
    onUnload = "[""onUnload""] spawn (uinamespace getvariable ""A3A_GUI_fnc_mapSelectorDialog"")";

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(110);
            y = CENTER_Y(77) - 5 * GRID_H;
            w = 110 * GRID_W;
            h = 5 * GRID_H;
        };
    };

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_mapSelector_mainTitle;
            x = CENTER_X(110);
            y = CENTER_Y(77) - 5 * GRID_H;
            w = 110 * GRID_W;
            h = 5 * GRID_H;
        };

        class MapBoardView : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAPSELECT_PICTUREMAPGROUP;

            x = CENTER_X(41) + 2.5 * GRID_W;
            y = CENTER_Y(41) - 13 * GRID_H;
            w = 41 * GRID_W;
            h = 41 * GRID_H;

            class Controls {

                class MapPicture : A3A_Picture
                {
                    idc = A3A_IDC_MAPSELECT_PICTUREMAPBOARD;
                    colorBackground[] = {0,0,0,0.7};
                    x = -10 * GRID_W;
                    y = -10 * GRID_H;
                    w = 61 * GRID_W;
                    h = 61 * GRID_H;
                };
            };
        };


        class MainContent : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_MAPSELECT_MAIN;

            x = CENTER_X(110);
            y = CENTER_Y(77);
            w = 110 * GRID_W;
            h = 77 * GRID_H;

            class Controls
            {
                class MapListText : A3A_Button 
                {
                    idc = A3A_IDC_MAPSELECT_INFO;
                    colorBackground[] = {0,0,0,0.7};
                    x = 0 * GRID_W;
                    y = 0 * GRID_H;
                    w = 36 * GRID_W;
                    h = 4 * GRID_H;
                    text = $STR_antistasi_mapSelector_infoTitle;
                    onButtonClick = "['handleInformationButton', ['information']] spawn (uinamespace getvariable 'A3A_GUI_fnc_mapSelectorDialog')";
                };
                class SelectBannerPicture : A3A_Button 
                {
                    idc = A3A_IDC_MAPSELECT_SELECTBANNERPICTURE;
                    colorBackground[] = {0,0,0,0.7};
                    x = 37 * GRID_W;
                    y = 0 * GRID_H;
                    w = 36 * GRID_W;
                    h = 4 * GRID_H;
                    text = $STR_antistasi_mapSelector_bannerTitle;
                    onButtonClick = "['handleBannerButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_mapSelectorDialog')";
                };
                class SelectMapPicture : A3A_Button 
                {
                    idc = A3A_IDC_MAPSELECT_SELECTMAPPICTURE;
                    colorBackground[] = {0,0,0,0.7};
                    x = 74 * GRID_W;
                    y = 0 * GRID_H;
                    w = 36 * GRID_W;
                    h = 4 * GRID_H;
                    text = $STR_antistasi_mapSelector_mapTitle;
                    onButtonClick = "['handleMapButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_mapSelectorDialog')";
                };
                class MapSelector : A3A_Listbox
                {
                    idc = A3A_IDC_MAPSELECT_MAPLB;
                    colorBackground[] = {0,0,0,0.7};
                    onLBSelChanged = "[""mapSelChanged""] spawn (uinamespace getvariable ""A3A_GUI_fnc_mapSelectorDialog"")";
                    x = 0 * GRID_W;
                    y = 5 * GRID_H;
                    w = 36 * GRID_W;
                    h = 63 * GRID_H;
                };
                class MapPicture : A3A_Picture
                {
                    idc = A3A_IDC_MAPSELECT_PICTURE;
                    colorBackground[] = {0,0,0,0.7};
                    x = 37 * GRID_W;
                    y = 5 * GRID_H;
                    w = 73 * GRID_W;
                    h = 41 * GRID_H;
                };
                class MapPictureText : A3A_StructuredText
                {
                    idc = A3A_IDC_MAPSELECT_PICTURETEXT;
                    colorBackground[] = {0,0,0,0.7};
                    x = 37 * GRID_W;
                    y = 5 * GRID_H;
                    w = 73 * GRID_W;
                    h = 41 * GRID_H;
                };
                class MapBoardText: A3A_StructuredText
                {
                    idc = A3A_IDC_MAPSELECT_MAPBOARDTEXT;
                    colorBackground[] = {0,0,0,0.7};
                    linespacing = 0.7;
                    size = (GRID_H * 4);
                    x = 79 * GRID_W;
                    y = 5 * GRID_H;
                    w = 31 * GRID_W;
                    h = 41 * GRID_H;
                };
                class MapInfo : A3A_StructuredText
                {
                    idc = A3A_IDC_MAPSELECT_INFOTEXT;
                    colorBackground[] = {0,0,0,0.7};
                    x = 37 * GRID_W;
                    y = 47 * GRID_H;
                    w = 73 * GRID_W;
                    h = 21 * GRID_H;
                };
                class RequiredModsText : A3A_StructuredText 
                {
                    idc = A3A_IDC_MAPSELECT_REQUIREDMODSTEXT;
                    colorBackground[] = {0,0,0,0};
                    size = GUI_TEXT_SIZE_SMALL;
                    x = 37 * GRID_W;
                    y = 64 * GRID_H;
                    w = 73 * GRID_W;
                    h = 5 * GRID_H;
                };
                // Dead controls for a scrapped testing mode
                /*
                class DebugIDTitle : A3A_StructuredText 
                {
                    idc = A3A_IDC_MAPSELECT_DEBUGIDTITLE;
                    colorBackground[] = {0,0,0,0};
                    x = 37 * GRID_W;
                    y = 49 * GRID_H;
                    w = 25 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Game ID:";
                };
                class DebugMapTitle : A3A_StructuredText 
                {
                    idc = A3A_IDC_MAPSELECT_DEBUGMAPTITLE;
                    colorBackground[] = {0,0,0,0};
                    x = 37 * GRID_W;
                    y = 56 * GRID_H;
                    w = 25 * GRID_W;
                    h = 5 * GRID_H;
                    text = "Testing Map:";
                };
                class DebugIDEdit : A3A_Edit
                {
                    idc = A3A_IDC_MAPSELECT_DEBUGIDEDIT;
                    colorBackground[] = {0,0,0,0};
                    x = 62 * GRID_W;
                    y = 49 * GRID_H;
                    w = 10 * GRID_W;
                    h = 5 * GRID_H;
                };
                class DebugMapText : A3A_StructuredText 
                {
                    idc = A3A_IDC_MAPSELECT_DEBUGMAPTEXT;
                    colorBackground[] = {0,0,0,0};
                    x = 62 * GRID_W;
                    y = 56 * GRID_H;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                    text = "None";
                };
                */
                class BackButton : A3A_Button
                {
                    idc = A3A_IDC_MAPSELECT_BACK;
                    colorBackground[] = {0,0,0,0.7};
                    x = 0 * GRID_W;
                    y = 69 * GRID_H;
                    w = 20 * GRID_W;
                    h = 5 * GRID_H;
                    text = $STR_antistasi_mapSelector_backButton;
                    onButtonClick = "['handleBackButton'] spawn (uinamespace getvariable 'A3A_GUI_fnc_mapSelectorDialog')";
                };
                class PlaySPButton : A3A_Button
                {
                    idc = A3A_IDC_MAPSELECT_PLAYSP;
                    colorBackground[] = {0,0,0,0.7};
                    x = 65 * GRID_W;
                    y = 69 * GRID_H;
                    w = 22 * GRID_W;
                    h = 5 * GRID_H;
                    text = $STR_antistasi_mapSelector_playSPButton;
                    onMouseButtonClick = "['handlePlayButton', ['SP',_this]] spawn (uinamespace getvariable 'A3A_GUI_fnc_mapSelectorDialog')";
                };
                class PlayMPButton : A3A_Button
                {
                    idc = A3A_IDC_MAPSELECT_PLAYMP;
                    colorBackground[] = {0,0,0,0.7};
                    x = 88 * GRID_W;
                    y = 69 * GRID_H;
                    w = 22 * GRID_W;
                    h = 5 * GRID_H;
                    text = $STR_antistasi_mapSelector_playMPButton;
                    onMouseButtonClick = "['handlePlayButton', ['MP',_this]] spawn (uinamespace getvariable 'A3A_GUI_fnc_mapSelectorDialog')";
                };
            };
        };
    };
};