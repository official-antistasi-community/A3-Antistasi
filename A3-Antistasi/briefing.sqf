waitUntil {!isNull player};
//format [localize "STR_antistasi_journal_entry_header_tutorial_1"]
//format [localize "STR_antistasi_journal_entry_text_tutorial_1"]
if (side player == teamPlayer) then
{
_index =player createDiarySubject ["Tutorial", localize "STR_antistasi_journal_entry_header_tutorial"];
player createDiaryRecord ["Tutorial",[localize "STR_antistasi_undercover",localize "STR_antistasi_journal_entry_text_tutorial_7"]];
player createDiaryRecord ["Tutorial",[localize "STR_a3_cfgvehicles_modulerespawnvehicle_f_arguments_position_values_start_0",localize "STR_antistasi_journal_entry_text_tutorial_6"]];
player createDiaryRecord ["Tutorial",[localize "STR_antistasi_resources",localize "STR_antistasi_journal_entry_text_tutorial_5"]];
player createDiaryRecord ["Tutorial",[localize "STR_antistasi_journal_entry_header_tutorial_4",localize "STR_antistasi_journal_entry_text_tutorial_4"]];
player createDiaryRecord ["Tutorial",[localize "STR_a3_wl_menu_strategy",localize "STR_antistasi_journal_entry_text_tutorial_3"]];
player createDiaryRecord ["Tutorial",[localize "STR_antistasi_journal_entry_header_tutorial_2",localize "STR_antistasi_journal_entry_text_tutorial_2"]];
player createDiaryRecord ["Tutorial",[localize "STR_antistasi_journal_entry_header_tutorial_1",localize "STR_antistasi_journal_entry_text_tutorial_1"]];

_index =player createDiarySubject ["Commander",localize "STR_antistasi_journal_entry_header_commander"];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_15",localize "STR_antistasi_journal_entry_text_commander_15"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_14",localize "STR_antistasi_journal_entry_text_commander_14"]];
player createDiaryRecord ["Commander",[localize "STR_a3_cfggroups_empty_military_roadblocks",localize "STR_antistasi_journal_entry_text_commander_13"]];
player createDiaryRecord ["Commander",[localize "STR_a3_mdl_sites_disp_military_op",localize "STR_antistasi_journal_entry_text_commander_12"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_11",localize "STR_antistasi_journal_entry_text_commander_11"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_10",localize "STR_antistasi_journal_entry_text_commander_10"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_9",localize "STR_antistasi_journal_entry_text_commander_9"]];
player createDiaryRecord ["Commander",[localize "STR_a3_cfgmarkers_nato_art",localize "STR_antistasi_journal_entry_text_commander_8"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_7",localize "STR_antistasi_journal_entry_text_commander_7"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_6",localize "STR_antistasi_journal_entry_text_commander_6"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_5",localize "STR_antistasi_journal_entry_text_commander_5"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_4",localize "STR_antistasi_journal_entry_text_commander_4"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_journal_entry_header_commander_3",localize "STR_antistasi_journal_entry_text_commander_3"]];
player createDiaryRecord ["Commander",[localize "STR_antistasi_garrisons",localize "STR_antistasi_journal_entry_text_commander_2"]];
player createDiaryRecord ["Commander",[localize "STR_a3_rscdisplayconfigure_textgeneral",localize "STR_antistasi_journal_entry_text_commander_1"]];


_index =player createDiarySubject ["SpecialK",localize "STR_antistasi_journal_entry_header_SpecialK"];
player createDiaryRecord ["SpecialK",[localize "STR_antistasi_earplugs",localize "STR_antistasi_journal_entry_text_SpecialK_5"]];
player createDiaryRecord ["SpecialK",[localize "STR_antistasi_journal_entry_header_SpecialK_4",localize "STR_antistasi_journal_entry_text_SpecialK_4"]];
player createDiaryRecord ["SpecialK",[localize "STR_a3_cfgmarkers_nato_art",localize "STR_antistasi_journal_entry_text_SpecialK_3"]];
player createDiaryRecord ["SpecialK",[localize "STR_a3_cfghints_highcommand1",localize "STR_antistasi_journal_entry_text_SpecialK_2"]];
player createDiaryRecord ["SpecialK",[localize "STR_antistasi_journal_entry_header_SpecialK_1",localize "STR_antistasi_journal_entry_text_SpecialK_1"]];


_index =player createDiarySubject ["Features",localize "STR_antistasi_journal_entry_header_Features"];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_17",format [localize "STR_antistasi_journal_entry_text_Features_17", breachingExplosivesAPC call A3A_fnc_createBreachChargeText, "<br></br><br></br>", breachingExplosivesTank call A3A_fnc_createBreachChargeText]]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_16",localize "STR_antistasi_journal_entry_text_Features_16"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_12",localize "STR_antistasi_journal_entry_text_Features_12"]];
player createDiaryRecord ["Features",[localize "STR_a3_fastravel1",localize "STR_antistasi_journal_entry_text_Features_11"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_10",localize "STR_antistasi_journal_entry_text_Features_10"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_9",localize "STR_antistasi_journal_entry_text_Features_9"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_8",localize "STR_antistasi_journal_entry_text_Features_8"]];
player createDiaryRecord ["Features",[localize "STR_dn_vehicles",localize "STR_antistasi_journal_entry_text_Features_7"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_6",format [localize "STR_antistasi_journal_entry_text_Features_6",worldName]]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_5",localize "STR_antistasi_journal_entry_text_Features_5"]];
player createDiaryRecord ["Features",[localize "STR_A3_Arsenal",localize "STR_antistasi_journal_entry_text_Features_4"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_undercover",localize "STR_antistasi_journal_entry_text_Features_3"]];
player createDiaryRecord ["Features",[localize "STR_a3_garage",localize "STR_antistasi_journal_entry_text_Features_2"]];
player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_1",localize "STR_antistasi_journal_entry_text_Features_1"]];


_index =player createDiarySubject ["AI",localize "STR_antistasi_journal_entry_header_AI"];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_7",localize "STR_antistasi_journal_entry_text_AI_7"]];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_6",localize "STR_antistasi_journal_entry_text_AI_6"]];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_5",localize "STR_antistasi_journal_entry_text_AI_5"]];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_4",localize "STR_antistasi_journal_entry_text_AI_4"]];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_3",localize "STR_antistasi_journal_entry_text_AI_3"]];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_2",localize "STR_antistasi_journal_entry_text_AI_2"]];
player createDiaryRecord ["AI",[localize "STR_antistasi_journal_entry_header_AI_1",localize "STR_antistasi_journal_entry_text_AI_1"]];


_index =player createDiarySubject ["Options",localize "STR_disp_options_game_options"];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_8",localize "STR_antistasi_journal_entry_text_Options_8"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_7",localize "STR_antistasi_journal_entry_text_Options_7"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_6",localize "STR_antistasi_journal_entry_text_Options_6"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_5",localize "STR_antistasi_journal_entry_text_Options_5"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_4",localize "STR_antistasi_journal_entry_text_Options_4"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_3",localize "STR_antistasi_journal_entry_text_Options_3"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_2",localize "STR_antistasi_journal_entry_text_Options_2"]];
player createDiaryRecord ["Options",[localize "STR_antistasi_journal_entry_header_Options_1",localize "STR_antistasi_journal_entry_text_Options_1"]];

//Default Diary entries (Found in "Briefing" box)
player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_Diary_6",localize "STR_antistasi_journal_entry_text_Diary_6"]];
player createDiaryRecord ["Diary",[localize "STR_antistasi_resources",localize "STR_antistasi_journal_entry_text_Diary_5"]];
player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_Diary_4",localize "STR_antistasi_journal_entry_text_Diary_4"]];
player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_Diary_3",localize "STR_antistasi_journal_entry_text_Diary_3"]];
player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_Diary_2",localize "STR_antistasi_journal_entry_text_Diary_2"]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_1",nameOccupants,nameInvaders],format [localize "STR_antistasi_journal_entry_text_Diary_1",nameOccupants,nameInvaders,nameTeamPlayer,worldName]]];

