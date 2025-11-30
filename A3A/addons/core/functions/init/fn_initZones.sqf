//usage: place on the map markers covering the areas where you want the AAF operate, and put names depending on if they are powerplants,resources, bases etc.. The marker must cover the whole operative area, it's buildings etc.. (for example in an airport, you must cover more than just the runway, you have to cover the service buildings etc..)
//markers cannot have more than 500 mts size on any side or you may find "insta spawn in your nose" effects.
//do not do it on cities and hills, as the mission will do it automatically
//the naming convention must be as the following arrays, for example: first power plant is "power", second is "power_1" thir is "power_2" after you finish with whatever number.
//to test automatic zone creation, init the mission with debug = true in init.sqf
//of course all the editor placed objects (petros, flag, respawn marker etc..) have to be ported to the new island
//deletion of a marker in the array will require deletion of the corresponding marker in the editor
//only touch the commented arrays
scriptName "initZones.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initZones started");

forcedSpawn = [];
citiesX = [];
private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};

[] call A3A_fnc_prepareMarkerArrays;

// TODO: Read additional camps from config here?

(A3A_mapCamps + A3A_mapRoadblocks + seaMarkers + seaSpawn + seaAttackSpawn + spawnPoints + detectionAreas) apply {_x setMarkerAlpha 0};
markersX = airportsX + resourcesX + factories + outposts + seaports + ["Synd_HQ"];
markersX apply {
	_x setMarkerAlpha 0;
	spawner setVariable [_x, 2, true];
};

outpostsFIA = [];
destroyedSites = [];
controlsX = [];

sidesX setVariable ["Synd_HQ", teamPlayer, true];
sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];

// Set up dummy markers
call A3A_fnc_initBases;


Info("Setting up towns");

//Disables Towns/Villages, Names can be found in configFile >> "CfgWorlds" >> "WORLDNAME" >> "Names"
private ["_nameX", "_roads", "_numCiv", "_roadsProv", "_roadcon", "_dmrk", "_info"];

private _townPop = createHashMapFromArray getArray (_mapInfo/"population");
private _disabledTowns = getArray (_mapInfo/"disabledTowns");
private _hardCodedPop = _townPop isNotEqualTo createHashMap;

private _popMult = getNumber (_mapInfo/"populationMult");
if (_popMult == 0) then { _popMult = 1 };

// Stop putting random crap in server namespace
A3A_cityData = [true] call A3A_fnc_createNamespace;		// city -> [pop, support, accumHR]? Might have variable pop at some point
A3A_cityPop = createHashMap;							// city -> base pop, won't change


