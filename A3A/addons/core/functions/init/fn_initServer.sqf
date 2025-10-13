#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Define and publish logLevel first thing, so we can start logging appropriately.
logLevel = "LogLevel" call BIS_fnc_getParamValue; publicVariable "logLevel"; //Sets a log level for feedback, 1=Errors, 2=Information, 3=DEBUG
A3A_logDebugConsole = "A3A_logDebugConsole" call BIS_fnc_getParamValue; publicVariable "A3A_logDebugConsole";

Info("Server init started");
A3A_serverVersion = QUOTE(VERSION); publicVariable "A3A_serverVersion";
Info_1("Server version: %1", QUOTE(VERSION_FULL));

// ********************** Pre-setup init ****************************************************

if (isClass (missionConfigFile/"CfgFunctions"/"A3A")) exitWith {};          // Pre-mod mission will break. Messaging handled in initPreJIP
if (!requiredVersion QUOTE(REQUIRED_VERSION)) exitWith { Error("Arma version is out of date") };
if (call A3A_fnc_modBlacklist) exitWith {};

// hide all the HQ objects
{
    _x enableRopeAttach false;
    _x allowDamage false;
    _x hideObjectGlobal true;
} forEach [boxX, flagX, vehicleBox, fireX, mapX, petros];

switch (toLower worldname) do {
	case "cam_lao_nam": {};
	case "vn_khe_sanh": {mapX setObjectTextureGlobal [0,"Pictures\Mission\whiteboard.paa"];};
	case "spe_normandy": {mapX setObjectTextureGlobal [0,"Pictures\Mission\whiteboard.paa"];};
	case "spe_mortain": {mapX setObjectTextureGlobal [0,"Pictures\Mission\whiteboard.paa"];};
	default {mapX setObjectTextureGlobal [0,"Pictures\Mission\whiteboard.jpg"];};
};

"Synd_HQ" setMarkerShape "ELLIPSE";
"Synd_HQ" setMarkerSize [75,75];

enableSaving [false,false];

//Disable VN music
if (isClass (configFile/"CfgVehicles"/"vn_module_dynamicradiomusic_disable")) then {
    A3A_VN_MusicModule = (createGroup sideLogic) createUnit ["vn_module_dynamicradiomusic_disable", [worldSize, worldSize,0], [],0,"NONE"];
};

// Shouldn't be anything with dependencies in here
call A3A_fnc_initVarCommon;
call A3A_fnc_initZones;					// needed here because new-game setup needs to know where the markers are

// Start up the monitor to handle the setup UI
[] spawn A3A_fnc_setupMonitor;

// ************************ Background init ***********************************************

Info("Background init started");

// U-interface init. May as well do this here, let players set up their groups?
["Initialize"] call BIS_fnc_dynamicGroups;

// No reason not to do this early
[] execVM QPATHTOFOLDER(Scripts\fn_advancedTowingInit.sqf);

// Don't need these for displaying the map, no save dependence
Info("Initializing civ spawn places");
{ isNil { _x call A3A_fnc_initCivSpawnPlaces } } forEach citiesX;
A3A_spawnPlacesDone = true; publicVariable "A3A_spawnPlacesDone";       // let the headless clients know

// Nav stuff, should have no parameter/save dependence at all
call A3A_fnc_loadNavGrid;
call A3A_fnc_addNodesNearMarkers;		    // Needs data from navgrid & initZones
call A3A_fnc_generateRoadblockPairs;        // only needed on server

// JNA preload, does some item type caching, no param dependence
Info("Server JNA preload started");
["Preload"] call jn_fnc_arsenal;

Info("Background init completed");
A3A_backgroundInitDone = true;

Info("Server Initialising PATCOM Variables");
[] call A3A_fnc_patrolInit;

// **************** Starting game, param-dependent init *******************************

// Wait until we have selected/created save data
waitUntil {sleep 0.1; !isNil "A3A_saveData"};
A3A_startupState = "starting"; publicVariable "A3A_startupState";

// Use true params list in case we're loading an autosave from a different version
private _savedParamsHM = createHashMapFromArray (A3A_saveData get "params");
{
    if (getArray (_x/"texts") isEqualTo [""]) then { continue };                // spacer/title
    private _val = _savedParamsHM getOrDefault [configName _x, getNumber (_x/"default")];
    if (getArray (_x/"values") isEqualTo [0,1]) then {
        if (_val isEqualType 0) then { _val = _val != 0 };                      // number -> bool
    } else {
        if (_val isEqualType false) then { _val = [0, 1] select _val };         // bool -> number
    };
    missionNamespace setVariable [configName _x, _val, true];                   // just publish them all, doesn't really hurt
} forEach ("true" configClasses (configFile/"A3A"/"Params"));

