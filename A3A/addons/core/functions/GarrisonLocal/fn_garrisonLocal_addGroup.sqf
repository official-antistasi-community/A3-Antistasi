// Local garrison function for adding an already-spawned group
// Can be used by either enemy or rebel

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_group"];

// Group may not be local at this point, because setGroupOwner takes five seconds with zero ping. 
// patrolLoop seems to work but updateStatics does not, because splitting the group leaves units at the wrong locality
// Worked around in updateStatics

// Add local killed & handleDamage EH if it's missing. Unit may not be at original locality
{
    if (_x getVariable ["A3A_killedEH", false]) then { continue };
    if (side _group == teamPlayer) then {
        _x addEventHandler ["Killed", A3A_fnc_rebelUnitKilledEH];
        [_x] call A3A_fnc_initRevive;
    } else {
        _x addEventHandler ["HandleDamage", A3A_fnc_handleDamageAAF];
        _x addEventHandler ["Killed", A3A_fnc_enemyUnitKilledEH];
    };
    _x setVariable ["A3A_killedEH", true];
} forEach units _group;

private _garrison = A3A_activeGarrison get _marker;

(_garrison get "groups") pushBack _group;
(_garrison get "troops") append units _group;
[_group, "Patrol_Defend", 0, 150, -1, true, markerPos _marker, false, false] call A3A_fnc_patrolLoop;
_group deleteGroupWhenEmpty true;
_group addEventHandler ["CombatModeChanged", A3A_fnc_combatModeChangedEH];


// Will only work if they're close, but whatever
[_marker] call A3A_fnc_garrisonLocal_updateStatics;
