/*
    Author: [Hazey]
    Description:
        Main Patrol Logic

    Arguments:
        <Group> Group to handle orders on.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group] call A3A_fnc_patrolCommander;

    License: MIT License

    Notes:
        https://community.bistudio.com/wiki/Code_Optimisation

        Reading the above link, its better to use an if switch rather than a switch itself.
        An if switch runs at 0.0032ms and switch itself runs at 0.0047ms. These values will scale as the switch gets bigger.
        This is way faster than doing a standard FSM and I have opted to use the if switch.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

// We exit here if the group is empty. It's a waste of performance to handle empty groups.
if (count units _group == 0) exitWith {
    If (PATCOM_DEBUG) then {
        ServerDebug_1("PATCOM | Group Eliminated, Exiting PATCOM Group: %1", _group);
    };
};

private _patrolParams = _group getVariable "PATCOM_Patrol_Params";
private _currentOrders = _patrolParams # 0;

// Handle Patrol Formations, Exits if already set and time not expired.
[leader _group] call A3A_fnc_patrolHandleFormation;


// If autoattack is enabled, check if enemies are near and change to attack orders
if (_group getVariable ["PATCOM_AutoAttack", true]) then {
    if (_currentOrders in ["Patrol_Attack", "Patrol_Water"]) exitWith {};

    private _knownEnemies = _group targets [true, PATCOM_VISUAL_RANGE, [], PATCOM_TARGET_TIME];
    if (_knownEnemies isEqualTo []) exitWith {};
    private _distances = _knownEnemies apply { _x distance2d leader _group };
    private _nearEnemy = _knownEnemies select (_distances find selectMin _distances);       // fuck Arma

    // Set Current Orders to Attack.
    _group setVariable ["PATCOM_Previous_Orders", _patrolParams];
    _patrolParams = ["Patrol_Attack", 0, 50, -1, false, getPosATL _nearEnemy, false];     // mostly irrelevant
    _currentOrders = _patrolParams # 0;
    _group setVariable ["PATCOM_Group_State", "COMBAT"];            // what does this do?
};


If (PATCOM_DEBUG) then {
    ServerDebug_3("PATCOM | Group: %1 | Current Orders: %2 | Group State: %3", _group, _currentOrders, _group getVariable "PATCOM_Group_State");
};

if (_currentOrders == "Patrol_Attack") exitWith {
    [_group, _patrolParams#2, _patrolParams#5] call A3A_fnc_patrolAttack;
};

if (_currentOrders == "Patrol_Defend") exitWith {
    [_group, _patrolParams#1, _patrolParams#2, _patrolParams#4, _patrolParams#5] call A3A_fnc_patrolDefend;
};

if (_currentOrders == "Patrol_Area") exitWith {
    [_group, _patrolParams#1, _patrolParams#2, _patrolParams#3, _patrolParams#4, _patrolParams#5, _patrolParams#6] call A3A_fnc_patrolArea;
};

if (_currentOrders == "Patrol_Water") exitWith {
    [_group, _patrolParams#1, _patrolParams#2, _patrolParams#3, _patrolParams#4, _patrolParams#5] call A3A_fnc_patrolWater;
};