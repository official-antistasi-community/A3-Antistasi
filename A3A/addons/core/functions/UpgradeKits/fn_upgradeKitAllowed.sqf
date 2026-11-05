/*
Maintainer: Shoter
    Whether a player may buy and return upgrade kits of any kind: members and the commander.
    With membership off every player counts as a member. Dismantling a built town upgrade stays commander-only and does not use this.

Arguments:
    <OBJECT> Player

Return Value:
    <BOOL>

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_isMember

Example:
    if ([player] call A3A_fnc_upgradeKitAllowed) then { ... };
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_player", objNull, [objNull]]];
if (isNull _player) exitWith { false };

([_player] call A3A_fnc_isMember) or {_player == theBoss};
