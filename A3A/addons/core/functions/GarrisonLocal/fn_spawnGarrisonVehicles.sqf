/*
    Spawn vehicles (sometimes crewed) in garrison
    Worker function for spawnGarrison, runs on server and HCs
*/

params ["_activeGarrison", "_marker", "_side", "_storedTroops", "_storedVehicles"];
private _faction = Faction(_side);
private _markerPos = markerPos _marker;

private _groups = _activeGarrison get "groups";
private _vehicles = _activeGarrison get "vehicles";
private _troops = _activeGarrison get "troops";

private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);
private _groupStatics = grpNull;
{
    _x params ["_class", "_posData"];

    private _vtype = call {
        if (_class isKindOf "Helicopter") exitWith {"heli"};
        if (_class isKindOf "Air") exitWith {"plane"};
        "vehicle"
    };

    private _vehicle = objNull;
    if (_posData isEqualType 0) then
    {
       	private _spawnParams = [_marker, _vtype, _posData] call A3A_fnc_takeSpawnPosition;
        if (_spawnParams isEqualType false) exitWith {};        // blocked by support mortar probably?
        isNil {
            _vehicle = _class createVehicle [_class, _spawnParams#0, [], 0, "CAN_COLLIDE"];
            _vehicle setDir _spawnParams#1;
            _vehicle setVariable ["spawnPlace", _spawnParams#2];
        };
    } else {
        // Arbitrary placement (probably rebel)
        _posData params ["_posWorld", "_vecUp", "_vecDir"];
        isNil {
            _static = createVehicle [_class, _posWorld, [], 0, "CAN_COLLIDE"];
            _static setPosWorld _posWorld;
            _static setVectorDirAndUp [_vecDir, _vecUp];
        };
    };
    _vehicles pushBack _vehicle;
    _vehicle setVariable ["markerX", _marker, true];
    [_vehicle, _side] call A3A_fnc_AIVEHinit;

    if (_side != teamPlayer) then {
        // TODO: same for boat?
        if (_vehicle in (_faction get "vehiclesAA")) then {
            private _countCrew = count fullCrew [_vehicle, "", true] - count fullCrew [_vehicle, "cargo", true];
            if (_storedTroops#0 < _countCrew) then { continue };
            _storedTroops set [0, (_storedTroops#0) - _countCrew];

            private _group = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
            {[_x, _marker] call _fnc_initUnit} forEach units _group;
            _troops append units _group;
            _groups pushBack _group;
            [_group, "Patrol_Area", 25, 100, 250, true, _markerPos, false] call A3A_fnc_patrolLoop;
            continue;
        };
        if !(_marker in controlsX) then { continue };
    };

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

    if (isNull _groupStatics) then { _groupStatics = createGroup _side };

    private _unit = [_groupStatics, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit assignAsGunner _vehicle;
    _unit moveInGunner _vehicle;
    _troops pushBack _unit;
    [_unit, _marker] call _fnc_initUnit;

    sleep 0.2;

} forEach _storedVehicles;
