/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Main menu specific modifications for Antistasi.
*/

/* Uncomment when we have scenes to use
class CfgWorlds
{
	class CAWorld;
	class Stratis : CAWorld
	{
		cutscenes[] = { "A3A_menu" };
	};
	initWorld = "Stratis";
	demoWorld = "Stratis";
};

class CfgMissions
{
	class Cutscenes
	{
		class A3A_menu
		{
			directory = "x\A3A\addons\gui\scenes\A3A_Menu.Altis";
		};
	};
};
*/ 

class RscActivePicture;
class RscStandardDisplay;
class RscControlsGroupNoScrollbars;

class RscDisplayMain : RscStandardDisplay 
{
    enableDisplay = 0;
	class controls
	{
		/*
		delete Spotlight;
		delete Spotlight1;
		delete Spotlight2;
		delete Spotlight3;
		delete SpotlightNext;
		delete SpotlightPrev;
		delete BackgroundSpotlightRight;
		delete BackgroundSpotlightLeft;
		delete BackgroundSpotlight;

        class Logo : RscActivePicture
		{	
			x="safezoneX + safezoneW - 5 * 		2 * 	(pixelW * pixelGrid * 2)";
			y="safezoneY + 2 * 	(pixelH * pixelGrid * 2)";
			w="4 * 	(pixelW * pixelGrid * 2)";
			h="2 * 	(pixelH * pixelGrid * 2)";
		};
		class A3A_Logo : Logo 
		{
			text = QPATHTOFOLDER(dialogues\textures\banner\mainMenuLogo.paa);
			tooltip="Click to start an Antistasi game!";
			x="0.5 - 	5 * 	(pixelW * pixelGrid * 2)";
			y="safezoneY + (3 - 0.25 * 	5) * 	(pixelH * pixelGrid * 2)";
			w="2 * 	5 * 	(pixelW * pixelGrid * 2)";
			h="0.5 * 	5 * 	(pixelH * pixelGrid * 2)";
			onButtonClick="finddisplay 0 createDisplay 'A3A_MapSelectorDialog';";
			onLoad="";
		};
		*/

