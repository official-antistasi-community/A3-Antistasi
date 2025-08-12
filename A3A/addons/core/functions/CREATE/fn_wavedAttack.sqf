/*
Maintainer: John Jordan
    Sends a combined attack force to capture the given marker

Scope: Server
Environment: Scheduled, should be spawned

Arguments:
    <STRING> Destination marker (enemy-owned airport, outpost, seaport, factory or resource)
    <STRING> Origin marker (should be airbase)
    <INTEGER> Maximum number of attack waves to send
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mrkDest", "_mrkOrigin", "_maxWaves"];

Info_3("Creating waved attack against %1 from %2 with %3 waves", _mrkDest, _mrkOrigin, _maxWaves);

forcedSpawn pushBack _mrkDest; publicVariable "forcedSpawn";

private _targpos = markerPos _mrkDest;
private _side = sidesX getVariable _mrkOrigin;
private _targside = sidesX getVariable _mrkDest;
private _faction = Faction(_side);
private _lowAir = _faction getOrDefault ["attributeLowAir", false];

// Create a task for enemy vs rebel, notification only for enemy vs enemy
private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _nameEnemy = _faction get "name";
private _taskId = "wavedAttack" + str A3A_taskCount;
if (_targside == teamPlayer) then {
    private _taskStr = format [localize "STR_A3A_fn_base_wavedAttack_long", _nameEnemy, _nameDest];
    [true,_taskId,[_taskStr,format [localize "STR_A3A_fn_base_wavedAttack_title",_nameEnemy],_mrkDest],markerPos _mrkDest,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
    [_taskId, "rebelAttack", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
} else {
    private _text = format [localize "STR_A3A_fn_base_wavedAttack_other", _nameEnemy, Faction(_targside) get "name", _nameDest];
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification", 0];
};

// Generate reveal value for the attack wave notifications
private _reveal = call {
    if (_targside != teamPlayer) exitWith {0};
    private _reveal = [_targPos] call A3A_fnc_calculateSupportCallReveal;
    [_side, _targPos, _reveal] call A3A_fnc_useRadioKey;
};


// These mostly used for cleanup?
private _allCargoGroups = [];
private _allCrewGroups = [];
private _allVehicles = [];
private _attackHelis = [];

private _wave = 1;
private _victory = false;
while {_wave <= _maxWaves and !_victory} do
{
    // Somewhat flattened because a lot of the work is done by garrisons
    private _vehCount = round (2 + random 1 + 3*A3A_balancePlayerScale);
    if (_targside != teamPlayer) then { _vehCount = 5 + round (random 2) };
    if (_wave == 1) then { _vehCount = _vehCount + 2 };

    // Check what air supports & attack helis we have left from previous waves
    // Check active air supports for UAV/CAS/ASF
    private _countNewSupport = 0;
    private _airSupports = [];      // support type strings
    call {
        {
            _x params ["_supportName", "_suppSide", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];
            if (_suppSide != _side or _suppCenter distance2d _targpos > _suppRadius) then { continue };
            if (_suppType in ["UAV", "CAS", "ASF"]) then { _airSupports pushBack _suppType };
        } forEach A3A_activeSupports;

        // Not ideal because it might have a dead gunner. Might need some proper vehicleCanFight function
        _attackHelis = _attackHelis select { canMove _x and canFire _x };

        private _remSupports = (count _airSupports + count _attackHelis);
        private _reqSupports = round (_vehCount * (0.1 + random 0.1 + (5 + tierWar) * 0.025) * ([1, 0.4] select _lowAir));
        _countNewSupport = 1 max (_reqSupports - _remSupports);

        ServerDebug_3("Remaining air supports %1, plus %2 attack helis. Adding %3 air supports", _airSupports, count _attackHelis, _countNewSupport);
    };
    _vehCount = _vehCount - _countNewSupport;

    // Approx, just to prevent sending QRFs on top
	A3A_supportStrikes pushBack [_side, "TROOPS", _targPos, time + 1800, 1800, _vehCount * A3A_balanceVehicleCost];


    // Send the land units and air transports. Returns once air sent
    private _minDelay = [0, 300] select (_wave == 1 and _targSide == teamPlayer);
    //params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_delay", "_modifiers", "_attackType", "_reveal"];
    private _data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount, _minDelay, ["noairsupport"], "MajorAttack", _reveal] call A3A_fnc_createAttackForceMixed;
    _data params ["", "_newVehicles", "_crewGroups", "_cargoGroups"];


    // Now add air supports up to the requirement
    private _newAttackHelis = 0;
    for "_i" from 1 to _countNewSupport do 
    {
        private _possibles = ["AH", 1];
        if !("UAV" in _airSupports) then { _possibles append ["UAV", 1] };
        if !("CAS" in _airSupports) then { _possibles append ["CAS", 0.6] };
        if !("ASF" in _airSupports) then { _possibles append ["ASF", 0.3] };

        private _support = selectRandomWeighted _possibles;
        if (_support == "AH") then { _newAttackHelis = _newAttackHelis + 1 }
        else {
            // ["_type", "_side", "_caller", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];
            private _suppName = [_support, _side, "attack", 500, objNull, _targPos, 0, 0] call A3A_fnc_createSupport;
            if (_suppName == "") exitWith { _newAttackHelis = _newAttackHelis + 1 };
            _airSupports pushBack _support;
        };
    };

    // Spawn the attack helis
    if (_newAttackHelis > 0) then {
        // ["_side", "_originMrk", "_destMrk", "_resPool", "_vehCount", "_attackVehCount", "_tierMod"]
        private _data = [_side, _mrkOrigin, _mrkDest, "attack", _newAttackHelis, _newAttackHelis, 2] call A3A_fnc_createAttackForceAir;
        _newVehicles append _data#1;
        _attackHelis append _data#1;
        _crewGroups append _data#2;

        [-(_data#0), _side, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];

        ServerInfo_1("Spawn performed: Attack helis %1", (_data#1) apply {typeof _x});
    };

    // Request some artillery
    call {
        // Choose target/pos. Aim for static weapon if known, or just somewhere around flag otherwise
        private _target = markerPos _mrkDest getPos [random 100, random 360];
        private _vehicles = vehicles inAreaArray _mrkDest;
        _vehicles = _vehicles select { canFire _x and _x isKindOf "StaticWeapon" };
        if !(_vehicles isEqualTo []) then { _target = selectRandom _vehicles };

        // ["_side", "_target", "_caller", "_precision", "_reveal", "_delay"];
        [_side, _target, "attack", _wave min 4, 0, 0] call A3A_fnc_requestArtillery;
    };

    private _timeout = time + 900;		// wave timeout, 15 mins after the wave has finished spawning
    private _soldiers = [];
    { _soldiers append units _x } forEach _cargoGroups;     // only new troops count, in case old troops are just stuck somewhere

    _allCargoGroups append _cargoGroups;
    _allCrewGroups append _crewGroups;
    _allVehicles append _newVehicles;

    // Wave termination monitor
    while {true} do
    {
//    if (sidesX getVariable [_mrkDestination,sideUnknown] != teamPlayer) then {_soldiers spawn A3A_fnc_remoteBattle};
        private _markerSide = sidesX getVariable _mrkDest;
        if(_markerSide == _side) exitWith {
            ServerInfo_2("Wave %1 has captured %2", _wave, _mrkDest);
            _victory = true;
        };

        private _curSoldiers = { !fleeing _x and _x call A3A_fnc_canFight } count _soldiers;
        Debug_2("%1 soldiers remaining out of %2", _curSoldiers, count _soldiers);
        if (_curSoldiers < count _soldiers * 0.25) exitWith {
            ServerInfo_2("Wave %1 against %2 has been defeated", _wave, _mrkDest);
        };
        if(_timeout < time) exitWith {
            ServerInfo_2("Wave %1 against %2 has timed out", _wave, _mrkDest);
        };

        // Attempt to flip marker
        [_mrkDest, _markerSide] remoteExec ["A3A_fnc_zoneCheck", 2];
        sleep 10;
    };
    _wave = _wave + 1;
};

if (_victory) then {
    if (_targSide != teamPlayer) exitWith {};
    [_taskId, "rebelAttack", "FAILED"] call A3A_fnc_taskSetState;
    if (_targside == teamPlayer) then { [-10,theBoss] call A3A_fnc_playerScoreAdd };
} else {
    [_mrkDest, _mrkOrigin] call A3A_fnc_minefieldAAF;

    if (_targSide != teamPlayer) exitWith {};
    [_taskId, "rebelAttack", "SUCCEEDED"] call A3A_fnc_taskSetState;
    private _nearRebels = [500, 0, markerPos _mrkDest, teamPlayer] call A3A_fnc_distanceUnits;
    { if (isPlayer _x) then { [10, _x] call A3A_fnc_playerScoreAdd } } forEach _nearRebels;
    [10, theBoss] call A3A_fnc_playerScoreAdd;
};
[_taskId, "rebelAttack", 30] spawn A3A_fnc_taskDelete;

ServerInfo("Reached end of winning conditions. Starting despawn");

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _allVehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _allCrewGroups;
{
    [_x, [nil, _mrkDest] select _victory] spawn A3A_fnc_enemyReturnToBase;
    sleep 10;
} forEach _allCargoGroups;

sleep 60;

bigAttackInProgress = false; publicVariable "bigAttackInProgress";
forcedSpawn = forcedSpawn - [_mrkDest]; publicVariable "forcedSpawn";
