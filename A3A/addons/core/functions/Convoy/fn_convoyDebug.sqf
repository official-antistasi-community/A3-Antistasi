/*  Shows the convoy markers on the maps, if this is either singleplayer or you are admin
*   Params:
*       None
*   Returns:
*       Nothing
*/

//Fixes users are not able to follow instructions
if(!canSuspend) exitWith
{
  [] spawn A3A_fnc_convoyDebug;
};

if(isDedicated) exitWith {};

if(isMultiplayer && {!isServer} && {!(call BIS_fnc_admin > 0)}) exitWith {[localize "STR_A3A_fn_convoy_convdebug_title", localize "STR_A3A_fn_convoy_convdebug_admin"] call A3A_fnc_customHint;};

player setVariable ["convoyDebug", true];
sleep 1;

_stop = player addAction [localize "STR_A3A_fn_convoy_convdebug_deactivate", {(_this select 0) setVariable ["convoyDebug", false]; (_this select 0) removeAction (_this select 2);}, nil, 0, false, false, "", "_originalTarget == _this"];

private _allConvoyMarker = [];
while {player getVariable ["convoyDebug", false]} do
{
    _allConvoyMarker = server getVariable ["convoyMarker_Occupants", []];
    _allConvoyMarker = _allConvoyMarker + (server getVariable ["convoyMarker_Invaders", []]);
    if(count _allConvoyMarker != 0) then
    {
        {
            _x setMarkerAlphaLocal 1;
        } forEach _allConvoyMarker;
    };
    sleep 10;
};

player removeAction _stop;

{
    _x setMarkerAlphaLocal 0;
} forEach _allConvoyMarker;
