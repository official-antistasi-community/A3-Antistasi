/*
Maintainer: No one
    Orchestrates the outpost capture sequence. Activated with a flag pole action.
    Designed to be added as addAction Code.
    Is called locally.

Arguments:
    <OBJECT> flagPole.

Scope: Local Client, Local Arguments, Global Effect
Environment: Scheduled
Public: No

ExternalVariables:
    <BOOLEAN> A3A_isPlayerCapturingFlag, can be nil. Makes the action invisible so that it does not interfere with abort action.
    <SCALAR> A3A_flagCaptureETA. EAT of when the flag may be captured. No other actions should be performed until this ETA has expired.

Example:
    _actionX = _flag addAction ["<t>Take the Flag<t> <img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.8' shadow=2 />", A3A_fnc_mrkWIN,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _titleStr = localize "STR_A3A_fn_base_mrkwin_title";

params ["_target","_caller","_actionID","_argument"];

if (_caller isNotEqualTo player) exitWith {
    // These can only get called if someone updates the functionality and forgets to update this.
    ServerError("Flag action mrkWIN must be locally called");
    systemChat "Error, flag action must be local.";
};
private _flagX = _target;

private _markerX = [airportsX + resourcesX + factories + outposts + seaports, getPosATL _flagX] call BIS_fnc_nearestPosition;
private _markerPos = getMarkerPos _markerX;
private _outpostGridSquare = ((_markerPos#0 toFixed 0) call A3A_fnc_pad_3Digits) + ((_markerPos#1 toFixed 0) call A3A_fnc_pad_3Digits);  // NB: Check if this is the right order for pos-> grid square

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) exitWith {};

if !(player call A3A_fnc_canFight) exitWith { ServerError("Action somehow used by dead or unconscious player?") };
if (captive player) exitWith {[_titleStr, localize "STR_A3A_fn_base_mrkwin_no_undercover"] call A3A_fnc_customHint;};
if ((_markerX in airportsX) and (tierWar < 3)) exitWith {[_titleStr, localize "STR_A3A_fn_base_mrkwin_no_wl3"] call A3A_fnc_customHint;};

// This damn ineffective multiplayer lock will be fixed with a future library addition. Not worth the effort to fix At the Moment. - C.Serafin
//Check if the flag is locked
private _flagCaptureETA = _flagX getVariable ["A3A_flagCaptureETA", -1];
if(_flagCaptureETA > serverTime) exitWith
{
    private _timeSpan = [_flagCaptureETA - serverTime] call A3A_fnc_secondsToTimeSpan;
    private _secondsLeftString = [_timeSpan,0,0,false,1] call A3A_fnc_timeSpan_format;  // Only print most significant quantity.
    [_titleStr, format [localize "STR_A3A_fn_base_mrkwin_used", _secondsLeftString]] call A3A_fnc_customHint;
};
//Lock the flag
_flagX setVariable ["A3A_flagCaptureETA", serverTime + 10, true];


ServerInfo_3("Outpost at %1 (%2): Flag capture initiated by %3", _outpostGridSquare, _markerX, str player);

private _capRadius = ((markerSize _markerX select 0) + (markerSize _markerX select 1)) / 2;
_capRadius = 50 max _capRadius;

private _rebelValue = 0;
private _enemyValue = 0;
{
    if !(_x call A3A_fnc_canFight) then { continue };
    private _value = linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _x, 1, 0, true];
    if (side _x == teamPlayer) then {
        _rebelValue = _rebelValue + _value;
        continue;
    };
    if (side _x == Occupants or side _x == Invaders) then {
        _enemyValue = _enemyValue + _value;
        player reveal _x;
    };
} forEach (allUnits inAreaArray [_markerPos, _capRadius, _capRadius]);


if (_enemyValue > 2*_rebelValue) exitWith
{
    ServerInfo_4("Outpost at %1 (%2): Flag capture cancelled due to enemy value (%3) greater than 2*rebel value (%4)", _outpostGridSquare, _markerX, _enemyValue, _rebelValue);
    if (difficultyOption "mapContentEnemy" == 1) then {
        [_titleStr, localize "STR_A3A_fn_base_mrkwin_lurk_check"] call A3A_fnc_customHint;
    } else {
        // Remove map quote due to immersive difficulty.
        [_titleStr, localize "STR_A3A_fn_base_mrkwin_lurk_hunt"] call A3A_fnc_customHint;
    }
};


A3A_isPlayerCapturingFlag = true;
player playMove "MountSide";

private _cancellationToken = [false];
private _cancelActionID = player addAction [localize "STR_A3A_fn_base_mrkwin_addact_abortCapture",
{
    params ["_target","_caller","_actionID","_cancellationToken"];
    _cancellationToken set [0, true];
    A3A_isPlayerCapturingFlag = nil;
    player switchMove "";
    player removeAction _actionID;
    [localize "STR_A3A_fn_base_mrkwin_title", localize "STR_A3A_fn_base_mrkwin_abort"] call A3A_fnc_customHint;

}, _cancellationToken];
// returnflag Icon should be 1.5 tiems bigger than takeflag icon. 2 * 1.5 = 3
player setUserActionText [_cancelActionID,"Aborted Outpost Capture","<img size='3' image='\A3\ui_f\data\igui\cfg\actions\returnflag_ca.paa'/>"];

// Capturing
sleep 7;

if (_cancellationToken #0) exitWith {
    ServerInfo_3("Outpost at %1 (%2): Flag capture aborted by %3", _outpostGridSquare, _markerX, str player);
};
A3A_isPlayerCapturingFlag = nil;
player removeAction _cancelActionID;
player playMove "";

{
    if (isPlayer _x) then
    {
        [5,_x] remoteExec ["A3A_fnc_playerScoreAdd",_x];
        if (captive _x) then
        {
            [_x,false] remoteExec ["setCaptive",_x];
        };
    }
} forEach ([_capRadius,0,_markerPos,teamPlayer] call A3A_fnc_distanceUnits);

ServerInfo_3("Outpost at %1 (%2): Flag capture completed by %3", _outpostGridSquare, _markerX, str player);
[teamPlayer,_markerX] remoteExec ["A3A_fnc_markerChange",2];
