#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_side", "_newGarrison"];
private _markerPos = markerPos _marker;
private _faction = Faction(_side);

Info_2("Spawning %2 garrison at marker %1", _marker, _side);
Debug_1("Garrison data: %1", _newGarrison);

private _garrison = createHashMapFromArray [["troops", []]], ["statics", []], ["vehicles", []], ["buildings", []], ["groups", []], ["civs", []], ["civGroups", []]];
A3A_activeGarrison set [_marker, _garrison];

// Spawn buildings first, so that flag/box don't trip over them
if (_marker != "Synd_HQ") then {
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
if (_marker != "Synd_HQ" and !(_marker in citiesX)) then
{
    private _flag = createVehicle [_faction get "flag", _markerPos, [], 0, "NONE"];
    _flag setFlagTexture (_faction get "flagTexture");
    _flag allowDamage false;
    (_garrison get "buildings") pushBack _flag;
    private _flagAction = ["take", "SDKFlag"] select (_side == teamPlayer);
    [_flag, _flagAction] remoteExec ["A3A_fnc_flagaction", 0, _flag];
};

// Spawn resource/factory civs
if ((_marker in resourcesX) or (_marker in factories)) then {
    private _spawnedCivilians = [_marker, 4] call A3A_fnc_createResourceCiv;
    if !(isNil "_spawnedCivilians") then {
        (_garrison get "civGroups") pushBack (_spawnedCivilians # 0);
        (_garrison get "civs") append (_spawnedCivilians # 1);
    };
};

if (_side != teamPlayer and { _marker in airportsX or _marker in outposts or _marker in seaports }) then {
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
	if !(_marker in seaports) exitWith {};
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
