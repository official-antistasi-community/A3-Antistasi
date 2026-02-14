/*
    Author: [Håkon]
    [Description]
        Client side handling of server broadcast, keeps client in synch with server data

    Arguments:
        0. <String> Lock UID
        1. <String> Checkout UID
        2. <Int>    Category index
        3. <Int>    Vehicle UID
        4. <Object> Player who made the request
        5. <Bool>   Switch vehicle

    Return Value:
        <Nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: (_this#1) call HR_GRG_fnc_reciveBroadcast;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
Trace_1("Reciving broadcast: %1",_this);
params ["_lockUID", "_checkoutUID", "_catIndex", "_vehUID", "_player", "_switch", "_time"];

private _cat = HR_GRG_Vehicles#_catIndex;
private _vehicle = _cat get _vehUID;

//set the new data
if (_switch) then { [getPlayerUID _player] call HR_GRG_fnc_releaseAllVehicles };

if (!isNil "_lockUID") then {
    _vehicle set [2, _lockUID];
    _vehicle set [5, if (_lockUID isEqualTo "") then { "" } else { name _player }];
    _vehicle set [7, [_time, []] select (_lockUID isEqualTo "")];
};

if (!isNil "_checkoutUID") then {
    _vehicle set [3, _checkoutUID];
};

//handle refreshing preview and extras
private _isPlayer = _player isEqualTo player;
if (_isPlayer) then {
    if (_switch) then {
        Trace_3("Setting selected vehicle | Cat: %1 | UID: %2 | Class: %3", _catIndex, _vehUID, _vehicles#1);
        HR_GRG_SelectedVehicles = [_catIndex, _vehUID, _vehicle#1];
        [] call HR_GRG_fnc_reloadPreview;
        if (
            HR_GRG_Pylons_Enabled //Pylon editing enabled
            && { HR_GRG_hasAmmoSource } //or ammo source registered
        ) then { [] call HR_GRG_fnc_reloadPylons };
    };
    [true] call HR_GRG_fnc_toggleConfirmBttn;
};
[_isPlayer] call HR_GRG_fnc_reloadExtras;

//refresh the category display
private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrl = HR_GRG_Cats#_catIndex;
Trace_2("r.Broadcast - Ctrl: %1 | Active: %2" , _ctrl, ctrlEnabled _ctrl);
if (ctrlEnabled _ctrl) then {
    [_ctrl, _catIndex] call HR_GRG_fnc_reloadCategory;
};
