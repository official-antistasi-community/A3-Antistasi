_canManageAi = false;
_failText = "";
// Check if AI Management is available
switch (true) do
{
    case !(leader player == player):
    {
        _failText = localize "STR_antistasi_dialogs_main_ai_management_sl_tooltip";
    };

    case ({!isPlayer _x} count units group player < 1):
    {
        _failText = localize "STR_antistasi_dialogs_main_ai_management_no_ai_tooltip";
    };

    default
    {
        _canManageAi = true;
    };
};
[_canManageAI, _failText]