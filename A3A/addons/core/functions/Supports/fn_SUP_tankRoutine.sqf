/*  Create and maintain close air support bomber

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <STRING> Resource pool of support, "attack" or "defence"
    <STRING> Marker name of source land base
    <NUMBER> Number of tanks to send
    <SCALAR> Delay time in seconds
    <SCALAR> Estimated resources already spent on support
//    <SCALAR> Amount of information to reveal to rebels, 0-1
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug_1("tankRoutine called with %1", _this);

params ["_suppData", "_resPool", "_base", "_vehCount", "_sleepTime", "_estResources"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];

sleep _sleepTime;

// Only spawn tanks
private _data = [_side, _base, _suppCenter, _resPool, _vehCount, _vehCount, 2, "Normal", true] call A3A_fnc_createAttackForceLand;
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];
Info_1("Spawn performed: Vehicles %1", _vehicles apply { typeOf _x });

// Update the resource usage for the final value
[_estResources - _resources, _side, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];


#define STATE_TRAVEL 1
#define STATE_ACQUIRE 2
#define STATE_ATTACK 3

private _timeOut = time + 1800;
private _remTargets = 2;
private _state = STATE_TRAVEL;
private _targetObj = objNull;

while {true} do
{
    private _remVehicles = _vehicles select { canFire _x and canMove _x and side _x == _side };
    if (_remVehicles isEqualTo []) exitWith {
        Info_1("%1 has been defeated, starting retreat", _supportName);
    };
    if (time > _timeOut) exitWith {
        Info_1("%1 has timed out, starting retreat", _supportName);
    };
    if (_remTargets <= 0) exitWith {
        Info_1("%1 has run out of targets, aborting routine", _supportName);
    };

    switch (_state) do
    {
        case STATE_TRAVEL: {
            if (_remVehicles inAreaArray [_suppCenter, _suppRadius, _suppRadius] isEqualTo []) exitWith { sleep 5 };

            Debug_1("%1 reached patrol zone, acquiring target", _supportName);
            _state = STATE_ACQUIRE;
            continue;
        };

        case STATE_ACQUIRE: {
            if (_suppTarget isEqualTo []) exitWith { sleep 5 };

            _targetObj = _suppTarget select 0;
            if !(_targetObj call A3A_fnc_canFight) exitWith {
                _suppTarget resize 0;
                Debug_1("%1 skips target, as it is already dead", _supportName);
            };
            Debug_2("Next target for %2 is %1", _suppTarget, _supportName);

            private _lastKnownPos = _suppTarget select 1;
            private _knownDist = _lastKnownPos distance2d getPosATL _targetObj;
            private _knowledge = random 0.3 + _knownDist / _suppRadius;

            {
                // reveal based on proximity to last known pos
                _x reveal [_targetObj, 4*_knowledge];

                { deleteWaypoint _x } forEachReversed (waypoints _x);
                private _attackWP = _x addWaypoint [_targetObj, 0];
                _attackWP setWaypointType "DESTROY";
                _attackWP waypointAttachVehicle _targetObj;
                private _sadWP = _x addWaypoint [_lastKnownPos, 0];
                _sadWP setWaypointType "SAD";

                _x setCurrentWaypoint ([_sadWP, _attackWP] select (_knowledge > random 0.5));
                _x setBehaviourStrong "COMBAT";
                _x setCombatMode "RED";

            } forEach _crewGroups;

            _timeout = _timeout + 300;
            _state = STATE_ATTACK;
            continue;
        };

        case STATE_ATTACK: {
            if (alive _targetObj and {_targetObj distance2D _suppCenter < _suppRadius}) exitWith { sleep 5 };

            _remTargets = _remTargets - 1;
            _suppTarget resize 0;           // clear target array so support routines can add the next

            if !(alive _targetObj) then {
                Debug_1("Target destroyed, %1 returns to cycle mode", _supportName);
            } else {
                Debug_1("Target evaded, %1 returns to cycle mode", _supportName);
            };

            {
                _x setBehaviourStrong "AWARE";
                _x setCombatMode "YELLOW";
            } forEach _crewGroups;

            _timeout = _timeout - 300;
            _state = STATE_ACQUIRE;
            continue;
        };
    };
};

_suppData set [4, 0];           // Set activesupport radius to 0, enables cleanup

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach (_crewGroups + _cargoGroups);
