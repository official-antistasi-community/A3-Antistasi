// Garrison-local function to spawn in garrison units & vehicles

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_garrisonData", "_side"];
private _markerPos = markerPos _marker;
private _faction = Faction(_side);
private _garrisonType = _garrisonData get "type";

Info_2("Spawning %2 garrison at marker %1", _marker, _side);
Debug_1("Garrison data: %1", _garrisonData);

private _garrison = createHashMapFromArray [["troops", []], ["vehicles", []], ["buildings", []], ["groups", []], ["civs", []], ["civGroups", []],
    ["side", _side], ["type", _garrisonType], ["buildingGroup", grpNull], ["staticGroup", grpNull], ["mortarGroup", grpNull] ];
A3A_activeGarrison set [_marker, _garrison];


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
            _buildings pushBack _building;
        };
    } forEach (_garrisonData getOrDefault ["buildings", []]);
    _garrison set ["buildings", _buildings];
} else {
    _garrison set ["buildings", _garrisonData get "spawnedBuildings"];
};


// Spawn flagpole
if !(_garrisonType in ["hq", "city", "roadblock", "camp", "rebpost"]) then
{
    private _flag = createVehicle [_faction get "flag", _markerPos, [], 0, "NONE"];
    _flag setFlagTexture (_faction get "flagTexture");
    _flag allowDamage false;
    _garrison set ["flag", _flag];
    private _flagAction = ["take", "SDKFlag"] select (_side == teamPlayer);
    [_flag, _flagAction] remoteExec ["A3A_fnc_flagaction", 0, _flag];
};


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
	private _ammoBox = [_faction get "ammobox", _markerPos, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
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


private _storedTroops = +(_garrisonData get "troops");

// Spawn vehicles (including statics)
[_garrison, _marker, _side, _storedTroops, _garrisonData get "vehicles"] call A3A_fnc_spawnGarrisonVehicles;

// If there's a police station, spawn items & troops
if (_garrisonData getOrDefault ["policeStation", false] isEqualType []) then {
    [_garrison, _marker, _garrisonData, _storedTroops] call A3A_fnc_spawnPoliceStation;
};

// Spawn 2-man patrols
[_garrison, _marker, _side, _storedTroops] call A3A_fnc_spawnGarrisonPatrols;

// Spawn remainder as squads
[_garrison, _marker, _side, _storedTroops, true] call A3A_fnc_spawnGarrisonSquads;


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