// Might have params dependency at some point
if (A3A_hasACEMedical) then { call A3A_fnc_initACEUnconsciousHandler };

// Need to run this before game load or initial unlocks. Params dependency.
boxX call jn_fnc_arsenal_init;

// This does the actual template loading in the middle somewhere
[A3A_saveData] call A3A_fnc_initVarServer;

// Parameter-dependent vars. Could be moved to initVarServer...
if (gameMode != 1) then {
    Occupants setFriend [Invaders,1];
    Invaders setFriend [Occupants,1];
    if (gameMode == 3) then {"CSAT_carrier" setMarkerAlpha 0};
    if (gameMode == 4) then {"NATO_carrier" setMarkerAlpha 0};
};
bookedSlots = floor ((memberSlots/100) * (playableSlotsNumber teamPlayer)); publicVariable "bookedSlots";


// ****************** Load save data or create new *********************************

private _startType = A3A_saveData get "startType";
if (_startType != "new") then
{
    // Setup save info
    A3A_saveTarget = [A3A_saveData get "serverID", A3A_saveData get "gameID", worldName, false];
    private _json = ["json"] call A3A_fnc_returnSavedStat;
    if (!isNil "_json") then { A3A_saveTarget set [3, fromJSON _json] };

    // Sanity checks? hmm

    Info_2("Loading campaign with ID %1, JSON %2", A3A_saveData get "gameID", !isNil "_json");

    // Do the actual game loading
    call A3A_fnc_loadServer;
}
else
{
    // Fill out garrisons, set sides/names as appropriate
    call A3A_fnc_initGarrisons;

    Info("Starting item unlocks");

    // Do initial arsenal filling
    private _categoriesToPublish = createHashMap;
    private _addedClasses = createHashMap;       // dupe proofing
    {
        _x params ["_class", ["_count", -1]];
        if (_class in _addedClasses) then { continue };
        _addedClasses set [_class, nil];

        private _arsenalTab = _class call jn_fnc_arsenal_itemType;
        jna_dataList#_arsenalTab pushBack [_class, _count];         // direct add to avoid O(N^2) issue

        private _categories = _class call A3A_fnc_equipmentClassToCategories;
        { (missionNamespace getVariable ("unlocked" + _x)) pushBack _class } forEach _categories;
        _categoriesToPublish insert [true, _categories, []];

    } foreach FactionGet(reb,"initialRebelEquipment");

    // Publish the unlocked categories (once each)
    { publicVariable ("unlocked" + _x) } forEach keys _categoriesToPublish;

    Info("Initial arsenal unlocks completed");
    call A3A_fnc_checkRadiosUnlocked;

    // HQ placement setup
    private _posHQ = A3A_saveData get "startPos";
    respawnTeamPlayer setMarkerPos _posHQ;
    "Synd_HQ" setMarkerPos _posHQ;
    posHQ = _posHQ; publicVariable "posHQ";     // hmm, remove this at some point
    petros setPos _posHQ;
    [_posHQ] call A3A_fnc_relocateHQObjects;
};

if (_startType != "load") then {
    // Set blank server ID if we don't have one already. They're pretty pointless
    private _serverID = profileNamespace getVariable ["ss_serverID", ""];
    _serverID = [_serverID, false] select (A3A_saveData get "useNewNamespace");

    // Create new campaign ID, avoiding collisions
    private _newID = call A3A_fnc_uniqueID;
    A3A_saveTarget = [_serverID, _newID, worldName, false];

    Info_1("Creating new campaign with ID %1", _newID);
};

// ********************** Post-load init ****************************************************

if (isClass (configFile >> "AntistasiServerMembers")) then
{
    Info("Loading external member list");
    membersX = [];                              // don't use saved (temp) members

    // Load data from the array
    private _memberUIDsFromConfig = getArray (configFile >> "AntistasiServerMembers" >> "MembersArray" >> "uidArray");
    {membersX pushBackUnique _x} forEach _memberUIDsFromConfig;

    // Load data from the classes
    private _memberClasses = "true" configClasses (configFile >> "AntistasiServerMembers" >> "MembersClasses");
    {membersX pushBackUnique (getText (_x >> "uid"))} forEach _memberClasses;
};

// TODO: Do we need this? maybe...
if (isPlayer A3A_setupPlayer) then {
    // Add current admin (setupPlayer) to members list and make them commander
    membersX pushBackUnique getPlayerUID A3A_setupPlayer;
    theBoss = A3A_setupPlayer;
    ["commander",true] remoteExecCall ["A3A_fnc_unitTraits",theBoss];
};

