// Handler to alert garrison if a group's combat mode level increases

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_newMode"];

if (_newMode != "COMBAT") exitWith {};
private _marker = leader _group getVariable "markerX";
if (isNil "_marker") exitWith {};       // might be ex-garrison? Unlikely


[_group, _marker] spawn {
    params ["_group", "_marker"];

    sleep (4 + random 4);                // give it a few seconds to recognise targets properly and call
    if !(leader _group call A3A_fnc_canFight) exitWith {};

    // Find target that this group knows most about
    private _targets = _group targets [true];
    if (_targets isEqualTo []) exitWith { Debug_1("Group %1 changed combat mode without targets", _group) };
    private _knowledge = _targets apply { _group knowsAbout _x };
    private _index = _knowledge find selectMax _knowledge;

    A3A_garrisonOps pushBack ["enemyInfo", [_marker, "detect", _targets#_index, _knowledge#_index]];
};
