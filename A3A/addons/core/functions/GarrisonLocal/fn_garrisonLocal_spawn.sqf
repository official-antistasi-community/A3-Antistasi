#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_side", "_newGarrison"];
private _markerPos = markerPos _marker;
private _faction = Faction(_side);

Info_2("Spawning %2 garrison at marker %1", _marker, _side);
Debug_1("Garrison data: %1", _newGarrison);

private _garrison = createHashMapFromArray [["troops", []]], ["statics", []], ["vehicles", []], ["buildings", []], ["groups", []], ["civs", []], ["civGroups", []]];
_garrison set ["side", _side];
A3A_activeGarrison set [_marker, _garrison];

// Generate the type now so that we only need to do it once per spawn
// TODO: if careful, everything except cities can be done with _ lookup?
private _garrisonType = call {
    if (_marker in citiesX) exitWith {"city"};
    if (_marker find "roadblock" == 0) exitWith {"roadblock"};
    if (_marker find "camp" == 0) exitWith {"camp"};
    if (_marker find "FIAPost" == 0) exitWith {"rebPost"};      // change these?
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

// Spawn buildings first, so that flag/box don't trip over them
if !(_garrisonType == "hq") then {
    private _buildings = _garrison get "buildings";
    {
        _x params ["_class", "_posData"];
        _posData params ["_posWorld", "_vecUp", "_vecDir"];
        isNil {
            private _building = createVehicle [_class, _posWorld, [], 0, "CAN_COLLIDE"];
            _building setPosWorld _posWorld;
            _building setVectorDirAndUp [_vecDir, _vecUp];
            _buildings pushBack _building;
        };
    } forEach (_newGarrison get "buildings");
};

// Spawn flagpole
if !(_garrisonType in ["hq", "city", "roadblock", "camp", "rebPost"]) then
{
    private _flag = createVehicle [_faction get "flag", _markerPos, [], 0, "NONE"];
    _flag setFlagTexture (_faction get "flagTexture");
    _flag allowDamage false;
    (_garrison get "buildings") pushBack _flag;
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
    // Spawn intel
    // TODO: should be persistently placed
    if (random 100 < (40 + tierWar * 3)) then
    {
        private _large = random 100 < (30 + tierWar * 2);
        [_markerX, _large] spawn A3A_fnc_placeIntel;
    };

    // Spawn loot crate if it's off cooldown. TODO: Move to newGarrison data
    if (garrison getVariable [_markerX + "_lootCD", 0] != 0) exitWith {};
	private _ammoBox = [_faction get "ammobox", _markerPos, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
	[_ammoBox] call A3A_Logistics_fnc_addLoadAction;
    (_garrison get "vehicles") pushBack _ammoBox;
	[_ammoBox] call A3A_fnc_fillLootCrate;
	if !(_garrisonType == "seaport") exitWith {};
    {
        _ammoBox addItemCargoGlobal [_x, round random [2,6,8]];
    } forEach (A3A_faction_reb get "diveGear");
};

private _storedTroops = +(_newGarrison get "troops");

// Spawn statics & crew
[_garrison, _marker, _side, _storedTroops, _newGarrison get "statics"] call A3A_fnc_spawnGarrisonStatics;

// Spawn vehicles
[_garrison, _marker, _side, _storedTroops, _newGarrison get "vehicles"] call A3A_fnc_spawnGarrisonVehicles;

// Spawn 2-man patrols
[_garrison, _marker, _side, _storedTroops] call A3A_fnc_spawnGarrisonPatrols;

// Spawn remainder as squads
[_garrison, _marker, _side, _storedTroops] call A3A_fnc_spawnGarrisonSquads;


["locationSpawned", [_marker, "RebelOutpost", true]] call EFUNC(Events,triggerEvent);

// Spawn the monitor function at this point?
