/*
    Author: [Håkon]
    Description:
        adds an array of classnames to the garage with the lock specified

    Arguments:
    0. <Array> classnames of vehicles
    1. <String> Lock uid, valid values {"", getPlayerUID player}

    Return Value:
    <Bool> Successfull

    Scope: Server
    Environment: unscheduled
    Public: Yes
    Dependencies: HR_GRG_Vehicles

    Example: [_classes, ""] call HR_GRG_fnc_addVehiclesByClass;

    License: APL-ND
*/
params [["_vehicles", [], [[]]], ["_lockUID", "", [""]]];
#include "defines.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {false};
if (isNil "HR_GRG_Vehicles") then { [] call HR_GRG_fnc_initServer };

private _catsRequiringUpdate = [];
private _cfg = configFile >> "CfgVehicles";
{
    if (!isClass (_cfg >> _x)) then {Info_1("Invalid class: %1", str _x); continue};
    private _cat = [_x] call HR_GRG_fnc_getCatIndex;
    _catsRequiringUpdate pushBackUnique _cat;
    if (_cat < 0) then {Info_1("Unsoported category: %1", str _x); continue};
    private _vehUID = [] call HR_GRG_fnc_genVehUID;
    (HR_GRG_Vehicles#_cat) set [_vehUID, [cfgDispName(_x), _x, _lockUID, "", [[1,-1,nil],[0,[[],[]],-1],[]], "", [false, false]]];

    private _source = [
        [_x] call HR_GRG_fnc_isAmmoSource
        ,[_x] call HR_GRG_fnc_isFuelSource
        ,[_x] call HR_GRG_fnc_isRepairSource
    ];
    private _sourceIndex = _source find true;
    if (_sourceIndex != -1) then {
        (HR_GRG_Sources#_sourceIndex) pushBack _vehUID;
        [_sourceIndex] call HR_GRG_fnc_declairSources;
    }; //register vehicle as a source

    Info_2("Vehicle added to garage: %1 | Lock UID: %2", str _x, str _lockUID);
} forEach _vehicles;

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

true
