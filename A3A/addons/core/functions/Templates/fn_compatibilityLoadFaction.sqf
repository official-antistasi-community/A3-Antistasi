/*

 * File: fn_compatabilityLoadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file, and transforms it into the old global variable system for sides.
 * Params:
 *    _file - Faction definition file path
 *    _side - Side to load them in as
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_file", "_side"];

Info_2("Compatibility loading template: '%1' as side %2", _file, _side);

private _factionDefaultFile = ["EnemyDefaults","EnemyDefaults","RebelDefaults","CivilianDefaults"] #([west, east, independent, civilian] find _side);
_factionDefaultFile = QPATHTOFOLDER(Templates\Templates\FactionDefaults) + "\" + _factionDefaultFile + ".sqf";

private _faction = [[_factionDefaultFile,_file]] call A3A_fnc_loadFaction;
_faction set ["side", _side];
private _factionPrefix = ["occ", "inv", "reb", "civ"] #([west, east, independent, civilian] find _side);
missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction];
[_faction, _factionPrefix] call A3A_fnc_compileGroups;

private _baseUnitClass = switch (_side) do {
    case west: { "a3a_unit_west" };
    case east: { "a3a_unit_east" };
    case independent: { "a3a_unit_reb" };
    case civilian: { "a3a_unit_civ" };
};

private _unitClassMap = if (_side isNotEqualTo independent) then { createHashMap } else {
    createHashMapFromArray [                // Cases matter. Lower case here because allVariables on namespace returns lowercase
        ["militia_Unarmed", "a3a_unit_reb_unarmed"],
        ["militia_Rifleman", "a3a_unit_reb"],
        ["militia_staticCrew", "a3a_unit_reb"],
        ["militia_Medic", "a3a_unit_reb_medic"],
        ["militia_Sniper", "a3a_unit_reb_sniper"],
        ["militia_Marksman", "a3a_unit_reb_marksman"],
        ["militia_LAT", "a3a_unit_reb_lat"],
        ["militia_MachineGunner", "a3a_unit_reb_mg"],
        ["militia_ExplosivesExpert", "a3a_unit_reb_exp"],
        ["militia_Grenadier", "a3a_unit_reb_gl"],
        ["militia_SquadLeader", "a3a_unit_reb_sl"],
        ["militia_Engineer", "a3a_unit_reb_eng"],
        ["militia_AT", "a3a_unit_reb_at"],
        ["militia_AA", "a3a_unit_reb_aa"],
        ["militia_Petros", "a3a_unit_reb_petros"]
    ]
};
//validate loadouts
private _loadoutsPrefix = format ["loadouts_%1_", _factionPrefix];
private _allDefinitions = _faction get "loadouts";

#if __A3_DEBUG__
    [_faction, _file] call A3A_fnc_TV_verifyLoadoutsData;
#endif

//Register loadouts globally.
{
    private _loadoutName = _x;
    private _unitClass = _unitClassMap getOrDefault [_loadoutName, _baseUnitClass];
    [_loadoutsPrefix + _loadoutName, _y + [_unitClass]] call A3A_fnc_registerUnitType;
} forEach _allDefinitions;

#if __A3_DEBUG__
    [_faction, _side, _file] call A3A_fnc_TV_verifyAssets;
#endif

if (_side in [Occupants, Invaders]) then {
    // Compile light armed that also have 4+ passenger seats
    private _lightArmedTroop = (_faction get "vehiclesLightArmed") select {
        ([_x, true] call BIS_fnc_crewCount) - ([_x, false] call BIS_fnc_crewCount) >= 4
    };
    _faction set ["vehiclesLightArmedTroop", _lightArmedTroop];

    private _cargoCapable = (_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks") + (_faction get "vehiclesMilitiaTrucks")
        select { [_x] call A3A_Logistics_fnc_getVehCapacity > 1 };
    _faction set ["vehiclesCargo", _cargoCapable];

    private _faction = Faction(_side);
    private _noSAM = _faction getOrDefault ["attributeNoSAM", false];
    if (!_noSAM) then {
        private _configSide = [_side, "supportSide", 0] call A3A_fnc_getConfigTemplate;
        private _SAMs = _faction get "vehiclesSAM";
        if (_SAMs isEqualTo [] && (!_noSAM)) then {
            private _selectedSAM = ["O_SAM_System_04_F", "B_SAM_System_03_F"] select (_configSide > 0);
            _faction set ["vehiclesSAM", [_selectedSAM]];
        };
        private _radars = _faction get "vehiclesRadar";
        if (_radars isEqualTo []) then {
            private _selectedRadar = ["O_Radar_System_02_F", "B_Radar_System_01_F"] select (_configSide > 0);
            _faction set ["vehiclesRadar", [_selectedRadar]];
        };
    };

    private _noType = [];
    if ((_faction get "vehiclesHelisAttack") + (_faction get "vehiclesHelisLightAttack") + (_faction get "vehiclesHelisTransport")
        + (_faction get "vehiclesHelisLight") isEqualTo []) then { _noType pushBack "heli" };
    if (_faction get "staticAT" isEqualTo []) then { _noType pushBack "staticAT" };
    if (_faction get "vehiclesGunBoats" isEqualTo []) then { _noType pushBack "boat" };
    if ((_faction get "vehiclesPlanesAA") + (_faction get "vehiclesPlanesCAS") isEqualTo []) then { _noType append ["plane", "runway"] };
    if (_faction get "vehiclesArtillery" isEqualTo []) then { _noType pushBack "vehicleArty" };
    _faction set ["noPlaceTypes", _noType];
};

_faction;
