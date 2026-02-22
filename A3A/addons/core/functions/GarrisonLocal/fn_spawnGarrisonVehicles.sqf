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

private _fullCrewed = [];           // boats, SAMs, arty, AA tanks
private _parked = [];               // TODO: other airport vehicles, might be crewed too

private _crewVar = ["A3A_crewed", "A3A_rebCrewed"] select (_side == teamPlayer);
private _places = A3A_spawnPlacesHM get _marker;
private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);

private _fullCrewTypes = ["vehicleAA", "vehicleArty", "vehicleSAM", "boat"];
private _supportVehIDs = _garrison get "vehActions" apply { _x#0 };

private _potentialBlockers = (_markerPos nearEntities 700) + (allDead inAreaArray [_markerPos, 700, 700]);
if (_marker == "Synd_HQ") then { _potentialBlockers = _potentialBlockers - [boxX, flagX, vehicleBox, fireX, mapX, petros] };

// pass in _pos, _class and _marker
private _fnc_isBlocked = {
    // Don't prefetch because vehicles can be placed outside marker
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
    _x params ["_class", "_posData", "_state", "_idNum"];

    if (_idNum in _supportVehIDs) then { continue };            // Vehicle already spawned as support
    private _vehicle = objNull;
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
        _vehicle setVariable ["A3A_vehPlaceType", _placeType];
        if (_placeType == "vehicle") then { _parked pushBack _vehicle };
        if (_side != teamPlayer and _placeType in _fullCrewTypes) then { _fullCrewed pushBack _vehicle };
        if ("static" in _placeType or _placeType == "vehicleRB") then { _vehicle setVariable ["A3A_crewed", true] };
    }
    else
    {
        // Arbitrary placement (probably rebel)
        _posData params ["_posWorld", "_vecDir", "_vecUp"];
        private _pos = ASLtoAGL _posWorld;           // blocker check is currently 2d anyway, but keep it consistent
        if (call _fnc_isBlocked) then { continue };
        isNil {
            _vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
            _vehicle setPosWorld _posWorld;
            _vehicle setVectorDirAndUp [_vecDir, _vecUp];
        };
    };
    if (_vehicle isKindOf "Land" and _vehicle emptyPositions "gunner" > 0) then { _vehicle setVariable ["A3A_rebCrewed", true] };

    _vehicles pushBack _vehicle;
    _vehicle setVariable ["markerX", _marker, true];
    _vehicle setVariable ["A3A_vehID", _idNum, [2, clientOwner]];
    if (!isNil "_state") then { [_vehicle, _state] call HR_GRG_fnc_setState };
    [_vehicle, _side, "garrison"] call A3A_fnc_AIVEHinit;

    // Fill vehicles that are only supposed to have a gunner
    if (_vehicle isNil _crewVar) then { sleep 0.1; continue };

    private _unitType = if (_side != teamPlayer) then {
        if (_storedTroops#0 == 0) then { sleep 0.1; continue };
        _storedTroops set [0, (_storedTroops#0) - 1];
        _faction get (["unitPoliceGrunt", "unitMilitiaGrunt", "unitGrunt", "unitGrunt"] select floor (_storedTroops#1 + random 0.99));
    } else {
        private _index = _storedTroops find (_faction get "unitCrew");
        if (_index == -1) then { _index = _storedTroops find (_faction get "unitRifle") };
        if (_index == -1) then { sleep 0.1; continue };      // No suitable units
        _storedTroops deleteAt _index;
    };

    private _groupType = ["staticGroup", "mortarGroup"] select (_vehicle isKindOf "StaticMortar");
    private _group = _garrison get _groupType;
    if (isNull _group) then { _group = createGroup [_side, true]; _garrison set [_groupType, _group] };

    private _unit = [_group, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _vehicle;
    _unit moveInGunner _vehicle;
    _troops pushBack _unit;
    [_unit, _marker] call _fnc_initUnit;
    if (_vehicle isKindOf "StaticMortar") then { _unit disableAI "CHECKVISIBLE" };

    sleep 0.1;

} forEach _storedVehicles;

// Rebels don't full-crew anything
if (_side == teamPlayer) exitWith {};

/*
// If it's an airbase, add extra defending vehicles (2 more if there's no AA vehicle)
if (_garrison get "type" == "airport") then {
    // Only want to crew armed vehicles, so we use threat as weight
    private _weights = _parked apply { A3A_groundVehicleThreat getOrDefault [typeOf _x, 0] };
Debug_2("Parked %1; weights %2", _parked, _weights);
    while { count _fullCrewed < 2 } do {
        private _vehicle = _parked selectRandomWeighted _weights;
        if (isNil "_vehicle") exitWith {};
        _weights set [_parked find _vehicle, 0];            // zero weight so that it won't be selected again
        _fullCrewed pushBack _vehicle;
    };
};
Debug_1("Fullcrewed %1", _fullCrewed);
*/

// Fill the fully-crewed vehicles
{
    private _vehicle = _x;
    private _countCrew = count fullCrew [_vehicle, "", true] - count fullCrew [_vehicle, "cargo", true];
    if (_storedTroops#0 < _countCrew) exitWith {};
    _storedTroops set [0, (_storedTroops#0) - _countCrew];

    private _group = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
    {[_x, _marker] call _fnc_initUnit} forEach units _group;
    _troops append units _group;
    _groups pushBack _group;
    _group deleteGroupWhenEmpty true;

    switch (_vehicle getVariable ["A3A_vehPlaceType", "none"]) do {
        case "vehicleAA": {
            [_group, "Patrol_Area", 25, 100, 250, true, _markerPos, false, false] call A3A_fnc_patrolLoop;
        };
        case "vehicles": {
            // Otherwise move the units out of the vehicle
            //[_vehicle] call A3A_fnc_setupParkedCrew;
        };
        // Arty & SAM just sit there
    };

    sleep 0.3; continue;
} forEach _fullCrewed;

