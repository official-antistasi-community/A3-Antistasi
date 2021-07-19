#include "Includes\common.inc"
FIX_LINE_NUMBERS()
waitUntil {!isNull player};
//format [localize "STR_antistasi_journal_entry_header_tutorial_1"]
//format [localize "STR_antistasi_journal_entry_text_tutorial_1"]
private _nameOcc = FactionGet(occ,"name");
private _nameInv = FactionGet(inv,"name");
private _namereb = FactionGet(reb,"name");
if (side player == teamPlayer) then
{
_index =player createDiarySubject ["Tutorial","Antistasi Basics"];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_7"],format [localize "STR_antistasi_journal_entry_text_tutorial_7"]]];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_6"],format [localize "STR_antistasi_journal_entry_text_tutorial_6"]]];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_5"],format [localize "STR_antistasi_journal_entry_text_tutorial_5"]]];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_4"],format [localize "STR_antistasi_journal_entry_text_tutorial_4"]]];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_3"],format [localize "STR_antistasi_journal_entry_text_tutorial_3"]]];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_2"],format [localize "STR_antistasi_journal_entry_text_tutorial_2"]]];
player createDiaryRecord ["Tutorial",[format [localize "STR_antistasi_journal_entry_header_tutorial_1"],format [localize "STR_antistasi_journal_entry_text_tutorial_1"]]];

_index =player createDiarySubject ["Commander","Commander Options"];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_15"],format [localize "STR_antistasi_journal_entry_text_commander_15"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_14"],format [localize "STR_antistasi_journal_entry_text_commander_14"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_13"],format [localize "STR_antistasi_journal_entry_text_commander_13"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_12"],format [localize "STR_antistasi_journal_entry_text_commander_12"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_11"],format [localize "STR_antistasi_journal_entry_text_commander_11"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_10"],format [localize "STR_antistasi_journal_entry_text_commander_10"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_9"],format [localize "STR_antistasi_journal_entry_text_commander_9"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_8"],format [localize "STR_antistasi_journal_entry_text_commander_8"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_7"],format [localize "STR_antistasi_journal_entry_text_commander_7"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_6"],format [localize "STR_antistasi_journal_entry_text_commander_6"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_5"],format [localize "STR_antistasi_journal_entry_text_commander_5"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_4"],format [localize "STR_antistasi_journal_entry_text_commander_4"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_3"],format [localize "STR_antistasi_journal_entry_text_commander_3"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_2"],format [localize "STR_antistasi_journal_entry_text_commander_2"]]];
player createDiaryRecord ["Commander",[format [localize "STR_antistasi_journal_entry_header_commander_1"],format [localize "STR_antistasi_journal_entry_text_commander_1"]]];


_index =player createDiarySubject ["SpecialK","Special Keys"];
player createDiaryRecord ["SpecialK",[format [localize "STR_antistasi_journal_entry_header_SpecialK_5"],format [localize "STR_antistasi_journal_entry_text_SpecialK_5"]]];
player createDiaryRecord ["SpecialK",[format [localize "STR_antistasi_journal_entry_header_SpecialK_4"],format [localize "STR_antistasi_journal_entry_text_SpecialK_4"]]];
player createDiaryRecord ["SpecialK",[format [localize "STR_antistasi_journal_entry_header_SpecialK_3"],format [localize "STR_antistasi_journal_entry_text_SpecialK_3"]]];
player createDiaryRecord ["SpecialK",[format [localize "STR_antistasi_journal_entry_header_SpecialK_2"],format [localize "STR_antistasi_journal_entry_text_SpecialK_2"]]];
player createDiaryRecord ["SpecialK",[format [localize "STR_antistasi_journal_entry_header_SpecialK_1"],format [localize "STR_antistasi_journal_entry_text_SpecialK_1"]]];


_index =player createDiarySubject ["Features","Features Detail"];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_17"],format [localize "STR_antistasi_journal_entry_text_Features_17", FactionGet(reb,"breachingExplosivesAPC") call A3A_fnc_createBreachChargeText, "<br></br><br></br>", FactionGet(reb,"breachingExplosivesTank") call A3A_fnc_createBreachChargeText]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_16"],format [localize "STR_antistasi_journal_entry_text_Features_16"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_12"],format [localize "STR_antistasi_journal_entry_text_Features_12"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_11"],format [localize "STR_antistasi_journal_entry_text_Features_11"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_10"],format [localize "STR_antistasi_journal_entry_text_Features_10"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_9"],format [localize "STR_antistasi_journal_entry_text_Features_9"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_8"],format [localize "STR_antistasi_journal_entry_text_Features_8"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_7"],format [localize "STR_antistasi_journal_entry_text_Features_7"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_6"],format [localize "STR_antistasi_journal_entry_text_Features_6",worldName]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_5"],format [localize "STR_antistasi_journal_entry_text_Features_5"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_4"],format [localize "STR_antistasi_journal_entry_text_Features_4"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_3"],format [localize "STR_antistasi_journal_entry_text_Features_3"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_2"],format [localize "STR_antistasi_journal_entry_text_Features_2"]]];
player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_1"],format [localize "STR_antistasi_journal_entry_text_Features_1"]]];


_index =player createDiarySubject ["AI","AI Management"];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_7"],format [localize "STR_antistasi_journal_entry_text_AI_7"]]];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_6"],format [localize "STR_antistasi_journal_entry_text_AI_6"]]];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_5"],format [localize "STR_antistasi_journal_entry_text_AI_5"]]];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_4"],format [localize "STR_antistasi_journal_entry_text_AI_4"]]];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_3"],format [localize "STR_antistasi_journal_entry_text_AI_3"]]];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_2"],format [localize "STR_antistasi_journal_entry_text_AI_2"]]];
player createDiaryRecord ["AI",[format [localize "STR_antistasi_journal_entry_header_AI_1"],format [localize "STR_antistasi_journal_entry_text_AI_1"]]];


