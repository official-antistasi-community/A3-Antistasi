#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
_nul=createDialog "set_params";

waitUntil {dialog};
private _autoSaveInterval = "autoSaveInterval" call BIS_fnc_getParamValue;
[
	"W A R N I N G ",
	["Antistasi has a custom save system similar to other CTIs.<br/><br/>",
	"To Save: Your commander needs to go to the <t color='#f0d498'>Map Board</t>, scroll-select <t color='#f0d498'>""Game Options""</t> and click on the <t color='#f0d498'>""Persistent Save""</t> button.<br/><br/>",
	"Current parameters are configured to auto-save every <t color='#f0d498'>",(_autoSaveInterval/60) toFixed 0," minutes</t>."] joinString ""
] call A3A_fnc_customHint;
waitUntil {!dialog};

if (!isNil "loadLastSave" && {!loadLastSave}) then {
	_nul=createDialog "diff_menu";
	waitUntil {dialog};
	["Load Save", "Choose a difficulty level"] call A3A_fnc_customHint;
	waitUntil {!dialog};

	// Set default SP params before initParams runs, where different from MP
	if (isNil "skillMult") then {skillMult = 2};
	minWeaps = [15,15,25,40] select skillMult;
	membershipEnabled = false;
	tkPunish = false;

	[] spawn {
		waitUntil {(!isNil "serverInitDone")};			// need following params to be initialized
		if (skillMult == 1) then
			{
			//Easy Difficulty Tweaks
			server setVariable ["hr",25,true];
			server setVariable ["resourcesFIA",5000,true];
			vehInGarage = [FactionGet(reb,"vehicleTruck"),FactionGet(reb,"vehicleTruck"),FactionGet(reb,"staticMortar"),FactionGet(reb,"staticMG"),FactionGet(reb,"staticAA")];
			if !(A3A_hasTFAR || A3A_hasTFARBeta) then
				{
				["ItemRadio"] call A3A_fnc_unlockEquipment;
				haveRadio = true;
				};
			};
		if (skillMult == 3) then
			{
			//Hard Difficulty Tweaks
			server setVariable ["hr",0,true];
			server setVariable ["resourcesFIA",200,true];
			};
		[] call A3A_fnc_statistics;
		};

	_nul= createDialog "gameMode_menu";
	waitUntil {dialog};
	["Load Save", "Choose a Game Mode"] call A3A_fnc_customHint;
	waitUntil {!dialog};
	if (isNil "gamemode") then {gamemode = 1};
};
