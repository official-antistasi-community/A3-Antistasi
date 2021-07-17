/*
Author: Wurzel0701
    Checks if the player is able to go undercover

Arguments:
    <NIL>

Return Value:
    ARRAY<BOOL, STRING> The result of the check and a small reason

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
    <ARRAY> reportedVehs
    <ARRAY> allArmoredHeadgear
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <SIDE> Invaders
    <SIDE> Occupants

Example:
    [] call A3A_fnc_canGoUndercover;
*/

private _reasons = [];

if (player != player getVariable["owner", player]) exitWith
{
    [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_controlAI"] call A3A_fnc_customHint;
    [false, "No Undercover while controlling AI"];
};

if (captive player) exitWith
{
    [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_already"] call A3A_fnc_customHint;
    [false, "Already undercover"];
};

private _roadblocks = controlsX select {isOnRoad(getMarkerPos _x)};
private _secureBases = airportsX + outposts + seaports + _roadblocks;
private _result = [];

if !(isNull (objectParent player)) then
{
    if (!(typeOf(objectParent player) in undercoverVehicles)) exitWith
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_undercoverVehicles"] call A3A_fnc_customHint;
        _result = [false, "In non civilian vehicle"];
    };
    if ((objectParent player) in reportedVehs) then
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_reportedVehs"] call A3A_fnc_customHint;
        _result = [false, "In reported vehicle"];
    };
}
else
{
    if (dateToNumber date < (player getVariable ["compromised", 0])) exitWith
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_reported"] call A3A_fnc_customHint;
        _result = [false, "Recently reported"];
    };

    private _text = localize "STR_antistasi_undercover_text";
    _result = [true];
    if (primaryWeapon player != "" || secondaryWeapon player != "" || handgunWeapon player != "") then
    {
        _text = format ["%1<br/>"+localize"STR_antistasi_undercover_visible_weapon", _text];
        _result set [0, false];
        _result pushBack "Weapon visible";
    };
    if (vest player != "") then
    {
        _text = format ["%1<br/>"+localize"STR_antistasi_undercover_visible_vest", _text];
        _result set [0, false];
        _result pushBack "Vest visible";
    };
    if (headgear player in allArmoredHeadgear) then
    {
        _text = format ["%1<br/>"+localize"STR_antistasi_undercover_visible_helmet", _text];
        _result set [0, false];
        _result pushBack "Helmet visible";
    };
    if (hmd player != "") then
    {
        _text = format ["%1<br/>"+localize"STR_antistasi_undercover_visible_NVGs", _text];
        _result set [0, false];
        _result pushBack "NVG visible";
    };
    if ((uniform player != "") && !(uniform player in (A3A_faction_civ getVariable "uniforms"))) then
    {
        _text = format ["%1<br/>"+localize"STR_antistasi_undercover_visible_uniform", _text];
        _result set [0, false];
        _result pushBack "Suspicious uniform";
    };
    if (uniform player == "") then
    {
        _text = format ["%1<br/>"+localize"STR_antistasi_undercover_visible_naked", _text];
        _result set [0, false];
        _result pushBack "No clothes";
    };
    if !(_result select 0) then
    {
        [localize "STR_antistasi_undercover", _text] call A3A_fnc_customHint;
    };
};

if (count _result != 0 && !(_result select 0)) exitWith
{
    _result;
};

private _base = [_secureBases, player] call BIS_fnc_nearestPosition;
private _size = [_base] call A3A_fnc_sizeMarker;
if ((player distance2D getMarkerPos _base < _size * 2) && (sidesX getVariable [_base, sideUnknown] != teamPlayer)) exitWith
{
    [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_zone"] call A3A_fnc_customHint;
    [false, "Near enemy territory"];
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
    [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_spotting"] call A3A_fnc_customHint;
    [false, "Spotted by enemies"];
};

[true, ""];
