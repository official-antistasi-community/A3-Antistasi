/*
    Author: [Hazey]
    Description:
        Patrol Loop, Add's units to Array to be controlled.

    Arguments:
        <Group> Group whom you want to give PATCOM control over.
        <String> Patrol Types. "Patrol_Area", "Patrol_Defend", "Patrol_Attack". Etc.
        <Number> Minimum Patrol distance.
        <Number> Maxiumum Patrol distance.
        <Number> Max distance unit can go before needing to return home/center.
        <Bool> Should patrol happen from center of spawn. False means that it uses it current position to patrol.
        <Array> Center Position of unit. Typically where it spawned.
        <Bool> Should this unit search buildings?

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_groupX, "Patrol_Area", 25, 150, 150, false, _positionX, true] call A3A_fnc_patrolLoop;

    License: MIT License

    Note:
        The From Center can be a little bit confusing. Create a circle in your head and place it where the unit spawned.
        If From center is set to true. It will only patrol within the circle. However if it is set to false. When the 
        unit reaches its end patrol point. The circle moves to its current position and they get a new patrol point within
        that new radius allowing them to venture out further and more dynamically.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group",
    ["_patrolType", "Patrol_Area"], 
    ["_minDist", 0], 
    ["_maxDist", 100], 
    ["_dist", -1], 
    ["_fromCenter", true], 
    ["_centerPos", []], 
    ["_searchBuildings", false]
];

private _scriptHandle = [_group, _patrolType, _minDist, _maxDist, _dist, _fromCenter, _centerPos, _searchBuildings] spawn {
    params ["_group","_patrolType", "_minDist", "_maxDist", "_dist", "_fromCenter", "_centerPos", "_searchBuildings"];
    
    // Exit if the group is Null, or Empty.
    if ((isNull _group) || (({alive _x} count units _group) < 1)) exitWith {};

    if (count _centerPos < 3) then {
        _centerPos = (getPosATL (leader _group));
    };

    if !((side leader _group) == civilian) then {
        _group setVariable ["PATCOM_Patrol_Params", [_patrolType, _minDist, _maxDist, _dist, _fromCenter, _centerPos, _searchBuildings]];
    };

    // Will not run unless PATCOM_Controlled is set to false.
    [_group] call A3A_fnc_patrolGroupVariables;

    while {true} do {
        if ((isNull _group) || (({alive _x} count units _group) < 1)) exitWith {};

        if ((side leader _group) == civilian) then {
            [_group] call A3A_fnc_patrolCivilianCommander;
        } else {
            [_group] call A3A_fnc_patrolCommander;
        };

        sleep (round (((count allunits) / 2) * 1.2));
    };
};

_group setVariable ["A3A_AIScriptHandle", _scriptHandle];
