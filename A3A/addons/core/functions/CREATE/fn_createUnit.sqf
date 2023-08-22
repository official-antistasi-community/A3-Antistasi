/*
To be used instead of 'createUnit' scripting command.
Adds additional behaviour, including passing a loadout instead of a classname.

Arguments:
    <GROUP> _group - group to add the AI.
    <STRING> or <UnitLoadout> _type - a classname in CfgVehicles, or a unit loadout array.
    <Position>, <Position2D>, <OBJECT>, <GROUP> _position - position to create at.
    <ARRAY> _markers - markers the AI can be placed on.
    <SCALAR> _placement - placement radius.
    <STRING> _special - unit special placement.
    <HASHMAP> _identity - optional unit identity parameters, keys may include:
        - "face"
        - "speaker"
        - "pitch"
        - "firstName"
        - "lastName"
        All values of those keys must be strings except for "pitch" which is a number.
        If _identity parameter is not specified, a random identity will be applied to the unit according to its faction and type.
Return value:
    <OBJECT> - created unit.

Scope: Any
Environment: Any
Public: Yes

Example:
    [group, _type, position, markers, placement, special] call A3A_fnc_createUnit;
*/

#include "..\..\script_component.hpp"

params ["_group", "_type", "_position", ["_markers", []], ["_placement", 0], ["_special", "NONE"], "_identity"];

private _unitDefinition = A3A_customUnitTypes getVariable [_type, []];

private _unit = if (_unitDefinition isEqualTo []) then {
    _group createUnit [_type, _position, _markers, _placement, _special];
} else {
    _unitDefinition params ["_loadouts", "_traits", "_unitClass"];
    private _u = _group createUnit [_unitClass, _position, _markers, _placement, _special];
    _u setUnitLoadout selectRandom _loadouts;
    { _u setUnitTrait _x } forEach _traits;
    _u;
};

_unit setVariable ["unitType", _type, true];

private _identity = if (isNil "_identity") then {
    [Faction(side _unit), _type] call A3A_fnc_createRandomIdentity;
} else {
    _identity;
};
[_unit, _identity] call A3A_fnc_setIdentity;

_unit;
