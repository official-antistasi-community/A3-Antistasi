/*  Checks if the marker should change its owner after a unit died and flips it if need be
    Execution on: Server or HC (garrison local)
    Environment: Spawned? Shouldn't matter? Arguably should be a garrisonOp?
    Params:
        _marker : STRING : Name of the marker the unit died on
        _side : SIDE : Side of the unit which died
    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
if (isNil "_garrison") exitWith {
    Error_2("No active garrison for %1 on machine %2", _marker, clientOwner);
};
private _troops = _garrison get "troops";
private _remTroops = _troops select { _x call A3A_fnc_canFight };

private _type == _garrison get "type";
if (_type in ["hq", "city"]) exitWith {};          // No action required
if (_type in ["camp", "roadblock", "rebPost"]) exitWith {
    // Minor site case, remove if empty
    if (_remTroops isNotEqualTo []) exitWith {};
    Debug_2("Site %1 lost all troops", _marker);

    // Mark everything in the garrison (downed troops etc) as no longer in the garrison
    {
        if (!isNull _x) then { _x setVariable ["markerX", false, true] };
    } forEach (_troops + (_garrison get "vehicles") + (_garrison get "statics"));

    // Tell the server to clear the site
    [_marker] remoteExecCall [["A3A_fnc_deleteMinorSite", "A3A_fnc_deleteRebelControl"] select (_type == "rebPost"), 2];
};

// Otherwise it's a capturable site, so we continue with the check

private _enemies = [teamPlayer, Occupants, Invaders] - [_garrison get "side"];
_enemies params ["_enemy1", "_enemy2"];

// Only count defenders within the marker, in case of distant/stuck patrols
// might need to implement minimum size for small markers?
private _defenderCount = count ((_remTroops inAreaArray _marker) arrayIntersect (_remTroops inAreaArray [_markerPos, 50, 50]));

// Use average marker size to force reasonable behaviour with highly rectangular targets
private _capRadius = ((markerSize _marker select 0) + (markerSize _marker select 1)) / 2;
_capRadius = _capRadius max 50;
private _markerPos = markerPos _marker;

private _enemy1Count = 0;
{
    if !(_this call A3A_fnc_canFight) then { continue };
    if (vehicle _this isKindOf "Air") then { continue };
    _enemy1Count = _enemy1Count + linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _this, 1, 0, true];  
} forEach (units _enemy1 inAreaArray [_markerPos, _capRadius, _capRadius]);

private _enemy2Count = 0;
{
    if !(_this call A3A_fnc_canFight) then { continue };
    if (vehicle _this isKindOf "Air") then { continue };
    _enemy2Count = _enemy2Count + linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _this, 1, 0, true];  
} forEach (units _enemy2 inAreaArray [_markerPos, _capRadius, _capRadius]);


Debug_7("ZoneCheck at %1 found %2 friendly %5 units, %3 enemy %6 units and %4 enemy %7 units", _marker, _defenderCount, _enemy1Count, _enemy2Count, _side, _enemy1, _enemy2);

if (_enemy1Count max _enemy2Count > 3 * _defenderCount) then
{
    private _winner = if (_enemy1Count > _enemy2Count) then {_enemy1} else {_enemy2};
    //if (_winner isEqualTo teamPlayer) exitWith {Debug_2("Rebel auto capture of %1 was blocked, %1 remains side %2", _marker, _side)};
    [_winner, _marker] remoteExec ["A3A_fnc_markerChange",2];
};
