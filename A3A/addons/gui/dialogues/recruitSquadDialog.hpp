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
        // Left hand squads

        class InfSquadIcon : A3A_Picture
        {
          idc = A3A_IDC_RECRUITINFSQUADICON;
          colorText[]= A3A_COLOR_TEXT_DARKER;
          text = A3A_Icon_Inf_Squad;
          x = 24 * GRID_W;
          y = 6 * GRID_H;
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
          y = 14 * GRID_H;
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
          y = 6 * GRID_H;
          w = 36 * GRID_W;
          h = 12 * GRID_H;
        };

        class EngSquadIcon : InfSquadIcon
        {
          idc = A3A_IDC_RECRUITENGSQUADICON;
          text = A3A_Icon_Eng_Squad;
          y = 23 * GRID_H;
        };
        class EngSquadPriceText : InfSquadPriceText
        {
          idc = A3A_IDC_RECRUITENGSQUADPRICE;
          y = 31 * GRID_H;
        };
        class EngSquadButton : InfSquadButton
        {
          idc = A3A_IDC_RECRUITENGSQUADBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_eng_squad;
          y = 23 * GRID_H;
        };

        class InfTeamIcon : InfSquadIcon
        {
          idc = A3A_IDC_RECRUITINFTEAMICON;
          text = A3A_Icon_Inf_Team;
          y = 40 * GRID_H;
        };
        class InfTeamPriceText : InfSquadPriceText
        {
          idc = A3A_IDC_RECRUITINFTEAMPRICE;
          y = 48 * GRID_H;
        };
        class InfTeamButton : InfSquadButton
        {
          idc = A3A_IDC_RECRUITINFTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_inf_team;
          y = 40 * GRID_H;
        };

        class AtTeamIcon : InfSquadIcon
        {
          idc = A3A_IDC_RECRUITATTEAMICON;
          text = A3A_Icon_AT_Team;
          y = 57 * GRID_H;
        };
        class AtTeamPriceText : InfSquadPriceText
        {
          idc = A3A_IDC_RECRUITATTEAMPRICE;
          y = 65 * GRID_H;
        };
        class AtTeamButton : InfSquadButton
        {
          idc = A3A_IDC_RECRUITATTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_at_team;
          y = 57 * GRID_H;
        };

        class SniperTeamIcon : InfSquadIcon
        {
          idc = A3A_IDC_RECRUITSNIPERTEAMICON;
          text = A3A_Icon_Sniper_Team;
          y = 74 * GRID_H;
        };
        class SniperTeamPriceText : InfSquadPriceText
        {
          idc = A3A_IDC_RECRUITSNIPERTEAMPRICE;
          y = 82 * GRID_H;
        };
        class SniperTeamButton : InfSquadButton
        {
          idc = A3A_IDC_RECRUITSNIPERTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_sniper_team;
          y = 74 * GRID_H;
        };

        // Right hand squads

        class MgTeamIcon : InfSquadIcon
        {
          idc = A3A_IDC_RECRUITMGTEAMICON;
          text = A3A_Icon_MG_Team;
          x = 128 * GRID_W;
          y = 6 * GRID_H;
        };
        class MgTeamPriceText : InfSquadPriceText
        {
          idc = A3A_IDC_RECRUITMGTEAMPRICE;
          x = 124 * GRID_W;
          y = 14 * GRID_H;
        };
        class MgTeamButton : InfSquadButton
        {
          idc = A3A_IDC_RECRUITMGTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_mg_team;
          x = 88 * GRID_W;
          y = 6 * GRID_H;
        };

        class MortarTeamIcon : MgTeamIcon
        {
          idc = A3A_IDC_RECRUITMORTARTEAMICON;
          text = A3A_Icon_Mortar_Team;
          y = 23 * GRID_H;
        };
        class MortarTeamPriceText : MGTeamPriceText
        {
          idc = A3A_IDC_RECRUITMORTARTEAMPRICE;
          y = 31 * GRID_H;
        };
        class MortarTeamButton : MgTeamButton
        {
          idc = A3A_IDC_RECRUITMORTARTEAMBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_mortar_team;
          y = 23 * GRID_H;
        };

        class MgCarIcon : MgTeamIcon
        {
          idc = A3A_IDC_RECRUITMGCARICON;
          text = A3A_Icon_MG_Car;
          y = 40 * GRID_H;
        };
        class MgCarPriceText : MgTeamPriceText
        {
          idc = A3A_IDC_RECRUITMGCARPRICE;
          y = 48 * GRID_H;
        };
        class MgCarButton : MgTeamButton
        {
          idc = A3A_IDC_RECRUITMGCARBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_mg_car;
          y = 40 * GRID_H;
        };

        class AtCarIcon : MgTeamIcon
        {
          idc = A3A_IDC_RECRUITATCARICON;
          text = A3A_Icon_AT_Car;
          y = 57 * GRID_H;
        };
        class AtCarPriceText : MgTeamPriceText
        {
          idc = A3A_IDC_RECRUITATCARPRICE;
          y = 65 * GRID_H;
        };
        class AtCarButton : MgTeamButton
        {
          idc = A3A_IDC_RECRUITATCARBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_at_car;
          y = 57 * GRID_H;
        };

        class AaTruckIcon : MgTeamIcon
        {
          idc = A3A_IDC_RECRUITAATRUCKICON;
          text = A3A_Icon_AA_Truck;
          y = 74 * GRID_H;
        };
        class AaTruckPriceText : MgTeamPriceText
        {
          idc = A3A_IDC_RECRUITAATRUCKPRICE;
          y = 82 * GRID_H;
        };
        class AaTruckButton : MgTeamButton
        {
          idc = A3A_IDC_RECRUITAATRUCKBUTTON;
          text = $STR_antistasi_dialogs_recruit_squad_aa_truck;
          y = 74 * GRID_H;
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
