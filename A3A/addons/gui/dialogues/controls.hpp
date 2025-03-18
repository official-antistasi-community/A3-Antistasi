/*
Maintainer: DoomMetal
    Contains class definitions for basic GUI controls.
*/

////////////////////
// Basic Controls //
////////////////////
class A3A_CtrlDefault
{
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    access = 0;
    deletable = 0;
    fade = 0;
    default = 0;
    blinkingPeriod = 0;

    x = 0;
    y = 0;
    w = 0;
    h = 0;

    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorText[] = A3A_COLOR_TOOLTIP_TEXT;
    tooltipColorBox[] = A3A_COLOR_TOOLTIP_BOX;
    tooltipColorShade[] = A3A_COLOR_TOOLTIP_BACKGROUND;

    class ScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1,1,1,1};
    };
};

class A3A_Text : A3A_CtrlDefault
{
    w = 20 * GRID_W;
    h = 4 * GRID_H;
    text = "";
    font = "RobotoCondensed";
    SizeEx = GUI_TEXT_SIZE_MEDIUM;
    shadow = 0;
    fixedWidth = 0;
    linespacing = 1;

    colorText[] = A3A_COLOR_TEXT;
    colorShadow[] = A3A_COLOR_SHADOW;
    colorBackground[] = A3A_COLOR_TRANSPARENT;
};

class A3A_TextRight : A3A_Text
{
    style = ST_RIGHT;
};

class A3A_TextMulti: A3A_Text
{
    style = ST_LEFT + ST_MULTI + ST_NO_RECT;
};

class A3A_StructuredText : A3A_Text
{
    type = CT_STRUCTURED_TEXT;
    size = GUI_TEXT_SIZE_MEDIUM;
};

class A3A_Edit : A3A_Text
{
    type = CT_EDIT;
    canModify = 1;
    autocomplete = "";

    colorBackground[] = A3A_COLOR_BACKGROUND;
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED;
    colorSelection[] = A3A_COLOR_TITLEBAR_BACKGROUND;
};

class A3A_TitlebarText : A3A_Text
{
    font = A3A_TITLEBAR_FONT;
    sizeEx = GUI_TEXT_SIZE_LARGE;
    colorText[] = A3A_COLOR_TITLEBAR_TEXT;
};

class A3A_SectionLabelLeft : A3A_Text
{
    style = ST_RIGHT;
    colorBackground[] = {0,0,0,1};
};

class A3A_SectionLabelRight : A3A_SectionLabelLeft
{
    style = ST_LEFT;
};

class A3A_InfoTextLeft : A3A_Text
{
    sizeEx = GUI_TEXT_SIZE_SMALL;
    shadow = 2;
};

class A3A_InfoTextRight: A3A_InfoTextLeft
{
    style = ST_RIGHT;
};

class A3A_Background : A3A_Text
{
    colorText[] = A3A_COLOR_TRANSPARENT;
    colorBackground[] = A3A_COLOR_BACKGROUND;
};

class A3A_Listbox : A3A_Text
{
    type = CT_LISTBOX;
    style = LB_TEXTURES;

    rowHeight = GUI_TEXT_SIZE_MEDIUM;
    itemSpacing = 0;
    maxHistoryDelay = 1;
    period = 1;
    canDrag = 0;

    colorBackground[] = A3A_COLOR_BACKGROUND;
    colorSelectBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
    colorSelectBackground2[] = A3A_COLOR_TITLEBAR_BACKGROUND;
    colorShadow[] = A3A_COLOR_SHADOW;
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED;
    colorText[] = A3A_COLOR_TEXT;
    colorSelect[] = A3A_COLOR_TEXT;
    colorSelect2[] = A3A_COLOR_TEXT;
    colorTextRight[] = A3A_COLOR_TEXT;
    colorSelectRight[] = A3A_COLOR_TEXT;
    colorSelect2Right[] = A3A_COLOR_TEXT;

    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};

    soundSelect[] =
    {
        "\A3\ui_f\data\sound\RscListbox\soundSelect",
        0.09,
        1
    };

    // Intentionally empty, gets it's style from A3A_CtrlDefault/Scrollbar
    class ListScrollBar: ScrollBar {};
};

class A3A_ListboxMulti : A3A_Listbox
{
    style = LB_MULTI;
};

class A3A_ListNBox : A3A_Text
{
    // Note: Doesn't support background color so that has to be added separately
    type = CT_LISTNBOX;
    style = ST_MULTI;

    period = 1;
    disableOverflow = 0;
    rowHeight = "4.32 * (1 / (getResolution select 3)) * pixelGridNoUIScale * 0.5";
    maxHistoryDelay = 1;
    columns[] = {0};

