// Handler to alert garrison if a group's combat mode level increases

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_newMode"];

Trace_2("Group %1 initiated combat mode change to %2", _group, _newMode);

if (_newMode != "COMBAT") exitWith {};
private _marker = leader _group getVariable "markerX";
if (isNil "_marker") exitWith {};       // might be ex-garrison? Unlikely

// If we have any false targets (parked vehicles etc), clear them now
private _enemySides = [teamPlayer, Occupants, Invaders] - [side _group];
private _badTargets = _group targets [true] select { !(side _x in _enemySides) };
{ _group reveal [_x, 4] } forEach _badTargets;

[_group, _marker, _enemySides] spawn {
    params ["_group", "_marker", "_enemySides"];

    sleep (4 + random 4);                // give it a few seconds to recognise targets properly and call
    if !(leader _group call A3A_fnc_canFight) exitWith {};

    // Make sure target is actually enemy. If not, reset to AWARE and bail
    Trace_4("Group %1 at %2 changed combat mode to %3 due to targets %4", _group, _marker, combatBehaviour _group, _group targets [true]);
    private _targets = _group targets [true] select { side _x in _enemySides };
    if (_targets isEqualTo []) exitWith {
        Debug_1("Group %1 changed combat mode without enemy targets", _group);
        _group setCombatBehaviour "AWARE";
    };

    // Trigger any extra combat mode behaviour
    if !(_group isNil "A3A_triggerOnCombat") then {
        [_group, _marker] spawn (_group getVariable "A3A_triggerOnCombat");
    };

    // Find target that this group knows most about
    private _knowledge = _targets apply { (_group knowsAbout _x) min 4 };           // sometimes returns max-float
    private _index = _knowledge find selectMax _knowledge;

    A3A_garrisonOps pushBack ["enemyInfo", [_marker, "detect", _targets#_index, _knowledge#_index]];
};
