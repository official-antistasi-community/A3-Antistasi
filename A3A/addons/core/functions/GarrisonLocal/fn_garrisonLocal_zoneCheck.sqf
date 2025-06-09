/*  Checks if the marker should change its owner after a unit died and flips it if need be
    Execution on: Server or HC (garrison local)
    Environment: Spawned? Shouldn't matter? Arguably should be a garrisonOp?
    Params:
        _marker : STRING : Name of the marker the unit died on
        _forced : BOOL : If it's not from a kill
    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", ["_forced", false]];

Trace_1("Called with parameters %1", _this);

private _garrison = A3A_activeGarrison get _marker;
private _troops = _garrison get "troops";
private _markerPos = markerPos _marker;
private _type = _garrison get "type";
private _side = _garrison get "side";

if (_type in ["hq", "city"]) exitWith {};          // No action required
if (_type in ["camp", "roadblock", "rebpost"]) exitWith
{
    // Minor site case, remove if empty
    private _remTroops = _troops select { _x call A3A_fnc_canFight };
    Debug_2("Site %1 has %2 troops remaining", _marker, count _remTroops);
    if (_remTroops isNotEqualTo []) exitWith {};
    Info_1("Site %1 lost all troops, removing", _marker);

    // Mark everything in the garrison (downed troops etc) as no longer in the garrison
    {
        if (!isNull _x) then { _x setVariable ["markerX", nil, true] };
    } forEach (_troops + (_garrison get "vehicles") + (_garrison get "statics"));

    // Should we signal camps too?
    if (_type == "roadblock") then {
        private _nearPlayers = allPlayers inAreaArray [_markerPos, 700, 700] select { side _x == teamPlayer };
        ["TaskSucceeded", ["", localize "STR_A3A_fn_base_craicts_rbDestr"]] remoteExec ["BIS_fnc_showNotification", _nearPlayers];
    };

    // Tell the server to clear the site
    [_marker] remoteExecCall [["A3A_fnc_deleteMinorSite", "A3A_fnc_deleteRebelControl"] select (_type == "rebpost"), 2];
};

// Otherwise it's a capturable site, so we continue with the check
// Can't base on garrison troops in case of rebel support or QRFs hanging around

// Only count defenders within the marker, in case of distant/stuck patrols
// might need to implement minimum size for small markers?
private _defenders = units _side inAreaArray _marker;
_defenders insert [-1, units _side inAreaArray [_markerPos, 50, 50], true];
private _defenderCount = count (_defenders select { _x call A3A_fnc_canFight });
if (!_forced and _defenderCount >= 4) exitWith {
    Debug_3("ZoneCheck at %1 early out from %2 friendly %3 units", _marker, _defenderCount, _side);
};

private _enemies = [teamPlayer, Occupants, Invaders] - [_side];
_enemies params ["_enemy1", "_enemy2"];

// Use average marker size to force reasonable behaviour with highly rectangular targets
private _capRadius = ((markerSize _marker select 0) + (markerSize _marker select 1)) / 2;
_capRadius = _capRadius max 50;

private _enemy1Count = 0;
{
    if !(_x call A3A_fnc_canFight) then { continue };
    if (vehicle _x isKindOf "Air") then { continue };
    _enemy1Count = _enemy1Count + linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _x, 1, 0, true];
} forEach (units _enemy1 inAreaArray [_markerPos, _capRadius, _capRadius]);

private _enemy2Count = 0;
{
    if !(_x call A3A_fnc_canFight) then { continue };
    if (vehicle _x isKindOf "Air") then { continue };
    _enemy2Count = _enemy2Count + linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _x, 1, 0, true];
} forEach (units _enemy2 inAreaArray [_markerPos, _capRadius, _capRadius]);


Debug_7("ZoneCheck at %1 found %2 friendly %5 units, %3 enemy %6 units and %4 enemy %7 units", _marker, _defenderCount, _enemy1Count, _enemy2Count, _side, _enemy1, _enemy2);

if (_enemy1Count max _enemy2Count > 3 * _defenderCount) then
{
    private _winner = if (_enemy1Count > _enemy2Count) then {_enemy1} else {_enemy2};
    //if (_winner isEqualTo teamPlayer) exitWith {Debug_2("Rebel auto capture of %1 was blocked, %1 remains side %2", _marker, _side)};
    [_winner, _marker] remoteExecCall ["A3A_fnc_markerChange", 2];
};