    drawSideArrows = 0;
    idcLeft = -1;
    idcRight = -1;

    colorSelectBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
    colorSelectBackground2[] = A3A_COLOR_TITLEBAR_BACKGROUND;
    colorText[] = A3A_COLOR_TEXT;
    colorDisabled[] = {1,1,1,0.25};
    colorSelect[] = A3A_COLOR_TEXT;
    colorSelect2[] = A3A_COLOR_TEXT;
    colorShadow[] = A3A_COLOR_SHADOW;

    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};

    soundSelect[] =
    {
        "\A3\ui_f\data\sound\RscListbox\soundSelect",
        0.09,
        1
    };

    // Intentionally empty, gets it's style from A3A_CtrlDefault/Scrollbar
    class ListScrollBar: ScrollBar {};
};

class A3A_Picture : A3A_CtrlDefault
{
    style = ST_PICTURE;
    w = 16 * GRID_W;
    h = 16 * GRID_H;
    text = "";
    font = "TahomaB";
    sizeEx = 0;
    colorText[] = A3A_COLOR_WHITE; // Controls tint when used on pictures
    colorBackground[] = A3A_COLOR_TRANSPARENT;
    shadow = 0;
    fixedWidth = 0;
    lineSpacing = 0;
};

class A3A_PictureStroke : A3A_Picture
{
    shadow = 2;
    colorShadow[] = A3A_COLOR_SHADOW;
};

class A3A_Button : A3A_Text
{
    type = CT_BUTTON;
    style = ST_CENTER + ST_UPPERCASE;

    w = 20 * GRID_W;
    h = 6 * GRID_H;

    font = A3A_BUTTON_FONT;
    borderSize = 0;

    // Colors

    // Text
    colorText[] = A3A_COLOR_BUTTON_TEXT;
    colorFocused[] =	A3A_COLOR_BUTTON_FOCUSED;
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED;

    // Background
    colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND;
    colorBackgroundDisabled[] = A3A_COLOR_BUTTON_BACKGROUND_DISABLED;
    colorBackgroundActive[] =	A3A_COLOR_BUTTON_ACTIVE;

    // Other (not in use so we make it invisible)
    colorBorder[] = A3A_COLOR_TRANSPARENT;
    colorShadow[] = A3A_COLOR_TRANSPARENT;

    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0; // Button press pos offset, used to be "pixelW"
    offsetPressedY = 0; // Changed to 0 to match look to ShortcutButton

    period = 0; // 0
    periodFocus = 2; // 2
    periodOver = 0.5; // 0.5

