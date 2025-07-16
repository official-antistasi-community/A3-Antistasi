#define ACTIONINTERNAL(type) "["##type##", _this] call A3A_fnc_keyActions"
#define ACTION(type) ACTIONINTERNAL(QGVAR(type))
class CfgUserActions {
    class GVAR(battleMenu) {
        displayName = $STR_A3A_keybinds_CfgUserAct_battleMenu_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_battleMenu_tip;
        onActivate = ACTION(battleMenu);
    };

    class GVAR(artyMenu) {
        displayName = $STR_A3A_keybinds_CfgUserAct_artyMenu_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_artyMenu_tip;
        onActivate = ACTION(artyMenu);
    };

    class GVAR(respawn) {
        displayName = $STR_A3A_keybinds_CfgUserAct_respawn_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_respawn_tip;
    };

    class GVAR(selfRevive) {
        displayName = $STR_A3A_keybinds_CfgUserAct_selfRevive_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_selfRevive_tip;
    };

    class GVAR(infoBar) {
        displayName = $STR_A3A_keybinds_CfgUserAct_infoBar_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_infoBar_tip;
        onActivate = ACTION(infoBar);
    };

    class GVAR(earPlugs) {
        displayName = $STR_A3A_keybinds_CfgUserAct_earPlugs_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_earPlugs_tip;
        onActivate = ACTION(earPlugs);
    };

    class GVAR(customHintDismiss) {
        displayName = $STR_A3A_keybinds_CfgUserAct_cusHintDiss_DN;
        tooltip = $STR_A3A_keybinds_CfgUserAct_cusHintDiss_tip;
        onActivate = ACTION(customHintDismiss);
    };
};
#undef ACTION
