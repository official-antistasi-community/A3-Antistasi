/*
    Author: [Håkon]
    [Description]
        initilizes the garage on the server

    Arguments:
    0. <nil>

    Return Value:
    <>

    Scope: Server
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [] call HR_GRG_fnc_initServer;

    License: APL-ND
*/
if !(isClass (missionConfigFile/"A3A")) exitWith {};//not A3 Antistasi mission

#include "config.inc"
#include "defines.inc"
FIX_LINE_NUMBERS()

HR_GRG_defaultMags = createHashMap;

if (!isServer) exitWith {};

Trace("Running server init");
if (!isNil "HR_GRG_Init") exitWith {};//init already run.

if (isNil "HR_GRG_Vehicles") then {[] call HR_GRG_fnc_loadSaveData};
if (isNil "HR_GRG_Users") then {HR_GRG_Users = []};
[] call HR_GRG_fnc_validateGarage;

//Handle improper exit of garage (crash)
addMissionEventHandler ["PlayerDisconnected", {
    private _owner = param [4, -1];
    if (_owner isNotEqualTo -1) then {
        private _UID = param [1,""];
        [_owner] call HR_GRG_fnc_removeUser;

        private _recipients = +HR_GRG_Users;
        _recipients pushBackUnique 2;
        [_UID] remoteExecCall ["HR_GRG_fnc_releaseAllVehicles",_recipients];
    };
}];

//mark init complete
HR_GRG_Init = true;
publicVariable "HR_GRG_Init";
