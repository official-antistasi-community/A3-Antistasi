/*
    Author: John Jordan
    Description:
    Set speed/formation/combat mode based on group behaviour

    Arguments:
    <Group> Group to handle orders on.
    <String> Behaviour to use

    Return Value:
      N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
    [_group, "SAFE"] call A3A_fnc_patrolSetCombatModes;

    License: MIT License
*/

params ["_group", "_behaviour"];

if (_behaviour == "CARELESS") exitWith {};          // only use careless for forced movement special cases

if (_behaviour == "SAFE") then {
    // Sometimes groups enter SAFE and leave their units in AWARE. Looks weird.
    { if (behaviour _x != "SAFE") then {_x setBehaviour "SAFE"} } forEach units _group;
} else {
    // If group switched to AWARE or COMBAT then don't switch back for a while
    _group setVariable ["PATCOM_safeCheckTime", time+120];
};

private _modeParams = switch (_behaviour) do {
    case "COMBAT": { ["NORMAL", "WEDGE", "RED"] };
    case "AWARE": { ["NORMAL", "WEDGE", "YELLOW"] };
    case "SAFE": { ["LIMITED", "COLUMN", "YELLOW"] };
};
_modeParams params ["_speedMode", "_formation", "_combatMode"];

_group setSpeedMode _speedMode;
_group setFormation _formation;
_group setCombatMode _combatMode;
