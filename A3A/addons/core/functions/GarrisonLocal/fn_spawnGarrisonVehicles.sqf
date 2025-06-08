/*
    Spawn vehicles (sometimes crewed) in garrison
    Worker function for spawnGarrison, runs on server and HCs
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_activeGarrison", "_marker", "_side", "_storedTroops", "_storedVehicles"];

private _faction = Faction(_side);
private _markerPos = markerPos _marker;

private _groups = _activeGarrison get "groups";
private _vehicles = _activeGarrison get "vehicles";
private _troops = _activeGarrison get "troops";

private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);
private _groupStatics = _activeGarrison getOrDefault ["staticGroup", grpNull];
{
    _x params ["_class", "_posData", "_vecDir", "_vecUp", "_state"];

    private _vehicle = objNull;
    private _fullCrew = false;
    if (_posData isEqualType 0) then
    {
        private _spawnPlace = (A3A_spawnPlacesHM get _marker) # _posData;
        _spawnPlace params ["_placeType", "_pos", "_dir", "_building"];

        // TODO: block conditions for vehicles? Anything nearby that's not markerX?
        /*private _blockers = _pos nearEntities ["StaticWeapon", 2];
        if (_blockers isNotEqualTo []) then {
            Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
            continue;
        };*/

        isNil {
            _vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
            _vehicle setDir _dir;
        };
        if (_side != teamPlayer and _placeType in ["vehicleAA", "boat"]) then { _fullCrew = true };
    } else {
        // Arbitrary placement (probably rebel)
        isNil {
            _vehicle = createVehicle [_class, _posData, [], 0, "CAN_COLLIDE"];
            _vehicle setPosWorld _posData;
            _vehicle setVectorDirAndUp [_vecDir, _vecUp];
        };
    };
    _vehicles pushBack _vehicle;
    _vehicle setVariable ["markerX", _marker, true];
    if (!isNil "_state") then { [_vehicle, _state] call HR_GRG_fnc_setState };
    [_vehicle, _side] call A3A_fnc_AIVEHinit;

    if (_fullCrew) then {
        private _countCrew = count fullCrew [_vehicle, "", true] - count fullCrew [_vehicle, "cargo", true];
        if (_storedTroops#0 < _countCrew) then { continue };
        _storedTroops set [0, (_storedTroops#0) - _countCrew];

        private _group = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
        {[_x, _marker] call _fnc_initUnit} forEach units _group;
        _troops append units _group;
        _groups pushBack _group;
        [_group, "Patrol_Area", 25, 100, 250, true, _markerPos, false] call A3A_fnc_patrolLoop;     // TODO: check for boat
        continue;
    };

    if !(_activeGarrison get "type" in ["rebpost", "roadblock"]) then { continue };       // Only use gunner spawning for roadblocks atm
    if (_vehicle emptyPositions "gunner" == 0) then { continue };                       // in case we leave unarmed veh at roadblock

    private _unitType = if (_side != teamPlayer) then {
        if (_storedTroops#0 == 0) then { continue };
        _storedTroops set [0, (_storedTroops#0) - 1];
        _faction get (["unitPoliceGrunt", "unitGrunt", "unitMilitiaGrunt", "unitMilitiaGrunt"] select floor (_storedTroops#1 + random 0.99));
    } else {
        private _index = _storedTroops find (_faction get "unitCrew");
        if (_index == -1) then { _index = _storedTroops find (_faction get "unitRifle") };
        if (_index == -1) then { continue };      // No suitable units
        _storedTroops deleteAt _index;
    };

    if (isNull _groupStatics) then { _groupStatics = createGroup _side; _groups pushBack _groupStatics };

    private _unit = [_groupStatics, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _vehicle;
    _unit moveInGunner _vehicle;
    _troops pushBack _unit;
    [_unit, _marker] call _fnc_initUnit;

    sleep 0.2;

} forEach _storedVehicles;

_garrison set ["staticGroup", _groupStatics];
