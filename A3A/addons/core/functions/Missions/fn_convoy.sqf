#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Mission: Capture/destroy the convoy
if (!isServer and hasInterface) exitWith {};
params ["_mrkDest", "_mrkOrigin", ["_convoyType", ""], ["_resPool", "legacy"], ["_startDelay", -1]];

private _difficult = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_mrkOrigin,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);

private _posSpawn = getMarkerPos _mrkOrigin;			// used for spawning infantry before moving them into vehicles
private _posHQ = getMarkerPos respawnTeamPlayer;

private _soldiers = [];
private _vehiclesX = [];
private _markNames = [];
private _POWS = [];
private _reinforcementsX = [];


// Setup start time

if (_startDelay < 0) then { _startDelay = random 5 + ([10, 5] select _difficult) }; 		// start delay, 5-10 or 15-20 mins real time
private _startDateNum = dateToNumber date + _startDelay * timeMultiplier / (365*24*60);
private _startDate = numberToDate [date select 0, _startDateNum];
private _displayTime = [_startDate] call A3A_fnc_dateToTimeString;

private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _nameOrigin = [_mrkOrigin] call A3A_fnc_localizar;
[_mrkOrigin, _startDelay + 1] call A3A_fnc_addTimeForIdle;      // best not to try driving past this stuff


// Determine convoy type from destination

private _convoyTypes = [];
if ((_mrkDest in airportsX) or (_mrkDest in outposts)) then
{
    _convoyTypes = ["Ammunition","Armor"];
    if (_mrkDest in outposts) then {if (((count (garrison getVariable [_mrkDest, []]))/2) >= [_mrkDest] call A3A_fnc_garrisonSize) then {_convoyTypes pushBack "Reinforcements"}};
}
else
{
    if (_mrkDest in citiesX) then
    {
        if (sidesX getVariable [_mrkDest,sideUnknown] == Occupants) then {_convoyTypes = ["Supplies"]} else {_convoyTypes = ["Supplies"]}
    }
    else
    {
        if ((_mrkDest in resourcesX) or (_mrkDest in factories)) then {_convoyTypes = ["Money"]} else {_convoyTypes = ["Prisoners"]};
        if (((count (garrison getVariable [_mrkDest, []]))/2) >= [_mrkDest] call A3A_fnc_garrisonSize) then {_convoyTypes pushBack "Reinforcements"};
    };
};

if (_convoyType == "") then { _convoyType = selectRandom _convoyTypes };

private _textX = "";
private _taskState = "CREATED";
private _taskTitle = "";
private _taskIcon = "";
private _taskState1 = "CREATED";
private _typeVehObj = "";

