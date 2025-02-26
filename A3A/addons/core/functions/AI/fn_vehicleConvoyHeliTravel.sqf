/*
 * File: fn_vehicleConvoyHeliTravel.sqf
 * Function: 
 * Author: <author>
 * Function description
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_heli", "_convoyObj", "_maxSpeed"];

private _heliGroup = group _heli;

// we want the heli to land near the enemies.
if((typeOf _heli) in FactionGet(all, "vehiclesHelisTransport") + FactionGet(all,"vehiclesHelisLight")) then 
{
    _heliGroup addEventHandler ["CombatModeChanged", {
	    params ["_group", "_newMode"];
        if(_newMode isEqualTo "COMBAT") then 
        {

        };
    }];
};

if((typeOf _heli) in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) then 
{
    _heliGroup addEventHandler ["EnemyDetected", {
	    params ["_group", "_newTarget"];
        
        [vehicle leader _group, _group, getPosATL _newTarget] spawn A3A_fnc_attackHeli;
    }];
};


private _speedSet = false;

while{alive _heli && alive _convoyObj} do {

    private _wp = _heliGroup addWaypoint [_convoyObj, 50];
    _wp setWaypointType "MOVE";
    _heliGroup setCurrentWaypoint _wp;

    if(_heli distance2D _convoyObj < 100 && !_speedSet) then 
    {
        _heli limitSpeed _maxSpeed;
       _wp setWaypointBehaviour "AWARE";
       _speedSet = true;
    };

    sleep 3;
};

