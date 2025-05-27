#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_group"];

// Assume that setGroupOwner has already been called by whatever called this function?
// Makes sense, as that's probably from the server...

// Add local killed EH if it's missing. Unit may not be at original locality
{
    if !(_x getVariable ["A3A_killedEH", false]) then {
        _unit addEventHandler ["Killed", A3A_fnc_rebelUnitKilledEH];
        _unit setVariable ["A3A_killedEH", true];
    };
} forEach units _group;

private _garrison = A3A_activeGarrison get _marker;

(_garrison get "groups") pushBack _group;
(_garrison get "troops") append units _group;
[_group, "Patrol_Defend", 0, 150, -1, true, markerPos _marker, false] call A3A_fnc_patrolLoop
