/*
    Author: [Håkon]
    [Description]
        Update veh pool on all clients in garage

    Arguments:
    0. <String> Lock UID, (nil if to not change)
    1. <String> Checkout UID
    2. <Int>    Categroy index
    3. <Int>    Vehicle UID
    4. <Object> Player whom made the request
    5. <Bool>   Switch selected vehicle to this for player

    Return Value:
    <Bool> succeded

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [nil, _UID, _catIndex, _vehUID, _player, true] call HR_GRG_fnc_broadcast;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
if !(isServer) exitWith {false};
Trace_2("Broadcasting %1 to users %2",_this,HR_GRG_Users);
_this remoteExecCall ["HR_GRG_fnc_receiveBroadcast", HR_GRG_Users];
true
