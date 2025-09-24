#include "ids.inc"

class A3A_ArsenalLimitsDialog : A3A_DefaultDialog {
    idd = A3A_IDD_ARSENALLIMITSDIALOG;
    movingenable = false;

    onLoad = "['init'] spawn A3A_GUI_fnc_arsenalLimitsDialog";
    onUnload = "publicVariable 'A3A_arsenalLimits'";

    class Controls {
        class TitlebarText : A3A_TitlebarText {
            idc = -1;
            text = $STR_antistasi_arsenal_limits_dialog_title;
            x = DIALOG_X;
            y = DIALOG_Y - 5*GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5*GRID_H;
        };

        class MainListBox : A3A_ControlsGroup {
            idc = A3A_IDC_ARSLIMLISTBOX;
            x = DIALOG_X + 42*GRID_W;
            y = DIALOG_Y + 6*GRID_H;
            w = 102*GRID_W;
            h = 88*GRID_H;
        };
        class HeaderCurrent : A3A_TextRight {
            idc = -1;
            x = DIALOG_X + 95*GRID_W;
            y = DIALOG_Y + 2*GRID_H;
            w = 10*GRID_W;
            h = 4*GRID_H;
            text = $STR_antistasi_arsenal_limits_dialog_current;
        };
        class HeaderLimit : HeaderCurrent {
            x = DIALOG_X + 115*GRID_W;
            text = $STR_antistasi_arsenal_limits_dialog_limit;
        };

        class ResetButton : A3A_Button {
            idc = A3A_IDC_ARSLIMRESETBUTTON;
            x = DIALOG_X + 14*GRID_W;
            y = DIALOG_Y + 78*GRID_H;
            text = $STR_antistasi_arsenal_limits_dialog_reset;
            tooltip = $STR_antistasi_arsenal_limits_dialog_reset_tooltip;
            onButtonClick = "['resetButton'] call A3A_GUI_fnc_ArsenalLimitsDialog";
        };

        class CloseButton : A3A_Button {
            idc = A3A_IDC_ARSLIMCLOSEBUTTON;
            x = DIALOG_X + 14*GRID_W;
            y = DIALOG_Y + 88*GRID_H;
            text = $STR_antistasi_arsenal_limits_dialog_close;
            onButtonClick = "closeDialog 0";
        };


/*
        class StepButton : CloseButton {
            idc = A3A_IDC_ARSLIMSTEPBUTTON;
            x = AL_CENTER_X - 20*AL_GRID_W;
            text = "";              // stringtable combination doesn't work so prep in onLoad instead
            onButtonClick = "['stepButton'] call A3A_GUI_fnc_arsenalLimitsDialog";
            onLoad = "['stepButton'] spawn A3A_GUI_fnc_arsenalLimitsDialog";
        };
*/
        class TypeSelection : A3A_ControlsGroup {
            idc = A3A_IDC_ARSLIMTYPESELECT;
            x = DIALOG_X + 14*GRID_W;
            y = DIALOG_Y + 6*GRID_H;
            w = 16*GRID_W;
            h = 68*GRID_H;
            class controls {
                class buttonPrimaryWeapon : A3A_Button {
                    style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
                    idc = A3A_IDC_ARSLIMTYPESBASE + 0;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_PrimaryWeapon";
                    onLoad = "(_this # 0) ctrlEnable false";                // disable until init is complete
                    onButtonClick = "['typeSelect', [ctrlIDC (_this#0)]] call A3A_GUI_fnc_arsenalLimitsDialog";
                    colorDisabled[] = {0,0,0,1};
                    colorBackgroundDisabled[] = {1,1,1,1};
                    x = 0;
                    y = 0;
                    w = 6*GRID_W;
                    h = 6*GRID_H;
                };
                class buttonHandgun : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 2;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Handgun";
                    y = 6*GRID_H;
                };
                class buttonSecondaryWeapon : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 1;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_SecondaryWeapon";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = 12*GRID_H;
                };
                class buttonHeadgear : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 6;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Headgear";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa";
                    y = 18*GRID_H;
                };
                class buttonUniform : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 3;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Uniform";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa";
                    y = 24*GRID_H;
                };
                class buttonVest: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 4;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Vest";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa";
                    y = 30*GRID_H;
                };
                class buttonBackpack: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 5;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Backpack";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa";
                    y = 36*GRID_H;
                };
                class buttonNVG: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 8;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_NVGs";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa";
                    y = 42*GRID_H;
                };
                class buttonBinoculars: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 9;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Binoculars";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa";
                    y = 48*GRID_H;
                };
                class buttonGPS: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 11;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_GPS";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa";
                    y = 54*GRID_H;
                };
                class buttonRadio: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 12;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Radio";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa";
                    y = 60*GRID_H;
                };

                class buttonOptic: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 18;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemOptic";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
                    x = 10*GRID_W;
                    y = 0*GRID_H;
                };
                class buttonItemAcc: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 19;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemAcc";
                    y = 6*GRID_H;
                };
                class buttonMuzzle: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 20;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemMuzzle";
                    y = 12*GRID_H;
                };
                class buttonBipod: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 25;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemBipod";
                    y = 18*GRID_H;
                };

                class buttonMag: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 26;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMagAll";
                    y = 28*GRID_H;
                };
                class buttonThrow: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 22;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoThrow";
                    y = 34*GRID_H;
                };
                class buttonPut: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 23;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoPut";
                    y = 40*GRID_H;
                };
                class buttonMisc: buttonOptic {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 24;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMisc";
                    y = 46*GRID_H;
                };
            };
        };
    };
};