    // Sounds
    soundClick[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEnter[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundEscape[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
};

class A3A_Button_Left : A3A_Button
{
    style = ST_LEFT + ST_UPPERCASE;
};

class A3A_ShortcutButton : A3A_CtrlDefault
{
    type = CT_SHORTCUTBUTTON;
    style = ST_CENTER + ST_UPPERCASE;
    default = false;
    w = GRID_W * 20;
    h = GRID_H * 6;

    text = "";
    font = "PuristaLight";
    size = GUI_TEXT_SIZE_MEDIUM;
    sizeEx = GUI_TEXT_SIZE_MEDIUM;

    textSecondary = "";
    fontSecondary = "PuristaLight";
    sizeExSecondary = GUI_TEXT_SIZE_MEDIUM;

    url = "";
    // shortcuts[] = {'test'};

    // Colors

    // Text
    color[] = A3A_COLOR_BUTTON_TEXT; // Normal
    color2[] = A3A_COLOR_BUTTON_TEXT; // Blinking
    colorFocused[] = A3A_COLOR_BUTTON_TEXT; // Focused (selected with keyboard?)
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED; // Disabled

    // TextSecondary
    colorSecondary[] = A3A_COLOR_BUTTON_TEXT; // Normal
    color2Secondary[] = A3A_COLOR_BUTTON_TEXT; // Blinking
    colorFocusedSecondary[] = A3A_COLOR_BUTTON_TEXT; // Focused
    colorDisabledSecondary[] = A3A_COLOR_BUTTON_TEXT_DISABLED; // Disabled

    // Background
    colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND; // Normal background, or pressed ? gets way darker for some reason
    colorBackground2[] = A3A_COLOR_BUTTON_BACKGROUND; // Blinking background
    colorBackgroundFocused[] = A3A_COLOR_BUTTON_BACKGROUND; // Focused

    // Hack to get around blinking and remaining focus colors
    onMouseEnter = "_this#0 ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13]), (profilenamespace getvariable ['GUI_BCG_RGB_G',0.54]), (profilenamespace getvariable ['GUI_BCG_RGB_B',0.21]), (profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])];";
    onMouseExit = "_this#0 ctrlSetBackgroundColor [0,0,0,1];";

    animTextureDefault = "#(argb,1,1,1)color(0,0,0,1)";
    animTextureNormal = "#(argb,1,1,1)color(0,0,0,1)";
    animTextureDisabled = "#(argb,1,1,1)color(1,1,1,0.5)";
    animTextureOver = "#(argb,1,1,1)color(1,1,1,1)";
    animTextureFocused = "#(argb,1,1,1)color(1,1,1,1)";
    animTexturePressed = "#(argb,1,1,1)color(1,1,1,1)";

    textureNoShortcut = "#(argb,1,1,1)color(0,0,0,0)"; // Used to put images on the button

    period = 0;
    periodFocus = 0;
    periodOver = 0;

    shadow = 0;

    // Sounds
    soundEnter[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };

    class HitZone
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };

    class TextPos // Defaults for GUI_TEXT_SIZE_MEDIUM, change if using other sizes
    {
        left = 2 * GRID_W;
        right = 2 * GRID_W;
        top = 2 * GRID_H;
        bottom = 2 * GRID_H;
    };

    class ShortcutPos // Used for positioning images on the button
    {
        left = 0;
        top = 0;
        w = 0;
        h = 0;
    };

    class Attributes
    {
        font = "PuristaLight";
        color = "#FFFFFF";
        align = "center";
        shadow = "false";
    };

    class AttributesImage
    {
        font = "PuristaLight";
        color = "#FFFFFF";
        align = "center";
    };
};

class A3A_ActiveText : A3A_CtrlDefault
{
    type = CT_ACTIVETEXT;
    font = A3A_DEFAULT_FONT;
    text = "";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;

    // Colors
    color[] = A3A_COLOR_TEXT;
    colorActive[] = A3A_COLOR_ACTIVE;
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED;

    // Sounds
    soundEnter[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
};

class A3A_ActivePicture : A3A_ActiveText
{
    style = ST_MULTI + ST_TITLE_BAR;
    color[] = {1,1,1,0.5};
    colorActive[] = {1,1,1,1};
};

class A3A_CloseButton : A3A_ActivePicture
{
    text = A3A_Icon_Close;
    // Uses onMouseButtonClick to not be accidentally triggered by keyboard
    onMouseButtonClick = "closeDialog 2;";
    w = 5 * GRID_W;
    h = 5 * GRID_H;
};

class A3A_BackButton : A3A_CloseButton
{
    text = A3A_Icon_Back;
};

class A3A_ScrollBar
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class A3A_Progress : A3A_CtrlDefault
{
    type = CT_PROGRESS;
    style = ST_HORIZONTAL;
    colorBackground[] = A3A_COLOR_BACKGROUND;
    colorFrame[] = {0,0,0,1};
    colorBar[] = A3A_COLOR_TEXT;
    texture = "";// "#(argb,8,8,3)color(1,1,1,1)";
};

class A3A_Slider : A3A_CtrlDefault
{
    type = CT_XSLIDER;
    style = SL_HORZ;
    color[] = {1,1,1,1};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    sliderRange[] = {0,1};
    sliderPosition = 1;
    lineSize = 0.1;
    arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
    arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
    border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
    thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";

    onCanDestroy = "";
    onDestroy = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onSliderPosChanged = "";
};

class A3A_CheckBox : A3A_CtrlDefault
{
    type = CT_CHECKBOX;

    checked = 0;

    color[] = {1,1,1,0.7};
    colorFocused[] = {1,1,1,1};
    colorHover[] = {1,1,1,1};
    colorPressed[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.2};
    colorBackground[] = {0,0,0,0};
    colorBackgroundFocused[] = {0,0,0,0};
    colorBackgroundHover[] = {0,0,0,0};
    colorBackgroundPressed[] = {0,0,0,0};
    colorBackgroundDisabled[] = {0,0,0,0};

    textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";

    soundEnter[] =
    {
        "",
        0.1,
        1
    };
    soundPush[] =
    {
        "",
        0.1,
        1
    };
    soundClick[] =
    {
        "",
        0.1,
        1
    };
    soundEscape[] =
    {
        "",
        0.1,
        1
    };
};

class A3A_MapControl
{
    // Mostly copypasted straight from the GUI base class export with slight cleanups.
    // Not inheriting from any other class is intentional as it is
    // *very* prone to crashing if anything is out of place.
    // Never place this inside a controlsGroup as the drawn position will be
    // offset from the actual interactable area.
    // Also make sure the map area is not overlapping with any controlsGroup
    // as interacting with any control in the overlapping controlsGroup will
    // make the map uninteractable in that area.

    idc = 51;
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_MAP_MAIN;
    style = ST_MULTI + ST_TITLE_BAR;
    font = "TahomaB";
    sizeEx = 0.04;
    colorBackground[] = {0.969,0.957,0.949,1};
    colorOutside[] = {0,0,0,1};
    colorText[] = {0,0,0,1};
    colorSea[] = {0.467,0.631,0.851,0.5};
    colorForest[] = {0.624,0.78,0.388,0.5};
    colorRocks[] = {0,0,0,0.3};
    colorCountlines[] = {0.572,0.354,0.188,0.25};
    colorMainCountlines[] = {0.572,0.354,0.188,0.5};
    colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
    colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
    colorForestBorder[] = {0,0,0,0};
    colorRocksBorder[] = {0,0,0,0};
    colorPowerLines[] = {0.1,0.1,0.1,1};
    colorRailWay[] = {0.8,0.2,0,1};
    colorNames[] = {0.1,0.1,0.1,0.9};
    colorInactive[] = {1,1,1,0.5};
    colorLevels[] = {0.286,0.177,0.094,0.5};
    colorTracks[] = {0.84,0.76,0.65,0.15};
    colorRoads[] = {0.7,0.7,0.7,1};
    colorMainRoads[] = {0.9,0.5,0.3,1};
    colorTracksFill[] = {0.84,0.76,0.65,1};
    colorRoadsFill[] = {1,1,1,1};
    colorMainRoadsFill[] = {1,0.6,0.4,1};
    colorGrid[] = {0.1,0.1,0.1,0.6};
    colorGridMap[] = {0.1,0.1,0.1,0.6};
    stickX[] = {0.2,["Gamma",1,1.5]};
    stickY[] = {0.2,["Gamma",1,1.5]};
    moveOnEdges = 1;
    x = "SafeZoneXAbs";
    y = SafeZoneY + 1.5 * GUI_GRID_H;
    w = "SafeZoneWAbs";
    h = SafeZoneH - 1.5 * GUI_GRID_H;
    shadow = 0;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 20;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;
    showCountourInterval = 0;
    scaleMin = 0.001;
    scaleMax = 1;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 2;
    alphaFadeEndScale = 2;
    colorTrails[] = {0.84,0.76,0.65,0.15};
    colorTrailsFill[] = {0.84,0.76,0.65,0.65};
    widthRailWay = 4;
    fontLabel = "RobotoCondensed";
    sizeExLabel = GUI_TEXT_SIZE_SMALL;
    fontGrid = "TahomaB";
    sizeExGrid = 0.02;
    fontUnits = "TahomaB";
    sizeExUnits = GUI_TEXT_SIZE_SMALL;
    fontNames = "RobotoCondensed";
    sizeExNames = GUI_TEXT_SIZE_SMALL * 2;
    fontInfo = "RobotoCondensed";
    sizeExInfo = GUI_TEXT_SIZE_SMALL;
    fontLevel = "TahomaB";
    sizeExLevel = 0.02;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    idcMarkerColor = -1;
    idcMarkerIcon = -1;
    textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    showMarkers = 1;
    class Legend
    {
        colorBackground[] = {1,1,1,0.5};
        color[] = {0,0,0,1};
        x = SafeZoneX + GUI_GRID_W;
        y = SafeZoneY + safezoneH - 4.5 * GUI_GRID_H;
        w = 10 * GUI_GRID_W;
        h = 3.5 * GUI_GRID_H;
        font = "RobotoCondensed";
        sizeEx = GUI_TEXT_SIZE_SMALL;
    };
    class ActiveMarker
    {
        color[] = {0.3,0.1,0.9,1};
        size = 50;
    };
    class Command
    {
        color[] = {1,1,1,1};
        icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Task
    {
        taskNone = "#(argb,8,8,3)color(0,0,0,0)";
        taskCreated = "#(argb,8,8,3)color(0,0,0,1)";
        taskAssigned = "#(argb,8,8,3)color(1,1,1,1)";
        taskSucceeded = "#(argb,8,8,3)color(0,1,0,1)";
        taskFailed = "#(argb,8,8,3)color(1,0,0,1)";
        taskCanceled = "#(argb,8,8,3)color(1,0.5,0,1)";
        colorCreated[] = {1,1,1,1};
        colorCanceled[] = {0.7,0.7,0.7,1};
        colorDone[] = {0.7,1,0.3,1};
        colorFailed[] = {1,0.3,0.2,1};
        color[] =
        {
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
        };
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class CustomMark
    {
        color[] = {1,1,1,1};
        icon = "\a3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Tree
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class SmallTree
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bush
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = "14/2";
        importance = "0.2 * 14 * 0.05 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Church
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Chapel
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Cross
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Rock
    {
        color[] = {0.1,0.1,0.1,0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bunker
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fortress
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fountain
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class ViewTower
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Lighthouse
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Quay
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Fuelstation
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Hospital
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class BusStop
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class LineMarker
    {
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
        lineWidthThin = 0.008;
        lineWidthThick = 0.014;
        lineDistanceMin = 3e-005;
        lineLengthMin = 5;
    };
    class Transmitter
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Stack
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.4;
        coefMax = 2;
    };
    class Ruin
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class Tourism
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.7;
        coefMax = 4;
    };
    class Watertower
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Waypoint
    {
        color[] = {1,1,1,1};
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
    };
    class WaypointCompleted
    {
        color[] = {1,1,1,1};
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\a3\ui_f\data\map\mapcontrol\waypointcompleted_ca.paa";
        size = 18;
    };
    class power
    {
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class powersolar
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class powerwave
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class powerwind
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class Shipwreck
    {
        icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
        color[] = {0,0,0,1};
    };
};

////////////////////
// ControlsGroups //
////////////////////

class A3A_ControlsGroup
{
    idc = -1;
    deletable = 0;
    fade = 0;
    type = CT_CONTROLS_GROUP;
    style = ST_MULTI;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;

    class VScrollbar: A3A_ScrollBar
    {
        color[] = {1,1,1,1};
        width = 0.021;
        autoScrollEnabled = 1;
    };

    class HScrollbar: A3A_ScrollBar
    {
        color[] = {1,1,1,1};
        height = 0.028;
    };

    class Controls
    {
    };
};

class A3A_ControlsGroupNoScrollbars: A3A_ControlsGroup
{
    class VScrollbar: VScrollbar
    {
        width = 0;
    };

    class HScrollbar: HScrollbar
    {
        height = 0;
    };
};

class A3A_ControlsGroupNoHScrollbars: A3A_ControlsGroup
{
    class HScrollbar: HScrollbar
    {
        height = 0;
    };
};

class A3A_ControlsGroupNoVScrollbars: A3A_ControlsGroup
{
    class VScrollbar: VScrollbar
    {
        width = 0;
    };
};

class A3A_DefaultDialog
{
    idd = -1;

    #define DIALOG_W 160 // Width of dialog in pixelGrid units
    #define DIALOG_H 100 // Height of dialog in pixelGrid units
    #define DIALOG_X CENTER_X(DIALOG_W) // Global x pos of dialog
    #define DIALOG_Y CENTER_Y(DIALOG_H) // Global y pos of dialog

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class Background : A3A_Background
        {
            x = DIALOG_X;
            y = DIALOG_Y;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H;
        };
    };
};

class A3A_TabbedDialog : A3A_DefaultDialog
{
    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class TabsBackground : A3A_Background
        {
            colorBackground[] = A3A_COLOR_TABS_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class Background : A3A_Background
        {
            x = DIALOG_X;
            y = DIALOG_Y;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H;
        };
    };
};

class A3A_DefaultControlsGroup : A3A_ControlsGroupNoScrollbars
{
    x = DIALOG_X;
    y = DIALOG_Y;
    w = DIALOG_W * GRID_W;
    h = DIALOG_H * GRID_H;
};

class A3A_Text_Small : A3A_text
{
    sizeEx = GUI_TEXT_SIZE_SMALL;
};

class A3A_Listbox_Small : A3A_Listbox
{
    rowHeight = GUI_TEXT_SIZE_SMALL;
    sizeEx = GUI_TEXT_SIZE_SMALL;
};

class A3A_ComboBox : A3A_ListBox
{
    type = CT_COMBO;
    class ComboScrollBar: ScrollBar {};
    style = ST_MULTI;   // + ST_NO_RECT;          // ?

    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    soundExpand[] = { "\A3\ui_f\data\sound\RscCombo\soundExpand", 0.1, 1 };
    soundCollapse[] = { "\A3\ui_f\data\sound\RscCombo\soundCollapse", 0.1, 1 };
    wholeHeight = 1; // ??
    maxHistoryDelay = 0.2;      // Do values <1 actually work? pretty annoying if you can't quick open-close these
};

class A3A_ComboBox_Small : A3A_ComboBox
{
    sizeEx = GUI_TEXT_SIZE_SMALL;
    rowHeight = GUI_TEXT_SIZE_SMALL;
};