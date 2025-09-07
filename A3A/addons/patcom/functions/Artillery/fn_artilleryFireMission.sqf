/*
    Author: [Hazey]
    Description:
        Calls artillery firemission to select a battery and fire at a given location.

    Arguments:
        <Object> Mortar to use for artillery strike.
        <Array> Position where you want the artillery strike to happen.
        <Number> Area in which you want the artillery strike to happen in.
        <String> Type of round, "HE", "Flare", "Smoke".
        <Number> Number of rounds you want fired.
        <Number> Setup delay before firing in seconds.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [getPosATL _instigator, (random 150), "HE", 6, _unit] call A3A_fnc_artilleryFireMission;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_mortar", "_targetPos", "_area", "_roundType", "_rounds", ["_delay", PATCOM_ARTILLERY_DELAY]];

//private _batteryArray = [];
private _side = side _group;
/*
/////// GET ACTIVE BATTERY ARRAY FOR CALLERS SIDE \\\\\\\
{
    if !(_x getVariable ["PATCOM_ArtilleryBusy", false]) then {
        {
            private _veh = vehicle _x;
            private _class = typeOf _veh;
            if ((_class == "") || (gunner _veh != _x)) then { continue; };
            private _artyChk = getNumber(configfile/"CfgVehicles"/_class/"artilleryScanner");
            if (_artyChk isEqualTo 1) then {
                if !(_veh in _batteryArray) then {
                    _batteryArray pushBackUnique _veh;
                };
            };
        } forEach (units _x);
    };
} forEach ((groups _side) select {_x getVariable ["PATCOM_ArtilleryBattery", false]});

if (count _batteryArray == 0) exitWith {
    If (PATCOM_DEBUG) then {
        [leader _callerGroup, "NO SUPPORT AVAILABLE", 5, "Red"] call A3A_fnc_debugText3D;
    };
};

private _selectedBattery = selectRandom _batteryArray;


*/
private _selectedBattery = _mortar;
private _group = group (gunner _selectedBattery);
private _batteryClass = (typeOf _selectedBattery);
private _dayState = [] call A3A_fnc_getDayState;
private _reloadTime = [_selectedBattery] call A3A_fnc_getReloadTime;
private _roundType = "HE";

// Set Artillery to busy
_selectedBattery setVariable ["PATCOM_ArtilleryBusy", true, true];

/////// CHECK IF UNITS ARE IN DANGER CLOSE PROXIMITY \\\\\\\
if ([_targetPos, _area, _side] call A3A_fnc_artilleryDangerClose) then {
    If (PATCOM_DEBUG) then {
        [leader _group, "DANGER CLOSE", 5, "Yellow"] call A3A_fnc_debugText3D;
    };

    if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
        _roundType = "Flare"; // Need to add flare into templates.
    } else {
        _roundType = "Smoke";
    };
};
Trace_1("Round type %1", _roundType);

/////// GET ARTILLERY ROUND TYPE FROM TEMPLATES \\\\\\\
private _faction = Faction(_side);
private _shellType = "";
if (_batteryClass in (_faction get "vehiclesArtillery")) then {
    private _shellArray = _faction get "magazines" get _batteryClass;
    _shellType = (_shellArray # 0);
};
if (_shellType == "" and _batteryClass isKindOf "StaticMortar") then {
    private _mags = [_batteryClass] call A3A_fnc_getMortarMags;
    _shellType = _mags get _roundType;
};

if (_shellType == "") exitWith {
    ServerDebug_2("Unable to find ammoType %1 for %2", _roundType, _batteryClass);
    _selectedBattery setVariable ["PATCOM_ArtilleryBusy", false, true];
};
Trace_1("Shell type %1", _shellType);


/////// FINAL ARTILLERY RANGE CHECK \\\\\\\
if !(_targetPos inRangeOfArtillery [[_selectedBattery], _shellType]) exitWith {
    If (PATCOM_DEBUG) then {
        [leader _group, "OUT OF RANGE", 5, "Red"] call A3A_fnc_debugText3D;
    };
    _selectedBattery setVariable ["PATCOM_ArtilleryBusy", false, true];
};

/////// DO ARTILLERY FIRE \\\\\\\
[_group, _targetPos, _area, _selectedBattery, _shellType, _rounds, _reloadTime, _delay] spawn {
    params ["_group", "_targetPos", "_area", "_selectedBattery", "_shellType", "_rounds", "_reloadTime", "_delay"];

    sleep _delay;

    for "_i" from 1 to _rounds do {
        //private _finalTargetPos = [_targetPos, (random 50), _area, 0, 1, -1, 0] call A3A_fnc_getSafePos;
        private _finalTargetPos = _targetPos getPos [_area * sqrt random 1, random 360];
        _selectedBattery doArtilleryFire [_finalTargetPos, _shellType, 1];
        If (PATCOM_DEBUG) then {
            [leader _group, "ROUND AWAY", 1, "Green"] call A3A_fnc_debugText3D;
        };
        sleep (_reloadTime + (2 + (random 4)));
    };

    _selectedBattery setVariable ["PATCOM_ArtilleryBusy", false, true];
};