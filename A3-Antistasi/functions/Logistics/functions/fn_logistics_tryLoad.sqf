/*
    Author: [Håkon]
    [Description]
        Trys to a cargo into the nearest vehicle to the cargo, handles feedback to player

    Arguments:
    0. <Object> cargo

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_cargo] remoteExecCall ["A3A_fnc_logistics_tryLoad",2];

    License: MIT License
*/
if (!isServer) exitWith {};
params ["_cargo"];
#include "..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _vehicles = (nearestObjects [_cargo,["Car","Ship"], 10]) - [_cargo];
private _vehicle = _vehicles#0;
if (isNil "_vehicle") exitWith {[localize"STR_antistasi_logistics_head", localize"STR_antistasi_logistics_longAway"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]};

private _return = [_vehicle, _cargo] call A3A_fnc_logistics_canLoad;
if (_return isEqualType 0) exitWith {

    private _cargoName = getText (configFile >> "CfgVehicles" >> typeOf _cargo >> "displayName");
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    if (_cargo isKindOf "CAManBase") then {_cargoName = name _cargo};

    switch _return do {
        case -1: { [localize"STR_antistasi_logistics_head", localize"STR_antistasi_logistics_destroyedVeh"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -2: { [localize"STR_antistasi_logistics_head", localize"STR_antistasi_logistics_destroyedCargo"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -3: { [localize"STR_antistasi_logistics_head", format [localize"STR_antistasi_logistics_cannotLoaded", _cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -4: { [localize"STR_antistasi_logistics_head", localize"STR_antistasi_logistics_staticMounted_load"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -5: { [localize"STR_antistasi_logistics_head", format [localize"STR_antistasi_logistics_cannotMounted", _cargoName, _vehicleName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] }; //vehicle in weapon blacklist
        case -6: { [localize"STR_antistasi_logistics_head", format [localize"STR_antistasi_JN_helped",_cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -7: { [localize"STR_antistasi_logistics_head", format [localize"STR_antistasi_logistics_unableLoad", _vehicleName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -8: { [localize"STR_antistasi_logistics_head", format [localize"STR_antistasi_logistics_noSpace", _vehicleName, _cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -9: { [localize"STR_antistasi_logistics_head", format [localize"STR_antistasi_logistics_unitBlock", _vehicleName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        default { Error_1("Unknown error code: %1", _return) };
    };
};

_return spawn A3A_fnc_logistics_load;

nil
