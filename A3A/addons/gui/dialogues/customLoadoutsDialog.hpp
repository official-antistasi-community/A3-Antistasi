#include "ids.inc"

class A3A_CustomLoadoutsDialog {
    idd = A3A_IDD_CUSTOMLOADOUTSDIALOG;
    movingenable = true;

    onLoad = "['init'] spawn A3A_GUI_fnc_customLoadoutsDialog";
    onUnload = "['close'] call A3A_GUI_fnc_customLoadoutsDialog";      // TODO probably need something here

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(120);
            y = CENTER_Y(80) - 5*GRID_H;
            w = 120*GRID_W;
            h = 5*GRID_H;
        };

        class Background : A3A_Background
        {
            x = CENTER_X(120);
            y = CENTER_Y(80);
            w = 120*GRID_W;
            h = 80*GRID_H;
        };
    };

    class Controls {
        class TitlebarText : A3A_TitlebarText {
            idc = -1;
            text = $STR_antistasi_dialogs_custom_loadouts_title;
            x = CENTER_X(120);
            y = CENTER_Y(80) - 5*GRID_H;
            w = 120*GRID_W;
            h = 5*GRID_H;
        };

        // Container exists purely to simplify the x/y of subcontrols
        class MainContainer : A3A_controlsGroupNoScrollbars {
            idc = -1;
            x = CENTER_X(120);
            y = CENTER_Y(80);
            w = 120*GRID_W;
            h = 80*GRID_H;

            class Controls {
                class RoleList : A3A_listBox {
                    idc = A3A_IDC_CUSLOAD_LISTBOX;
                    x = 4*GRID_W;
                    y = 4*GRID_H;
                    w = 36*GRID_W;
                    h = 61*GRID_H;
                    onLBSelChanged = "['selectRole', [_this#1]] call A3A_GUI_fnc_customLoadoutsDialog";
                    onLoad = "(_this # 0) ctrlEnable false";                // disable until init is complete
                };

                class PriWeaponText : A3A_TextRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_custom_loadouts_priWeapon;
                    x = 45*GRID_W;
                    y = 6*GRID_H;
                    w = 26*GRID_W;
                    h = 5*GRID_H;
                };
                class PriWeaponSel : A3A_comboBox {
                    idc = A3A_IDC_CUSLOAD_PRIWEAPON;
                    x = 76*GRID_W;
                    y = 6*GRID_H;
                    w = 40*GRID_W;
                    h = 5*GRID_H;
                    //onLoad = "(_this # 0) ctrlEnable false";                // disable until init is complete
                };
                class SecWeaponText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_secWeapon;
                    y = 13*GRID_H;
                };
                class SecWeaponSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_SECWEAPON;
                    y = 13*GRID_H;
                };
                class PriOpticText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_priOptic;
                    y = 20*GRID_H;
                };
                class PriOpticSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_PRIOPTIC;
                    y = 20*GRID_H;
                };
                class AmmoQuantText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_ammoQuant;
                    y = 27*GRID_H;
                };
                class AmmoQuantSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_AMMOQUANT;
                    y = 27*GRID_H;
                };

                class UniformText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_uniform;
                    y = 37*GRID_H;
                };
                class UniformSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_UNIFORM;
                    y = 37*GRID_H;
                };
                class VestText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_vest;
                    y = 44*GRID_H;
                };
                class VestSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_VEST;
                    y = 44*GRID_H;
                };
                class BackpackText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_backpack;
                    y = 51*GRID_H;
                };
                class BackpackSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_BACKPACK;
                    y = 51*GRID_H;
                };
                class HeadgearText : PriWeaponText {
                    text = $STR_antistasi_dialogs_custom_loadouts_headgear;
                    y = 58*GRID_H;
                };
                class HeadgearSel : PriWeaponSel {
                    idc = A3A_IDC_CUSLOAD_HEADGEAR;
                    y = 58*GRID_H;
                };

                class CloseButton : A3A_Button {
                    idc = A3A_IDC_CUSLOAD_CLOSEBUTTON;
                    x = 5*GRID_W;
                    y = 70*GRID_H;
                    text = $STR_antistasi_dialogs_custom_loadouts_close;
                    onButtonClick = "closeDialog 0";
                };
                class CopyToAllButton : A3A_Button {
                    idc = A3A_IDC_CUSLOAD_COPYTOALLBUTTON;
                    x = 44*GRID_W;
                    y = 70*GRID_H;
                    text = $STR_antistasi_dialogs_custom_loadouts_copyToAll;
                    onButtonClick = "['copyToAllButton'] call A3A_GUI_fnc_customLoadoutsDialog";
                };
                class ResetRoleButton : A3A_Button {
                    idc = A3A_IDC_CUSLOAD_RESETROLEBUTTON;
                    x = 70*GRID_W;
                    y = 70*GRID_H;
                    text = $STR_antistasi_dialogs_custom_loadouts_resetRole;
                    onButtonClick = "['resetRoleButton'] call A3A_GUI_fnc_customLoadoutsDialog";
                };
                class ResetAllButton : A3A_Button {
                    idc = A3A_IDC_CUSLOAD_RESETALLBUTTON;
                    x = 96*GRID_W;
                    y = 70*GRID_H;
                    text = $STR_antistasi_dialogs_custom_loadouts_resetAll;
                    onButtonClick = "['resetAllButton'] call A3A_GUI_fnc_customLoadoutsDialog";
                };
            };
        };
    };
};
