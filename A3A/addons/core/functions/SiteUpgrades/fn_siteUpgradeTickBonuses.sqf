/*
Maintainer: Shoter
    Site upgrade bonuses that act once per income tick, called from A3A_fnc_resourcecheck.

    Company town (resource level 7): the nearest rebel-held, not destroyed town within A3A_siteUpgradeCompanyTownRange
    of each level 7 resource gets +1 support, once per town per tick. Those towns are kept in A3A_siteCompanyTowns,
    where A3A_fnc_citySupportChange halves civilian death losses like the clinic does.
    Smugglers (seaport level 3): every second tick, each such seaport adds A3A_siteUpgradeSmugglerMags enemy faction
    magazines to the arsenal. They count towards unlocks.

Arguments:
    <BOOL> Run Smugglers on this call whatever the tick counter says [DEFAULT = false]

Return Value:
    <SCALAR> Number of magazines the Smugglers added this tick

Scope: Server
Environment: Any
Public: No
Dependencies: A3A_fnc_siteLevel, A3A_fnc_citySupportChange, jn_fnc_arsenal_itemType, jn_fnc_arsenal_addItem
    A3A_siteUpgradeCompanyTownRange, A3A_siteUpgradeSmugglerMags, A3A_faction_occ, A3A_faction_inv, A3A_customUnitTypes

Example:
    private _smuggled = [] call A3A_fnc_siteUpgradeTickBonuses;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_forceSmugglers", false, [false]]];

// Company town
private _companyTowns = [];
{
    if ([_x] call A3A_fnc_siteLevel < 7) then { continue };
    private _resPos = markerPos _x;
    private _towns = citiesX select {
        sidesX getVariable [_x, sideUnknown] == teamPlayer
        and {!(_x in destroyedSites)}
        and {markerPos _x distance2D _resPos <= A3A_siteUpgradeCompanyTownRange}
    };
    if (_towns isEqualTo []) then { continue };
    _companyTowns pushBackUnique ([_towns, _resPos] call BIS_fnc_nearestPosition);
} forEach resourcesX;

A3A_siteCompanyTowns = _companyTowns;
{ [1, _x, false] call A3A_fnc_citySupportChange } forEach _companyTowns;

// Smugglers
A3A_siteSmugglerTick = (missionNamespace getVariable ["A3A_siteSmugglerTick", 0]) + 1;
if (!_forceSmugglers and {A3A_siteSmugglerTick % 2 != 0}) exitWith { 0 };

private _ports = seaports select { [_x] call A3A_fnc_siteLevel >= 3 };
if (_ports isEqualTo []) exitWith { 0 };

// Magazines carried by the occupant and invader loadouts, gathered once
if (isNil "A3A_siteSmugglerPool") then {
    private _pool = [];
    private _fnc_addMag = {
        if (_this isEqualType "" and {_this != ""} and {isClass (configFile >> "CfgMagazines" >> _this)}) then { _pool pushBackUnique _this };
    };
    {
        private _prefix = _x # 0;
        {
            private _definition = A3A_customUnitTypes getVariable [format ["loadouts_%1_%2", _prefix, _x], []];
            if (_definition isEqualTo []) then { continue };
            {
                private _loadout = _x;
                // Loaded magazines of the primary, launcher and handgun
                {
                    private _weapon = _loadout # _x;
                    if (count _weapon > 5) then {
                        ((_weapon # 4) param [0, ""]) call _fnc_addMag;
                        ((_weapon # 5) param [0, ""]) call _fnc_addMag;
                    };
                } forEach [0, 1, 2];
                // Uniform, vest and backpack contents: magazines are [class, count, ammo]
                {
                    private _container = _loadout # _x;
                    if (count _container < 2) then { continue };
                    { if (count _x == 3) then { (_x # 0) call _fnc_addMag } } forEach (_container # 1);
                } forEach [3, 4, 5];
            } forEach (_definition # 0);
        } forEach keys (_x # 1 get "loadouts");
    } forEach [["occ", A3A_faction_occ], ["inv", A3A_faction_inv]];
    A3A_siteSmugglerPool = _pool;
    Info_1("Smugglers magazine pool: %1 classes", count _pool);
};
if (A3A_siteSmugglerPool isEqualTo []) exitWith { 0 };

// The arsenal counts magazines in rounds
private _added = 0;
for "_i" from 1 to (count _ports * A3A_siteUpgradeSmugglerMags) do {
    private _class = selectRandom A3A_siteSmugglerPool;
    private _rounds = getNumber (configFile >> "CfgMagazines" >> _class >> "count") max 1;
    [_class call jn_fnc_arsenal_itemType, _class, _rounds] call jn_fnc_arsenal_addItem;
    _added = _added + 1;
};
_added;
