/*

           ██▀███  ▓█████ ▄▄▄       ██▓     █     █░ ▄▄▄       ██▀███
          ▓██ ▒ ██▒▓█   ▀▒████▄    ▓██▒    ▓█░ █ ░█░▒████▄    ▓██ ▒ ██▒
          ▓██ ░▄█ ▒▒███  ▒██  ▀█▄  ▒██░    ▒█░ █ ░█ ▒██  ▀█▄  ▓██ ░▄█ ▒
          ▒██▀▀█▄  ▒▓█  ▄░██▄▄▄▄██ ▒██░    ░█░ █ ░█ ░██▄▄▄▄██ ▒██▀▀█▄
          ░██▓ ▒██▒░▒████▒▓█   ▓██▒░██████▒░░██▒██▓  ▓█   ▓██▒░██▓ ▒██▒
          ░ ▒▓ ░▒▓░░░ ▒░ ░▒▒   ▓▒█░░ ▒░▓  ░░ ▓░▒ ▒   ▒▒   ▓▒█░░ ▒▓ ░▒▓░
            ░▒ ░ ▒░ ░ ░  ░ ▒   ▒▒ ░░ ░ ▒  ░  ▒ ░ ░    ▒   ▒▒ ░  ░▒ ░ ▒░
            ░░   ░    ░    ░   ▒     ░ ░     ░   ░    ░   ▒     ░░   ░
             ░        ░  ░     ░  ░    ░  ░    ░          ░  ░   ░

                      remade by Triada from RealWar community

*/

/*

                 █████             ██████   ███
              ░░███             ███░░███ ░░░
            ███████   ██████   ░███ ░░░  ████  ████████    ██████   █████
           ███░░███  ███░░███ ███████   ░░███ ░░███░░███  ███░░███ ███░░
          ░███ ░███ ░███████ ░░░███░     ░███  ░███ ░███ ░███████ ░░█████
          ░███ ░███ ░███░░░    ░███      ░███  ░███ ░███ ░███░░░   ░░░░███
          ░░████████░░██████   █████     █████ ████ █████░░██████  ██████
           ░░░░░░░░  ░░░░░░   ░░░░░     ░░░░░ ░░░░ ░░░░░  ░░░░░░  ░░░░░░

*/

#include "..\..\Includes\common.inc"
#define INBOUND_TEXT "STR_antistasi_arty_inbound_text" call BIS_fnc_localize
#define SPLASH_TEXT "STR_antistasi_arty_splash_text" call BIS_fnc_localize
#define TITLE_TEXT "STR_antistasi_arty_title_text" call BIS_fnc_localize
#define YOU_MUST_TEXT "STR_antistasi_arty_you_must_text" call BIS_fnc_localize
#define CANNOT_FIRE_TEXT "STR_antistasi_arty_cannot_fire_text" call BIS_fnc_localize
#define MODSET_TEXT "STR_antistasi_arty_modset_text" call BIS_fnc_localize
#define NO_AMMO_TEXT "STR_antistasi_arty_no_ammo_text" call BIS_fnc_localize
#define BUSY_TEXT "STR_antistasi_arty_busy_text" call BIS_fnc_localize
#define SELECT_POS_TEXT "STR_antistasi_arty_select_pos_text" call BIS_fnc_localize
#define OUT_TEXT "STR_antistasi_arty_out_text" call BIS_fnc_localize
#define MARKER_TEXT "STR_antistasi_arty_marker_text" call BIS_fnc_localize
#define BEGIN_MARKER_TEXT "STR_antistasi_arty_begin_marker_text" call BIS_fnc_localize
#define END_MARKER_TEXT "STR_antistasi_arty_end_marker_text" call BIS_fnc_localize
#define SELECT_POS_START_TEXT "STR_antistasi_arty_select_pos_start_text" call BIS_fnc_localize
#define SELECT_POS_FIN_TEXT "STR_antistasi_arty_select_pos_fin_text" call BIS_fnc_localize
#define REQUEST_TEXT "STR_antistasi_arty_request_text" call BIS_fnc_localize

/*

                    ██████
                   ███░░███
                  ░███ ░░░  █████ ████ ████████    ██████   █████
                 ███████   ░░███ ░███ ░░███░░███  ███░░███ ███░░
                ░░░███░     ░███ ░███  ░███ ░███ ░███ ░░░ ░░█████
                  ░███      ░███ ░███  ░███ ░███ ░███  ███ ░░░░███
                  █████     ░░████████ ████ █████░░██████  ██████
                 ░░░░░       ░░░░░░░░ ░░░░ ░░░░░  ░░░░░░  ░░░░░░

*/

