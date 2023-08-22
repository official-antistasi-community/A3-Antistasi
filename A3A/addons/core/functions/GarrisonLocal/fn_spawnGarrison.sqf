#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_newGarrison"];
private _markerPos = markerPos _marker;

Info_1("Spawning rebel garrison at marker %1", _marker);
Debug_1("Garrison data: %1", _newGarrison);

private _troops = [];
private _statics = [];
private _vehicles = [];
private _buildings = [];
private _groups = [];
private _civs = [];
private _civGroups = [];

if (_marker != "Synd_HQ" and !(_marker in citiesX)) then
{
    // Spawn flagpole
    private _flag = createVehicle [FactionGet(reb,"flag"), markerPos _marker, [], 0, "NONE"];
    _flag setFlagTexture FactionGet(reb,"flagTexture");
    _flag allowDamage false;
    _buildings pushBack _flag;
    [_flag, "SDKFlag"] remoteExec ["A3A_fnc_flagaction", 0, _flag];

    // Spawn resource/factory civs
	if ((_marker in resourcesX) or (_marker in factories)) then {
		private _spawnedCivilians = [_marker, 4] call A3A_fnc_createResourceCiv;
		if !(isNil "_spawnedCivilians") then {
			_civGroups pushBack (_spawnedCivilians # 0);
			_civs append (_spawnedCivilians # 1);
		};
	};
};


// Spawn statics & crew
private _troopTypes = _newGarrison getOrDefault ["troops", []];
private _groupStatics = grpNull;
{
    _x params ["_class", "_posData"];
    _posData params ["_posWorld", "_vecUp", "_vecDir"];

    private _blockers = (ASLtoATL _posWorld) nearEntities ["StaticWeapon", 2];
    if (_blockers isNotEqualTo []) then {
        Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
        continue;
    };

    private _static = objNull;
    isNil {
        _static = createVehicle [_class, _posWorld, [], 0, "CAN_COLLIDE"];
        _static setPosWorld _posWorld;
        _static setVectorDirAndUp [_vecDir, _vecUp];
    };
    _statics pushBack _static;
    _static setVariable ["markerX", _marker, true];
    [_static, teamPlayer] call A3A_fnc_AIVEHinit;

    private _index = _troopTypes find FactionGet(reb,"unitCrew");
    if (_index == -1) then { _index = _troopTypes find FactionGet(reb,"unitRifle") };
    if (_index == -1) then { continue };      // Ran out of units

    private _group = call {
        if (_static isKindOf "StaticMortar") exitWith { createGroup teamPlayer };
        if (isNull _groupStatics) then { _groupStatics = createGroup teamPlayer; _groups pushBack _groupStatics };
        _groupStatics;
    };

    private _unit = [_group, _troopTypes deleteAt _index, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _static;
    _unit moveInGunner _static;
    _troops pushBack _unit;
	[_unit, _marker] call A3A_fnc_FIAinitBases;

    if (_static isKindOf "StaticMortar") then {
        [_group] call A3A_fnc_artilleryAdd;
        _groups pushBack _group;
    };
    sleep 0.1;

} forEach (_newGarrison getOrDefault ["statics", []]);


// Make 8-man groups out of the remainder of the garrison
_troopTypes = _troopTypes call A3A_fnc_garrisonReorg;

private _infGroups = [];
private _curGroup = grpNull;

while {_troopTypes isNotEqualTo []} do
{
	if (isNull _curGroup or {count units _curGroup == 8}) then {
		_curGroup = createGroup teamPlayer;
		_infGroups pushBack _curGroup;
	};
	private _unitType = _troopTypes deleteAt 0;
	private _unit = [_curGroup, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
	if (_unitType isEqualTo FactionGet(reb,"unitSL")) then {_curGroup selectLeader _unit};      // unnecessary?
	[_unit, _marker] call A3A_fnc_FIAinitBases;
	_troops pushBack _unit;
	sleep 0.1;
};
_groups append _infGroups;

// Add infantry groups to patcom
if (_infGroups isNotEqualTo []) then {
    private _markerSize = [_marker] call A3A_fnc_sizeMarker;
    private _extraGroups = [_infGroups deleteAt 0, _markerPos, _markerSize] call A3A_fnc_patrolGroupGarrison;
	_groups append _extraGroups;

    {
        [_x, "Patrol_Defend", 0, 150, -1, true, _markerPos, false] call A3A_fnc_patrolLoop;
    } forEach _infGroups;
};

private _garrison = createHashMapFromArray [["troops", _troops], ["statics", _statics], ["vehicles", []], ["buildings", _buildings], ["groups", _groups],
    ["civs", _civs], ["civGroups", _civGroups]];
A3A_activeGarrison set [_marker, _garrison];

["locationSpawned", [_marker, "RebelOutpost", true]] call EFUNC(Events,triggerEvent);

// Spawn the monitor function at this point?