switch (tolower _convoyType) do
{
    case "ammunition":
    {
        _textX = format ["A convoy from %1 is about to depart at %2. It will provide ammunition to %3. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nameOrigin,_displayTime,_nameDest];
        _taskTitle = "Ammo Convoy";
        _taskIcon = "rearm";
        _typeVehObj = selectRandom (_faction get "vehiclesAmmoTrucks");
    };
    case "armor":
    {
        _textX = format ["A convoy from %1 is about to depart at %2. It will reinforce %3 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nameOrigin,_displayTime,_nameDest];
        _taskTitle = "Armored Convoy";
        _taskIcon = "Destroy";
        _typeVehObj = selectRandom (_faction get "vehiclesAA");
    };
    case "prisoners":
    {
        _textX = format ["A group of POWs is being transported from %1 to %3, and it's about to depart at %2. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nameOrigin,_displayTime,_nameDest];
        _taskTitle = "Prisoner Convoy";
        _taskIcon = "run";
        _typeVehObj = selectRandom (_faction get "vehiclesTrucks");
    };
    case "reinforcements":
    {
        _textX = format ["Reinforcements are being sent from %1 to %3 in a convoy, and it's about to depart at %2. Try to intercept and kill all the troops and vehicle objective.",_nameOrigin,_displayTime,_nameDest];
        _taskTitle = "Reinforcements Convoy";
        _taskIcon = "run";
        _typeVehObj = selectRandom (_faction get "vehiclesTrucks");
    };
    case "money":
    {
        _textX = format ["A truck with plenty of money is being moved from %1 to %3, and it's about to depart at %2. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nameOrigin,_displayTime,_nameDest];
        _taskTitle = "Money Convoy";
        _taskIcon = "move";
        _typeVehObj = selectRandom (FactionGet(reb, "vehiclesCivSupply"));
    };
    case "supplies":
    {
        _textX = format ["A truck with medical supplies destination %3 it's about to depart at %2 from %1. Steal that truck bring it to %3 and let people in there know it is %4 who's giving those supplies.",_nameOrigin,_displayTime,_nameDest,FactionGet(reb,"name")];
        _taskTitle = "Supply Convoy";
        _taskIcon = "heal";
        _typeVehObj = selectRandom (FactionGet(reb, "vehiclesCivSupply"));
    };
};


// Find suitable nav points for origin/dest
private _posOrigin = navGrid select ([_mrkOrigin] call A3A_fnc_getMarkerNavPoint) select 0;
private _posDest = navGrid select ([_mrkDest] call A3A_fnc_getMarkerNavPoint) select 0;

private _taskId = "CONVOY" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskTitle,_mrkDest],_posDest,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
[[_sideX],_taskID+"B",[format ["A convoy from %1 to %3, it's about to depart at %2. Protect it from any possible attack.",_nameOrigin,_displayTime,_nameDest],"Protect Convoy",_mrkDest],_posDest,false,0,true,"run",true] call BIS_fnc_taskCreate;
[_taskId, "CONVOY", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

ServerInfo_3("%1 convoy mission created from %2 to %3", _convoyType, _mrkOrigin, _mrkDest);


// *********** Convoy vehicle spawning ***********************

private _route = [_posOrigin, _posDest] call A3A_fnc_findPath;
_route = _route apply { _x select 0 };			// reduce to position array
if (_route isEqualTo []) then { _route = [_posOrigin, _posDest] };

private _vehPool = ([_sideX, tierWar] call A3A_fnc_getVehiclesGroundTransport) + ([_sideX, tierWar] call A3A_fnc_getVehiclesGroundSupport);
private _pathState = [];			// Set the scope so that state is preserved between findPosOnRoute calls
private _resourcesSpent = 0;

// Spawning worker functions

private _fnc_spawnConvoyVehicle = {
    params ["_vehType", "_markName"];
    ServerDebug_1("Spawning vehicle type %1", _vehType);

    // Find location down route
    _pathState = [_route, [20, 0] select (count _pathState == 0), _pathState] call A3A_fnc_findPosOnRoute;
    while {true} do {
        // make sure there are no other vehicles within 10m
        if (count (ASLtoAGL (_pathState#0) nearEntities 10) == 0) exitWith {};
        _pathState = [_route, 10, _pathState] call A3A_fnc_findPosOnRoute;
    };

    private _veh = createVehicle [_vehType, ASLtoAGL (_pathState#0) vectorAdd [0,0,0.5]];               // Give it a little air
    private _vecUp = (_pathState#1) vectorCrossProduct [0,0,1] vectorCrossProduct (_pathState#1);       // correct pitch angle
    _veh setVectorDirAndUp [_pathState#1, _vecUp];
    _veh allowDamage false;

    private _group = [_sideX, _veh] call A3A_fnc_createVehicleCrew;
    { [_x, nil, nil, _resPool] call A3A_fnc_NATOinit; _x allowDamage false; _x disableAI "MINEDETECTION" } forEach (units _group);
    _soldiers append (units _group);
    (driver _veh) stop true;
    deleteWaypoint [_group, 0];													// groups often start with a bogus waypoint

    [_veh, _sideX, _resPool] call A3A_fnc_AIVEHinit;
    if (_vehType in FactionGet(all,"vehiclesArmor")) then { _veh allowCrewInImmobile true };			// move this to AIVEHinit at some point?
    _vehiclesX pushBack _veh;
    _markNames pushBack _markName;
    _veh;
};

private _fnc_spawnEscortVehicle = {
    private _typeVehEsc = selectRandomWeighted _vehPool;
    private _veh = [_typeVehEsc, "Convoy Escort"] call _fnc_spawnConvoyVehicle;

    private _typeGroup = [_typeVehEsc, _sideX] call A3A_fnc_cargoSeats;
    if (count _typeGroup == 0) exitWith {};
    private _groupEsc = [_posSpawn, _sideX, _typeGroup] call A3A_fnc_spawnGroup;				// Unit limit?
    {[_x, nil, nil, _resPool] call A3A_fnc_NATOinit;_x assignAsCargo _veh;_x moveInCargo _veh;} forEach units _groupEsc;
    _soldiers append (units _groupEsc);
};


// Tail escort
[] call _fnc_spawnEscortVehicle;

// Objective vehicle
sleep 2;
private _objText = if (_difficult) then {" Convoy Objective"} else {"Convoy Objective"};
private _vehObj = [_typeVehObj, _objText] call _fnc_spawnConvoyVehicle;

//if (_convoyType == "Armor") then {_vehObj allowCrewInImmobile true;};
if (_convoyType == "Prisoners") then
{
    private _grpPOW = createGroup teamPlayer;
    for "_i" from 1 to (1+ round (random 11)) do
    {
        private _unit = [_grpPOW, FactionGet(reb,"unitUnarmed"), _posSpawn, [], 0, "NONE"] call A3A_fnc_createUnit;
        _unit setCaptive true;
        _unit disableAI "MOVE";
        _unit setBehaviour "CARELESS";
        _unit allowFleeing 0;
        _unit assignAsCargo _vehObj;
        _unit moveInCargo [_vehObj, _i + 3];
        removeAllWeapons _unit;
        removeAllAssignedItems _unit;
        [_unit,"refugee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
        _POWS pushBack _unit;
        [_unit] call A3A_fnc_reDress;
    };
};
if (_convoyType == "Reinforcements") then
{
    private _typeGroup = [_typeVehObj,_sideX] call A3A_fnc_cargoSeats;
    private _groupEsc = [_posSpawn,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
    {[_x, nil, nil, _resPool] call A3A_fnc_NATOinit;_x assignAsCargo _vehObj;_x moveInCargo _vehObj;} forEach units _groupEsc;
    _soldiers append (units _groupEsc);
    _reinforcementsX append (units _groupEsc);
};
if ((_convoyType == "Money") or (_convoyType == "Supplies")) then
{
    _vehObj setVariable ["A3A_reported", true, true];
};
if (_convoyType == "Ammunition") then
{
    [_vehObj] spawn A3A_fnc_fillLootCrate;
};

// Initial escort vehicles, 0-1 for SP, 1-2 for 10+
private _countX = round ((A3A_balancePlayerScale min 1.5) + random 0.5 + ([-0.75, 0.25] select _difficult));
for "_i" from 1 to _countX do
{
    sleep 2;
    [] call _fnc_spawnEscortVehicle;
};

// Lead vehicle
sleep 2;
private _typeVehX = selectRandom (if (_sideX == Occupants && random 4 < tierWar) then {_faction get "vehiclesPolice"} else {_faction get "vehiclesLightArmed"});
private _vehLead = [_typeVehX, "Convoy Lead"] call _fnc_spawnConvoyVehicle;

// Apply convoy resource cost, if it's from attack or defence pool
if (_resPool != "legacy") then {
    private _resources = 10 * count _soldiers;
    { _resources = _resources + (A3A_vehicleResourceCosts getOrDefault [typeOf _x, 0]) } forEach _vehiclesX;
    [-_resources, _sideX, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];
};

// Remove spawn-suicide protection
sleep 2;
{_x allowDamage true} forEach _vehiclesX;
{_x allowDamage true; if (vehicle _x == _x) then {deleteVehicle _x}} forEach _soldiers;
ServerInfo_2("Spawn performed: %1 ground vehicles, %2 soldiers", count _vehiclesX, count _soldiers);


// Send the vehicles after the delay

sleep (60*_startDelay);
_route = _route select [_pathState#2, count _route];        // remove navpoints that we already passed while spawning
ServerInfo("Convoy mission under way");

// This array is used to share remaining convoy vehicles between threads
private _convoyVehicles = +_vehiclesX;
reverse _convoyVehicles;
reverse _markNames;
{
    (driver _x) stop false;
    [_x, _route, _convoyVehicles, 30, _x == _vehObj] spawn A3A_fnc_vehicleConvoyTravel;
	[_x, _markNames#_forEachIndex, false] spawn A3A_fnc_inmuneConvoy;			// Disabled the stuck-vehicle hacks
    sleep 3;
} forEach _convoyVehicles;



// **************** Termination condition handling ********************************

private _bonus = if (_difficult) then {1.5} else {1};
private _arrivalDist = 100;
private _timeout = time + 3600;

private _fnc_applyResults =
{
    params ["_success", "_success1", "_adjustCA", "_adjustScore", "_aggroMod", "_aggroTime", "_type"];

    _taskState = if (_success) then { "SUCCEEDED" } else { "FAILED" };
    _taskState1 = if (_success1) then { "SUCCEEDED" } else { "FAILED" };

    [_adjustCA, _sideX] remoteExec ["A3A_fnc_timingCA", 2];
    [_adjustScore, theBoss] call A3A_fnc_playerScoreAdd;
    if (_adjustScore > 0) then {
        {
            if (isPlayer _x) then { [_adjustScore,_x] call A3A_fnc_playerScoreAdd };
        } forEach ([500,0,_vehObj,teamPlayer] call A3A_fnc_distanceUnits);
    };

    [_sideX, _aggroMod, _aggroTime] remoteExec ["A3A_fnc_addAggression", 2];

    if !(_success1) then {
        _killZones = killZones getVariable [_mrkOrigin,[]];
        _killZones = _killZones + [_mrkDest,_mrkDest];
        killZones setVariable [_mrkOrigin,_killZones,true];
    };

#define CONVOY_MISSION_STATUS_ARRAY ["lost", "won"]
    ServerDebug_2("Rebels %1 a %2 convoy mission", CONVOY_MISSION_STATUS_ARRAY select _success, _type);
};

if (_convoyType == "Ammunition") then
{
    waitUntil {sleep 1; (time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or (not alive _vehObj) or (side group driver _vehObj != _sideX)};
    if ((_vehObj distance _posDest < _arrivalDist) or (time > _timeout)) then
    {
        [false, true, -200, -10, 0, 0, "ammo"] call _fnc_applyResults;
        clearMagazineCargoGlobal _vehObj;
        clearWeaponCargoGlobal _vehObj;
        clearItemCargoGlobal _vehObj;
        clearBackpackCargoGlobal _vehObj;
    }
    else
    {
        [true, false, 400*_bonus, 10*_bonus, 10, 120, "ammo"] call _fnc_applyResults;
        [0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
};

if (_convoyType == "Armor") then
{
    waitUntil {sleep 1; (time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or (not alive _vehObj) or (side group driver _vehObj != _sideX)};
    if ((_vehObj distance _posDest < _arrivalDist) or (time > _timeout)) then
    {
        [false, true, -200, -10, 0, 0, "armor"] call _fnc_applyResults;
        server setVariable [_mrkDest,dateToNumber date,true];
    }
    else
    {
        [true, false, 400*_bonus, 10*_bonus, 10, 120, "armor"] call _fnc_applyResults;
        [0,5*_bonus,_posDest] remoteExec ["A3A_fnc_citySupportChange",2];
    };
};

if (_convoyType == "Prisoners") then
{
    waitUntil {sleep 1; (time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or (side group driver _vehObj != _sideX) or ({alive _x} count _POWs == 0)};
    if ((_vehObj distance _posDest < _arrivalDist) or ({alive _x} count _POWs == 0) or (time > _timeout)) then
    {
        [false, true, -200, -10, 0, 0, "prisoner"] call _fnc_applyResults;
    };
    if (side group driver _vehObj != _sideX) then
    {
        {_x enableAI "MOVE"; [_x] orderGetin false} forEach _POWs;
        waitUntil {sleep 2; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance _posHQ < 50)} count _POWs > 0) or (time > _timeout)};

        if (({alive _x} count _POWs == 0) or (time > _timeout)) then
        {
            [false, false, 0, -10, 20, 120, "prisoner"] call _fnc_applyResults;
        }
        else
        {
            _countX = {(alive _x) and (_x distance _posHQ < 150)} count _POWs;
            [true, false, 400*_bonus, _bonus*_countX/2, 10, 120, "prisoner"] call _fnc_applyResults;

            [_countX,_countX*300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
            [0,10*_bonus,_posSpawn] remoteExec ["A3A_fnc_citySupportChange",2];
        };
    };
};

if (_convoyType == "Reinforcements") then
{
    waitUntil {sleep 1; (time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or ({_x call A3A_fnc_canFight} count _reinforcementsX == 0)};
    if ({_x call A3A_fnc_canFight} count _reinforcementsX == 0) then
    {
        [true, false, 400*_bonus, 10*_bonus, 10, 120, "reinforcement"] call _fnc_applyResults;
        [0,10*_bonus,_posSpawn] remoteExec ["A3A_fnc_citySupportChange",2];
    }
    else
    {
        [false, true, -200, -10, 0, 0, "reinforcement"] call _fnc_applyResults;
        _countX = {alive _x} count _reinforcementsX;
        if (_countX <= 8) then {_taskState1 = "FAILED"};
        if (sidesX getVariable [_mrkDest,sideUnknown] == _sideX) then
        {
            _typesX = [];
            {_typesX pushBack (_x getVariable "unitType")} forEach (_reinforcementsX select {alive _x});
            [_typesX,_sideX,_mrkDest,0] remoteExec ["A3A_fnc_garrisonUpdate",2];
        };
    };
};

if (_convoyType == "Money") then
{
    waitUntil {sleep 1; (time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or (not alive _vehObj) or (side group driver _vehObj != _sideX)};
    if ((time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or (not alive _vehObj)) then
    {
        if ((time > _timeout) or (_vehObj distance _posDest < _arrivalDist)) then
        {
            [false, true, -200, -10, 0, 0, "money"] call _fnc_applyResults;
        }
        else
        {
            // Ok, this is a success of sorts...
            [false, false, 400*_bonus, 0, 5, 60, "money"] call _fnc_applyResults;
        };
    }
    else
    {
        waitUntil {sleep 2; (_vehObj distance _posHQ < 50) or (not alive _vehObj) or (time > _timeout)};
        if ((not alive _vehObj) or (time > _timeout)) then
        {
            [true, false, 400*_bonus, 5*_bonus, 5, 60, "money"] call _fnc_applyResults;
        };
        if (_vehObj distance _posHQ < 50) then
        {
            [true, false, 400*_bonus, 10*_bonus, 10, 120, "money"] call _fnc_applyResults;
            [0,5000*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
        };
    };
};

if (_convoyType == "Supplies") then
{
    waitUntil {sleep 1; (time > _timeout) or (_vehObj distance _posDest < _arrivalDist) or (not alive _vehObj) or (side group driver _vehObj != _sideX)};
    if (not alive _vehObj) then
    {
        [false, false, 0, -10, 0, 0, "supply"] call _fnc_applyResults;
    }
    else
    {
        if (side group driver _vehObj != _sideX) then
        {
            waitUntil {sleep 1; (_vehObj distance _posDest < _arrivalDist) or (not alive _vehObj) or (time > _timeout)};
            if (_vehObj distance _posDest < _arrivalDist) then
            {
                [true, false, 200*_bonus, 10*_bonus, 5, 120, "supply"] call _fnc_applyResults;
                [0,15*_bonus,_mrkDest] remoteExec ["A3A_fnc_citySupportChange",2];
            }
            else
            {
                [false, false, 0, -5, 0, 0, "supply"] call _fnc_applyResults;
                [0,-5*_bonus,_mrkDest] remoteExec ["A3A_fnc_citySupportChange",2];
            };
        }
        else
        {
            [false, true, 0, -10, 0, 0, "supply"] call _fnc_applyResults;
            [15*_bonus,0,_mrkDest] remoteExec ["A3A_fnc_citySupportChange",2];
        };
    };
};

[_taskId, "CONVOY", _taskState] call A3A_fnc_taskSetState;
[_taskId+"B",_taskState1] call BIS_fnc_taskSetState;		// Do this manually because both sides can fail


// Cleanup

{ deleteVehicle _x } forEach _POWs;

[_taskId, "CONVOY", 600, true] spawn A3A_fnc_taskDelete;

// Clear this array so the vehicleConvoyTravel spawns exit and merge groups
_convoyVehicles resize 0;
sleep 5;

// Groups change due to convoy crew group split/merge, so we recreate them
private _groups = [];
{ if (alive _x) then {_groups pushBackUnique (group _x)} } forEach _soldiers;
{ [_x] spawn A3A_fnc_groupDespawner } forEach _groups;
{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehiclesX;

// Hang around for a bit, and then send all escorts back to the source base
sleep 60;
{
    if (count units _x > 0) then {
        private _wp = _x addWaypoint [_posOrigin, 50];
        _wp setWaypointType "MOVE";
        _x setCurrentWaypoint _wp;
    };
} forEach _groups - [group driver _vehObj];
