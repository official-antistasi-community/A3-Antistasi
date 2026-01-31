/*
    Garrison-local function to spawn garrison units & vehicles.

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <HASHMAP> Garrison data from server.
    <SIDE> Current marker side.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_garrisonData", "_side"];
private _markerPos = markerPos _marker;
private _faction = Faction(_side);
private _garrisonType = _garrisonData get "type";

Info_2("Spawning %2 garrison at marker %1", _marker, _side);
Debug_1("Garrison data: %1", _garrisonData);

// May already have entry if there are active supports
private _garrison = A3A_activeGarrison get _marker;
if (isNil "_garrison") then {
    _garrison = createHashMapFromArray [ ["troops", []], ["vehicles", []], ["buildings", []], ["groups", []], ["civs", []], ["civGroups", []], ["vehActions", []],
        ["side", _side], ["buildingGroup", grpNull], ["staticGroup", grpNull], ["mortarGroup", grpNull] ];
    A3A_activeGarrison set [_marker, _garrison];
};
_garrison set ["state", "enabled"];
_garrison set ["type", _garrisonType];      // Won't be set by vehicle actions

// Merge in spawn places & garrison size for minor sites if we haven't done so yet
if !(_marker in A3A_spawnPlacesHM) then { A3A_spawnPlacesHM set [_marker, _garrisonData get "spawnPlaces"] };
if !(_marker in A3A_garrisonSize) then { A3A_garrisonSize set [_marker, [_marker, true] call A3A_fnc_garrisonSize] };


// Remove vehicles parked too close to vehicle spawn places
/*
{
    if !("vehicle" in _x#0) then { continue };
    entities
} forEach (A3A_spawnPlacesHM get _marker);
*/

// Spawn buildings first, so that flag/box don't trip over them
if !(_garrisonType == "hq") then {
    private _buildings = [];
    {
        _x params ["_class", "_posWorld", "_vecDir", "_vecUp"];
        isNil {
            private _building = createVehicle [_class, _posWorld, [], 0, "CAN_COLLIDE"];
            _building setPosWorld _posWorld;
            _building setVectorDirAndUp [_vecDir, _vecUp];
            _building setVariable ["A3A_building", true, true];
            _buildings pushBack _building;
        };
    } forEach (_garrisonData getOrDefault ["buildings", []]);
    _garrison set ["buildings", _buildings];
} else {
    _garrison set ["buildings", _garrisonData get "spawnedBuildings"];
};


// If a flag marker is provided, use that for flag & ammobox
private _flagPos = _markerPos;
if (_garrisonType in A3A_markerPrefixHM) then {
    private _flagMarker = (_marker call A3A_fnc_getMarkerPrefix) + "flag";
    if (markerShape _flagMarker != "") then { _flagPos = markerPos _flagMarker };
};

// Spawn flagpole
if !(_garrisonType in ["hq", "city", "roadblock", "camp", "rebpost"]) then
{
    private _flag = createVehicle [_faction get "flag", _flagPos, [], 0, "NONE"];
    _flag setFlagTexture (_faction get "flagTexture");
    _flag allowDamage false;
    _garrison set ["flag", _flag];
    private _flagAction = ["take", "SDKFlag"] select (_side == teamPlayer);
    [_flag, _flagAction] remoteExec ["A3A_fnc_flagaction", 0, _flag];
};


// Spawn everything else now so that statics etc don't get spawn-blocked
private _storedTroops = +(_garrisonData get "troops");

// Subtract units spawned as vehAction crews
if (_side != teamPlayer) then {
    private _countSpawned = 0;
    {
        _countSpawned = _countSpawned + ({alive _x} count units (_x#2));
    } forEach (_garrison get "vehActions");
    _storedTroops set [0, 0 max ((_storedTroops#0) - _countSpawned)];
};

// Spawn vehicles (including statics)
[_garrison, _marker, _side, _storedTroops, _garrisonData get "vehicles"] call A3A_fnc_spawnGarrisonVehicles;

// Spawn a radar system if there's an AA launcher in the garrison
if (_side != teamPlayer and _garrisonType == "airport") then {
    private _factionSAMs = _faction get "vehiclesSAM";
    if (_factionSAMs isEqualTo [] or _faction get "vehiclesRadar" isEqualTo []) exitWith {};
    if (_garrisonData get "vehicles" findIf { _x#0 in _factionSAMs } == -1) exitWith {};
    private _radarPos = [_flagPos, 150, 20] call A3A_fnc_findArtilleryPos;
    private _radar = createVehicle [selectRandom (_faction get "vehiclesRadar"), _radarPos, [], 0, "NONE"];
    _garrison get "vehicles" pushBack _radar;
};

// If there's a police station, spawn items & troops
if (_garrisonData getOrDefault ["policeStation", false] isEqualType []) then {
    [_garrison, _marker, _garrisonData, _storedTroops] call A3A_fnc_spawnPoliceStation;
};

// Spawn 2-man patrols
[_garrison, _marker, _side, _storedTroops] call A3A_fnc_spawnGarrisonPatrols;

// Spawn remainder as squads
[_garrison, _marker, _side, _storedTroops, true] call A3A_fnc_spawnGarrisonSquads;


// Spawn resource/factory civs
if (_garrisonType in ["resource", "factory"]) then {
    private _spawnedCivilians = [_marker, 4] call A3A_fnc_createResourceCiv;
    if !(isNil "_spawnedCivilians") then {
        (_garrison get "civGroups") pushBack (_spawnedCivilians # 0);
        (_garrison get "civs") append (_spawnedCivilians # 1);
    };
};


if (_side != teamPlayer and _garrisonType in ["airport", "outpost", "seaport"]) then {
    // Spawn intel if it's off cooldown
    if (_garrison getOrDefault ["lootCD", 0] <= 0) then {
        private _large = random 100 < (30 + tierWar * 2);
        [_marker, _large] spawn A3A_fnc_placeIntel;
    };

    // Spawn loot crate if it's off cooldown
    if (_garrison getOrDefault ["lootCD", 0] > 0) exitWith {};
	private _ammoBox = [_faction get "ammobox", _flagPos, 10, 5, true] call A3A_fnc_safeVehicleSpawn;
    [_ammoBox, true, _garrison, _marker] call A3A_fnc_setupLootCrate;
};


// Spawn minefield (non-persistent for cost/benefit & perf reasons)
if (_garrisonType == "camp") then {
    private _mineTypes = (_faction get "minefieldAPERS");
    private _placedMines = [];
    for "_i" from 1 to 30 do {
        private _mine = createMine [selectRandom _mineTypes, _markerPos, [], 200];
        // Don't put mines on roads otherwise we might start blowing up civs
        if (isOnRoad _mine or surfaceIsWater getPosATL _mine) then { deleteVehicle _mine; continue };
        _side revealMine _mine;
        _placedMines pushBack _mine;
    };
    _garrison set ["mines", _placedMines];
};


// Temporary watchpost stealth: apply if <5 units and none in vehicles
//private _stealth = count (_garrison get "troops") < 5 and _garrison get "troops" findIf { vehicle _x != _x } == -1;
// TODO: Need to teach patcom about stealth

// Some general all-group stuff
{
    if (_side == teamPlayer) then { _x allowFleeing 0 };
    _x deleteGroupWhenEmpty true;
    _x addEventHandler ["CombatModeChanged", A3A_fnc_combatModeChangedEH];
} forEach (_garrison get "groups");


["locationSpawned", [_marker, "RebelOutpost", true]] call EFUNC(Events,triggerEvent);

// Spawn the monitor function at this point?
