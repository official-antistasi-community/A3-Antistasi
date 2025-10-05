class clientOptions
{
    class music
    {
        title = $STR_antistasi_client_options_useMusic;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        stateChange = "_this spawn A3A_fnc_musica";
    };
    class hideCorpses
    {
        title = $STR_antistasi_client_options_hideCorpses;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_tooltip, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        stateChange = "_this spawn A3A_fnc_hideCorpses";
    };
    
};
