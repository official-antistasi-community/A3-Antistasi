/*
Maintainer: Shoter
    Converts town upgrade save data written before the 2026-11 merge of the six upgrades into three.
        radio     -> clinic     (the clinic now also counts as a rebel radio tower)
        safehouse -> militia    (the militia post now also gives the safehouse fast travel and lie low)
        recruit   -> office     (the city office gives the money and HR bonuses)
        market    -> removed    (built markets are dropped, the office keeps the recruitment office building spot)
    A town that already has the merged upgrade keeps its own building, the legacy one is dropped.
    Kits still in transit are re-bound to the merged upgrade and keep the price paid, so returning one refunds it in full.
    A market kit becomes an office kit.
    Data without legacy ids passes through unchanged, so this runs on every load.

Arguments:
    <STRING> Save variable name, "cityInvest" or "townKits"
    <ANY> Saved value. cityInvest: HASHMAP city -> (id -> [posWorld, vectorDir, vectorUp]). townKits: ARRAY [[id, city, paid, posATL, dir], ...]

Return Value:
    <ANY> Converted value in the same format

Scope: Server
Environment: Any
Public: No
Dependencies:
    None

Example:
    _varValue = ["cityInvest", _varValue] call A3A_fnc_townUpgradeMigrate;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_varName", "", [""]], ["_varValue", []]];

// Legacy id -> merged id, "" = removed. Order matters for built upgrades: earlier entries claim the merged slot first
private _legacyMap = [["recruit", "office"], ["radio", "clinic"], ["safehouse", "militia"], ["market", ""]];
private _legacyIds = _legacyMap apply { _x # 0 };

if (_varName == "cityInvest" and {_varValue isEqualType createHashMap}) exitWith {
    private _result = createHashMap;
    {
        private _city = _x;
        private _old = _y;
        if !(_old isEqualType createHashMap) then { continue };
        // Current ids first, so an existing clinic or militia post keeps its own building
        private _new = createHashMap;
        { if !(_x in _legacyIds) then { _new set [_x, _y] } } forEach _old;
        {
            _x params ["_legacyId", "_mergedId"];
            if !(_legacyId in _old) then { continue };
            if (_mergedId == "") then { Info_2("Town upgrade migration: %1 in %2 removed", _legacyId, _city); continue };
            if (_mergedId in _new) then { Info_3("Town upgrade migration: %1 in %2 dropped, town already has %3", _legacyId, _city, _mergedId); continue };
            _new set [_mergedId, _old get _legacyId];
            Info_3("Town upgrade migration: %1 in %2 became %3", _legacyId, _city, _mergedId);
        } forEach _legacyMap;
        _result set [_city, _new];
    } forEach _varValue;
    _result;
};

if (_varName == "townKits" and {_varValue isEqualType []}) exitWith {
    private _result = [];
    {
        private _kit = +_x;
        if (_kit isEqualType [] and {count _kit > 1}) then {
            private _index = _legacyIds find (_kit # 0);
            if (_index != -1) then {
                private _mergedId = (_legacyMap # _index) # 1;
                if (_mergedId == "") then { _mergedId = "office" };
                Info_3("Town upgrade migration: %1 kit for %2 became %3 kit", _kit # 0, _kit # 1, _mergedId);
                _kit set [0, _mergedId];
            };
        };
        _result pushBack _kit;
    } forEach _varValue;
    _result;
};

_varValue;