// Add admin as member on state change
addMissionEventHandler ["OnUserAdminStateChanged", {
    params ["_networkId", "_loggedIn", "_votedIn"];
    private _userInfo = getUserInfo _networkId;
    if (_userInfo isEqualTo []) exitWith {};            // happens on disconnections, apparently
    if !(_userInfo#2 in membersX) then {
        membersX pushBackUnique _userInfo#2;
        publicVariable "membersX";
    };
}];

publicVariable "membersX";
publicVariable "theBoss";       // need to publish this even if empty


// Needs params + factions. Might depend on saved data in the future
call A3A_fnc_initSupports;

// Needs saved arsenal data
call A3A_fnc_generateRebelGear;

// Needs A3A_rebelGear for equipping
[getPosATL petros] call A3A_fnc_createPetros;           // preserve current position (potentially from save)

// Some of these may already be unhidden but we make sure
{ _x hideObjectGlobal false } forEach [boxX, flagX, vehicleBox, fireX, mapX, petros];


//HandleDisconnect doesn't get 'owner' param, so we can't use it to handle headless client disconnects.
addMissionEventHandler ["HandleDisconnect",{_this call A3A_fnc_onPlayerDisconnect;false}];
//PlayerDisconnected doesn't get access to the unit, so we shouldn't use it to handle saving.
addMissionEventHandler ["PlayerDisconnected",{
    // Remove player from arsenal in case they disconnected while in it
    private _temp = server getVariable ["jna_playersInArsenal",[]];
    _temp = _temp - [param [4]];
    server setVariable ["jna_playersInArsenal",_temp,true];
    _this call A3A_fnc_onHeadlessClientDisconnect;
    false;
}];