		class GroupSingleplayer : RscControlsGroupNoScrollbars 
		{
			h = "(6 * 	1.5) * 	(pixelH * pixelGrid * 2)";
			class Controls
			{
				class Editor;
				class A3A_LaunchSP : Editor {
					idc = A3A_IDC_MAINMENU_A3A_MP;
                    text = "Antistasi";
                    tooltip = "Start an Antistasi Game";
                    y = "(5 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onButtonClick="playMission ['', '\A3\Missions_F_Bootcamp\Scenarios\Arsenal.VR'];";
				};
			};
		};
        class GroupMultiplayer : GroupSingleplayer
        {
            h = "(5 * 	1.5) * 	(pixelH * pixelGrid * 2)";
            class Controls
            {
                class ApexProtocol;
                class A3A_LaunchMP : ApexProtocol {
                    idc = A3A_IDC_MAINMENU_A3A_MP;
                    text = "Antistasi";
                    tooltip = "Start an Antistasi Game";
                    y = "(3 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onButtonClick="finddisplay 0 createDisplay 'A3A_MapSelectorDialog';";
                };
				class A3A_CommunityAdvertisement : ApexProtocol {
                    idc = A3A_IDC_MAINMENU_COMMUNITY_AD;
                    text = "Anti. Community Servers";
                    tooltip = "Play Antistasi 24/7 on the official servers!";
                    y = "(4 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onButtonClick="finddisplay 0 createDisplay 'A3A_CommunityAdvertisement';";
                };

            };
        };
		/* ts doesnt work cause CBA. worth splitting, real settings menu if CBA loaded and option here if not? worth effort?
		class GroupOptions : GroupSingleplayer
        {
            h = "(7 * 	1.5) * 	(pixelH * pixelGrid * 2)";
            class Controls
            {
                class Expansions;
                class A3A_Options : Expansions {
                    idc = A3A_IDC_MAINMENU_OPTIONS;
                    text = "Antistasi Options";
                    tooltip = "Adjust client-side Antistasi settings";
                    y = "(6 * 	1.5) * 	(pixelH * pixelGrid * 2) + 	(pixelH)";
					onButtonClick="finddisplay 0 createDisplay 'A3A_ClientOptions';";
                };
            };
        };
		/*

		/*
		// ok so none of this shit fucking works. possible arma level issues. big ?????

		// Inherit from InfoNews
		// RIGHT HIGH Website
		// RIGHT MIDDLE Github
		// RIGHT LOW Mod on steam workshop
		// LEFT HIGH Community servers
		// LEFT MIDDLE Discord
		// LEFT LOW version (link to changelog)

		class InfoMods: RscControlsGroupNoScrollbars {
            class Controls;
        };

        class InfoNews: InfoMods {
            class Controls: Controls {
                class Background;
                class BackgroundIcon;
                class Icon;
                class Button;
				class News;
            };
        };
		class A3A_SteamWorkshopLink : InfoNews {
			idc = A3A_IDC_MAINMENU_LINKWORKSHOP;
			x = "safezoneX + 	(4 * pixelH)";
			y = "safeZoneY + safeZoneH - (4 * 2 + 1) * (pixelH * pixelGrid * 2) - 5 * (4 * pixelH)";

			class Controls: Controls {
                class Background: Background {
					idc = -1;
					angle = 0;
					x = (0.4) * 	(pixelW * pixelGrid * 2);
				};
                class BackgroundIcon: BackgroundIcon {
					idc = -1;
					angle = 0;
					x = (0.4) * 	(pixelW * pixelGrid * 2);
				};
                class Icon: Icon {
					idc = -1;
                    text = QPATHTOFOLDER(dialogues\textures\extIcons\steam.paa);
					x = (0.4) * 	(pixelW * pixelGrid * 2);
                };
				class Button: Button {
					idc = -1;
					tooltip = "Upvote the mod on the Steam Workshop!";
					url = "https://steamcommunity.com/sharedfiles/filedetails/?id=2867537125";
				};
				class Text: News {
					idc = -1;
					text = "Steam Workshop";
				};
			};
		};
		class A3A_GithubLink : A3A_SteamWorkshopLink {
			idc = A3A_IDC_MAINMENU_LINKGITHUB;
			y = "safeZoneY + safeZoneH - (5 * 2 + 1) * (pixelH * pixelGrid * 2) - 6 * (4 * pixelH)";

			class Controls: Controls {
                class Background: Background {};
                class BackgroundIcon: BackgroundIcon {};
                class Icon: Icon {
                    text = QPATHTOFOLDER(dialogues\textures\extIcons\github.paa);
                };
				class Button: Button {
					tooltip = "Visit the GitHub to view the progress on updates";
					url = "https://github.com/official-antistasi-community/A3-Antistasi";
				};
				class Text: News {
					text = "Antistasi Github";
				};
			};
		};
		class A3A_WebsiteLink : A3A_SteamWorkshopLink {
			idc = A3A_IDC_MAINMENU_LINKWEBSITE;
			y = "safeZoneY + safeZoneH - (6 * 2 + 1) * (pixelH * pixelGrid * 2) - 7 * (4 * pixelH)";

			class Controls: Controls {
				class Background: Background {};
                class BackgroundIcon: BackgroundIcon {};
                class Icon: Icon {
                    text = QPATHTOFOLDER(dialogues\textures\icon_move_hq.paa);
                };
				class Button: Button {
					tooltip = "Visit the website for additional Antistasi information";
					url = "https://antistasi.de";
				};
				class Text: News {
					text = "Antistasi Website";
				};

			};
		};
		class A3A_DiscordLink : InfoNews {
			idc = A3A_IDC_MAINMENU_LINKDISCORD;
			y = "safeZoneY + safeZoneH - (4 * 2 + 1) * (pixelH * pixelGrid * 2) - 5 * (4 * pixelH)";

			class Controls: Controls {
                class Background: Background {
					idc = -1;
				};
                class BackgroundIcon: BackgroundIcon {
					idc = -1;
				};
                class Icon: Icon {
					idc = -1;
                    text = QPATHTOFOLDER(dialogues\textures\extIcons\discord.paa);
                };
				class Button: Button {
					idc = -1;
					tooltip = "Join the Discord to find other Antistasi players and get support";
					url = "https://discord.gg/antistasi";
				};
				class Text: News {
					idc = -1;
					text = "Antistasi Discord";
				};
			};
		};

		class A3A_Version : A3A_DiscordLink {
			idc = A3A_IDC_MAINMENU_VERSION;
			// ACE and a3 dev branches both put something at y=3
			y = "safeZoneY + safeZoneH - (6 * 2 + 1) * (pixelH * pixelGrid * 2) - 7 * (4 * pixelH)";

			class Controls: Controls {
                class Background: Background {};
                class BackgroundIcon: BackgroundIcon {};
                class Icon: Icon {
                    text = QPATHTOFOLDER(dialogues\textures\extIcons\antistasi.paa);
                };
				class Button: Button {
					tooltip = "Click to view the changelog";
					url = "https://github.com/official-antistasi-community/A3-Antistasi/releases";
				};
				class Text: News {
					text = "0.00.0";
				};
			};
		};
		
		class A3A_CommunityServers : A3A_DiscordLink {
			idc = A3A_IDC_MAINMENU_COMMUNITYSERVERS;
			y = "safeZoneY + safeZoneH - (5 * 2 + 1) * (pixelH * pixelGrid * 2) - 6 * (4 * pixelH)";

			class Controls: Controls {
				class Background: Background {};
                class BackgroundIcon: BackgroundIcon {};
                class Icon: Icon {
                    text = QPATHTOFOLDER(dialogues\textures\icon_garrison.paa);
                };
				class Button: Button {
					tooltip = "Join the community servers for 24/7 Antistasi!";
					url = "https://dev.arma3.com/latest/sitrep";
				};
				class Text: News {
					text = "Community Servers";
				};
			};
		};
		*/
	};
};

/*
class RscDisplayMultiplayerSetup : RscStandardDisplay
{
     onLoad = "[""onLoad"",_this,""RscDisplayMultiplayerSetup"",'GUI'] call (uinamespace getvariable 'A3A_GUI_fnc_manageMultiplayerSetupDisplay')";
}; // stupid fucking overwrite
*/