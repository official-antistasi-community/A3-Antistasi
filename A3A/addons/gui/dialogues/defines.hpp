/*
Maintainer: DoomMetal
    Contains constants and macros for the GUI.
*/

//////////////////
// HEADER GUARD //
//////////////////

#define INCLUDED_DEFINES_HPP

/////////////
// IMPORTS //
/////////////

#ifndef GUI_BCG_COLOR
    #include "\a3\ui_f\hpp\definecommoncolors.inc"
#endif


////////////////////
// GENERIC MACROS //
////////////////////
#define REFLECT(Text) Text
#define SHARP REFLECT(#)
#define QUOTE(Text) #Text


///////////////////
// CONTROL TYPES //
///////////////////

#define CT_STATIC             0
#define CT_BUTTON             1
#define CT_EDIT               2
#define CT_SLIDER             3
#define CT_COMBO              4
#define CT_LISTBOX            5
#define CT_TOOLBOX            6
#define CT_CHECKBOXES         7
#define CT_PROGRESS           8
#define CT_HTML               9
#define CT_STATIC_SKEW        10
#define CT_ACTIVETEXT         11
#define CT_TREE               12
#define CT_STRUCTURED_TEXT    13
#define CT_CONTEXT_MENU       14
#define CT_CONTROLS_GROUP     15
#define CT_SHORTCUTBUTTON     16
#define CT_HITZONES           17
#define CT_XKEYDESC           40
#define CT_XBUTTON            41
#define CT_XLISTBOX           42
#define CT_XSLIDER            43
#define CT_XCOMBO             44
#define CT_ANIMATED_TEXTURE   45
#define CT_OBJECT             80
#define CT_OBJECT_ZOOM        81
#define CT_OBJECT_CONTAINER   82
#define CT_OBJECT_CONT_ANIM   83
#define CT_LINEBREAK          98
#define CT_USER               99
#define CT_MAP                100
#define CT_MAP_MAIN           101
#define CT_LISTNBOX           102
#define CT_ITEMSLOT           103
#define CT_CHECKBOX           77


////////////////////
// CONTROL STYLES //
////////////////////

#define ST_POS                0x0F
#define ST_HPOS               0x03
#define ST_VPOS               0x0C
#define ST_LEFT               0x00
#define ST_RIGHT              0x01
#define ST_CENTER             0x02
#define ST_DOWN               0x04
#define ST_UP                 0x08
#define ST_VCENTER            0x0C

#define ST_TYPE               0xF0
#define ST_SINGLE             0x00
#define ST_MULTI              0x10
#define ST_TITLE_BAR          0x20
#define ST_PICTURE            0x30
#define ST_FRAME              0x40
#define ST_BACKGROUND         0x50
#define ST_GROUP_BOX          0x60
#define ST_GROUP_BOX2         0x70
#define ST_HUD_BACKGROUND     0x80
#define ST_TILE_PICTURE       0x90
#define ST_WITH_RECT          0xA0
#define ST_LINE               0xB0
#define ST_UPPERCASE          0xC0
#define ST_LOWERCASE          0xD0

#define ST_SHADOW             0x100
#define ST_NO_RECT            0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Slider styles
#define SL_DIR                0x400
#define SL_VERT               0
#define SL_HORZ               0x400
#define SL_TEXTURES           0x10

// Progress bar
#define ST_VERTICAL           0x01
#define ST_HORIZONTAL         0

// Listbox styles
#define LB_TEXTURES           0x10
#define LB_MULTI              0x20

// Tree styles
#define TR_SHOWROOT           1
#define TR_AUTOCOLLAPSE       2


///////////////
// PIXELGRID //
///////////////

#define pixelScale 0.5  // Was originally 0.5.
#define PixelGridScaler pixelGridNoUIScale
#define GRID_W (pixelW * PixelGridScaler * pixelScale)
#define GRID_H (pixelH * PixelGridScaler * pixelScale)

// Converts pixelGrid units to GUI coordinates
#define PX_W(n) n*GRID_W
#define PX_H(n) n*GRID_H

