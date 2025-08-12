/*
    Author: [Håkon, DoomMetal]
    Description:
        Garage base GUI resources

    License: APL-ND
*/
//Common Macros
#ifndef QUOTE
#define QUOTE(var1) #var1
#endif

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_CONTROLS_TABLE   19
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_CHECKBOX         77
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_GROUP_BOX       96
#define ST_GROUP_BOX2      112
#define ST_ROUNDED_CORNER  ST_GROUP_BOX + ST_CENTER
#define ST_ROUNDED_CORNER2 ST_GROUP_BOX2 + ST_CENTER

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

//standardised values
#define FontSize "safeZoneW / safeZoneH min 1.2 / 1.2 / 25"
#define colorBG {0.43,0.43,0.43,0.75}
#define FontStyle "PuristaMedium"

////////////////
//Base Classes//
////////////////

class HR_GRG_RscText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    linespacing = 1;
    colorBackground[] = colorBG;
    colorText[] = {1,1,1,1};
    text = "";
    shadow = 0;
    font = FontStyle;
    SizeEx = FontSize;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;

};
class HR_GRG_RscTextNoBG : HR_GRG_RscText
{
    colorBackground[] = {0,0,0,0};
};

class HR_GRG_RscStructuredText
{
    idc = -1;
    type = CT_STRUCTURED_TEXT;
    style = ST_LEFT;
    colorBackground[] = colorBG;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    size = FontSize;
    text = "";
    class Attributes
    {
        font = FontStyle;
        color = "#FFFFFF";
        align = "left";
        valign = "middle";
        shadow = false;
        shadowColor = "#F5F5F5";
        size = "1";
    };
};
class HR_GRG_RscStructuredTextNoBG : HR_GRG_RscStructuredText
{
    colorBackground[] = {0,0,0,0};
};

class HR_GRG_RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = FontStyle;
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.05;
    h = 0.05;
};

class HR_GRG_RscButton
{
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.7,0,0,1};
    colorBackground[] = colorBG;
    colorBackgroundDisabled[] = colorBG;
    colorBackgroundActive[] = colorBG;
    colorFocused[] = {0.53,0.53,0.53,0.75};
    colorShadow[] = colorBG;
    colorBorder[] = colorBG;
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.06;
    h = 0.05;
    shadow = 0;
    font = FontStyle;
    sizeEx = FontSize;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
    onMouseEnter = "(_this select 0) ctrlSetTextColor [0.85,0.85,0.55,1]";
    onMouseExit = "(_this select 0) ctrlSetTextColor [1,1,1,1]";
};
class ctrlButtonPictureKeepAspect;

class HR_GRG_RscFrame
{
    type = CT_STATIC;
    idc = -1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = ST_FRAME;
    shadow = 0;
    colorBackground[] = colorBG;
    colorText[] = {1,1,1,1};
    font = FontStyle;
    sizeEx = FontSize;
    text = "";
};

class HR_GRG_RscBox
{
   type = CT_STATIC;
    idc = -1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = ST_CENTER;
    shadow = 0;
    colorText[] = colorBG;
    font = FontStyle;
    sizeEx = FontSize;
    colorBackground[] = colorBG;
    text = "";
};

class HR_GRG_RscListbox
{
     access = 0;
     type = CT_LISTBOX;
     style = 0;
     w = 0.4;
     h = 0.4;
     font = FontStyle;
     sizeEx = FontSize;
     rowHeight = 0;
     colorText[] = {1,1,1,1};
     colorScrollbar[] = {0.34,0.34,0.34,1};
     colorSelect[] = {1,1,1,0.75};
     colorSelect2[] = {0.85,0.85,0.55,0.75};
     colorSelectBackground[] = {0.53,0.53,0.53,0.75};
     colorSelectBackground2[] = colorBG;
     colorBackground[] = colorBG;
     colorDisabled[] = {0,0,0,0};
     maxHistoryDelay = 1.0;
     soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     period = 1;
     autoScrollSpeed = -1;
     autoScrollDelay = 5;
     autoScrollRewind = 0;
     arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
     arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
     shadow = 0;
     class ListScrollBar
     {
          color[] = {0.1,0.1,0.1,1};
          colorActive[] = {0.1,0.1,0.1,1};
          colorDisabled[] = {0.74,0.74,0.74,0.15};
          thumb = "#(argb,8,8,3)color(1,1,1,1)";
          arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
          arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
          border = "#(argb,8,8,3)color(1,1,1,1)";
          shadow = 0;
     };
};

