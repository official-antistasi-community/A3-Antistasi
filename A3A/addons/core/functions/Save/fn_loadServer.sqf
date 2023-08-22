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
	["garrison"] call A3A_fnc_getStatVariable;
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
	["controlsSDK"] call A3A_fnc_getStatVariable;
	["bombRuns"] call A3A_fnc_getStatVariable;
	["jna_dataList"] call A3A_fnc_getStatVariable;
	//===========================================================================

	//RESTORE THE STATE OF THE 'UNLOCKED' VARIABLES USING JNA_DATALIST
	{
		private _arsenalTabDataArray = _x;
		private _unlockedItemsInTab = _arsenalTabDataArray select { _x select 1 == -1 } apply { _x select 0 };
		{
			[_x, true] call A3A_fnc_unlockEquipment;
		} forEach _unlockedItemsInTab;
	} forEach jna_dataList;

	if !(unlockedNVGs isEqualTo []) then {
		haveNV = true; publicVariable "haveNV"
	};

	//Check if we have radios unlocked and update haveRadio.
	call A3A_fnc_checkRadiosUnlocked;

	//Sort optics list so that snipers pick the right sight
	// obsolete since rebelGear
	//unlockedOptics = [unlockedOptics,[],{getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")},"DESCEND"] call BIS_fnc_sortBy;

	// Set enemy roadblock allegiance to match nearest main marker
	private _mainMarkers = markersX - controlsX - outpostsFIA;
	{
		if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
			private _nearX = [_mainMarkers, markerPos _x] call BIS_fnc_nearestPosition;
			private _sideX = sidesX getVariable [_nearX,sideUnknown];
			sidesX setVariable [_x,_sideX,true];
		};
	} forEach controlsX;

	{
		[_x] call A3A_fnc_mrkUpdate
	} forEach (markersX - controlsX);

	if (count outpostsFIA > 0) then {
		markersX = markersX + outpostsFIA; publicVariable "markersX"
	};

	{
		if (_x in destroyedSites) then {
			sidesX setVariable [_x, Invaders, true];
			[_x] call A3A_fnc_destroyCity
		};
	} forEach citiesX;


	// Backwards compatibility, copy garrison troops and statics into rebel garrisons
	A3A_garrison = ["newGarrison"] call A3A_fnc_returnSavedStat;
	if (isNil "A3A_garrison") then
	{
		// troops
		A3A_garrison = createHashMap;
		private _rebelMarkers = markersX select { sidesX getVariable _x == teamPlayer };
		{
			private _troops = garrison getVariable [_x, []];
			private _garrison = createHashMapFromArray [ ["troops", _troops], ["statics", []], ["vehicles", []], ["buildings", []] ];
			A3A_garrison set [_x, _garrison];
		} forEach _rebelMarkers;

		// Too much of a pain to support, don't bother
		if (A3A_saveVersion < 20401) exitWith {};

		// statics & buildings
        {
            _x params ["_typeVeh", "_posVeh", "_vecUp", "_vecDir", "_state"];

            // ignore vehicles & utility items, spawned by loadStat
			if (_typeVeh in A3A_utilityItemHM) then { continue };
			private _isStatic = _typeVeh isKindOf "StaticWeapon";
            if !(_isStatic or _typeVeh isKindOf "Building") then { continue };
            // Could check for the driver flag instead maybe?

			_marker = [_posVeh] call A3A_fnc_getMarkerForPos;
			if (_marker == "") then { continue };
			if !(_marker in A3A_garrison) then { continue };			// non-rebel marker? maybe possible
			private _array = A3A_garrison get _marker get (["buildings", "statics"] select _isStatic);
			_array pushBack [_typeVeh, [_posVeh, _vecUp, _vecDir]];

        } forEach (["staticsX"] call A3A_fnc_returnSavedStat);

		// Could fix roadblock vehicle & garrison mortars here, probably not worth it though
	};

	// Spawn in all garrison buildings
	{
		{
			_x params ["_typeVeh", "_posData"];
			_posData params ["_posVeh", "_vecUp", "_vecDir"];
			isNil {
				private _veh = createVehicle [_typeVeh, _posVeh, [], 0, "CAN_COLLIDE"];
				_veh setPosWorld _posVeh;
				_veh setVectorDirAndUp [_vecDir, _vecUp];
			};
		} forEach (_y get "buildings");
	} forEach A3A_garrison;


    //Load aggro stacks and level and calculate current level
    ["aggressionOccupants"] call A3A_fnc_getStatVariable;
	["aggressionInvaders"] call A3A_fnc_getStatVariable;
    [true] call A3A_fnc_calculateAggression;

	["chopForest"] call A3A_fnc_getStatVariable;

	["posHQ"] call A3A_fnc_getStatVariable;
	["nextTick"] call A3A_fnc_getStatVariable;

	// Still used for utility items and vehicles parked near HQ
	["staticsX"] call A3A_fnc_getStatVariable;

	// update war tier silently, calls updatePreference if changed
	[true] call A3A_fnc_tierCheck;


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
		} forEach ["moneyX", "loadoutPlayer", "scorePlayer", "rankPlayer", "personalGarage"];

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
