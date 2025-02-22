/*
 * File: fn_getSaveDataFactions.sqf
 * Function: 
 * Author: Killerswin2
 * Function description
 *      asks the server to send over factions from the server and returns it.
 * Public: No
 */

[player] remoteExec ["A3A_fnc_sendFactionsData", 2];