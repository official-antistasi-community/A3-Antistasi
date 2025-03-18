class A3A_RecruitSquadDialog : A3A_DefaultDialog
{
  idd = A3A_IDD_RECRUITSQUADDIALOG;
  onLoad = "[""onLoad""] spawn A3A_GUI_fnc_recruitSquadDialog";

  class Controls
  {
    class TitlebarText : A3A_TitlebarText
    {
      idc = -1;
      text = $STR_antistasi_dialogs_recruit_squad_titlebar_text;
      x = DIALOG_X;
      y = DIALOG_Y - 5 * GRID_H;
      w = DIALOG_W * GRID_W;
      h = 5 * GRID_H;
    };

    // Main content
    class MainContent : A3A_DefaultControlsGroup
    {
      idc = A3A_IDC_RECRUITSQUADMAIN;

      class Controls
      {
        class InfSquadIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITINFSQUADICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Inf_Squad;
          x = 24 * GRID_W;
          y = 13 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class InfSquadPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITINFSQUADPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 20 * GRID_W;
          y = 19 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class InfSquadButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITINFSQUADBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_inf_squad;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 36 * GRID_W;
          y = 11 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class InfTeamIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITINFTEAMICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Inf_Team;
          x = 24 * GRID_W;
          y = 34 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class InfTeamPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITINFTEAMPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 20 * GRID_W;
          y = 40 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class InfTeamButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITINFTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_inf_team;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 36 * GRID_W;
          y = 32 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class MgTeamIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITMGTEAMICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_MG_Team;
          x = 24 * GRID_W;
          y = 55 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class MgTeamPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITMGTEAMPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 20 * GRID_W;
          y = 61 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class MgTeamButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITMGTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_mg_team;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 36 * GRID_W;
          y = 53 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class AtTeamIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITATTEAMICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_AT_Team;
          x = 24 * GRID_W;
          y = 76 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class AtTeamPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITATTEAMPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 20 * GRID_W;
          y = 82 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class AtTeamButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITATTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_at_team;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 36 * GRID_W;
          y = 74 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class MortarTeamIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITMORTARTEAMICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Mortar_Team;
          x = 128 * GRID_W;
          y = 13 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class MortarTeamPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITMORTARTEAMPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 124 * GRID_W;
          y = 19 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class MortarTeamButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITMORTARTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_mortar_team;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 88 * GRID_W;
          y = 11 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class SniperTeamIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITSNIPERTEAMICON;
          colorBackground[] = {0,0,0,0};
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Sniper_Team;
          x = 128 * GRID_W;
          y = 34 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class SniperTeamPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITSNIPERTEAMPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 124 * GRID_W;
          y = 40 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class SniperTeamButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITSNIPERTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_sniper_team;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 88 * GRID_W;
          y = 32 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class AtCarIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITATCARICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_AT_Car;
          x = 128 * GRID_W;
          y = 55 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class AtCarPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITATCARPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 124 * GRID_W;
          y = 61 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class AtCarButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITATCARBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_at_car;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 88 * GRID_W;
          y = 53 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class AaTruckIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITAATRUCKICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_AA_Truck;
          x = 128 * GRID_W;
          y = 76 * GRID_H;
          w = 8 * GRID_W;
          h = 8 * GRID_H;
        };

        class AaTruckPriceText : A3A_Text
        {
          idc = A3A_IDC_RECRUITAATRUCKPRICE;
          style = ST_CENTER;
          text = "";
          shadow = 2;
          x = 124 * GRID_W;
          y = 82 * GRID_H;
          w = 16 * GRID_W;
          h = 4 * GRID_H;
        };

        class AaTruckButton : A3A_Button
        {
          idc = A3A_IDC_RECRUITAATRUCKBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_aa_truck;
          onButtonClick = "[""buySquad"", [_this]] call A3A_GUI_fnc_recruitSquadDialog";
          size = GUI_TEXT_SIZE_LARGE;
          x = 88 * GRID_W;
          y = 74 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class IncludeVehicleLabel : A3A_Text
        {
          idc = -1;
          text = $STR_antistasi_dialogs_recruit_squad_include_vehicle_label;
          sizeEx = GUI_TEXT_SIZE_LARGE;
          colorBackground[] = A3A_COLOR_BACKGROUND;
          x = 60 * GRID_W;
          y = 90 * GRID_H;
          w = 42 * GRID_W;
          h = 6 * GRID_H;
        };

        class IncludeVehicleCB : A3A_CheckBox
        {
          idc = A3A_IDC_SQUADINCLUDEVEHICLECHECKBOX;
          onCheckedChanged = "[""update""] call A3A_GUI_fnc_recruitSquadDialog";
          x = 96 * GRID_W;
          y = 90 * GRID_H;
          w = 6 * GRID_W;
          h = 6 * GRID_H;
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
