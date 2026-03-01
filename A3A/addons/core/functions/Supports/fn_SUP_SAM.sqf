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

private _success = false;
isNil {
    private _bases = airportsX inAreaArray [_target, 10000, 10000] select { sidesX getVariable _x == _side };
    private _weightedBases = [];
    {
        private _base = _x;
        private _pos = markerPos _x;
        private _dist = _pos distance2D _targPos;
        if (_dist < 1500) then {continue};

        // Check if there's a SAM available at that base and find vehID for it
        private _vehID = -1;
        {
            if (_y#0 == "ready" and _y#1 == "vehiclesSAM") exitWith { _vehID = _x };
        } forEach (A3A_garrison get _base get "supportVehicles");
        if (_vehID == -1) then { continue };

        // Check if there's a firing path from the target to the airport (proxy for SAM position)
        private _targDir = _pos getDir _targPos;
        private _intercept = ATLtoASL _pos vectorAdd [300*sin _targDir, 300*cos _targDir, 200];
        if (terrainIntersectASL [_intercept, getPosASL _target]) then { continue };

        _weightedBases pushBack [_base, _vehID];
        _weightedBases pushBack (1e8 / _dist^2);       // prefer more distant bases
    } forEach _bases;

    if (_weightedBases isEqualTo []) exitWith { Debug("No bases found for SAM support") };
    selectRandomWeighted _weightedBases params ["_marker", "_vehID"];

    private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
    if (_delay < 0) then { _delay = (0.5 + random 1) * (100 - _aggro + 22*A3A_enemyResponseTime) };

    A3A_supportStrikes pushBack [_side, "TARGET", _target, time + 1200, 1200, 100];

    Info_5("SAM support %1 against %2 with delay %3 will be carried out by vehicle ID %4 from %5", _supportName, _target, _delay, _vehID, _marker);

    [_marker, _vehID, [_target, _delay, _reveal]] call A3A_fnc_garrisonServer_vehAction;
    _success = true;
};

//[_reveal, _side, "SAM", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;

// Vehicle cost + extra support cost for balance
//(A3A_vehicleResourceCosts get _launcherType) + 100;
[-1, 80] select _success;