/* --------------------------- count ammo function -------------------------- */

private _fastCountAmmo =
{
    params ["_artyArray", "_typeAmmo"];

    private _artyAmmoArray = [];

    private ["_artyUnit", "_magTypeAmmo", "_magCountAmmo"];

    for "_i" from 0 to (count _artyArray) - 1
    do
    {
        _artyAmmoArray pushBack 0;
        _artyUnit = _artyArray # _i;

        {
            _magTypeAmmo = _x # 0;
            _magCountAmmo = _x # 1;

            if ((_magTypeAmmo == _typeAmmo) && { (canFire _artyUnit) })
            then { _artyAmmoArray set [_i, _artyAmmoArray # _i + _magCountAmmo]; };
        } forEach (magazinesAmmo _artyUnit);
    };

    _artyAmmoArray
};

/* --------------------------- arty fire procedure -------------------------- */

private _artyFire =
{
    params ["_artyUnit", "_position", "_typeAmmo", "_orderNum"];

    waitUntil
    {
        sleep 0.2;

        if (!(canFire _artyUnit)
            || { _artyUnit getVariable ["currentOrderNum", 1] == _orderNum
            && { unitReady _artyUnit } }) exitWith { true };

        false
    };

    if (!(isNil "_artyUnit") && { (canFire  _artyUnit) })
    then
    {
        _artyUnit commandArtilleryFire [_position, _typeAmmo, 1];

        sleep 2;

        _artyUnit setVariable ["currentOrderNum",
            (_artyUnit getVariable ["currentOrderNum", 1]) + 1];
    }
    else
    {
        if !(isNil "_artyUnit")
        then
        {
            _artyUnit setVariable ["currentOrderNum", nil];
            _artyUnit setVariable ["lastOrderNum", nil];
        };
    }
};

/* ---------------------- impact notification procedure --------------------- */

private _firstImpactNotification =
{
    params ["_artyUnit", "_position", "_typeAmmo"];

    if !(canFire _artyUnit) exitWith { };

    private _eta = _artyUnit getArtilleryETA [_position, _typeAmmo];
    private _timeX = time + _eta;
    private _textX = format [INBOUND_TEXT, round _eta];

    [petros, "sideChat", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];

    waitUntil
    {
        sleep 1;

        if (!(isNil "_timeX") && { time > _timeX }) exitWith { true };

        false
    };


    [petros, "sideChat", SPLASH_TEXT] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];
};

/* -------------------------------------------------------------------------- */

/*

                                                ███
                                               ░░░
                     █████████████    ██████   ████  ████████
                    ░░███░░███░░███  ░░░░░███ ░░███ ░░███░░███
                     ░███ ░███ ░███   ███████  ░███  ░███ ░███
                     ░███ ░███ ░███  ███░░███  ░███  ░███ ░███
                     █████░███ █████░░████████ █████ ████ █████
                    ░░░░░ ░░░ ░░░░░  ░░░░░░░░ ░░░░░ ░░░░ ░░░░░

*/

/* --------------------------------- _groups -------------------------------- */

FIX_LINE_NUMBERS()

private _groups = hcSelected player;

if (count _groups == 0)
exitWith { [TITLE_TEXT, YOU_MUST_TEXT] call A3A_fnc_customHint; };

/* --------------------------------- _units --------------------------------- */

private _units = [];

{
    _group = _x;

    { _units pushBack _x; } forEach units _group;
} forEach _groups;

/* ------------------------------- _artyArray ------------------------------- */

private _artyArray = [];
private _unit = nil;
private _veh = nil;
private _supportConfigArray = [];

{
    _unit = _x;
    _veh = vehicle _unit;

    if (_veh != _unit && { _supportConfigArray = getArray (configfile >> "CfgVehicles"
            >> typeOf _veh >> "availableForSupportTypes"); "Artillery" in _supportConfigArray })
    then { _artyArray pushBackUnique _veh; };
} forEach _units;

if (count _artyArray == 0)
exitWith { [TITLE_TEXT, YOU_MUST_TEXT] call A3A_fnc_customHint; };

/* ----------------------------- _fireArtyArray ----------------------------- */

private _fireArtyArray = [];

{
    if (canFire _x) then { _fireArtyArray pushBack _x; };
} forEach _artyArray;

if (count _fireArtyArray == 0)
exitWith { [TITLE_TEXT, CANNOT_FIRE_TEXT] call A3A_fnc_customHint; };

/* --------------------------- mortar_type dialog --------------------------- */

typeAmmunition = nil;

createDialog "mortar_type";

waitUntil { sleep 0.1; !dialog };

if (isNil "typeAmmunition") exitWith {};

private _typeAmmo = typeAmmunition;

if (_typeAmmo == "not_supported")
exitWith { [TITLE_TEXT, MODSET_TEXT] call A3A_fnc_customHint; };

/* ---------------------------- _hasAmmoArtyArray --------------------------- */

private _hasAmmoArtyArray = [];

{
    _veh = _x;

    {
        _magAmmoType = _x # 0;

        if (_magAmmoType == _typeAmmo)
        then { _hasAmmoArtyArray pushBack _veh; };
    } forEach magazinesAmmo _veh;
} forEach _fireArtyArray;

if (count _hasAmmoArtyArray == 0)
exitWith { [TITLE_TEXT, NO_AMMO_TEXT] call A3A_fnc_customHint; };

/* ---------------------- ready to fire artillery array --------------------- */

private _hasAmmoReadyArtyArray = [];

{
    if (unitReady _x) then { _hasAmmoReadyArtyArray pushBack _x; };
} forEach _hasAmmoArtyArray;

if (count _hasAmmoReadyArtyArray == 0)
exitWith { [TITLE_TEXT, BUSY_TEXT] call A3A_fnc_customHint; };

/* ------------------------ select strike type dialog ----------------------- */

hcShowBar false;
hcShowBar true;

typeArty = nil;

if (_typeAmmo != "2Rnd_155mm_Mo_LG")
then
{
    closedialog 0;
    createDialog "strike_type";
}
else
{
    typeArty = "NORMAL";
};

waitUntil { sleep 0.1; !dialog };

if (isNil "typeArty") exitWith {};

private _typeArty = typeArty;

/* --------------------------- first click on map --------------------------- */

positionTel = [];

if (_typeArty != "BARRAGE")
then { [TITLE_TEXT, SELECT_POS_TEXT] call A3A_fnc_customHint; }
else { [TITLE_TEXT, SELECT_POS_START_TEXT] call A3A_fnc_customHint; };


if !(visibleMap) then { openMap true; };

onMapSingleClick "positionTel = _pos; onMapSingleClick ''";

waitUntil { sleep 1; (count positionTel > 0) || { !(visibleMap) } };

if (count positionTel == 0) exitWith {};

private _positionTel = positionTel;

/* --------------------------- in range arty array -------------------------- */

private _isInRangeArtyArray = [];

{
    if (_positionTel inRangeOfArtillery [[_x], _typeAmmo])
    then { _isInRangeArtyArray pushBack _x; };
} forEach _hasAmmoReadyArtyArray;

if (count _isInRangeArtyArray == 0)
exitWith { [TITLE_TEXT, OUT_TEXT] call A3A_fnc_customHint; };

/* ------------------- markers and second click on the map ------------------ */

private _mrkFinal = createMarkerLocal [format ["Arty%1", random 100], _positionTel];
_mrkFinal setMarkerShapeLocal "ICON";
_mrkFinal setMarkerTypeLocal "hd_destroy";
_mrkFinal setMarkerColorLocal "ColorRed";

private _positionTel2 = [];

if (_typeArty != "BARRAGE")
then
{
    _mrkFinal setMarkerTextLocal (MARKER_TEXT);
}
else
{
    positionTel = [];

    _mrkFinal setMarkerTextLocal (BEGIN_MARKER_TEXT);

    [TITLE_TEXT, SELECT_POS_FIN_TEXT] call A3A_fnc_customHint;

    if !(visibleMap) then { openMap true; };

    onMapSingleClick "positionTel = _pos; onMapSingleClick ''";

    waitUntil { sleep 1; (count positionTel > 0) || { !(visibleMap) } };

    _positionTel2 = positionTel;
};

if (_typeArty == "BARRAGE" && { count _positionTel2 == 0 })
exitWith { deleteMarkerLocal _mrkFinal; };

private _mrkFinal2 = nil;
private _angle = 0;

if (_typeArty == "BARRAGE")
then
{
    _mrkFinal2 = createMarkerLocal
        [format ["Arty%1", random 100], _positionTel2];
    _mrkFinal2 setMarkerShapeLocal "ICON";
    _mrkFinal2 setMarkerTypeLocal "hd_destroy";
    _mrkFinal2 setMarkerColorLocal "ColorRed";
    _mrkFinal2 setMarkerTextLocal (END_MARKER_TEXT);

    _angle = _positionTel getDir _positionTel2;
};

sleep 1;

/* --------------------------- count rounds dialog -------------------------- */

roundsX = nil;

if (_typeAmmo != "2Rnd_155mm_Mo_LG")
then { createDialog "rounds_number"; }
else { roundsX = 1; };

waitUntil { sleep 1; !(dialog) };

if (isNil "roundsX")
exitWith
{
    if !(isNil "_mrkFinal") then { deleteMarkerLocal _mrkFinal; };
    if !(isNil "_mrkFinal2") then { deleteMarkerLocal _mrkFinal2; };
};

private _rounds = roundsX;

/* ---------------------- barrage strike interval count --------------------- */

private  _distance = 0;

if (_typeArty == "BARRAGE" && { _rounds > 1 })
then { _distance = (_positionTel distance _positionTel2) / (_rounds - 1); };

/* ---------------------------- spawn fired area ---------------------------- */

private _markerX = [markersX, _positionTel] call BIS_fnc_nearestPosition;
private _size = [_markerX] call A3A_fnc_sizeMarker;
private _forcedX = false;

if (!(_markerX in forcedSpawn)
    && { _positionTel distance (getMarkerPos _markerX) < _size
    && { spawner getVariable _markerX != 0 } })
then
{
    _forcedX = true;
    forcedSpawn pushBack _markerX;
    publicVariable "forcedSpawn";
};

/* ---------------------------------- chat ---------------------------------- */

private _fin = "";

if ((_rounds % 10) != 1 || { (_rounds % 100) == 11 })
then
{
    if ((_rounds % 10) in [2, 3, 4] && { !((_rounds % 100) in [12, 13, 14]) })
    then { _fin = "а"; }
    else { _fin = "ов"; };
};

private _textX = format [REQUEST_TEXT, mapGridPosition _positionTel, round _rounds, _fin];
[theBoss, "sideChat", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];

/* ------------------------------- fire cycle ------------------------------- */

sleep 5;

private _position = [];
private _artyUnits = _isInRangeArtyArray;
private _ammoUnits = [_artyUnits, _typeAmmo] call _fastCountAmmo;

private _isCycleOn = true;
private _count = 0;
private _lastOrderNum = 0;

while { _isCycleOn }
do
{
    _isCycleOn = false;

    for "_i" from 0 to (count _artyUnits) - 1
    do
    {
        _artyUnit = _artyUnits # _i;
        _unitAmmo = _ammoUnits # _i;

        if (_count != _rounds && { canFire _artyUnit && { _unitAmmo >= 1 } })
        then
        {
            _lastOrderNum = _artyUnit getVariable ["lastOrderNum", 0];
            _lastOrderNum = _lastOrderNum + 1;
            _artyUnit setVariable ["lastOrderNum", _lastOrderNum];

            if (_typeArty == "BARRAGE")
            then { _positionTel = _positionTel getPos [_distance , _angle]; };

            _position = _positionTel getPos [random 10, random 360];

            [_artyUnit, _position, _typeAmmo, _lastOrderNum] spawn _artyFire;

            if (_count == 0)
            then { [_artyUnit, _position, _typeAmmo] spawn _firstImpactNotification; };

            _count = _count + 1;
            _isCycleOn = true;
            _ammoUnits set [_i, _unitAmmo - 1];
        };
    };
};

/* ----------------------------- after fire work ---------------------------- */

sleep 10;

if !(isNil "_mrkFinal") then { deleteMarkerLocal _mrkFinal; };

if !(isNil "_mrkFinal2") then { deleteMarkerLocal _mrkFinal2; };

if !(_forcedX) exitWith {};

sleep 20;

if !(_markerX in forcedSpawn) exitWith {};

forcedSpawn = forcedSpawn - [_markerX];
publicVariable "forcedSpawn";

/* -------------------------------------------------------------------------- */
