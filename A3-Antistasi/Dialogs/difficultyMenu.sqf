_nul=createDialog "diff_menu";
waitUntil {dialog};
hint "Choose a difficulty level";
waitUntil {!dialog};
if !(skillMult == 1) then
	{
	if (skillMult == 0.5) then
		{
		server setVariable ["hr",25,true];
		server setVariable ["resourcesFIA",5000,true];
		vehInGarage = [vehSDKTruck,vehSDKTruck,SDKMortar,SDKMGStatic,staticAAteamPlayer];
		minWeaps = 15;
		_index = sniperRifle call jn_fnc_arsenal_itemType;
		[_index,sniperRifle,-1] call jn_fnc_arsenal_addItem;
		unlockedSN pushBack sniperRifle;
		_magazine = (getArray (configFile / "CfgWeapons" / sniperRifle / "magazines") select 0);
		if (!isNil "_magazine") then
			{
			unlockedMagazines pushBack _magazine;
			_index = _magazine call jn_fnc_arsenal_itemType;
			[_index,_magazine,-1] call jn_fnc_arsenal_addItem;
			};
		unlockedWeapons pushBack sniperRifle;
		if !(hasTFAR) then
			{
			_index = "ItemRadio" call jn_fnc_arsenal_itemType;
			[_index,"ItemRadio",-1] call jn_fnc_arsenal_addItem;
			unlockedItems pushBack "ItemRadio";
			haveRadio = true;
			};
		}
	else
		{
		server setVariable ["hr",0,true];
		server setVariable ["resourcesFIA",200,true];
		minWeaps = 40;
		};
	[] call A3A_fnc_statistics;
	};
_nul= createDialog "gameMode_menu";
waitUntil {dialog};
hint "Choose a Game Mode";
waitUntil {!dialog};
if (gameMode != 1) then
	{
	Occupants setFriend [Invaders,1];
    Invaders setFriend [Occupants,1];
    if (gameMode == 3) then {"CSAT_carrier" setMarkerAlpha 0};
    if (gameMode == 4) then {"NATO_carrier" setMarkerAlpha 0};
	};
hint "Map Init in progress";
call compile preprocessFileLineNumbers "initGarrisons.sqf";
hint "Map Init Done";
_nul = [] spawn A3A_fnc_placementselection;