/*
Maintainer: John Jordan
    Create invader city punishment attack

Scope: Server, although written to work on HCs
Environment: Scheduled, should be spawned

Arguments:
    <STRING> Destination marker (should be town)
    <STRING> Origin marker (should be airbase)
    <SCALAR> Optional, delay in seconds before sending vehicles (Default: Auto-calculated)
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_mrkDest", "_mrkOrigin", "_delay"];

ServerInfo_2("Launching CSAT Punishment Against %1 from %2", _mrkDest, _mrkOrigin);

// Mostly to prevent fast travel
bigAttackInProgress = true; publicVariable "bigAttackInProgress";
forcedSpawn pushBack _mrkDest; publicVariable "forcedSpawn";

private _posDest = getMarkerPos _mrkDest;
private _posOrigin = getMarkerPos _mrkOrigin;
private _size = [_mrkDest] call A3A_fnc_sizeMarker;

private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _taskId = "invaderPunish" + str A3A_taskCount;
[[teamPlayer,civilian,Occupants],_taskId,[format ["%2 is attacking critical positions within %1! Defend the city at all costs",_nameDest,FactionGet(inv,"name")],format ["%1 Punishment",FactionGet(inv,"name")],_mrkDest],_posDest,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "invaderPunish", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


if (isNil "_delay") then {
    _delay = 300 + 60 * (markerPos "Synd_HQ" distance2d _posDest) / 2000;            // +1 min per 2km
};

// Create the attacking force
// probably doesn't make much sense to aggro-scale this one as it's not a response
private _vehCount = round (2 + random 1 + A3A_balancePlayerScale);

//params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_delay", "_modifiers", "_attackType", "_reveal"];
private _data = [Invaders, _mrkOrigin, _mrkDest, "attack", _vehCount, _delay, ["airboost", "specops"]] call A3A_fnc_createAttackForceMixed;
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];

// May as well do it properly here
A3A_supportStrikes pushBack [Invaders, "TROOPS", markerPos _mrkDest, time + 1800, 1800, _resources];


// Call up some artillery
private _artyTargPos = _posDest getPos [_size/3, random 360];
// ["_side", "_target", "_resPool", "_precision", "_reveal", "_delay"];
[Invaders, _artyTargPos, "attack", 0, 0, 0] call A3A_fnc_requestArtillery;


// Spawn in the "civilians" (rebel defenders)
private _numCiv = (server getVariable _mrkDest) select 0;
_numCiv = 4 + round sqrt (_numCiv);
if (_numCiv > 30) then {_numCiv = 30};

private _civilians = [];
private _civGroups = [];
private _civWeapons = unlockedsniperrifles + unlockedmachineguns + unlockedshotguns + unlockedrifles + unlockedsmgs + unlockedhandguns;
private _unitType = FactionGet(reb, "unitUnarmed");

while {count _civilians < _numCiv} do
{
    private _groupCivil = createGroup teamPlayer;
    _civGroups pushBack _groupCivil;
    private _pos = while {true} do {
        private _pos = _posDest getPos [random _size / 2,random 360];
        if (!surfaceIsWater _pos) exitWith { _pos };
    };
    for "_i" from 1 to (4 min (_numCiv - count _civilians)) do {
        private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
        private _civ = [_groupCivil, _unitType, _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
        _civ forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
        _civ addHeadgear selectRandom (A3A_faction_civ get "headgear");
        [_civ, selectRandom _civWeapons, 5, 0] call BIS_fnc_addWeapon;
        _civ setSkill 0.5;
        _civilians pushBack _civ;
    };
    [_groupCivil, "Patrol_Defend", 0, 100, -1, true, _pos, false] call A3A_fnc_patrolLoop;
};


// Termination conditions
private _missionExpireTime = time + 3600;
private _missionMinTime = time + 600;
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

waitUntil {
    sleep 10;
//    Debug_4("Soldiers %1 initial, %2 active. Civs %3 initial, %4 active", count _soldiers, {_x call A3A_fnc_canFight} count _soldiers, count _civilians, {alive _x} count _civilians);
    ({_x call A3A_fnc_canFight} count _soldiers < count _soldiers / 3)
    or (time > _missionMinTime and ({alive _x} count _civilians < count _civilians / 4))
    or (time > _missionExpireTime)
};

private _fnc_adjustNearCities = {
    params ["_position", "_maxSupport", "_maxDist"];
    {
        private _dist = getMarkerPos _x distance2d _position;
        if (_dist > _maxDist) then { continue };
        private _suppChange = linearConversion [0, _maxDist, _dist, _maxSupport, 0, true];
        [0,_suppChange,_x,false] spawn A3A_fnc_citySupportChange;		// don't scale this by pop
    } forEach citiesX;
};

if (({_x call A3A_fnc_canFight} count _soldiers < count _soldiers / 3) or (time > _missionExpireTime)) then {
    Info_1("Rebels defeated a punishment attack against %1", _mrkDest);
    [_taskId, "invaderPunish", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [_posDest, 30, 3000] call _fnc_adjustNearCities;

    [Occupants, -10, 90] remoteExec ["A3A_fnc_addAggression",2];
    {if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posDest,teamPlayer] call A3A_fnc_distanceUnits);
    [10,theBoss] call A3A_fnc_playerScoreAdd;
} else {
    Info_1("Rebels lost a punishment attack against %1", _mrkDest);
    [_taskId, "invaderPunish", "FAILED"] call A3A_fnc_taskSetState;
    [_posDest, -30, 3000] call _fnc_adjustNearCities;

    // Invaders pay extra to destroy a city
    private _citypop = (server getVariable _mrkDest) select 0;
    [-4 * _citypop * A3A_balancePlayerScale, Invaders, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];

    destroyedSites = destroyedSites + [_mrkDest];
    publicVariable "destroyedSites";
    private _mineTypes = A3A_faction_inv get "minefieldAPERS";
    for "_i" from 1 to 60 do {
        private _mineX = createMine [selectRandom _mineTypes,_posDest,[],_size];
        Invaders revealMine _mineX;
    };
    [_mrkDest] call A3A_fnc_destroyCity;
    // Putting this stuff here is a bit gross, but currently there's no cityFlip function. Usually done by resourceCheck.
    sidesX setVariable [_mrkDest, Invaders, true];
    garrison setVariable [_mrkDest, [], true];
    [_mrkDest] call A3A_fnc_mrkUpdate;
};

sleep 60;
[_taskId, "invaderPunish", 0] spawn A3A_fnc_taskDelete;

bigAttackInProgress = false; publicVariable "bigAttackInProgress";
forcedSpawn = forcedSpawn - [_mrkDest]; publicVariable "forcedSpawn";


// Order remaining aggressor units back to base, hand them to the group despawner
{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _crewGroups + _cargoGroups;

// When the city marker is despawned, get rid of the civilians
waitUntil {sleep 5; (spawner getVariable _mrkDest == 2)};
{deleteVehicle _x} forEach _civilians;
{deleteGroup _x} forEach _civGroups;
