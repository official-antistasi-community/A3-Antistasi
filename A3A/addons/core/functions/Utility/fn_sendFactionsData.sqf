/*
 * File: fn_sendFactionsData.sqf
 * Function: 
 * Author: Killerswin2
 * Function description
 *  Sends the faction data to the client that requested it
 *
 * Public: No
 */

params ["_client"];

A3A_factionsDataGS =  [A3A_saveData get "factions", A3A_enabledDLC, A3A_disabledDLC];
(owner _client) publicVariableClient "A3A_factionsDataGS";