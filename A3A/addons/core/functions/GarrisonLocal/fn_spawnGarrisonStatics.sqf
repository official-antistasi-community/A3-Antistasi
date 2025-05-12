/*
    Spawn statics & crew in garrison
    Worker function for spawnGarrison, runs on server and HCs
*/

params ["_activeGarrison", "_marker", "_side", "_storedTroops", "_storedStatics"];
private _faction = Faction(_side);
private _markerPos = markerPos _marker;

private _groups = _activeGarrison get "groups";
private _statics = _activeGarrison get "statics";
private _troops = _activeGarrison get "troops";

// Spawn statics & crew
private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);
private _groupStatics = grpNull;
{
    _x params ["_class", "_posOrType", "_upOrPlace", "_vecDir"];

    private _static = objNull;
    if (_posOrType isEqualType "") then
    {
        // Mortar/MG/AA spawn place
        ((A3A_spawnPlacesHM get _marker) get _posOrType) params ["_pos", "_dir", "_building"];
        if (damage _building >= 1 or isObjectHidden _building) then {
            Info_2("Spawn of %1 in %2 blocked because building destroyed", _class, _marker);
            continue;
        };
        private _blockers = _pos nearEntities ["StaticWeapon", 2];
        if (_blockers isNotEqualTo []) then {
            Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
            continue;
        };
        isNil {
            _static = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
            _static setDir _dir;
        };
        };
    } else {
        // Arbitrary placement (probably rebel)
        private _blockers = (ASLtoATL _posOrType) nearEntities ["StaticWeapon", 2];
        if (_blockers isNotEqualTo []) then {
            Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
            continue;
        };
        isNil {
            _static = createVehicle [_class, _posOrType, [], 0, "CAN_COLLIDE"];
            _static setPosWorld _posOrType;
            _static setVectorDirAndUp [_vecDir, _upOrPlace];
        };
    };
    _statics pushBack _static;
    _static setVariable ["markerX", _marker, true];
    [_static, _side] call A3A_fnc_AIVEHinit;

    private _unitType = _faction get "unitRifle";
    if (_side != teamPlayer) then {
        if (_storedTroops#0 == 0) then { continue };
        _storedTroops set [0, (_storedTroops#0) - 1];
    } else {
        private _index = _storedTroops find (_faction get "unitCrew");
        if (_index == -1) then { _index = _storedTroops find (_faction get "unitRifle") };
        if (_index == -1) then { continue };      // No suitable units
        _unitType = _storedTroops deleteAt _index;
    };

    private _group = call {
        if (_static isKindOf "StaticMortar") exitWith { createGroup _side };
        if (isNull _groupStatics) then { _groupStatics = createGroup _side; _groups pushBack _groupStatics };
        _groupStatics;
    };

    private _unit = [_group, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _static;
    _unit moveInGunner _static;
    _troops pushBack _unit;
    [_unit, _marker] call _fnc_initUnit;

    if (_static isKindOf "StaticMortar") then {
        [_group] call A3A_fnc_artilleryAdd;
        _groups pushBack _group;
    };
    sleep 0.1;

} forEach _storedStatics;

// TODO: could do with slightly better group handling here?
// do we need to mark the static groups locally?
