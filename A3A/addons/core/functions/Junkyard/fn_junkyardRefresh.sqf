/*
Maintainer: Shoter
    Replaces the junkyard stock with a fresh random selection and schedules the next delivery.
    Stock is A3A_junkyardPoolCount vehicles drawn from the civilian, rebel, occupant and invader pools,
    plus A3A_junkyardWildcardCount wildcard vehicles drawn from every drivable vehicle class currently loaded.
    Statics, blacklisted garage classes and vehicles from disabled DLC are excluded.

Arguments:
    None

Return Value:
    <nil>

Scope: Server
Environment: Scheduled (config scan on first run can take a moment)
Public: No
Dependencies: A3A_fnc_junkyardPools, A3A_fnc_junkyardPrice

Example:
    [] spawn A3A_fnc_junkyardRefresh;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server") };

// Pools shared with factory production
([] call A3A_fnc_junkyardPools) params ["_civ", "_reb", "_occ", "_inv", "_wildcardPool"];

private _allPoolClasses = _civ + _reb + _occ + _inv;

// Draw from the pools, weighted, no duplicates
private _pools = [[_civ, 3], [_reb, 2], [_occ, 2], [_inv, 2]];
private _stock = [];
for "_i" from 1 to A3A_junkyardPoolCount do {
    private _available = _pools select { (_x#0) isNotEqualTo [] };
    if (_available isEqualTo []) exitWith {};
    private _indices = [];
    { _indices pushBack _forEachIndex } forEach _available;
    private _pool = (_available # (_indices selectRandomWeighted (_available apply { _x#1 }))) # 0;
    private _class = _pool deleteAt (floor random count _pool);
    _stock pushBack [_class, [_class] call A3A_fnc_junkyardPrice];
};

// Wildcards: A3A_junkyardWildcardCount vehicles from everything drivable that is loaded, outside the conflict pools
private _wildcards = _wildcardPool - _allPoolClasses - (_stock apply { _x#0 });
for "_i" from 1 to A3A_junkyardWildcardCount do {
    if (_wildcards isEqualTo []) exitWith {};
    private _class = _wildcards deleteAt (floor random count _wildcards);
    _stock pushBack [_class, [_class] call A3A_fnc_junkyardPrice];
};

A3A_junkyardStock = _stock;
publicVariable "A3A_junkyardStock";
A3A_junkyardNextRefresh = serverTime + A3A_junkyardRefreshInterval;
publicVariable "A3A_junkyardNextRefresh";

Info_1("Junkyard restocked: %1", _stock);
[localize "STR_A3A_fn_junkyard_title", localize "STR_A3A_fn_junkyard_newStock"] remoteExec ["A3A_fnc_customHint", 0];
