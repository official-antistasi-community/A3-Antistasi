
class A3A_SetupDialog : A3A_TabbedDialog
{
    idd = A3A_IDD_SETUPDIALOG;
    onLoad = "['onLoad'] spawn A3A_GUI_fnc_setupDialog";
    onUnload = "['onUnload'] call A3A_GUI_fnc_setupDialog";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = A3A_IDC_SETUP_TITLEBAR;
            text = $STR_antistasi_dialogs_setup_titlebar;
            x = DIALOG_X;
            y = DIALOG_Y - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_SETUP_TABBUTTONS;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
                class LoadgameTabButton : A3A_Button
                {
                    idc = A3A_IDC_SETUP_LOADGAMETABBUTTON;
                    text = $STR_antistasi_dialogs_setup_loadgame_tab_button;
                    onButtonClick = "['switchTab', ['loadgame']] call A3A_GUI_fnc_setupDialog;";
                    x = 0;
                    y = 0;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };

                class FactionTabButton : A3A_Button
                {
                    idc = A3A_IDC_SETUP_FACTIONTABBUTTON;
                    text = $STR_antistasi_dialogs_setup_faction_tab_button;
                    onButtonClick = "['switchTab', ['factions']] call A3A_GUI_fnc_setupDialog;";
                    x = 30 * GRID_W;
                    y = 0;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };

                class ParamsTabButton : A3A_Button
                {
                    idc = A3A_IDC_SETUP_PARAMSTABBUTTON;
                    text = $STR_antistasi_dialogs_setup_params_tab_button;
                    onButtonClick = "['switchTab', ['params']] call A3A_GUI_fnc_setupDialog;";
                    x = 60 * GRID_W;
                    y = 0;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };


        ///////////////
        // MAIN TABS //
        ///////////////

        class LoadgameTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_SETUP_LOADGAMETAB;
            onLoad = "['onLoad'] spawn A3A_GUI_fnc_setupLoadgameTab";
            show = false;

            class Controls
            {
                class SavedGamesLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_saved_games;
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 118 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SavedGamesBackground: A3A_Background {
                    idc = -1;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 118 * GRID_W;
                    h = 80 * GRID_H;
                };
                class SavedGamesHeader : A3A_ControlsGroupNoScrollbars
                {
                    idc = A3A_IDC_SETUP_SAVESHEADER;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 118 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SavedGamesTable : A3A_ControlsGroup       // hopefully has scrollbars
                {
                    idc = A3A_IDC_SETUP_SAVESLISTBOX;
                    onMouseButtonUp = "['saveListClick', _this] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 4 * GRID_W;
                    y = 12 * GRID_H;
                    w = 118 * GRID_W;
                    h = 76 * GRID_H;

                    class Controls
                    {
                        class SavedGamesSelector: A3A_Background {
                            idc = A3A_IDC_SETUP_GAMESELECTBOX;
                            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
                            x = 0 * GRID_W;
                            y = 0 * GRID_H;
                            w = 118 * GRID_W;
                            h = 4 * GRID_H;
                        };
                    };
                };

                class SaveNameLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_new_save_name;
                    x = 4 * GRID_W;
                    y = 91 * GRID_H;
                    w = 24 * GRID_W;
                    h = 5 * GRID_H;
                };
                class SaveNameEditBox: A3A_Edit {
                    idc = A3A_IDC_SETUP_NAMEEDITBOX;
                    x = 28 * GRID_W;
                    y = 91 * GRID_H;
                    w = 94 * GRID_W;
                    h = 5 * GRID_H;
                };