"(toLower getText (_x >> ""type"") in [""namecitycapital"",""namecity"",""namevillage"",""citycenter""]) &&
!(getText (_x >> ""Name"") isEqualTo """") &&
!((configName _x) in _disabledTowns)"
configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

	_nameX = getText (_x >> "Name");
	_sizeX = getNumber (_x >> "radiusA");
	_sizeY = getNumber (_x >> "radiusB");
	_size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
	_pos = getArray (_x >> "position");
	_size = [_size, 400] select (_size < 400);
	_numCiv = 0;

	if (_hardCodedPop) then
	{
		_numCiv = _townPop getOrDefault [_nameX, _townPop get (configName _x)]; //backwards compat to config name based pop defines
		if (isNil "_numCiv" || {!(_numCiv isEqualType 0)}) then
		{
            Error_1("Bad population count data for %1", _nameX);
			_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
		};
	}
	else {
		_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
	};

	// This can be used without hardcoded population
	_numCiv = ceil (_numCiv * _popMult);

	_roads = nearestTerrainObjects [_pos, ["MAIN ROAD", "ROAD", "TRACK"], _size, true, true];
	if (count _roads > 0) then {
		// Move marker position to the nearest road, if any
		_pos = _roads select 0;
	};
	_numVeh = (count _roads) min (_numCiv / 3);

	_mrk = createmarkerLocal [format ["%1", _nameX], _pos];
	_mrk setMarkerSizeLocal [_size, _size];
	_mrk setMarkerShapeLocal "RECTANGLE";
	_mrk setMarkerBrushLocal "SOLID";
	_mrk setMarkerColorLocal colorOccupants;
	_mrk setMarkerTextLocal _nameX;
	_mrk setMarkerAlpha 0;
	citiesX pushBack _nameX;
	spawner setVariable [_nameX, 2, true];
	spawner setVariable [_nameX + "_civ", 2, true];		// civ part of spawning

	_dmrk = createMarkerLocal [format ["Dum%1", _nameX], _pos];
	_dmrk setMarkerShapeLocal "ICON";
	_dmrk setMarkerTypeLocal "loc_Ruin";
	_dmrk setMarkerColor colorOccupants;

	sidesX setVariable [_mrk, Occupants, true];

	// ok, how much bulk HR? based on pop or sqrt pop? latter is safer...
	private _info = [_numCiv, 0, sqrt _numCiv];				// initial full pop, 0% rebel support, 10 HR for 100 pop (multiplied by map factor on award)
	A3A_cityData setVariable [_nameX, _info, true];
	A3A_cityPop set [_nameX, _numCiv];

};	//find in congigs faster then find location in 25000 radius

markersX = markersX + citiesX;


// Sort markers by ascending size. Useful for some operations.
private _markerSort = markersX apply { [vectorMagnitude markerSize _x, _x] };
_markerSort sort true;
markersX = _markerSort apply { _x#1 };

// Expected troop counts
A3A_garrisonSize = createHashMap;
{
    private _garrSize = [_x, true] call A3A_fnc_garrisonSize;        // TODO: replace all uses of this function and then sort it out?
    A3A_garrisonSize set [_x, _garrSize];
} forEach (markersX - ["Synd_HQ"]);

// Initialize static places, need the sorting for this
[markersX - citiesX - ["Synd_HQ"]] call A3A_fnc_initStaticPlaces;

// And now set up the max/par/index values per type (needs troop counts)
[markersX - ["Synd_HQ"]] call A3A_fnc_initSpawnPlaceStats;


Info("Setting up banks");

banks = [];

private _posBank = getArray (_mapInfo/"banks");
if (_posBank isEqualTo []) then {banks = nearestObjects [[worldSize/2, worldSize/2], ["Land_Offices_01_V1_F"], worldSize]};

{
	private _bank = nearestObject [_x, "house"];
	if (isNull _bank) then {
		Error_1("Building not found at %1", _x);
		continue;
	};
	banks pushBack _bank;
} forEach _posBank;


Info("Setting up antennas");

A3A_mrkAntennas = [];
A3A_antennas = [];
private _antennatypes = ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F",
"Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1", "Land_vn_tower_signal_01","land_gm_radio_antenna_01"];

private _posAntennas = getArray (_mapInfo/"antennas");
private _blacklistIndex = getArray (_mapInfo/"antennasBlacklistIndex");

// Land_A_TVTower_base can't be destroyed, Land_Communication_F and Land_Vysilac_FM are not replaced with "Ruins" when destroyed.
// This causes issues with persistent load and rebuild scripts, so we replace those with antennas that work properly.
private _replaceBadAntenna = {
	params ["_antenna"];
	if ((typeof _antenna) in ["Land_Communication_F", "Land_Vysilac_FM", "Land_A_TVTower_Base"]) then {
		hideObjectGlobal _antenna;
		if (typeof _antenna == "Land_A_TVTower_Base") then {
			// The TV tower is composed of 3 sections - need to hide them all
			private _otherSections = nearestObjects [_antenna, ["Land_A_TVTower_Mid", "Land_A_TVTower_Top"], 200];
			{ hideObjectGlobal _x; } forEach _otherSections;
		};
		private _antennaPos = getPosATL _antenna;
		_antennaPos set [2, 0];
		private _antennaClass = if (worldName == "chernarus_summer") then { "Land_Telek1" } else { "Land_TTowerBig_2_F" };
		_antenna = createVehicle [_antennaClass, _antennaPos, [], 0, "NONE"];
	};
	_antenna;
};

{
	private _antenna = nearestObjects [_x, _antennaTypes, 35, true] select 0;
	if (isNil "_antenna") then {
		Error_1("No antennas found at %1", _x);
		continue;
	};
	if (_forEachIndex in _blacklistIndex) then {
		_antenna setDamage [1, false];
	} else {
		A3A_antennas pushBack (_antenna call _replaceBadAntenna);
	};
} forEach _posAntennas;

if (_posAntennas isEqualTo []) then {
    private _antennas = nearestObjects [[worldSize /2, worldSize/2], _antennatypes, worldSize];
    A3A_antennas = _antennas apply { _x call _replaceBadAntenna };
};

{
	_mrkFinal = createMarkerLocal [format ["Ant%1", mapGridPosition _x], getPosATL _x];
	_mrkFinal setMarkerShapeLocal "ICON";
	_mrkFinal setMarkerTypeLocal "loc_Transmitter";
	_mrkFinal setMarkerColorLocal "ColorBlack";
	_mrkFinal setMarkerText "Radio Tower";
	A3A_mrkAntennas pushBack _mrkFinal;
} forEach A3A_antennas;


// Create marker -> antenna and antenna netID -> marker mappings
A3A_antennaMap = createHashMap;
private _siteMarkers = airportsX + resourcesX + factories + outposts + seaports;		// cities should not be associated with antennas
{
	private _nearMarker = [_siteMarkers, _x] call BIS_fnc_nearestPosition;
	A3A_antennaMap set [_nearMarker, _x];				// gives us a fast way to lookup whether an outpost owns a radio tower
	A3A_antennaMap set [netId _x, _nearMarker];			// To find what side owns a radio tower
} forEach A3A_antennas;

{
	private _nearAnt = [A3A_antennas, markerPos _x] call BIS_fnc_nearestPosition;
	A3A_antennaMap set [_x, _nearAnt];					// To determine which antenna influences a city
} forEach citiesX;


// Make list of markers that don't have a proper road nearby
// TODO: Nearly obsolete. Switch convoy code to road distance checks & markerNavPoint

blackListDest = (markersX - ["Synd_HQ"] - citiesX) select {
	private _nearRoads = (getMarkerPos _x) nearRoads (([_x] call A3A_fnc_sizeMarker) * 1.5);
//	_nearRoads = _nearRoads inAreaArray _x;
	private _badSurfaces = ["#GdtForest", "#GdtRock", "#GdtGrassTall"];
	private _idx = _nearRoads findIf { !(surfaceType (position _x) in _badSurfaces) && { count roadsConnectedTo _x != 0 } };
	if (_idx == -1) then {true} else {false};
};


Info("Setting up fuel stations");

// fuel rework
private _fuelStationTypes = getArray (_mapInfo/"fuelStationTypes");
if( _fuelStationTypes isEqualTo [] ) then {_fuelStationTypes = ["Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell","Land_vn_b_prop_fueldrum_01","Land_vn_usaf_fueltank_75_01","Land_vn_fuelstation_feed_f","Land_vn_fuelstation_01_pump_f","Land_vn_fuelstation_02_pump_f"]};
A3A_fuelStationTypes = _fuelStationTypes;
A3A_fuelStations = nearestObjects [[worldSize/2, worldSize/2], _fuelStationTypes, worldSize];
A3A_fuelStations apply {
	_mrkFinalFuel = createMarkerLocal [format ["Fuel%1", mapGridPosition _x], position _x];
	_mrkFinalFuel setMarkerShapeLocal "ICON";
	_mrkFinalFuel setMarkerTypeLocal "loc_Fuelstation";
	_mrkFinalFuel setMarkerColorLocal "ColorWhite";
	_mrkFinalFuel setMarkerTextLocal "Fuel station";
	_mrkFinalFuel setMarkerAlpha 0.75;
	if(A3A_hasACE) then {
		[_x, 250] call ace_refuel_fnc_setFuel; // only call on fuels that are not blacklisted and first zone init.
	};
};

// Generate rebel resource multipliers based on the map
private _reqGarrison = 0;
_reqGarrison = _reqGarrison + 30 * count airportsX;
_reqGarrison = _reqGarrison + 20 * (count outposts + count seaports);
_reqGarrison = _reqGarrison + 10 * (count factories + count resourcesX);

private _sumPop = 0;
{ _sumPop = _sumPop + sqrt (A3A_cityPop get _x) } forEach citiesX;

// Goal for incremental income is 5HR at half-map support per 10min tick
A3A_rebelHRTickMult = 10 / _sumPop;

// Goal for lump sum is to fill garrisons
A3A_rebelHRLumpMult = _reqGarrison / _sumPop;

// Set typical number of city battles equal to number of outposts
private _allPops = citiesX apply { sqrt (A3A_cityPop get _x) };
_allPops sort false;		// largest first
A3A_minCityBattlePop = if (count outposts < count citiesX) then { _allPops select count outposts } else { _allPops select -1 };
A3A_minCityBattlePop = A3A_minCityBattlePop max 9;			// Set a floor for now, fixes a couple of weird maps

publicVariable "blackListDest";
publicVariable "markersX";
publicVariable "citiesX";
publicVariable "airportsX";
publicVariable "resourcesX";
publicVariable "factories";
publicVariable "outposts";
publicVariable "seaports";
publicVariable "destroyedSites";
publicVariable "forcedSpawn";
publicVariable "outpostsFIA";
publicVariable "seaMarkers";
publicVariable "spawnPoints";
publicVariable "banks";
publicVariable "seaSpawn";
publicVariable "seaAttackSpawn";
publicVariable "detectionAreas";
publicVariable "A3A_antennas";
publicvariable "A3A_fuelStations";
publicvariable "A3A_fuelStationTypes";
publicVariable "A3A_antennaMap";
publicVariable "A3A_cityPop";
publicVariable "A3A_cityData";

initZonesDone = true;				// signal headless clients that they can start nav init
publicVariable "initZonesDone";

Info("initZones completed");
