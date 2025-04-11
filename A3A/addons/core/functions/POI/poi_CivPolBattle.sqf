
private ["_markerX"];

params ["_markerX"];
_positionX = getMarkerPos _markerX;
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

_vehiclesX = [];
_soldiers = [];
private _dogs = [];
private _groups = [];
_pilots = [];

private _typeGroup = (_faction get "groupPoliceSquad");
Verbose_2("Side: %1 spawning group composition: %2", _sideX, _typeGroup);
private _groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
_groups pushBack _groupX;
[_groupX, "Patrol_Defend", 0, 50, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
_groupX setBehaviour "COMBAT";

{_soldiers pushBack _x; [_x,"", false] call A3A_fnc_NATOinit} forEach units _groupX;

private _typeVehX = selectRandom(_faction get "vehiclesPolice");

_radiusX = 20;
private _roads = _positionX nearRoads _radiusX;
while {_radiusX < 100} do
{
    _roads = _positionX nearRoads _radiusX;
    _roads = _roads select { count (roadsConnectedTo _x) == 2 };
    if (count _roads > 0) exitWith {};
    _radiusX = _radiusX + 10;
};
if (_radiusX >= 100) then {
    // fallback case, shouldn't happen unless the map is very broken
    Error_2("Road error for %1 at %2", _markerX, _positionX);
    _roads = _positionX nearRoads 20;		// guaranteed due to isOnRoad check
    _dirveh = random 360;
} else {
    private _roadscon = roadsConnectedto (_roads select 0);
    _dirveh = [_roads select 0, _roadscon select 0] call BIS_fnc_DirTo;
};
private _veh = _typeVehX createVehicle getPos (_roads select 0);
_veh setDir _dirveh;
_vehiclesX pushBack _veh;

// Spawn in the "civilians"
private _numCiv = 4 + random 4;

private _civilians = [];
private _civGroups = [];
private _civWeapons = [unlockedshotguns, unlockedhandguns, unlockedsniperrifles, unlockedrifles, unlockedsmgs];

if("vanilla" in A3A_factionEquipFlags) then {
    _civWeapons set [2, ["srifle_DMR_06_hunter_F","srifle_DMR_06_hunter_F"] + unlockedsniperrifles];
    _civWeapons set [3, ["arifle_AKM_F","arifle_AKS_F","arifle_AKM_F","arifle_AKS_F"] + unlockedrifles];
    _civWeapons set [4, ["arifle_AKS_F","arifle_AKS_F"] + unlockedsmgs];
};

//War tier scaling on rifles and SMGs, making them more common as the war escalates, tier 1: 0, 20. tier 5: 40, 40, tier 10: 90, 65.
//This would inhertently decrease the probability of the other weapon types
private _weaponsWeights = [70-5*tierWar, 50-3*tierWar, 30, -10+10*tierWar, 15+10*(tierWar/2)];
{
    if !(_x isEqualType []) then {continue};
    if(count _x == 0) then {
        _civWeapons set [_forEachIndex, unlockedhandguns + unlockedshotguns];
    };
} forEach _civWeapons;
private _unitType = FactionGet(reb, "unitUnarmed");

while {count _civilians < _numCiv} do
{
    private _groupCivil = createGroup teamPlayer;
    _civGroups pushBack _groupCivil;
    for "_i" from 1 to (random _numCiv max (_numCiv - count _civilians)) do {
        private _pos = while {true} do {
            private _pos = _positionX getPos [60 + (random 60),random 360];
            if (!surfaceIsWater _pos) exitWith { _pos };
        };
        private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
        private _civ = [_groupCivil, _unitType, _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
        _civ forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
        _civ addHeadgear selectRandom (A3A_faction_civ get "headgear");
        private _weapon = selectRandom(_civWeapons selectRandomWeighted _weaponsWeights);
        [_civ, _weapon, 5, 0] call BIS_fnc_addWeapon;
        if(_weapon in unlockedshotguns) then {
            [_civ, selectRandom unlockedhandguns, 3, 0] call BIS_fnc_addWeapon;
        };

        _civ setVariable ["spawner",false,false];
        _civ setSkill ((0.1 + 0.1*A3A_rebelSkillMul + 0.015 * skillFIA)/2);
        _civilians pushBack _civ;
		_soldiers pushBack _civ; 
    };
    _groupCivil allowFleeing 0.9;
};

{
    _x setBehaviour "COMBAT";
	private _wp = _x addWaypoint [_positionX, 15];
	_wp setWaypointType "SAD";
} forEach _civGroups;
_groups append _civGroups;

[_groups, _soldiers, _vehiclesX, _dogs, _pilots]