                class StartGame: A3A_Button {
                    idc = A3A_IDC_SETUP_STARTBUTTON;
                    text = $STR_antistasi_dialogs_setup_start_game;
                    onButtonClick = "['startGame'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 4 * GRID_H;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };
                class NewGameCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_NEWGAMECHECKBOX;
                    onCheckedChanged = "['newGameCheck'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 12 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class NewGameText: A3A_text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_create_new_game;
                    x = 130 * GRID_W;
                    y = 12 * GRID_H;
                    w = 26 * GRID_W;
                    h = 4 * GRID_H;
                };
                class CopyGameCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_COPYGAMECHECKBOX;
                    onCheckedChanged = "['copyGameCheck'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 18 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class CopyGameText: A3A_text {
                    idc = A3A_IDC_SETUP_COPYGAMETEXT;
                    text = $STR_antistasi_dialogs_setup_copy_old_game;
                    x = 130 * GRID_W;
                    y = 18 * GRID_H;
                    w = 26 * GRID_W;
                    h = 4 * GRID_H;
                };
                class OldParamsCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_OLDPARAMSCHECKBOX;
                    onCheckedChanged = "['oldParamsCheck'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 24 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class OldParamsText: A3A_text {
                    idc = A3A_IDC_SETUP_OLDPARAMSTEXT;
                    text = $STR_antistasi_dialogs_setup_load_old_params;
                    x = 130 * GRID_W;
                    y = 24 * GRID_H;
                    w = 26 * GRID_W;
                    h = 4 * GRID_H;
                };
                class NewNamespaceCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_NAMESPACECHECKBOX;
                    onCheckedChanged = "['newNamespaceCheck'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 30 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class NewNamespaceText: A3A_text {
                    idc = A3A_IDC_SETUP_NAMESPACETEXT;
                    text = $STR_antistasi_dialogs_setup_use_new_namespace;
                    x = 130 * GRID_W;
                    y = 30 * GRID_H;
                    w = 26 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SetHQPosButton: A3A_Button {
                    idc = A3A_IDC_SETUP_HQPOSBUTTON;
                    text = $STR_antistasi_dialogs_setup_set_hq_position;
                    onButtonClick = "['setHQPos'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 36 * GRID_H;
                    w = 30 * GRID_W;
                    h = 6 * GRID_H;
                };

                class DeleteButton: A3A_Button {
                    idc = A3A_IDC_SETUP_DELETEBUTTON;
                    text = $STR_antistasi_dialogs_setup_delete_game;
                    onButtonClick = "['deleteGame'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 84 * GRID_H;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };
                class RenameButton: A3A_Button {
                    idc = A3A_IDC_SETUP_RENAMEBUTTON;
                    text = $STR_antistasi_dialogs_setup_rename_game;
                    onButtonClick = "['renameGame'] call A3A_GUI_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 91 * GRID_H;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        class FactionsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_SETUP_FACTIONSTAB;
            //onLoad = "['onLoad'] spawn A3A_GUI_fnc_setupFactionsTab";
            show = false;

            class Controls
            {
                class RebelsLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_rebels;
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 34 * GRID_W;
                    h = 4 * GRID_H;
                };
                class RebelsListBox: A3A_Listbox_Small {
                    idc = A3A_IDC_SETUP_REBELSLISTBOX;
                    onLBSelChanged = "['factionSelected', _this] call A3A_GUI_fnc_setupFactionsTab";
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 34 * GRID_W;
                    h = 20 * GRID_H;
                };

                class CiviliansLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_civilians;
                    x = 4 * GRID_W;
                    y = 30 * GRID_H;
                    w = 34 * GRID_W;
                    h = 4 * GRID_H;
                };
                class CiviliansListBox: A3A_Listbox_Small {
                    idc = A3A_IDC_SETUP_CIVILIANSLISTBOX;
                    onLBSelChanged = "['factionSelected', _this] call A3A_GUI_fnc_setupFactionsTab";
                    x = 4 * GRID_W;
                    y = 34 * GRID_H;
                    w = 34 * GRID_W;
                    h = 20 * GRID_H;
                };

                class OccupantsLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_occupants;
                    x = 40 * GRID_W;
                    y = 4 * GRID_H;
                    w = 40 * GRID_W;
                    h = 4 * GRID_H;
                };
                class OccupantsListBox: A3A_Listbox_Small {
                    idc = A3A_IDC_SETUP_OCCUPANTSLISTBOX;
                    onLBSelChanged = "['factionSelected', _this] call A3A_GUI_fnc_setupFactionsTab";
                    x = 40 * GRID_W;
                    y = 8 * GRID_H;
                    w = 40 * GRID_W;
                    h = 88 * GRID_H;
                };

                class InvadersLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_invaders;
                    x = 82 * GRID_W;
                    y = 4 * GRID_H;
                    w = 40 * GRID_W;
                    h = 4 * GRID_H;
                };
                class InvadersListBox: A3A_Listbox_Small {
                    idc = A3A_IDC_SETUP_INVADERSLISTBOX;
                    onLBSelChanged = "['factionSelected', _this] call A3A_GUI_fnc_setupFactionsTab";
                    x = 82 * GRID_W;
                    y = 8 * GRID_H;
                    w = 40 * GRID_W;
                    h = 88 * GRID_H;
                };

                class SwitchEnemyCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_SWITCHENEMYCHECK;
                    onCheckedChanged = "['fillFactions', [false]] call A3A_GUI_fnc_setupFactionsTab";
                    x = 124 * GRID_W;
                    y = 4 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SwitchEnemyText: A3A_text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_switch_enemy_sides;
                    x = 128 * GRID_W;
                    y = 4 * GRID_H;
                    w = 28 * GRID_W;
                    h = 4 * GRID_H;
                };
                class AnyEnemyCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_ANYENEMYCHECK;
                    onCheckedChanged = "['fillFactions', [false]] call A3A_GUI_fnc_setupFactionsTab";
                    x = 124 * GRID_W;
                    y = 10 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class AnyEnemyText: A3A_text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_override_side_limits;
                    x = 128 * GRID_W;
                    y = 10 * GRID_H;
                    w = 28 * GRID_W;
                    h = 4 * GRID_H;
                };
                class IgnoreCamoCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_IGNORECAMOCHECK;
                    onCheckedChanged = "['fillFactions', [false]] call A3A_GUI_fnc_setupFactionsTab";
                    x = 124 * GRID_W;
                    y = 16 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class IgnoreCamoText: A3A_text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_override_camo_limits;
                    x = 128 * GRID_W;
                    y = 16 * GRID_H;
                    w = 28 * GRID_W;
                    h = 4 * GRID_H;
                };
                class ShowMissingCheck: A3A_Checkbox {
                    idc = A3A_IDC_SETUP_SHOWMISSINGCHECK;
                    onCheckedChanged = "['fillFactions', [false]] call A3A_GUI_fnc_setupFactionsTab";
                    x = 124 * GRID_W;
                    y = 22 * GRID_H;
                    w = 4 * GRID_W;
                    h = 4 * GRID_H;
                };
                class ShowMissingText: A3A_text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_show_missing_mods;
                    x = 128 * GRID_W;
                    y = 22 * GRID_H;
                    w = 28 * GRID_W;
                    h = 4 * GRID_H;
                };

                class DLCLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_dlc;
                    x = 124 * GRID_W;
                    y = 30 * GRID_H;
                    w = 32 * GRID_W;
                    h = 4 * GRID_H;
                };
                class DLCBackground: A3A_Background {
                    idc = -1;
                    x = 124 * GRID_W;
                    y = 34 * GRID_H;
                    w = 32 * GRID_W;
                    h = 62 * GRID_H;
                };
                class DLCBox: A3A_ControlsGroup {
                    idc = A3A_IDC_SETUP_DLCBOX;
                    x = 124 * GRID_W;
                    y = 34 * GRID_H;
                    w = 32 * GRID_W;
                    h = 62 * GRID_H;
                };
                class AddonVicsBox: A3A_ControlsGroup {
                    idc = A3A_IDC_SETUP_ADDONVICSBOX;
                    x = 124 * GRID_W;
                    y = 34 * GRID_H;
                    w = 32 * GRID_W;
                    h = 62 * GRID_H;
                };
                class DLCToggle: A3A_Button {
                    idc = A3A_IDC_SETUP_DLCTOGGLE;
                    text = $STR_antistasi_dialogs_setup_toggleAddons_addons;
                    onButtonClick = "['switchAddons'] call A3A_GUI_fnc_setupFactionsTab;";
                    x = 124 * GRID_W;
                    y = 92 * GRID_H;
                    w = 32 * GRID_W;
                    h = 4 * GRID_H;
                };
                class InfoLabel: A3A_SectionLabelRight {
                    idc = A3A_IDC_SETUP_INFOLABEL;
                    text = $STR_antistasi_dialogs_setup_factionInfo;
                    x = 4 * GRID_W;
                    y = 56 * GRID_H;
                    w = 34 * GRID_W;
                    h = 4 * GRID_H;
                };
                class InfoBackground: A3A_Background {
                    idc = -1;
                    x = 4 * GRID_W;
                    y = 60 * GRID_H;
                    w = 34 * GRID_W;
                    h = 36 * GRID_H;
                };
                class InfoBox: A3A_TextMulti {
                    idc = A3A_IDC_SETUP_INFOBOX;
                    SizeEx = GUI_TEXT_SIZE_TINY;
                    x = 4 * GRID_W;
                    y = 60 * GRID_H;
                    w = 34 * GRID_W;
                    h = 32 * GRID_H;
                };
            };
        };

        class ParamsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_SETUP_PARAMSTAB;
            onLoad = "['onLoad'] spawn A3A_GUI_fnc_setupParamsTab";
            show = false;

            class Controls
            {
                class ParamsBackground: A3A_Background {
                    idc = -1;
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 152 * GRID_W;
                    h = 92 * GRID_H;
                };
                class ParamsTable : A3A_ControlsGroup       // hopefully has scrollbars
                {
                    idc = A3A_IDC_SETUP_PARAMSTABLE;
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 152 * GRID_W;
                    h = 92 * GRID_H;
                };
            };
        };

    };
};