// Gets origin (top-left) in GUI coordinates of a centered box defined by pixelGrid units
#define CENTER_X(n) ((getResolution select 2) * 0.5 * pixelW) - (0.5 * (PX_W(n)))
#define CENTER_Y(n) ((getResolution select 3) * 0.5 * pixelH) - (0.5 * (PX_H(n)))

// Text sizes
#define GUI_TEXT_SIZE_TINY (GRID_H * 2.75) // Don't know where this fits
#define GUI_TEXT_SIZE_SMALL (GRID_H * 3.2) // Fits inside 3*GRID_H
#define GUI_TEXT_SIZE_MEDIUM (GRID_H * 4.2)  // Fits inside 4*GRID_H
#define GUI_TEXT_SIZE_LARGE (GRID_H * 5) // Fits inside 6*GRID_H


////////////
// COLORS //
////////////

// Background
#define A3A_COLOR_BACKGROUND {0.2,0.2,0.2,0.75}

// Titlebar background
#define A3A_COLOR_TITLEBAR_BACKGROUND GUI_BCG_COLOR
#define A3A_COLOR_TITLEBAR_BACKGROUND_SQF [GUI_BCG_RGB, GUI_BCG_ALPHA]

// Tabs Background
#define A3A_COLOR_TABS_BACKGROUND {0.2,0.2,0.2,0.9}

// Default text
#define A3A_COLOR_TEXT {1,1,1,1}

// Default text
#define A3A_COLOR_TITLEBAR_TEXT GUI_TITLETEXT_COLOR

// Darker text
#define A3A_COLOR_TEXT_DARKER {0.7,0.7,0.7,1}
#define A3A_COLOR_TEXT_DARKER_SQF [0.7,0.7,0.7,1]

// Active elements ("selection color")
#define A3A_COLOR_ACTIVE {0.95,0.95,0.95,1}

// Warning / Accents
#define A3A_COLOR_WARNING IGUI_WARNING_COLOR

// Error / Strong accents
#define A3A_COLOR_ERROR IGUI_ERROR_COLOR

// Shadows / Outlines
#define A3A_COLOR_SHADOW {0,0,0,0.5}

// Transparent, defined explicitly for readability
#define A3A_COLOR_TRANSPARENT {0,0,0,0}

// Other useful colors
#define A3A_COLOR_BLACK {0,0,0,1}
#define A3A_COLOR_WHITE {1,1,1,1}

// Tooltips
#define A3A_COLOR_TOOLTIP_TEXT {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BOX {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BACKGROUND {0,0,0,0.65}

// Buttons
#define A3A_COLOR_BUTTON_TEXT A3A_COLOR_TEXT
#define A3A_COLOR_BUTTON_TEXT_DISABLED {1,1,1,0.25}
#define A3A_COLOR_BUTTON_BACKGROUND {0,0,0,1}
#define A3A_COLOR_BUTTON_BACKGROUND_DISABLED {0,0,0,0.5}
#define A3A_COLOR_BUTTON_ACTIVE A3A_COLOR_TITLEBAR_BACKGROUND
#define A3A_COLOR_BUTTON_FOCUSED A3A_COLOR_TITLEBAR_BACKGROUND

// Map select marker
#define A3A_COLOR_SELECT_MARKER {1,1,1,0.75}

// Commander display
#define A3A_COLOR_COMMANDER {1,0.9,0.5,1}
#define A3A_COLOR_ELIGIBLE {0.7,0.7,0.7,1}
#define A3A_COLOR_INELIGIBLE {0.5,0.5,0.5,1}


///////////
// FONTS //
///////////

#define A3A_DEFAULT_FONT "RobotoCondensed"
#define A3A_BUTTON_FONT "PuristaLight"
#define A3A_TITLEBAR_FONT "PuristaMedium"


//////////////
// TEXTURES //
//////////////

#define A3A_GUI_TEXTURE_PATH_OF(Filename) x\A3A\addons\GUI\dialogues\textures\##Filename
#define A3A_GUI_QTEXTURE_PATH_OF(Filename) QUOTE(A3A_GUI_TEXTURE_PATH_OF(Filename))
