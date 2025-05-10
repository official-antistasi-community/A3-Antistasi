/*
    Author: [Håkon]
    Description:
        Loads garage from garage save data

    Arguments:
    0. <Struct> [
        <Array> [
            Array [
                <Struct> [
                    <String> Vehicle display name
                    <String> Vehicle classname
                    <String> Vehicl lock UID
                    <String> Vehicle check out UID
                    <Int>    Vehicle UID
                ] Vehicle data
            ] Vehicle category
        ] Garage vehicle data

        <Int> Last vehicle UID

        <Array> [
            <Array> [Vehicle UID] Ammo sources
            <Array> [Vehicle UID] Fuel sources
            <Array> [Vehicle UID] Repair sources
        ] Sources
    ] Garage save data

    Return Value:
    <Bool> Save loaded

    Scope: Server
    Environment: unscheduled
    Public: Yes
    Dependencies:

    Example: [_save] call HR_GRG_fnc_loadSaveData;

    License: APL-ND
*/

if (!isServer) exitWith {false};
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_save", [], [[]] ]];
private _newGarage = [];
for "_i" from 1 to (count HR_GRG_CATIDCS) do {_newGarage pushBack createHashMap;};
private _validSave = _save params [
    ["_garage", _newGarage, [[]]]
    , ["_uid", 0, [0]]
    , ["_sources", [[],[],[]], [[]], 3]
];

// Garage will change from 5 categories to 8 categories at some point. This code will adapt older saved garages to the new standard.
Info_1("Formatting an existing saved garage to %1 categories",count HR_GRG_CATIDCS)
{
    private _dataHM = _x;
    {
        private _data = _dataHM get _x;
        _newCat = [_data#1] call HR_GRG_fnc_getCatIndex;
        _newGarage#_newCat set [_x, _data];
    } forEach _x; // each vehicle
} forEach _garage; // each cat
_garage = _newGarage;

HR_GRG_Vehicles = +_garage;
HR_GRG_UID = +_uid;
HR_GRG_Sources = +_sources;

[] call HR_GRG_fnc_validateGarage;
{
    [_forEachIndex] call HR_GRG_fnc_declairSources;
} forEach HR_GRG_Sources;

if _validSave then {
    Trace("Garage restored");
} else {
    Trace("New garage loaded");
};
true;
