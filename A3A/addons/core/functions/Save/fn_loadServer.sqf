#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("loadServer Starting.");
if (isServer) then {
    Info("Starting Persistent Load.");
	petros allowdamage false;

	// Set all main markers to occupant control by default, overridden by mrkSDK & mrkCSAT
	{ 
		if (sidesX getVariable _x != Occupants) then { sidesX setVariable [_x, Occupants, true] };
	} forEach (airportsX + resourcesX + factories + outposts + seaports);

	A3A_saveVersion = 0;
	["version"] call A3A_fnc_getStatVariable;
	["outpostsFIA"] call A3A_fnc_getStatVariable;
	["mrkSDK"] call A3A_fnc_getStatVariable;
	["mrkCSAT"] call A3A_fnc_getStatVariable;
	["destroyedSites"] call A3A_fnc_getStatVariable;
	["minesX"] call A3A_fnc_getStatVariable;
	["antennas"] call A3A_fnc_getStatVariable;
	["hr"] call A3A_fnc_getStatVariable;
	["dateX"] call A3A_fnc_getStatVariable;
	["weather"] call A3A_fnc_getStatVariable;
	["prestigeOPFOR"] call A3A_fnc_getStatVariable;
	["prestigeBLUFOR"] call A3A_fnc_getStatVariable;
	["resourcesFIA"] call A3A_fnc_getStatVariable;
//	["garrison"] call A3A_fnc_getStatVariable;			// loaded later if it's an old save
	["skillFIA"] call A3A_fnc_getStatVariable;
	["membersX"] call A3A_fnc_getStatVariable;
	["vehInGarage"] call A3A_fnc_getStatVariable;
    ["HR_Garage"] call A3A_fnc_getStatVariable;
    ["A3A_fuelAmountleftArray"] call A3A_fnc_getStatVariable;
	["destroyedBuildings"] call A3A_fnc_getStatVariable;
	["enemyResources"] call A3A_fnc_getStatVariable;
	["HQKnowledge"] call A3A_fnc_getStatVariable;
//	["idlebases"] call A3A_fnc_getStatVariable;			// Might bring this back at some point
	["killZones"] call A3A_fnc_getStatVariable;
	["bombRuns"] call A3A_fnc_getStatVariable;
	["arsenalLimits"] call A3A_fnc_getStatVariable;
	["rebelLoadouts"] call A3A_fnc_getStatVariable;
	["jna_dataList"] call A3A_fnc_getStatVariable;
	["minorSites"] call A3A_fnc_getStatVariable;
	//===========================================================================

	//RESTORE THE STATE OF THE 'UNLOCKED' VARIABLES USING JNA_DATALIST
	private _categoriesToPublish = createHashMap;
	{
		private _arsenalTabDataArray = _x;
		private _unlockedItemsInTab = _arsenalTabDataArray select { _x select 1 == -1 } apply { _x select 0 };
		{
			private _categories = [_x, true, true] call A3A_fnc_unlockEquipment;
			_categoriesToPublish insert [true, _categories, []];
		} forEach _unlockedItemsInTab;
	} forEach jna_dataList;

	Info_1("Categories to publish: %1", keys _categoriesToPublish);

	// Publish the unlocked categories (once each)
	{ publicVariable ("unlocked" + _x) } forEach keys _categoriesToPublish;

	if !(unlockedNVGs isEqualTo []) then {
		haveNV = true; publicVariable "haveNV"
	};

	//Check if we have radios unlocked and update haveRadio.
	call A3A_fnc_checkRadiosUnlocked;

	{
		if (_x in destroyedSites) then {
			sidesX setVariable [_x, Invaders, true];
			[_x] call A3A_fnc_destroyCity
		};
	} forEach citiesX;

	// update war tier silently, calls updatePreference if changed
	// Needed for garrison sanity checks
	[true] call A3A_fnc_tierCheck;

	// ****************************************************************************************************
	// Garrison backwards compatibility
	A3A_garrison = +(["newGarrison"] call A3A_fnc_returnSavedStat);

	// Copy old garrison data into new garrisons
	private _garrisonCompat = isNil "A3A_garrison";
	if (_garrisonCompat) then { call A3A_fnc_convertSavedGarrisons };		// Creates & fills A3A_garrison

	// Fill out any garrison that hasn't already been filled
	// This might happen with map changes so we do it here rather than convertSavedGarrisons
	private _emptyGarrison = createHashMapFromArray [ ["troops", []], ["vehicles", []], ["buildings", []] ];
	{
		if (_x in A3A_garrison) then { continue };
		private _side = sidesX getVariable _x;
		if (_side == teamPlayer) then { A3A_garrison set [_x, +_emptyGarrison]; continue };		// should be impossible?
		[_x] call A3A_fnc_buildEnemyGarrison;		// cities, or markers added to map
	} forEach markersX;

	// outpostsFIA should be fully handled by convertSavedGarrisons

	// This needs doing with 3.9.0 saves
	{
		if (_x in A3A_garrison) then { continue };
		private _type = (A3A_minorSitesHM get _x) # 1;
		private _side = sidesX getVariable _x;
		[_x, _side] call ([A3A_fnc_buildRoadblock, A3A_fnc_buildCamp] select (_type == "camp"));
	} forEach controlsX;

	// Add police stations if missing
	call A3A_fnc_initPoliceStations;

	// Fill out city civ component if missing (should be done after police stations because they share vehicle places)
	{ [_x] call A3A_fnc_buildCity } forEach citiesX;

	// Add type info to markers
	call A3A_fnc_initMarkerTypes;

	// Move saved statics & buildings into the correct garrisons
	if (_garrisonCompat) then { call A3A_fnc_convertSavedStatics };

	// **********************************************************************************************

	// Validate garrison vehicles (in case of faction or logic change)
	// TODO: Need to do this for city civ component too
	Debug("Starting garrison vehicle validation");
	{
		[_x, true, false] call A3A_fnc_garrisonServer_cleanup;
	} forEach markersX;
	Debug("Completed garrison vehicle validation");

	// Backwards compat, delete mines that are within camp zones
	private _campPositions = values A3A_minorSitesHM select { _x#1 == "camp" } apply { _x#0 };
	{
		if (_campPositions inAreaArray [getPosATL _x, 300, 300] isEqualTo []) then { continue };
		deleteVehicle _x;
	} forEach allMines;

	// Should have garrison data for this now
	{
		[_x] call A3A_fnc_mrkUpdate
	} forEach markersX;


	// Spawn in HQ buildings before we potentially place HQ objects on them
	private _spawnedBuildings = [];
	{
		_x params ["_typeVeh", "_posVeh", "_vecDir", "_vecUp"];
		isNil {
			private _veh = createVehicle [_typeVeh, _posVeh, [], 0, "CAN_COLLIDE"];
			_veh setPosWorld _posVeh;
			_veh setVectorDirAndUp [_vecDir, _vecUp];
			_spawnedBuildings pushBack _veh;
		};
	} forEach (A3A_garrison get "Synd_HQ" get "buildings");
	A3A_garrison get "Synd_HQ" set ["spawnedBuildings", _spawnedBuildings];


    //Load aggro stacks and level and calculate current level
    ["aggressionOccupants"] call A3A_fnc_getStatVariable;
	["aggressionInvaders"] call A3A_fnc_getStatVariable;
    [true] call A3A_fnc_calculateAggression;

	["chopForest"] call A3A_fnc_getStatVariable;

	["posHQ"] call A3A_fnc_getStatVariable;				// second call, this one after buildings compat
	["nextTick"] call A3A_fnc_getStatVariable;

	{_x setPosATL getMarkerPos respawnTeamPlayer} forEach ((call A3A_fnc_playableUnits) select {side _x == teamPlayer});

	// Move headless client logic objects near HQ so that firedNear EH etc. work more reliably
	private _hcpos = markerPos respawnTeamPlayer vectorAdd [-100, -100, 0];
	{ _x setPosATL _hcpos } forEach (entities "HeadlessClient_F");


    //Load state of testing timer
    ["testingTimerIsActive"] call A3A_fnc_getStatVariable;

	// Load all player data into A3A_playerSaveData hashmap. Works around issues with game copies
	_savedPlayers = "savedPlayers" call A3A_fnc_returnSavedStat;
	if (isNil "_savedPlayers") then { _savedPlayers = [] };
	{
		private _uid = _x;
		private _playerData = createHashMap;
		{
			_playerData set [_x, [_uid, _x] call A3A_fnc_retrievePlayerStat];
		} forEach ["moneyX", "loadoutPlayer", "scorePlayer", "rankPlayer", "personalGarage","missionsCompleted"];

		if (isNil {_playerData get "moneyX"}) then { Error_1("Saved player %1 has no money var", _uid); continue };
		A3A_playerSaveData set [_uid, _playerData];
	} forEach _savedPlayers;

    Info("Persistent Load Completed.");

	// uh, why here?
	["tasks"] call A3A_fnc_getStatVariable;

	statsLoaded = 0; publicVariable "statsLoaded";
	petros allowdamage true;
};
Info("loadServer Completed.");
