/*  Finds a garrison artillery piece to perform a strike on a position

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here.
    <OBJECT|BOOL> No longer used here.
    <POS2D> Target position for initial artillery strike
    <SCALAR> 0-1, higher values more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, -1 for failed
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

// Uses server-side garrison support vehicle data to find suitable vehicle
// Should be done unscheduled because something else might use the selected artillery
private _success = false;
isNil {

    // First search enemy airports for artillery
    private _bases = airportsX select { sidesX getVariable _x == _side };
    private _artillery = [];          // [_marker, _vehEntry]
    {
        if (markerPos _x distance2d _targPos < 700) then { continue };      // Don't use local artillery
        private _base = _x;
        {
            if (_y#0 != "ready" or _y#1 != "vehiclesArtillery") then { continue };
            _artillery pushBack [_base, _y#2];
        } forEach (A3A_garrison get _base get "supportVehicles");
    } forEach _bases;

    // Then pick a random one that's within range
    private _artyData = [];
    while {_artillery isNotEqualTo []} do
    {
        (_artillery deleteAt floor random count _artillery) params ["_base", "_vehEntry"];
        _vehEntry params ["_vehType", "_posData", "", "_vehID"];

        private _artyPos = if (_posData isEqualType []) then { _posData#0 } else { A3A_spawnPlacesHM get _base select _posData select 1 };
        private _artyDist = _artyPos distance2d _targPos;

        private _magHM = [_vehType] call A3A_fnc_getMortarMags select 1;
        private _magType = _magHM getOrDefault ["HE", ""];

        ([_vehType, _magType] call A3A_fnc_getArtilleryRanges) params ["_minRange", "_maxRange"];
        if (_artyDist > _minRange and _artyDist < _maxRange) exitWith { _artyData = [_base, _vehID] };
    };
    if (_artyData isEqualTo []) exitwith { Debug("No bases found for artillery support") };

    // Extra aggro/tier based delay
    private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
    if (_delay < 0) then { _delay = (0.5 + random 1) * (150 - 5*tierWar - 0.5*_aggro) };

    Info_5("Artillery support %1 against %2 with delay %3 will be carried out by mortar ID %4 from %5", _supportName, _targPos, _delay, _artyData#0, _artyData#1);

    // Any point in this for single-target?
    //[_reveal, _side, "ARTILLERY", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

    A3A_supportStrikes pushBack [_side, "AREA", _targPos, time + 20*60, 20*60, 200];

    [_artyData#0, _artyData#1, [_targPos, _delay, _reveal]] call A3A_fnc_garrisonServer_vehAction;
    _success = true;
};

// Per-volley cost
[-1, 80] select _success;
