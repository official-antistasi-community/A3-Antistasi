/*
    Author: [Hazey]
    Description:
        Checks for open static weapons near the AI group.

    Arguments:
        <Object> Group of units you want to search for StaticWeapon.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group] call A3A_fnc_patrolArmStatics;

    License: MIT License

    Notes:
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

private _assignedPairs = [];
private _leader = leader _group;

private _staticsNear = nearestObjects [_leader, ["StaticWeapon"], 150];

// Only get statics that are currently in working order.
_staticsNear = _staticsNear select {alive _x};

// Only get statics which currently are not crewed.
_staticsNear = _staticsNear select {(crew _x) isequalto []};

// Only get statics which are not current assigned.
_staticsNear = _staticsNear select {(_x getVariable ["PATCOM_STATIC_ASSIGNED", false]) == false};

// Only get statics with no players nearby.
if (side _leader != teamPlayer) then {
    _staticsNear = _staticsNear select {allPlayers inAreaArray [getPosATL _x, 50, 50] isEqualTo [];};
};

// Exit if no statics are near.
if (count _staticsNear == 0) exitWith {};

// Get all units in the current group looking for statics.
private _unitArray = units _group;

// We don't want the leader to arm the static.
_unitArray deleteAt (_unitArray find _leader);

// We verify that the unit is not already in a vehicle for some reason.
_unitArray = _unitArray select {isNull objectParent _x};

// Exit if no units are available to be used in the statics.
if (count _unitArray == 0) exitWith {};

{
    // Exit if unitArray is empty.
    if (count _unitArray == 0) exitWith {};

    private _unit = selectRandom _unitArray;
    if (_unit distance2D _x < 100) then {
        _assignedPairs pushback [_unit, _x, _group];
        _unitArray deleteAt (_unitArray find _unit);	
    };

} foreach _staticsNear;

if (count _assignedPairs isEqualTo 0) exitWith {};

{
    _x spawn {
        params ["_unit", "_static", "_group"];
        private _assignedGunner = assignedGunner _static;
        if ((isNull _assignedGunner) && {(_static getVariable ["PATCOM_STATIC_ASSIGNED", false]) == false}) then {
            [_unit] joinSilent grpnull;
            _static setVariable ["PATCOM_STATIC_ASSIGNED", true];
            _unit setCombatBehaviour "SAFE"; 
            _unit setUnitCombatMode "BLUE";

            if (PATCOM_DEBUG) then {
                [_unit, "STATIC FOUND", 5, "Green"] call A3A_fnc_debugText3D;
            };

            _unit doMove (getPosATL _static);
            _unit assignAsGunner _static;
            [_unit] orderGetIn true;

            while {(alive _unit) && {_unit distance _static > 4}} do {
                sleep 3;
            };
            _unit moveInGunner _static;
            _unit setCombatBehaviour "AWARE"; 
            _unit setUnitCombatMode "YELLOW";

            if (typeOf _static in FactionGet(all, "vehiclesArtillery")) then {
                [_group] call A3A_fnc_artilleryAdd;
            };

            [_unit, _static, _group] spawn {
                params ["_unit", "_static", "_group"];
                private _staticGreen = true;
                private _statictime = PATCOM_AI_STATIC_ARM;
                
                while {_staticGreen && {alive _unit} && {alive _static} && {!(isNull (gunner _static))} && {_unit distance2D (leader (group _unit)) < 500}} do {
                    sleep 5;
                    private _enemy = _unit findNearestEnemy _unit;
                    if (!(isNull _enemy)) then {
                            private _cansee = [_unit, "VIEW"] checkVisibility [eyePos _unit, eyePos _enemy];
                            if (_cansee > 0) then {
                                _statictime = _statictime + 3;
                            } else {
                                _statictime = _statictime - 5;
                            };
                    } else {
                        _statictime = _statictime - 5;
                    };

                    if (_statictime < 1) then {
                        _staticGreen = false;
                    };
                };				
                
                unassignVehicle _unit;
                _unit leaveVehicle _static;
                _static setVariable ["PATCOM_STATIC_ASSIGNED", false];
                doGetOut _unit;
                [_unit] joinSilent _group;
            
            };
        };		
    };	
} foreach _assignedPairs;