#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitType"];

Info_1("Called spawnUnit with unit type %1", _unitType);

isNil {
    private _garrison = A3A_activeGarrison get _marker;
    private _groups = _garrison get "groups";

    private _group = grpNull;
    {
        if !(_x getVariable ["PATCOM_Controlled", false]) then { continue };
        if (count units _x < 8) exitWith { _group = _x };
    } forEach _groups;


    if (isNull _group) then {
        Info("Creating new group");
        _group = createGroup teamPlayer;
        _groups pushBack _group;
        [_group, "Patrol_Defend", 0, 150, -1, true, markerPos _marker, false] spawn A3A_fnc_patrolLoop;        // won't run until after the isNil
    };
    Info_1("Spawning new unit of type %1", _unitType);

    private _unit = [_group, _unitType, markerPos _marker, [], 0, "NONE"] call A3A_fnc_createUnit;
    if (_unitType isEqualTo FactionGet(reb,"unitSL")) then {_group selectLeader _unit};
    [_unit, _marker] call A3A_fnc_FIAinitBases;
    (_garrison get "troops") pushBack _unit;
};
