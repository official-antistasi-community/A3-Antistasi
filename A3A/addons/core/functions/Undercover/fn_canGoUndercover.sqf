/*
Author: Wurzel0701
    Checks if the player is able to go undercover.
    Returns result and text to be displayed.
    To display the long reason, you can use localize "STR_A3A_fn_undercover_title" as the title.
    Text is localised to local machine.

Arguments:
    <NIL>

Return Value:
    ARRAY<
        BOOL, True if player can go undercover, else false
        INTEGER, Reason why not Enum. See Reason Enum section in header.
        STRING, Short reason why not.
        STRING Long reason why not. Expected to be put into a customHint body.
    >  and a small reason

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <OBJECT> A3A_faction_civ
    <ARRAY> controlsX
    <ARRAY> airportsX
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> undercoverVehicles
    <ARRAY> allArmoredHeadgear
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <SIDE> Invaders
    <SIDE> Occupants

Example:
    ([] call A3A_fnc_canGoUndercover) params ["_canUndercover", "_reasonNotEnum", "_shortReasonNot", "_longReasonNot"];
    if (!_canUndercover) exitWith {
        [localize "STR_A3A_fn_undercover_title", _longReasonNot] call A3A_fnc_customHint;
    }

Reason Enum:
    0 - No reason, can go undercover.
    >0 - Cannot go undercover
    1 - No Undercover while controlling AI
    2 - Already undercover
    3 - In non civilian vehicle
    4 - In reported vehicle
    5 - In vehicle with tow ropes attached
    6 - Recently reported
    7 - Weapon visible
    8 - Vest visible
    9 - Helmet visible
    10 - NVG visible
    11 - Suspicious uniform
    12 - No clothes
    13 - Holding tow ropes
    14 - Near enemy territory
    15 - Spotted by enemies
*/
if (player != player getVariable["owner", player]) exitWith
{
    [false, 1, "No Undercover while controlling AI", localize "STR_A3A_fn_undercover_canGoUn_no_ai"];
};

if (captive player) exitWith
{
    [false, 2, "Already undercover", localize "STR_A3A_fn_undercover_canGoUn_already"];
};

if !(isNull (objectParent player)) then
{
    if (!(typeOf(objectParent player) in undercoverVehicles)) exitWith
    {
        [false, 3, "In non civilian vehicle", localize "STR_A3A_fn_undercover_canGoUn_no_nociv"];
    };
    if ((objectParent player) getVariable ["A3A_reported", false]) exitWith
    {
        [false, 4, "In reported vehicle", localize "STR_A3A_fn_undercover_canGoUn_no_reported1"];
    };
    if ((objectParent player) getVariable ["SA_Tow_Ropes", []] isNotEqualTo []) exitWith
    {
        [false, 5, "In vehicle with tow ropes attached", localize "STR_A3A_fn_undercover_canGoUn_no_towrope"];
    };
}
else
{
    if (dateToNumber date < (player getVariable ["compromised", 0])) exitWith
    {
        [false, 6, "Recently reported", localize "STR_A3A_fn_undercover_canGoUn_no_reported2"];
    };

    private _cantUndercoverWhile = localize "STR_A3A_fn_undercover_canGoUn_no_while";

    if (primaryWeapon player != "" || secondaryWeapon player != "" || handgunWeapon player != "") exitWith
    {
        [false, 7, "Weapon visible", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_weapon", _cantUndercoverWhile]];
    };
    if (vest player != "") exitWith
    {
        [false, 8, "Vest visible", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_vest", _cantUndercoverWhile]];
    };
    if (headgear player in allArmoredHeadgear) exitWith
    {
        [false, 9, "Helmet visible", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_helmet", _cantUndercoverWhile]];
    };
    if (hmd player != "") exitWith
    {
        [false, 10, "NVG visible", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_ngv", _cantUndercoverWhile]];
    };
    if ((uniform player != "") && !(uniform player in (A3A_faction_civ get "uniforms"))) exitWith
    {
        [false, 11, "Suspicious uniform", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_uniform", _cantUndercoverWhile]];
    };
    if (uniform player == "") exitWith
    {
        [false, 12, "No clothes", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_naked", _cantUndercoverWhile]];
    };
    if (!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull])) exitWith
    {
        [false, 13, "Holding tow ropes", format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_rope", _cantUndercoverWhile]];
    };
};


private _roadblocks = controlsX select {isOnRoad(getMarkerPos _x)};
private _secureBases = airportsX + outposts + seaports + _roadblocks;
private _base = [_secureBases, player] call BIS_fnc_nearestPosition;
private _size = [_base] call A3A_fnc_sizeMarker;
if ((player distance2D getMarkerPos _base < _size * 2) && (sidesX getVariable [_base, sideUnknown] != teamPlayer)) exitWith
{
    [false, 14, "Near enemy territory", localize "STR_A3A_fn_undercover_canGoUn_no_close"];
};

if
(
    {
        ((side _x == Invaders) || (side _x == Occupants)) &&
        {(_x knowsAbout player > 1.4) &&
        {_x distance player < 500}}
    } count allUnits > 0
) exitWith
{
    [false, 15, "Spotted by enemies", localize "STR_A3A_fn_undercover_canGoUn_no_spotted"];
};
// Return
[true, 0, "", ""];

