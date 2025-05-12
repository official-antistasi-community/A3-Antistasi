/*
Author: Spoffy, jaj22, Håkon, Socrates
Description:
    Heals rebel units near HQ, restores there stamina, and allows units and vehicles to go undercover again.
    Restores fuel/repair/ammo if garage has corresponding sources.
    Ace compatible.

Arguments: <Nil>

Return Value: <Nil>

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <Object> boxX - Vehicle box at hq init to variable in init field in sqm
    <Boolean> HR_GRG_hasAmmoSource - flag if garage has stored ammo source
    <Boolean> HR_GRG_hasRepairSource - flag if garage has stored repair source
    <Boolean> HR_GRG_hasFuelSource - flag if garage has stored fuel source
    <Marker> respawnTeamPlayer - HQ marker

Example:

License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if ((serverTime - (boxX getVariable ["lastUsed", -30])) < 30) exitWith {
    if (hasInterface) then {
        [localize "STR_A3A_base_vehicleBoxRestore_restoration_title", localize "STR_A3A_base_vehicleBoxRestore_usedRecently"] call A3A_fnc_customHint;
    };
};
boxX setVariable ["lastUsed", serverTime, true];

//Heal, restore stamina, and clear report for rebel units near HQ
private _posHQ = getMarkerPos respawnTeamPlayer;
private _rebelPlayers = allUnits select {side _x in [teamPlayer, civilian] && {_x distance _posHQ < 50}};

{
    if (!isNil "ace_advanced_fatigue_fnc_handlePlayerChanged") then {
        // abuse the init/respawn function to reset ACE stamina
        [_x, objNull] remoteExec ["ace_advanced_fatigue_fnc_handlePlayerChanged", _x];
    } else {
        [_x, 0] remoteExec ["setFatigue", _x];
    };
    if (A3A_hasACEMedical) then {
        [_x, _x] call ace_medical_treatment_fnc_fullHeal;
    };
    if (A3A_hasACEHearing) then {
        [{ace_hearing_deafnessDV = 0;}] remoteExec ["call", _x];
    };
    _x setDamage 0;
    _x setVariable ["incapacitated",false,true];
    _x setVariable ["compromised", 0, true];
    if !(A3A_hasACEMedical) then {
        [true] remoteExecCall ["A3A_fnc_selfReviveReset", 0];
    };
} forEach _rebelPlayers;

private _hqVehicles = (vehicles inAreaArray [_posHQ, 150, 150]) select {
    alive _x && {(side group _x) in [sideUnknown, teamPlayer] && {speed _x < 10 }}
};

//clear report from vehicles that are at HQ and reported
{
    if (isNil {_x getVariable "A3A_reported"}) then { continue };
    _x setVariable ["A3A_reported", nil, true];
} forEach _hqVehicles;

if (HR_GRG_hasAmmoSource) then {
    {
        [_x,1] remoteExec ["setVehicleAmmo",_x];
    } forEach _hqVehicles;
};

if (HR_GRG_hasRepairSource) then {
    {
        _x setDamage 0;
        if (_x getVariable ["incapacitated",false]) then {_x setVariable ["incapacitated",false,true]};
    } forEach _hqVehicles;
};

if (HR_GRG_hasFuelSource) then {
    {
        [_x] remoteExecCall ["HR_GRG_fnc_refuelVehicleFromSources", 2];
        sleep 0.5; // delay to reduce broadcast spam
    } forEach _hqVehicles;
};

private _additiveTexts = [localize "STR_A3A_base_vehicleBoxRestore_noreported"]; 
 
if (HR_GRG_hasRepairSource) then { 
	_additiveTexts pushBack (localize "STR_A3A_base_vehicleBoxRestore_repaired"); 
}; 
if (HR_GRG_hasAmmoSource) then { 
	_additiveTexts pushBack (localize "STR_A3A_base_vehicleBoxRestore_rearmed"); 
}; 
if (HR_GRG_hasFuelSource) then { 
	_additiveTexts pushBack (localize "STR_A3A_base_vehicleBoxRestore_refueled"); 
}; 
 
private _finalAdditiveString = _additiveTexts joinString ""; 
 
private _finalStringVariant = [
    localize "STR_A3A_base_vehicleBoxRestore_healed",
    localize "STR_A3A_base_vehicleBoxRestore_restored_additive"
] select (count _additiveTexts > 1);

private _finalString = format [_finalStringVariant, _finalAdditiveString];

["vehicleBoxRestore", [_posHQ]] call EFUNC(Events,triggerEvent);
[localize "STR_A3A_base_vehicleBoxRestore_restoration_title", _finalString] call A3A_fnc_customHint;


nil
