
class Params
{
    class autoLoadLastGame
    {
        title = $STR_A3A_Mission_Params_autoLoadLastGame_title;
        values[] = {-1, 60, 120, 180, 300, 600};
        texts[] = {$STR_A3A_Mission_Params_autoLoadLastGame_noautoload,$STR_A3A_Mission_Params_autoLoadLastGame_1min, $STR_A3A_Mission_Params_autoLoadLastGame_2min, $STR_A3A_Mission_Params_autoLoadLastGame_3min, $STR_A3A_Mission_Params_autoLoadLastGame_5min, $STR_A3A_Mission_Params_autoLoadLastGame_10min};
        default = -1;
    };
    class LogLevel
    {
        title = $STR_A3A_Mission_Params_LogLevel_title;
        values[] = {1,2,3,4};
        texts[] = {$STR_A3A_Mission_Params_LogLevel_error, $STR_A3A_Mission_Params_LogLevel_info, $STR_A3A_Mission_Params_LogLevel_debug, $STR_A3A_Mission_Params_LogLevel_verbose};
        default = 2;
    };
    class A3A_logDebugConsole
    {
        title = $STR_A3A_Mission_Params_logDebugConsole_title;
        values[] = {-1,1,2};
        texts[] = {$STR_A3A_Mission_Params_logDebugConsole_none, $STR_A3A_Mission_Params_logDebugConsole_nondev, $STR_A3A_Mission_Params_logDebugConsole_all};
        default = 1;
    };
};
