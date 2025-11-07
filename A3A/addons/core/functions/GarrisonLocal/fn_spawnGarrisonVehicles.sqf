/*
    Worker function to spawn statics and vehicles in garrison.
    Crews all statics and selected vehicles.

    Environment: Scheduled, used by garrison spawn functions.

    Arguments:
    <HASHMAP> Active garrison data.
    <STRING> Marker name.
    <SIDE> Marker side.
    <ARRAY> Remaining troops to use, either loadout names for rebel or [count, quality] for enemy.
    <ARRAY> Remaining vehicles to spawn.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_garrison", "_marker", "_side", "_storedTroops", "_storedVehicles"];

private _faction = Faction(_side);
private _markerPos = markerPos _marker;

private _groups = _garrison get "groups";
private _vehicles = _garrison get "vehicles";
private _troops = _garrison get "troops";

private _crewVar = ["A3A_crewed", "A3A_rebCrewed"] select (_side == teamPlayer);
private _places = A3A_spawnPlacesHM get _marker;
private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);

// Shouldn't be any units/vehicles from marker at this point
private _potentialBlockers = (allDead + (_markerPos nearEntities vectorMagnitude markerSize _marker)) inAreaArray _marker;

// pass in _pos, _class and _marker
private _fnc_isBlocked = {
    private _blockers = _potentialBlockers inAreaArray [_pos, 8, 8];
    {
        if (alive _x and !(_x isKindOf "WeaponHolderSimulated")) then { continue };
        _blockers deleteAt _forEachIndex;
        deleteVehicle _x;
        sleep 0.01;                 // otherwise might spawn vehicle in same frame & before deletion
    } forEachReversed _blockers;
    if (_blockers isEqualTo []) exitWith { false };
    Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
    true;
};

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
        if (call _fnc_isBlocked) then { continue };
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
        private _pos = ASLtoAGL _posData;           // blocker check is currently 2d anyway, but keep it consistent
        if (call _fnc_isBlocked) then { continue };
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
    [_vehicle, _side, "garrison"] call A3A_fnc_AIVEHinit;

    if (_fullCrew) then {
        private _countCrew = count fullCrew [_vehicle, "", true] - count fullCrew [_vehicle, "cargo", true];
        if (_storedTroops#0 < _countCrew) exitWith {};
        _storedTroops set [0, (_storedTroops#0) - _countCrew];

        private _group = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
        {[_x, _marker] call _fnc_initUnit} forEach units _group;
        _troops append units _group;
        _groups pushBack _group;
        if (_vehicle isKindOf "Land") then {
            [_group, "Patrol_Area", 25, 100, 250, true, _markerPos, false, false] call A3A_fnc_patrolLoop;
        };
        sleep 0.3; continue;
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

    private _groupType = ["staticGroup", "mortarGroup"] select (_vehicle isKindOf "StaticMortar");
    private _group = _garrison get _groupType;
    if (isNull _group) then { _group = createGroup _side; _groups pushBack _group; _garrison set [_groupType, _group] };

    private _unit = [_group, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _vehicle;
    _unit moveInGunner _vehicle;
    _troops pushBack _unit;
    [_unit, _marker] call _fnc_initUnit;
    if (_vehicle isKindOf "StaticMortar") then { _unit disableAI "CHECKVISIBLE" };

    sleep 0.1;

} forEach _storedVehicles;