class A3A_SetupHQPosDialog
{
    idd = A3A_IDD_SETUPHQPOSDIALOG;
    onLoad = "['onLoad'] spawn A3A_GUI_fnc_setupHQPosDialog";
    onUnload = "['onUnload'] call A3A_GUI_fnc_setupHQPosDialog";

    class ControlsBackground
    {
        class HQMap : A3A_MapControl
        {
            idc = -1;
            onMouseButtonUp = "['mouseUp', _this] spawn A3A_GUI_fnc_setupHQPosDialog";
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
        };
    };
    class Controls
    {
        class CloseButton : A3A_Button
        {
            idc = -1;
            text = $STR_antistasi_dialogs_hqpos_close;
            onButtonClick = "closeDialog 0";
            x = safeZoneX;
            y = safeZoneY;
            w = 30 * GRID_W;
            h = 6 * GRID_H;
        };
    };
};

class A3A_TextMultiCenter: A3A_Text
{
    style = ST_CENTER + ST_MULTI + ST_NO_RECT;
};

class A3A_SetupConfirmDialog
{
    idd = A3A_IDD_SETUPCONFIRMDIALOG;
    onLoad = "['onLoad'] spawn A3A_GUI_fnc_setupConfirmDialog";
    //onUnload = "['onUnload'] call A3A_GUI_fnc_setupConfirmDialog";        // nothing to do on cancel?

