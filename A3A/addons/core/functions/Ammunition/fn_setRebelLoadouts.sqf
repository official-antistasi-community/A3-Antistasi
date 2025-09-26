/*
    Writes custom rebel loadouts structure & updates version number

Parameters:
    <HASHMAP> Custom rebel loadouts structure

Environment:
    Unscheduled, server
*/

params ["_newLoadouts"];

A3A_rebelLoadoutsVersion = time;
_newLoadouts set ["Version", A3A_rebelLoadoutsVersion];
A3A_rebelLoadouts = _newLoadouts;

publicVariable "A3A_rebelLoadoutsVersion";