addMissionEventHandler ["BuildingChanged", {
    params ["_oldBuilding", "_newBuilding", "_isRuin"];

    Debug_4("%1 (%2) changed to %3 (%4)", typeof _oldBuilding, netId _oldBuilding, typeof _newBuilding, netId _newBuilding);

    // If it's a police station, mark as destroyed
    // Might not be spawned, so can't depend on the furniture case
    if (netId _oldBuilding in A3A_policeStations) then {
        private _city = A3A_policeStations get netId _oldBuilding;
        A3A_garrison get _city set ["policeStation", false];
        A3A_garrisonSize set [_city, (A3A_garrisonSize get _city) - 4];
        A3A_spawnPlaceStats deleteAt _city;
        A3A_policeStations deleteAt netId _oldBuilding;
        ["TaskSucceeded", ["", "Police Station Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];

        // Delete any furniture
        private _attached = _oldBuilding getVariable ["A3A_furniture", []];
        { deleteVehicle _x } forEach _attached;

        // Delete police car from garrison because the spawn place won't be saved
        private _vehicles = A3A_garrison get _city get "vehicles";
        A3A_garrison get _city set ["vehicles", _vehicles select { _x#1 isEqualType [] }];
    };

    if (_isRuin) then {

        // TODO: this whole system doesn't work for buildings that have an intermediate damage model
        _oldBuilding setVariable ["ruins", _newBuilding];
        _newBuilding setVariable ["building", _oldBuilding];

        // Antenna dead/alive status is handled separately
        if !(_oldBuilding in antennas || _oldBuilding in antennasDead) exitWith {
            destroyedBuildings pushBack _oldBuilding;
        };
    };
}];

addMissionEventHandler ["EntityKilled", {
    params ["_victim", "_killer", "_instigator"];
    if (typeof _victim == "") exitWith {};
    private _killerSide = side group (if (isNull _instigator) then {_killer} else {_instigator});
    if (isPlayer _killer) then {
        private _killerUID = getPlayerUID _killer;
        private _killerName = name _killer;
        Debug_4("%1 killed by %2 [UID: %3 Name: %4]", typeof _victim, _killerSide, _killerUID, _killerName);
    } else {
        Debug_2("%1 killed by %2", typeof _victim, _killerSide);
    };

    private _marker = _victim getVariable "markerX";
    if (!isNil "_marker") then {
        if (_victim isKindOf "CAManBase") exitWith { [_marker, _victim] call A3A_fnc_garrisonServer_remUnit };
        [_victim] call A3A_fnc_garrisonServer_remVehicle;
    };

    if !(isNil {_victim getVariable "ownerSide"}) then {
        // Antistasi-created vehicle
        [_victim, _killerSide, false, _killer] call A3A_fnc_vehKilledOrCaptured;
        [_victim] spawn A3A_fnc_postmortem;
    };
}];

// Shouldn't need these now due to attach/detach covering all cases
/*if (A3A_hasACE) then {
    // Handler for detecting ACE load of static weapons. God why?
    ["ace_common_hideObjectGlobal", {
    	params ["_object", "_hide"];
        if !(_object isKindOf "StaticWeapon") exitWith {};
        if !(_hide) exitWith {};
        if (!isNil {_object getVariable "markerX"}) then { [_object] call A3A_fnc_garrisonServer_remVehicle };
    }] call CBA_fnc_addEventHandler;

    // Handler for detecting ACE cargo unload of static weapons
    ["ace_cargoUnloaded", {
        params ["_object", "_vehicle", "_unload"];
        if !(_object isKindOf "StaticWeapon") exitWith {};
        ["", _object] call A3A_fnc_garrisonServer_addVehicle;
    }] call CBA_fnc_addEventHandler;

    // Handler for detecting ACE drag/carry release of static weapons
    ["ace_common_setMass", {
        params ["_object", "_mass"];
        if !(_object isKindOf "StaticWeapon") exitWith {};
        if (_mass < 1) exitWith {};
        ["", _object] call A3A_fnc_garrisonServer_addVehicle;
    }] call CBA_fnc_addEventHandler;
};*/

if ((isClass (configfile >> "CBA_Extended_EventHandlers")) && (
    isClass (configfile >> "CfgPatches" >> "lambs_danger"))) then {
    // disable lambs danger fsm entrypoint
    ["CAManBase", "InitPost", {
        params ["_unit"];
        (group _unit) setVariable ["lambs_danger_disableGroupAI", true];
        _unit setVariable ["lambs_danger_disableAI", true];
    }] call CBA_fnc_addClassEventHandler;
};

// Could replace these with entityCreated handler instead...
if(A3A_hasZen) then {
    ["zen_common_createZeus", {
        _this spawn {
            params ["_unit"];

            // wait in case our event was called first
            waitUntil {sleep 1; !isNull getAssignedCuratorLogic _unit};

            //now add the logging to the module
            [[getAssignedCuratorLogic _unit]] remoteExecCall ["A3A_fnc_initZeusLogging",0];
        };
    }] call CBA_fnc_addEventHandler;
};

if (A3A_hasACE) then {
    ["ace_zeus_createZeus", {
        _this spawn {
            params ["_unit"];

            // wait in case our event was called first
            waitUntil {sleep 1; !isNull getAssignedCuratorLogic _unit};

            //now add the logging to the module
            [[getAssignedCuratorLogic _unit]] remoteExecCall ["A3A_fnc_initZeusLogging",0];
        };
    }] call CBA_fnc_addEventHandler;
};


A3A_startupState = "completed"; publicVariable "A3A_startupState";
serverInitDone = true; publicVariable "serverInitDone";
Info("Setting serverInitDone as true");

// ********************* Initialize loops *******************************************

A3A_garrisonOps = [];
[] spawn A3A_fnc_garrisonOpLoop;

[] spawn A3A_fnc_postmortemLoop;                    // Postmortem cleanup loop
[] spawn A3A_fnc_distance;                          // Marker spawn loop
[] spawn A3A_fnc_resourcecheck;                     // 10-minute loop
[] spawn A3A_fnc_aggressionUpdateLoop;              // 1-minute loop
[] spawn A3A_fnc_garbageCleanerTracker;             // 5-minute loop

savingServer = false;           // enable saving

// Autosave loop. Save if there were any players on the server since the last save.
[] spawn {
    private _lastPlayerCount = count (call A3A_fnc_playableUnits);
    while {true} do
    {
        autoSaveTime = time + autoSaveInterval;
        waitUntil { sleep 60; time > autoSaveTime; };
        private _playerCount = count (call A3A_fnc_playableUnits);
        if (autoSave && (_playerCount > 0 || _lastPlayerCount > 0)) then {
            [] remoteExecCall ["A3A_fnc_saveLoop", 2];
        };
        _lastPlayerCount = _playerCount;
    };
};

[] spawn A3A_fnc_spawnDebuggingLoop;

//Enable performance logging
[] spawn {
    private _logPeriod = [30, 10] select (logLevel == 3);
    while {true} do
    {
        //Sleep if no player is online
        if (isMultiplayer && (count (allPlayers - (entities "HeadlessClient_F")) == 0)) then
        {
            waitUntil {sleep 10; (count (allPlayers - (entities "HeadlessClient_F")) > 0)};
        };

        [] call A3A_fnc_logPerformance;
        sleep _logPeriod;
    };
};

//Unit locality logging
[] spawn {
    if (logLevel < 3) exitWith {};
    while {true} do
    {
        sleep 60;
        if (allPlayers - entities "HeadlessClient_F" isEqualTo []) then { continue };

        private _countSrv = { local _x } count allUnits;
        private _countHC = { owner _x in hcArray } count allUnits;
        private _countClient = count allUnits - _countSrv - _countHC;
        Debug_3("Units on server: %1 HC: %2 clients: %3", _countSrv, _countHC, _countClient);
    };
};

Info("initServer completed");
