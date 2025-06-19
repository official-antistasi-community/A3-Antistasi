/*
    Author: [Hazey]
    Description:
        Setup Variable on Group

    Arguments:
        <Group> Group to setup variable on.

    Return Value:
        <Bool> Script Completed True/False

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group] call A3A_fnc_patrolGroupVariables;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

// We exit here if the group is empty. It's a waste of performance to handle empty groups.
if (count units _group <= 0) exitWith {
    if (PATCOM_DEBUG) then {
        ServerDebug_1("PATCOM | Group: %1 is Empty", _group);
    };
};

// Skip if Group is already being controlled by the PATCOM or is Civilian Controlled.
if (_group getVariable "PATCOM_Controlled") exitWith {
    if (PATCOM_DEBUG) then {
        ServerDebug_1("PATCOM | Group: %1 is already controlled", _group);
    };
};

If (PATCOM_DEBUG) then {
    ServerDebug_2("PATCOM | Setting up Variables on group: %1 - side: %2", _group, side (leader _group));
};

if ((side leader _group) == civilian) then {
    // Patrol Type, Min Patrol, Max Patrol, Max Distance, From Center, Center Pos, Search Buildings
    if ((count (_group getVariable ["PATCOM_Patrol_Params", []])) == 0) then {
        _group setVariable ["PATCOM_Patrol_Params", ["Civilian", 10, 50 + (random 50), -1, true, getPosATL (leader _group), true]];
    };

    _group setVariable ["PATCOM_Patrol_Home", getPosATL (leader _group)];

    {
        _x forceWalk true;
        _x disableAI "AUTOCOMBAT";
    } forEach units _group;
    
    _group setVariable ["PATCOM_ForceWalk", true];

    // Set Group to being controlled by PATCOM so we don't init variables again.
    _group setVariable ["PATCOM_Controlled", true];
} else {

    // Patrol Type, Min Patrol, Max Patrol, Max Distance, From Center, Center Pos, Search Buildings
    if ((count (_group getVariable ["PATCOM_Patrol_Params", []])) == 0) then {
        _group setVariable ["PATCOM_Patrol_Params", ["Patrol_Area", 50, 100, -1, true, getPosATL (leader _group), false]];
    };

    _group setVariable ["PATCOM_Patrol_Home", getPosATL (leader _group)];
    _group setVariable ["PATCOM_Group_State", "CALM"];

    // Set Group to being controlled by PATCOM so we don't init variables again.
    _group setVariable ["PATCOM_Controlled", true];

    if (PATCOM_DEBUG) then {
        {
            private _PathEH = _x addEventHandler ["PathCalculated", {
                _this spawn A3A_fnc_debug3DPath;
            }];
        } foreach (units _group);
    };
};