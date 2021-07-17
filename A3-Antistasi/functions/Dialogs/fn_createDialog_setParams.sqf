_nul=createDialog "set_params";

waitUntil {dialog};
private _autoSaveInterval = "autoSaveInterval" call BIS_fnc_getParamValue;
[
	localize"str_cfg_markers_warning",
	[localize"STR_antistasi_customHint_save_info",
	localize "STR_antistasi_customHint_save_info2",
	localize "STR_antistasi_customHint_autosave_info"+" <t color='#f0d498'>",(_autoSaveInterval/60) toFixed 0," "+localize"str_a3_rscattributeskiptime_minutes"+"</t>."] joinString ""
] call A3A_fnc_customHint;
waitUntil {!dialog};

if (!isNil "loadLastSave" && {!loadLastSave}) then {
	_nul=createDialog "diff_menu";
	waitUntil {dialog};
	[localize "STR_antistasi_customHint_load_head", localize "STR_antistasi_customHint_difficulty"] call A3A_fnc_customHint;
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
			vehInGarage = [vehSDKTruck,vehSDKTruck,SDKMortar,SDKMGStatic,staticAAteamPlayer];
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
