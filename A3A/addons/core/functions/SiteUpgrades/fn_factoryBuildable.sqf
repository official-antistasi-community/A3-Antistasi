/*
Maintainer: Shoter
    Builds the factory production list once per session and broadcasts it as A3A_factoryBuildList.
    Every vehicle the junkyard can offer can be built (A3A_fnc_junkyardPools), gated by the factory level in bands:
        band 1 (levels 1 to 4): wheeled cars and trucks that are not APCs and have light armor
        band 2 (levels 5 and 6): adds wheeled APCs, armored cars and boats
        band 3 (level 7): every vehicle, tracked and air included
    Build time: the junkyard repair complexity mapped to A3A_factoryBuildMinHours to A3A_factoryBuildMaxHours,
    halved for rebel faction vehicles, counted in income ticks (6 per hour, at least 1).

    List entry: [<STRING> class, <SCALAR> band, <SCALAR> ticks, <STRING> display name], sorted by display name.

Arguments:
    None

Return Value:
    <ARRAY> The list

Scope: Server
Environment: Scheduled (scans CfgVehicles on the first call)
Public: No
Dependencies: A3A_fnc_junkyardPools, A3A_fnc_junkyardPrice, A3A_fnc_junkyardComplexity

Example:
    [] spawn A3A_fnc_factoryBuildable;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); [] };

([] call A3A_fnc_junkyardPools) params ["_civ", "_reb", "_occ", "_inv", "_wildcards"];
private _all = _civ + _reb + _occ + _inv + _wildcards;
_all = _all arrayIntersect _all;

private _list = [];
{
    private _class = _x;
    private _cfg = configFile >> "CfgVehicles" >> _class;
    private _band = call {
        if (_class isKindOf "Car" and {!(_class isKindOf "Wheeled_APC_F")}) exitWith {
            [2, 1] select (getNumber (_cfg >> "armor") < A3A_factoryLightArmor)
        };
        if (_class isKindOf "Wheeled_APC_F" or {_class isKindOf "Ship"}) exitWith { 2 };
        3;
    };
    private _complexity = (([_class, [_class] call A3A_fnc_junkyardPrice] call A3A_fnc_junkyardComplexity) max 0) min 1;
    private _hours = A3A_factoryBuildMinHours + (A3A_factoryBuildMaxHours - A3A_factoryBuildMinHours) * _complexity;
    if (_class in _reb) then { _hours = _hours * 0.5 };
    private _ticks = 1 max round (6 * _hours);
    _list pushBack [getText (_cfg >> "displayName"), _class, _band, _ticks];
} forEach _all;

_list sort true;
_list = _list apply { [_x # 1, _x # 2, _x # 3, _x # 0] };

A3A_factoryBuildList = _list;
publicVariable "A3A_factoryBuildList";
Info_1("Factory production list built with %1 vehicles", count _list);
_list;
