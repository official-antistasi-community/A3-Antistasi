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

// Nav stuff, should have no parameter/save dependence at all
call A3A_fnc_loadNavGrid;
call A3A_fnc_addNodesNearMarkers;		// Needs data from both the above

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
    A3A_saveTarget = [A3A_saveData get "serverID", A3A_saveData get "gameID", worldName];
    // Sanity checks? hmm

    Info_1("Loading campaign with ID %1", A3A_saveData get "gameID");

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
    // Disable all nearby roadblocks/specops
    {
        if (markerPos _x distance _posHQ < distanceSPWN) then {
            sidesX setVariable [_x, teamPlayer, true];
        };
    } forEach controlsX;
    petros setPos _posHQ;
    [_posHQ, true] call A3A_fnc_relocateHQObjects;         // sets all the other vars
};

if (_startType != "load") then {
    // Set blank server ID if we don't have one already. They're pretty pointless
    private _serverID = profileNamespace getVariable ["ss_serverID", ""];
    _serverID = [_serverID, false] select (A3A_saveData get "useNewNamespace");

    // Create new campaign ID, avoiding collisions
    private _allIDs = call A3A_fnc_collectSaveData apply { _x get "gameID" };
    private _newID = str(floor(random(90000) + 10000));
    while { _newID in _allIDs } do { _newID = str(floor(random(90000) + 10000)) };

    Info_1("Creating new campaign with ID %1", _newID);

    A3A_saveTarget = [_serverID, _newID, worldName];
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
call A3A_fnc_createPetros;

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

    if (_isRuin) then {
        _oldBuilding setVariable ["ruins", _newBuilding];
        _newBuilding setVariable ["building", _oldBuilding];

        // Antenna dead/alive status is handled separately
        if !(_oldBuilding in antennas || _oldBuilding in antennasDead) then {
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
        Debug_3("%1 killed by %2. Killer UID: %3", typeof _victim, _killerSide, _killerUID);
    } else {
        Debug_2("%1 killed by %2", typeof _victim, _killerSide);
    };

    if !(isNil {_victim getVariable "ownerSide"}) then {
        // Antistasi-created vehicle
        [_victim, _killerSide, false, _killer] call A3A_fnc_vehKilledOrCaptured;
        [_victim] spawn A3A_fnc_postmortem;
    };
}];

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


Info("initServer completed");
