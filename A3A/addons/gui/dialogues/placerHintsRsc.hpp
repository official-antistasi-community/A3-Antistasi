#include "ids.inc"


#define SCREEN_RIGHT (safeZoneX + safeZoneW)
#define SCREEN_BOTTOM (safeZoneY + safeZoneH)

class A3A_PlacerHints {
    idd = IDD_PLACERHINT;
    fadeIn = 0;
    fadeOut = 0;
    duration = 999999;
    enableSimulation = 1;
    onLoad = "['onLoad', _this] spawn A3A_GUI_fnc_setUpPlacerHints";
    class controls {
        class TestText: A3A_Text {
            idc = IDC_PLACERHINT_TEST_TEXT;
            text = "";
            x = SCREEN_RIGHT - 32 * GRID_W;
            y = SCREEN_BOTTOM - 40 * GRID_H;
            w = 52 * GRID_W;
            h = 8 * GRID_H;
            sizeEx = 2.25 * GRID_H;
        };

        // snaping mode
        class IconALT: A3A_Picture {
            idc = IDC_PLACERHINT_ALT;
            text = A3A_Icon_key_alt;
            x = SCREEN_RIGHT - 32 * GRID_W;
            y = SCREEN_BOTTOM - 32 * GRID_H;
            w = 7 * GRID_W;
            h = 7 * GRID_H;
        };
        class TextALT: A3A_Text {
            idc = IDC_PLACERHINT_ALT_TEXT;
            text = "";
            x = SCREEN_RIGHT - 23 * GRID_W;
            y = SCREEN_BOTTOM - 31 * GRID_H;
            w = 45 * GRID_W;
            h = 4 * GRID_H;
            sizeEx = 2.25 * GRID_H;
        };

        // ROTATION_MODEs
        class IconEKEY: IconALT {
            idc = IDC_PLACERHINT_E;
            text = A3A_Icon_key_e;
            y = SCREEN_BOTTOM - 27 * GRID_H;
        };
        class TextEKEY: TextALT {
            idc = IDC_PLACERHINT_E_TEXT;
            y = SCREEN_BOTTOM - 26 * GRID_H;
        };
        class IconRKEY: IconALT {
            idc = IDC_PLACERHINT_R;
            text = A3A_Icon_key_r;
            y = SCREEN_BOTTOM - 22 * GRID_H;
        };
        class TextRKEY: TextALT {
            idc = IDC_PLACERHINT_R_TEXT;
            y = SCREEN_BOTTOM - 21 * GRID_H;
        };

        // UNSAFE_MODEs
        class IconSHIFT: IconALT {
            idc = IDC_PLACERHINT_SHIFT;
            text = A3A_Icon_key_shift;
            y = SCREEN_BOTTOM - 17 * GRID_H;
        };
        class TextSHIFT: TextALT {
            idc = IDC_PLACERHINT_SHIFT_TEXT;
            y = SCREEN_BOTTOM - 16 * GRID_H;
        };
        // cancel/rebuild keys
        class IconCKEY: IconALT {
            idc = IDC_PLACERHINT_C;
            text = A3A_Icon_key_c;
            y = SCREEN_BOTTOM - 12 * GRID_H;
        };
        class IconTKEY: IconALT {
            idc = IDC_PLACERHINT_T;
            text = A3A_Icon_key_t;
            y = SCREEN_BOTTOM - 12 * GRID_H;
        };
        class TextCKEY: TextALT {
            idc = IDC_PLACERHINT_C_TEXT;
            y = SCREEN_BOTTOM - 11 * GRID_H;
        };
        // place key
        class IconSpaceKEY: IconALT {
            idc = IDC_PLACERHINT_SPACE;
            text = A3A_Icon_key_space;
            x = SCREEN_RIGHT - 34 * GRID_W;
            y = SCREEN_BOTTOM - 11 * GRID_H;
            w = 10 * GRID_W;
            h = 15 * GRID_H;
        };
        class TextSpaceKEY: TextALT {
            idc = IDC_PLACERHINT_SPACE_TEXT;
            y = SCREEN_BOTTOM - 6 * GRID_H;
        };
    };
};