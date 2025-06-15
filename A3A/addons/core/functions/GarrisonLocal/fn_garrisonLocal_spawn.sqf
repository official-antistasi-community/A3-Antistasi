#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_newGarrison", "_side"];
private _markerPos = markerPos _marker;
private _faction = Faction(_side);

Info_2("Spawning %2 garrison at marker %1", _marker, _side);
Debug_1("Garrison data: %1", _newGarrison);

private _garrison = createHashMapFromArray [["troops", []], ["statics", []], ["vehicles", []], ["buildings", []], ["groups", []], ["civs", []], ["civGroups", []]];
_garrison set ["side", _side];
A3A_activeGarrison set [_marker, _garrison];

// Generate the type now so that we only need to do it once per spawn
// TODO: if careful, everything except cities can be done with _ lookup?
private _garrisonType = call {
    if (_marker in citiesX) exitWith {"city"};
    if (_marker find "roadblock" == 0) exitWith {"roadblock"};
    if (_marker find "camp" == 0) exitWith {"camp"};
    if (_marker find "RebPost" == 0) exitWith {"rebpost"};
    if (_marker find "outpost" == 0) exitWith {"outpost"};
    if (_marker find "resource" == 0) exitWith {"resource"};
    if (_marker find "factory" == 0) exitWith {"factory"};
    if (_marker find "seaport" == 0) exitWith {"seaport"};
    if (_marker find "airport" == 0) exitWith {"airport"};
    if (_marker == "Synd_HQ") exitWith {"hq"};
    Error_1("Marker %1 type not identified", _marker);
    "unknown";
};
_garrison set ["type", _garrisonType];

// Merge in spawn places & garrison size for minor sites if we haven't done so yet
if !(_marker in A3A_spawnPlacesHM) then { A3A_spawnPlacesHM set [_marker, _newGarrison get "spawnPlaces"] };
if !(_marker in A3A_garrisonSize) then { A3A_garrisonSize set [_marker, [_marker, true] call A3A_fnc_garrisonSize] };


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
    } forEach (_newGarrison getOrDefault ["buildings", []]);
    _garrison set ["buildings", _buildings];
} else {
    _garrison set ["buildings", _newGarrison get "spawnedBuildings"];
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


private _storedTroops = +(_newGarrison get "troops");

// Spawn statics & crew
[_garrison, _marker, _side, _storedTroops, _newGarrison get "statics"] call A3A_fnc_spawnGarrisonStatics;

// Spawn vehicles
[_garrison, _marker, _side, _storedTroops, _newGarrison get "vehicles"] call A3A_fnc_spawnGarrisonVehicles;

// If there's a police station, spawn items & troops
if (_newGarrison getOrDefault ["policeStation", false] isEqualType []) then {
    [_garrison, _marker, _newGarrison, _storedTroops] call A3A_fnc_spawnPoliceStation;
};

// Spawn 2-man patrols
[_garrison, _marker, _side, _storedTroops] call A3A_fnc_spawnGarrisonPatrols;

// Spawn remainder as squads
[_garrison, _marker, _side, _storedTroops, true] call A3A_fnc_spawnGarrisonSquads;


["locationSpawned", [_marker, "RebelOutpost", true]] call EFUNC(Events,triggerEvent);

// Spawn the monitor function at this point?
