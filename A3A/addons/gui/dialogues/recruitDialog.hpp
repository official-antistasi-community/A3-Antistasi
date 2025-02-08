class A3A_RecruitDialog : A3A_DefaultDialog
{
  idd = A3A_IDD_RECRUITDIALOG;
  onLoad = "[""onLoad""] spawn A3A_GUI_fnc_recruitDialog";

  class Controls
  {
    class TitlebarText : A3A_TitlebarText
    {
      idc = -1;
      text = $STR_antistasi_dialogs_recruit_units_titlebar;
      x = DIALOG_X;
      y = DIALOG_Y - 5 * GRID_H;
      w = DIALOG_W * GRID_W;
      h = 5 * GRID_H;
    };

    // Main content
    class MainContent : A3A_DefaultControlsGroup
    {
      idc = A3A_IDC_RECRUITMAIN;

      class Controls
      {
        class MilitiamanIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITMILITIAMANICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Rifleman;
          x = 24 * GRID_W;
          y = 13 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class MilitiamanPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITMILITIAMANPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 24 * GRID_W;
          y = 19 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class MilitiamanButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITMILITIAMANBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_militiaman;
          onButtonClick = "[A3A_faction_reb get 'unitRifle'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 36 * GRID_W;
          y = 11 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class AutoriflemanIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITAUTORIFLEMANICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Autorifleman;
          x = 24 * GRID_W;
          y = 34 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class AutoriflemanPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITAUTORIFLEMANPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 24 * GRID_W;
          y = 40 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class AutoriflemanButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITAUTORIFLEMANBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_autorifleman;
          onButtonClick = "[A3A_faction_reb get 'unitMG'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 36 * GRID_W;
          y = 32 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class GrenadierIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITGRENADIERICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Grenadier;
          x = 24 * GRID_W;
          y = 55 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class GrenadierPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITGRENADIERPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 24 * GRID_W;
          y = 61 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class GrenadierButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITGRENADIERBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_grenadier;
          onButtonClick = "[A3A_faction_reb get 'unitGL'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 36 * GRID_W;
          y = 53 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class AntitankIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITANTITANKICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_AT;
          x = 24 * GRID_W;
          y = 76 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class AntitankPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITANTITANKPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 24 * GRID_W;
          y = 82 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class AntitankButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITANTITANKBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_antitank;
          onButtonClick = "[A3A_faction_reb get 'unitLAT'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 36 * GRID_W;
          y = 74 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class MedicIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITMEDICICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Heal;
          x = 128 * GRID_W;
          y = 13 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class MedicPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITMEDICPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 128 * GRID_W;
          y = 19 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class MedicButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITMEDICBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_medic;
          onButtonClick = "[A3A_faction_reb get 'unitMedic'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 88 * GRID_W;
          y = 11 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class MarksmanIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITMARKSMANICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Sniper;
          x = 128 * GRID_W;
          y = 34 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class MarksmanPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITMARKSMANPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 128 * GRID_W;
          y = 40 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class MarksmanButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITMARKSMANBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_marksman;
          onButtonClick = "[A3A_faction_reb get 'unitSniper'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 88 * GRID_W;
          y = 32 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class EngineerIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITENGINEERICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Construct;
          x = 128 * GRID_W;
          y = 55 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class EngineerPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITENGINEERPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 128 * GRID_W;
          y = 61 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class EngineerButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITENGINEERBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_engineer;
          onButtonClick = "[A3A_faction_reb get 'unitEng'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 88 * GRID_W;
          y = 53 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class BombSpecialistIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITBOMBSPECIALISTICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Bomb_Specialist;
          x = 128 * GRID_W;
          y = 76 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class BombSpecialistPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITBOMBSPECIALISTPRICE;
          style = ST_CENTER;
          text = "€ 0";
          shadow = 2;
          x = 128 * GRID_W;
          y = 82 * GRID_H;
          w = 8 * GRID_W;
          h = 4 * GRID_H;
        };

        class BombSpecialistButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITBOMBSPECIALISTBUTTON;
          text = $STR_antistasi_dialogs_recruit_units_bomb_specialist;
          onButtonClick = "[A3A_faction_reb get 'unitExp'] spawn A3A_fnc_reinfPlayer; [""onLoad""] spawn A3A_GUI_fnc_recruitDialog;";
          x = 88 * GRID_W;
          y = 74 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

      };
    };

    class CloseButton : A3A_CloseButton
    {
      idc = -1;
      x = DIALOG_X + DIALOG_W * GRID_W - 5 * GRID_W;
      y = DIALOG_Y - 5 * GRID_H;
    };
  };
};