class HR_GRG_ScrollBar
{
    color[] = colorBG;
    colorActive[] = colorBG;
    colorDisabled[] = colorBG;
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

class HR_GRG_RscControlsGroup
{
    idc = -1;
    deletable = 1;
    type = CT_CONTROLS_GROUP;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = ST_MULTI;
    shadow = 0;
    fade = 0;
    class VScrollbar: HR_GRG_ScrollBar
    {
        color[] = {1,1,1,1};
        width = 0.02;
        autoScrollEnabled = 1;
    };
    class HScrollbar: HR_GRG_ScrollBar
    {
        color[] = {1,1,1,1};
        height = 0.02;
    };
    class Controls
    {
    };
};

class HR_GRG_RscControlsGroupNoScrollbars: HR_GRG_RscControlsGroup
{
    class VScrollbar: VScrollbar
    {
        width = 0;
        scrollSpeed = 0;
    };
    class HScrollbar: HScrollbar
    {
        height = 0;
        scrollSpeed = 0;
    };
};

class HR_GRG_RscCombo
{
    deletable = 1;
    fade = 0;
    access = 0;
    type = CT_COMBO;
    colorSelect[] = {1,1,1,0.75};
    colorText[] = {1,1,1,1};
    colorBackground[] = colorBG;
    colorScrollbar[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};
    colorTextRight[] = {1,1,1,1};
    colorSelectRight[] = {1,1,1,0.75};
    colorSelect2Right[] = {0.85,0.85,0.55,0.75};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    maxHistoryDelay = 1;
    class ComboScrollBar: HR_GRG_ScrollBar
    {
        color[] = {1,1,1,1};
    };
    style = ST_MULTI + ST_NO_RECT;
    font = FontStyle;
    sizeEx = FontSize;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    colorSelectBackground[] = {0.53,0.53,0.53,0.75};
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
    wholeHeight = 0.45 * safeZoneH;
    colorActive[] = {1,0,0,1};
};
class HR_GRG_RscComboBlckBG : HR_GRG_RscCombo
{
    colorBackground[] = {0,0,0,1};
};

class HR_GRG_RscCheckBox
{
    idc = -1;
    type = CT_CHECKBOX;
    deletable = 1;
    style = ST_LEFT;
    checked = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
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
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    soundEnter[] = {"",0.1,1};
    soundPush[] = {"",0.1,1};
    soundClick[] = {"",0.1,1};
    soundEscape[] = {"",0.1,1};
};

class HR_GRG_RscActiveText
{
    deletable = 1;
    fade = 0;
    access = 0;
    type = CT_ACTIVETEXT;
    style = ST_CENTER;
    color[] = {0.43,0.43,0.43,1};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {0.7,0,0,1};
    soundEnter[] = { "", 0.1, 1 };
    soundPush[] = { "", 0.1, 1 };
    soundClick[] = { "", 0.1, 1 };
    soundEscape[] = { "", 0.1, 1 };
    text = "";
    default = 0;
    idc = -1;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.035;
    font = FontStyle;
    shadow = 2;
    sizeEx = FontSize;
    url = "";
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};
class HR_GRG_RscActivePicture: HR_GRG_RscActiveText { style = ST_MULTI + ST_TITLE_BAR; };
class HR_GRG_RscActivePictureKeepAspect: HR_GRG_RscActivePicture { style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO; };
