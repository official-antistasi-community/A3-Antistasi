/*  Finds a garrison SAM to attack a target

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent (occupants or invaders)
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here.
    <OBJECT> Target of the support.
    <POSITION> No longer used.
    <SCALAR> Reveal value 0-1, higher values mean more information provided about support
    <SCALAR> Optional setup delay time in seconds, otherwise will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, or -1 for failure
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

// Pass in vehicle posATL and target, returns true if reachable
private _fnc_checkSAMPath = {
    params ["_pos", "_target"];
    private _targDir = _pos getDir _target;
    private _intercept = ATLtoASL _pos vectorAdd [300*sin _targDir, 300*cos _targDir, 200];
    if (terrainIntersectASL [_intercept, getPosASL _target]) exitWith {false};
    _pos distance2d _target > 1500;
};
private _bases = airportsX inAreaArray [_target, 10000, 10000] select { sidesX getVariable _x == _side }
    select { [markerPos _x, _target] call _fnc_checkSAMPath };

private _success = false;
isNil {
    private _usedBases = [];
    private _weightedBases = [];
    {
        // Check if there's a SAM available at that base and find vehID for it
        private _base = _x;
        {
            if (_y#1 != "vehiclesSAM") then { continue };
            if (_y#0 != "ready") exitWith { _usedBases pushBack _base };      // strictly one SAM per airport... 
            _weightedBases pushBack [_base, _x];
            _weightedBases pushBack (1e8 / (markerPos _base distance2d _target)^2);       // prefer more distant bases
        } forEach (A3A_garrison get _base get "supportVehicles");
    } forEach _bases;

    // Extra aggro/tier based delay. Need now so we can increase it
    private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
    if (_delay < 0) then { _delay = (0.5 + random 1) * (150 - 5*tierWar - 0.5*_aggro) };

    private _samData = [];
    if (_weightedBases isNotEqualTo []) then {
        _samData = selectRandomWeighted _weightedBases
    } else {
        // If none, then add one at a suitable airfield
        private _vehType = selectRandom (Faction(_side) get "vehiclesSAM");
        private _freeBases = (_bases - _usedBases) select { spawner getVariable _x == 2 };
        if (count _freeBases == 0) exitWith { Debug("No suitable airbases to spawn SAM") };
        private _base = selectRandom _freeBases;

        if ([_base, _vehType, "vehicleSAM"] call A3A_fnc_garrisonServer_addVehicleType) then
        {
            // Successfully added the vehicle. It'll be on the end of the vehicle array
            [-(A3A_vehicleResourceCosts get _vehType), _side, _resPool] call A3A_fnc_addEnemyResources;
            private _vehEntry = A3A_garrison get _base get "vehicles" select -1;
            _samData = [_base, _vehEntry#3];

            if (_delay != 0) then { _delay = _delay + 12*A3A_enemyResponseTime };
            [_reveal, _side, "SAM", getPosATL _target, _delay] spawn A3A_fnc_showInterceptedSetupCall;
        };
    };
    if (_samData isEqualTo []) exitwith {};
    _samData params ["_marker", "_vehID"];

    A3A_supportStrikes pushBack [_side, "TARGET", _target, time + 1200, 1200, 100];

    Info_5("SAM support %1 against %2 with delay %3 will be carried out by vehicle ID %4 from %5", _supportName, _target, _delay, _vehID, _marker);

    [_marker, _vehID, [_target, _delay, _reveal]] call A3A_fnc_garrisonServer_vehAction;
    _success = true;
};

// Per-volley cost
[-1, 80] select _success;