//Multiplayer Specific Options, these will only show when the game is loaded via Multiplayer.
	if (!isNil "serverID") then {
	//MP Features
		player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_15",localize "STR_antistasi_journal_entry_text_Features_15"]];
		player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_14",localize "STR_antistasi_journal_entry_text_Features_14"]];
		player createDiaryRecord ["Features",[localize "STR_antistasi_journal_entry_header_Features_13",localize "STR_antistasi_journal_entry_text_Features_13"]];

	};

};
//Mission Specific stuff, fuck this code. This specifies the Rules of Engagement option in the menus.
switch (gameMode) do {
	case 1: {
				player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_gamemode",format [localize "STR_antistasi_journal_entry_text_gamemode_4",nameOccupants,nameInvaders,nameTeamPlayer]]]
			};
	case 2: {
				player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_gamemode",format [localize "STR_antistasi_journal_entry_text_gamemode_3",nameOccupants,nameInvaders,nameTeamPlayer]]]
			};
	case 3: {
				player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_gamemode",format [localize "STR_antistasi_journal_entry_text_gamemode_2",nameOccupants,nameTeamPlayer]]]
			};
	case 4: {
				player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_gamemode",format [localize "STR_antistasi_journal_entry_text_gamemode_1",nameInvaders,nameTeamPlayer]]]
			};
	Default {player createDiaryRecord ["Diary",[localize "STR_antistasi_journal_entry_header_gamemode",format [localize "STR_antistasi_journal_entry_text_gamemode_4",nameOccupants,nameInvaders,nameTeamPlayer]]]};
	};


// Default Welcome stuff.
player createDiaryRecord ["Diary",[localize "STR_sensortype_loose",format [localize "STR_antistasi_journal_entry_text_Default_3",nameInvaders]]];
player createDiaryRecord ["Diary",[localize "STR_a3_endgame_debriefing_victory",localize "STR_antistasi_journal_entry_text_Default_2"]];

_nameXMiss = if (A3A_hasIFA) then {"Armia Krajowa"} else {if (worldName == "Tanoa") then {"Warlords of the Pacific"} else {"Antistasi"}};
player createDiaryRecord ["Diary",[localize "STR_A3_RscDisplayWelcome_Title",format [localize "STR_antistasi_journal_entry_text_Default_1",_nameXMiss]]];

// Always include the Credits. It's important!
_index =player createDiarySubject ["Credits",localize "STR_a3_rscdisplaymain_buttoncredits"];
player createDiaryRecord ["Credits",[localize "STR_antistasi_journal_entry_header_Credits_3",localize "STR_antistasi_journal_entry_text_Credits_3"]];
player createDiaryRecord ["Credits",[localize "STR_antistasi_journal_entry_header_Credits_2",localize "STR_antistasi_journal_entry_text_Credits_2"]];
player createDiaryRecord ["Credits",[localize "STR_antistasi_journal_entry_header_Credits_1",localize "STR_antistasi_journal_entry_text_Credits_1"]];
