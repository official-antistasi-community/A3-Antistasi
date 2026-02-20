/*  Finds a garrison mortar to perform a mortar strike on a position

Environment: Server, scheduled, internal

Arguments:
    <STRING> The (unique) name of the support, mostly for logging
    <SIDE> The side from which the support should be sent
    <STRING> Resource pool used for this support. Should be "attack" or "defence"
    <SCALAR> Maximum resources to spend. Not used here.
    <OBJECT|BOOL> Ignored now
    <POS2D> Target position for initial mortar strike
    <SCALAR> 0-1, higher values more information provided about support
    <SCALAR> Setup delay time in seconds, if negative will calculate based on war tier

Returns:
    <SCALAR> Resource cost of support call, -1 for failed
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];


// Search outpost and airport garrisons within 4km for available garrison mortars
// Should be done unscheduled because something else might use the selected mortar

private _success = false;
isNil {

    // First search enemy bases for mortars
    private _bases = (outposts + airportsX) inAreaArray [_targPos, 4000, 4000] select { sidesX getVariable _x == _side };
    private _mortars = [];          // [_marker, _vehEntry]
    {
        if (markerPos _x distance2d _targPos < 700) then { continue };      // Don't use local mortars
        private _base = _x;
        {
            if (_y#0 != "ready" or _y#1 != "staticMortars") then { continue };
            _mortars pushBack [_base, _y#2];
        } forEach (A3A_garrison get _base get "supportVehicles");
    } forEach _bases;

    // Then pick a random one that's within range
    private _mortarData = [];
    while {_mortars isNotEqualTo []} do {
        (_mortars deleteAt floor random count _mortars) params ["_base", "_vehEntry"];
        _vehEntry params ["_vehType", "_posData", "", "_vehID"];

        private _mortarPos = if (_posData isEqualType []) then { _posData#0 } else { A3A_spawnPlacesHM get _base select _posData select 1 };
        private _mortarDist = _mortarPos distance2d _targPos;

        private _magHM = [_vehType] call A3A_fnc_getMortarMags select 1;
        private _magType = _magHM getOrDefault ["HE", ""];

        ([_vehType, _magType] call A3A_fnc_getArtilleryRanges) params ["_minRange", "_maxRange"];
        if (_mortarDist > _minRange and _mortarDist < _maxRange) exitWith { _mortarData = [_base, _vehID] };
    };
    if (_mortarData isEqualTo []) exitwith { Debug("No bases found for mortar support") };

    // Should probably remove the extra 30 seconds at the far end...
    private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
    if (_delay < 0) then { _delay = (0.5 + random 1) * (120 - 5*tierWar - 0.5*_aggro) };

    Info_5("Mortar support %1 against %2 with delay %3 will be carried out by mortar ID %4 from %5", _supportName, _targPos, _delay, _mortarData#0, _mortarData#1);

    // Any point in this for single-target?
    //[_reveal, _side, "MORTAR", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

    A3A_supportStrikes pushBack [_side, "AREA", _targPos, time + 20*60, 20*60, 100];

    [_mortarData#0, _mortarData#1, [_targPos, _delay, _reveal]] call A3A_fnc_garrisonServer_vehAction;
    _success = true;
};

// Per-volley cost
[-1, 40] select _success;