    #define DIALOG_X CENTER_X(80) // Global x pos of dialog
    #define DIALOG_Y CENTER_Y(40) // Global y pos of dialog

    class Controls
    {
        class Titlebar : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_setup_confirm_title;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = 80 * GRID_W;
            h = 5 * GRID_H;
        };
        class Background : A3A_Background
        {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = 80 * GRID_W;
            h = 40 * GRID_H;
        };
        class ConfirmText : A3A_TextMultiCenter
        {
            idc = A3A_IDC_SETUP_CONFIRMTEXT;
            x = DIALOG_X + 4 * GRID_W;
            y = DIALOG_Y + 4 * GRID_H;
            w = 72 * GRID_W;
            h = 20 * GRID_H;
        };
        class CancelButton : A3A_Button
        {
            idc = A3A_IDC_SETUP_CONFIRMCANCEL;
            text = $STR_antistasi_dialogs_setup_confirm_cancel;
            onButtonClick = "closeDialog 0";
            x = DIALOG_X + 4 * GRID_W;
            y = DIALOG_Y + 28 * GRID_H;
            w = 30 * GRID_W;
            h = 5 * GRID_H;
        };
        class YesButton : A3A_Button
        {
            idc = A3A_IDC_SETUP_CONFIRMYES;
            text = $STR_antistasi_dialogs_setup_confirm_yes;
            onButtonClick = "['confirm'] call A3A_GUI_fnc_setupConfirmDialog";
            x = DIALOG_X + 46 * GRID_W;
            y = DIALOG_Y + 28 * GRID_H;
            w = 30 * GRID_W;
            h = 5 * GRID_H;
        };
    };
};
