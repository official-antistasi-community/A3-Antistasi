// Spawn active unit in rebel garrison, ideally in current group

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_unitType"];

private _garrison = A3A_activeGarrison get _marker;
private _groups = _garrison get "groups";

private _group = grpNull;
{
    if !(_x getVariable ["PATCOM_Controlled", false]) then { continue };        // wat?
    if (count units _x < 8) exitWith { _group = _x };
} forEach _groups;


if (isNull _group) then {
    Info("Creating new group");
    _group = createGroup teamPlayer;
    _group deleteGroupWhenEmpty true;
    _group addEventHandler ["CombatModeChanged", A3A_fnc_combatModeChangedEH];
    _groups pushBack _group;
    [_group, "Patrol_Defend", 0, 150, -1, true, markerPos _marker, false, false] spawn A3A_fnc_patrolLoop;        // won't run until after the isNil
};

private _unit = [_group, _unitType, markerPos _marker, [], 0, "NONE"] call A3A_fnc_createUnit;
if (_unitType isEqualTo FactionGet(reb,"unitSL")) then {_group selectLeader _unit};
[_unit, _marker] call A3A_fnc_FIAinitBases;
(_garrison get "troops") pushBack _unit;

if (_unitType isEqualTo FactionGet(reb,"unitRifle")) then { [_marker] call A3A_fnc_garrisonLocal_updateStatics };
