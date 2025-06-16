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

private _crewVar = ["A3A_crewed", "A3A_rebCrewed"] select (_side == teamPlayer);
private _places = A3A_spawnPlacesHM getOrDefault [_marker, _activeGarrison get "spawnPlaces"];
private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);
private _groupStatics = createGroup _side;
private _mortarGroups = [];
{
    _x params ["_class", "_posData", "_vecDir", "_vecUp", "_state"];

    private _vehicle = objNull;
    private _fullCrew = false;
    if (_posData isEqualType 0) then
    {
        // Predefined spawn place (probably enemy)
        private _spawnPlace = _places # _posData;
        _spawnPlace params ["_placeType", "_pos", "_dir", "_building"];

        if (!isNil "_building" and {damage _building >= 1 or isObjectHidden _building}) then {
            Info_2("Spawn of %1 in %2 blocked because building destroyed", _class, _marker);
            continue;
        };
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
        if ("static" in _placeType or _placeType == "vehicleRB") then { _vehicle setVariable ["A3A_crewed", true] };
    }
    else
    {
        // Arbitrary placement (probably rebel)
        /*private _blockers = (ASLtoATL _posData) nearEntities ["StaticWeapon", 2];
        if (_blockers isNotEqualTo []) then {
            Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
            continue;
        };*/
        isNil {
            _vehicle = createVehicle [_class, _posData, [], 0, "CAN_COLLIDE"];
            _vehicle setPosWorld _posData;
            _vehicle setVectorDirAndUp [_vecDir, _vecUp];
        };
    };
    if (_vehicle isKindOf "Land" and _vehicle emptyPositions "gunner" > 0) then { _vehicle setVariable ["A3A_rebCrewed", true] };

    _vehicles pushBack _vehicle;
    _vehicle setVariable ["markerX", _marker, true];
    if (!isNil "_state") then { [_vehicle, _state] call HR_GRG_fnc_setState };
    [_vehicle, _side] call A3A_fnc_AIVEHinit;

    if (_fullCrew) then {
        private _countCrew = count fullCrew [_vehicle, "", true] - count fullCrew [_vehicle, "cargo", true];
        if (_storedTroops#0 < _countCrew) exitWith {};
        _storedTroops set [0, (_storedTroops#0) - _countCrew];

        private _group = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
        {[_x, _marker] call _fnc_initUnit} forEach units _group;
        _troops append units _group;
        _groups pushBack _group;
        [_group, "Patrol_Area", 25, 100, 250, true, _markerPos, false] call A3A_fnc_patrolLoop;     // TODO: check for boat
        sleep 0.1; continue;
    };
    if (isNil {_vehicle getVariable _crewVar}) then { sleep 0.1; continue };

    private _unitType = if (_side != teamPlayer) then {
        if (_storedTroops#0 == 0) then { sleep 0.1; continue };
        _storedTroops set [0, (_storedTroops#0) - 1];
        _faction get (["unitPoliceGrunt", "unitGrunt", "unitMilitiaGrunt", "unitMilitiaGrunt"] select floor (_storedTroops#1 + random 0.99));
    } else {
        private _index = _storedTroops find (_faction get "unitCrew");
        if (_index == -1) then { _index = _storedTroops find (_faction get "unitRifle") };
        if (_index == -1) then { sleep 0.1; continue };      // No suitable units
        _storedTroops deleteAt _index;
    };

    private _group = if (_vehicle isKindOf "StaticMortar") then { createGroup _side } else { _groupStatics };
    private _unit = [_group, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _vehicle;
    _unit moveInGunner _vehicle;
    _troops pushBack _unit;
    [_unit, _marker] call _fnc_initUnit;

    if (_vehicle isKindOf "StaticMortar") then {
        [_group] call A3A_fnc_artilleryAdd;
        _group deleteGroupWhenEmpty true;
        _groups pushBack _group;
        _mortarGroups pushBack _group;
    };
    sleep 0.1;

} forEach _storedVehicles;

if (units _groupStatics isEqualTo []) then { deleteGroup _groupStatics };
_garrison set ["staticGroup", _groupStatics];
_garrison set ["mortarGroups", _mortarGroups];
