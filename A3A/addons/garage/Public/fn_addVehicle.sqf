/*
    Author: [Håkon]
    [Description]
        Tries to add a vehicle to the garage, with feedback transmited back to the client

    Arguments:
    0. <Object> Vehicle to add
    1. <Int>    ClientID
    2. <String> Lock UID
    3. <Object> Player trying to add the vehicle

    Return Value:
    <Bool> Successfully added vehicle

    Scope: Server
    Environment: Any
    Public: [Yes]
    Dependencies: TeamPlayer, FactionGet(reb,"name"), Invaders, Occupants, HR_GRG_Sources, HR_GRG_Vehicles

    Example: [cursorObject, clientOwner, call HR_GRG_dLock, _player] remoteExecCall ["HR_GRG_fnc_addVehicle",2];

    License: MIT / (APL-ND) the license switch is noted in the code
*/
params [ ["_vehicle", objNull, [objNull]], ["_client", 2, [0]], ["_lockUID", ""], ["_player", objNull, [objNull]] ];
#include "defines.inc"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { Error("called on client, this is a server only function") };
if (isNil "HR_GRG_Vehicles") then { [] call HR_GRG_fnc_initServer };
private _class = typeOf _vehicle;

//validate input
if (isNull _vehicle) exitWith { ["STR_HR_GRG_Feedback_addVehicle_Null"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };
if (!alive _vehicle) exitWith { ["STR_HR_GRG_Feedback_addVehicle_Destroyed"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };
if (locked _vehicle > 1) exitWith { ["STR_HR_GRG_Feedback_addVehicle_Locked"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };
if (_player isNotEqualTo vehicle _player) exitWith { ["STR_HR_GRG_Feedback_addVehicle_inVehicle"] remoteExec ["HR_GRG_fnc_Hint", _client] ; false };
if (_player distance _vehicle > 25) exitWith {["STR_HR_GRG_Feedback_addVehicle_Distance"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };

    //Valid area
private _friendlyMarkers = (["Synd_HQ"] +outposts + seaports + airportsX + factories + resourcesX) select {sidesX getVariable [_x,sideUnknown] == teamPlayer}; //rebel locations with a flag
private _inArea = _friendlyMarkers findIf { count ([_player, _vehicle] inAreaArray _x) > 1 };
if !(_inArea > -1) exitWith {["STR_HR_GRG_Feedback_addVehicle_badLocation",[FactionGet(reb,"name")]] remoteExec ["HR_GRG_fnc_Hint", _client]; false };

    //No hostiles near

if ([getPosATL _player] call A3A_fnc_enemyNearCheck) exitWith {
    ["STR_HR_GRG_Feedback_addVehicle_enemiesEngaging"] remoteExec ["HR_GRG_fnc_Hint", _client];
    false;
};


//Utility refund
private _utilityRefund = {
    params ["_object", ["_instantRefund", true]];

    // canGarage true means it's in the utilityItem lists
    private _flags = (A3A_utilityItemHM get typeof _object) # 4;

    if ("cmmdr" in _flags && _player isNotEqualTo theBoss && _instantRefund) exitWith {
        ["STR_HR_GRG_Feedback_addVehicle_commander_only"] remoteExec ["HR_GRG_fnc_Hint", _client];
        false;
    };

    private _toRefund = 0;
    private _feedBack = "STR_HR_GRG_Feedback_addVehicle_Item_Stored";
    if ("fuel" in _flags) then {
        _toRefund = floor (([_object] call A3A_fnc_remainingFuel) * (_object getVariable ['A3A_itemPrice', 0]));
        _feedBack = "STR_HR_GRG_Feedback_addVehicle_Fuel_sold";
    } else {
        _toRefund = _object getVariable ['A3A_itemPrice', 0];
    };
    if ("loot" in _flags) then {
        _feedBack = "STR_HR_GRG_Feedback_addVehicle_LTC";
        [_object, boxX, true] call A3A_fnc_ammunitionTransfer;
    };

    deleteVehicle _object;
    if (_instantRefund) exitWith {
        if (_toRefund > 0) then {
            [0,_toRefund] spawn A3A_fnc_resourcesFIA;
        };
        [_feedBack] remoteExec ["HR_GRG_fnc_Hint", _client];
        true;
    };
    _toRefund
};
if (_vehicle getVariable ['A3A_canGarage', false]) exitwith { [_vehicle] call _utilityRefund };

    //Towing
if !((_vehicle getVariable ["SA_Tow_Ropes",objNull]) isEqualTo objNull) exitWith {["STR_HR_GRG_Feedback_addVehicle_SATow"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };

    //crewed
private _exit = false;
if ( ( {alive _x} count (crew _vehicle) ) > 0) then { _exit = true };
{ if ( ( {alive _x} count (crew _x) ) > 0) exitWith {_exit = true} } forEach attachedObjects _vehicle;
if (_exit) exitWith { ["STR_HR_GRG_Feedback_addVehicle_Crewed"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };

    // valid vehicle for garage
private _cat = [_class] call HR_GRG_fnc_getCatIndex;
if (_cat < 0) exitWith { ["STR_HR_GRG_Feedback_addVehicle_GenericFail"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };

    //cap block
private _capacity = 0;
{ _capacity = _capacity + count _x } forEach HR_GRG_Vehicles;

private _countStatics = {_x isKindOf "StaticWeapon"} count (attachedObjects _vehicle);
if ((call HR_GRG_VehCap - _capacity) < (_countStatics + 1)) exitWith { ["STR_HR_GRG_Feedback_addVehicle_Capacity"] remoteExec ["HR_GRG_fnc_Hint", _client]; false };//HR_GRG_VehCap is defined in config.inc

//Block air garage outside of airbase
if (
    (_class isKindOf "Air")
    && {count (airportsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (_player inArea _x)}) < 1} //no airports
) exitWith {["STR_HR_GRG_Feedback_addVehicle_airBlocked", [FactionGet(reb,"name")]] remoteExec ["HR_GRG_fnc_Hint", _client]; false };

//here to allow adaption of external Antistasi system without needing to addapt code under APL-ND
private _broadcastReportedVehsAndStaticsToSave = {
    publicVariable "staticsToSave";
};
//_this is vehicle
private _deleteFromReportedVehsAndStaticsToSave = {
    staticsToSave deleteAt (staticsToSave find _this);
};
//_this is vehicle
private _transferToArsenal = {
    [_this,boxX] call A3A_fnc_ammunitionTransfer;
};

//_this is vehicle
private _unloadAceCargo = {
    private _toRefund = 0;
    {
        if !(_x isEqualType objNull) then { continue };
        if (typeOf _x in ["ACE_Wheel", "ACE_Track"]) then { continue };
        [_x, _this] call ace_cargo_fnc_unloadItem;

        if (_x getVariable ['A3A_canGarage', false]) then { _toRefund = _toRefund + ([_x, false] call _utilityRefund) };
    } forEach (_this getVariable ["ace_cargo_loaded", []]);

    if (_toRefund > 0) then {
        [_toRefund] remoteExec ["A3A_fnc_resourcesPlayer", _client];
    };
};

//---------------------------------------------------------|
// Everything above this line is under the license: MIT    |
// Everything under this line is under the license: APL-ND |
//---------------------------------------------------------|

//add vehicle
if (_vehicle getVariable ["HR_GRG_Garaging", false]) exitWith {};
_vehicle setVariable ["HR_GRG_Garaging", true];

private _addVehicle = {
    //check if compatible with garage
    private _class = typeOf _this;
    private _cat = [_class] call HR_GRG_fnc_getCatIndex;
    if (_cat isEqualTo -2) exitWith {deleteVehicle _this;}; // deletes anything caught by the blacklist
    if (_cat isEqualTo -1) exitWith {};
    _catsRequiringUpdate pushBackUnique _cat;

    private _source = [
        [_this] call HR_GRG_fnc_isAmmoSource
        ,[_this] call HR_GRG_fnc_isFuelSource
        ,[_this] call HR_GRG_fnc_isRepairSource
    ];
    private _sourceIndex = _source find true;

    //Disable locking if the player is already at the lock limit
    if (_sourceIndex == -1 && _lockUID != "" && {[_lockUID] call HR_GRG_fnc_getLockCount >= _player call HR_GRG_getLockLimit}) then {
        _lockUID = ""; _lockName = "";
    };

    private _stateData = [_this] call HR_GRG_fnc_getState;
    private _customisation = [_this] call BIS_fnc_getVehicleCustomization;
    private _lockTime = [systemTimeUTC, []] select (_lockUID isEqualTo "");

    //Antistasi adaptions
    _this call _transferToArsenal;
    _this call _deleteFromReportedVehsAndStaticsToSave;
    _this call _unloadAceCargo;

    deleteVehicle _this;

    //Add vehicle to garage
    private _vehUID = [] call HR_GRG_fnc_genVehUID;
    (HR_GRG_Vehicles#_cat) set [_vehUID, [cfgDispName(_class), _class, _lockUID, "", _stateData, _lockName, _customisation, _lockTime]];

    //register vehicle as a source
    if (_sourceIndex != -1) then {
        (HR_GRG_Sources#_sourceIndex) pushBack _vehUID;
        [_sourceIndex] call HR_GRG_fnc_declairSources;
    };

    Info_6("By: %1 [%2] | Type: %3 | Vehicle ID: %4 | Lock: %5 | Source: %6", name _player, getPlayerUID _player, cfgDispName(_class), _vehUID, _locking, _sourceIndex);
};

private _locking = if (_lockUID isEqualTo "") then {false} else {true};
private _lockName = if (_locking) then { name _player } else { "" };
private _catsRequiringUpdate = [];
{
    detach _x;
    _x call _addVehicle;
} forEach attachedObjects _vehicle;
_vehicle call _addVehicle;

if (_catsRequiringUpdate isNotEqualTo []) then _broadcastReportedVehsAndStaticsToSave;

//refresh category for active users
private _refreshCode = {
    #include "defines.inc"
    FIX_LINE_NUMBERS()
    private _disp = findDisplay HR_GRG_IDD_Garage;
    private _cats = _this apply { HR_GRG_Cats#_x };
    {
        if (ctrlEnabled _x) then {
            [_x, _this#_forEachIndex] call HR_GRG_fnc_reloadCategory;
        };
    } forEach _cats;
    call HR_GRG_fnc_updateVehicleCount;
};

if !(HR_GRG_Users isEqualTo []) then {
    [ _catsRequiringUpdate, _refreshCode ] remoteExecCall ["call", HR_GRG_Users];
};

["STR_HR_GRG_Feedback_addVehicle_Success", [cfgDispName(_class)] ] remoteExec ["HR_GRG_fnc_Hint", _client];
true;