_index =player createDiarySubject ["Options","Game Options"];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_8"],format [localize "STR_antistasi_journal_entry_text_Options_8"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_7"],format [localize "STR_antistasi_journal_entry_text_Options_7"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_6"],format [localize "STR_antistasi_journal_entry_text_Options_6"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_5"],format [localize "STR_antistasi_journal_entry_text_Options_5"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_4"],format [localize "STR_antistasi_journal_entry_text_Options_4"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_3"],format [localize "STR_antistasi_journal_entry_text_Options_3"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_2"],format [localize "STR_antistasi_journal_entry_text_Options_2"]]];
player createDiaryRecord ["Options",[format [localize "STR_antistasi_journal_entry_header_Options_1"],format [localize "STR_antistasi_journal_entry_text_Options_1"]]];

//Default Diary entries (Found in "Briefing" box)
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_6"],format [localize "STR_antistasi_journal_entry_text_Diary_6"]]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_5"],format [localize "STR_antistasi_journal_entry_text_Diary_5"]]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_4"],format [localize "STR_antistasi_journal_entry_text_Diary_4"]]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_3"],format [localize "STR_antistasi_journal_entry_text_Diary_3"]]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_2"],format [localize "STR_antistasi_journal_entry_text_Diary_2"]]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Diary_1",_nameOcc,_nameInv],format [localize "STR_antistasi_journal_entry_text_Diary_1",_nameOcc,_nameInv,_nameReb,worldName]]];

//Multiplayer Specific Options, these will only show when the game is loaded via Multiplayer.
	if (!isNil "serverID") then {
	//MP Features
		player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_15"],format [localize "STR_antistasi_journal_entry_text_Features_15"]]];
		player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_14"],format [localize "STR_antistasi_journal_entry_text_Features_14"]]];
		player createDiaryRecord ["Features",[format [localize "STR_antistasi_journal_entry_header_Features_13"],format [localize "STR_antistasi_journal_entry_text_Features_13"]]];

	};

};
//Mission Specific stuff, fuck this code. This specifies the Rules of Engagement option in the menus.
switch (gameMode) do {
	case 1: {
				player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_gamemode"],format [localize "STR_antistasi_journal_entry_text_gamemode_4",_nameOcc,_nameInv,_nameReb]]]
			};
	case 2: {
				player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_gamemode"],format [localize "STR_antistasi_journal_entry_text_gamemode_3",_nameOcc,_nameInv,_nameReb]]]
			};
	case 3: {
				player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_gamemode"],format [localize "STR_antistasi_journal_entry_text_gamemode_2",_nameOcc,_nameReb]]]
			};
	case 4: {
				player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_gamemode"],format [localize "STR_antistasi_journal_entry_text_gamemode_1",_nameInv,_nameReb]]]
			};
	Default {player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_gamemode"],format [localize "STR_antistasi_journal_entry_text_gamemode_4",_nameOcc,_nameInv,_nameReb]]]};
	};


// Default Welcome stuff.
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Default_3"],format [localize "STR_antistasi_journal_entry_text_Default_3",_nameInv]]];
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Default_2"],format [localize "STR_antistasi_journal_entry_text_Default_2"]]];

_nameXMiss = if (A3A_hasIFA) then {"Armia Krajowa"} else {if (worldName == "Tanoa") then {"Warlords of the Pacific"} else {"Antistasi"}};
player createDiaryRecord ["Diary",[format [localize "STR_antistasi_journal_entry_header_Default_1"],format [localize "STR_antistasi_journal_entry_text_Default_1",_nameXMiss]]];

// Always include the Credits. It's important!
_index =player createDiarySubject ["Credits","Credits"];
player createDiaryRecord ["Credits",[format [localize "STR_antistasi_journal_entry_header_Credits_3"],format [localize "STR_antistasi_journal_entry_text_Credits_3"]]];
player createDiaryRecord ["Credits",[format [localize "STR_antistasi_journal_entry_header_Credits_2"],format [localize "STR_antistasi_journal_entry_text_Credits_2"]]];
player createDiaryRecord ["Credits",[format [localize "STR_antistasi_journal_entry_header_Credits_1"],format [localize "STR_antistasi_journal_entry_text_Credits_1"]]];
