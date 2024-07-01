// TODO UI-update: update header

/*
Maintainer: Caleb Serafin, DoomMetal

License: APL-ND

*/

// Returns info about a group
// Group name, position, alive/combat ready counts, vehicle status etc.
// Mostly rewritten stuff from REINF/fn_vehStats.sqf
// TODO UI-update: This might be a good idea to split up into multiple functions

/* Current return layout:
  [
  0: The group itself, object
  1: groupID, i.e. the display name, string
  2: group leader, object
  3: units, array
  4: leader position, position
  5: alive units count, number
  6: combat-ready units count, number
  7: current task (will be implemented when merging), string
  8: combat mode ("behaviour"), string
  9: has medic, bool
  10: has AT, bool
  11: has AA, bool
  12: has mortar, bool
  13: mortar deployed, bool
  14: has static weapon, bool
  15: static deployed, bool
  16: vehicle (not yet implemented)
  17: icon
  18: icon color
  ]
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_group", grpNull]];
if (_group isEqualTo grpNull) exitWith {
  Error("No group specified");
};

private _groupID = groupID _group;
private _groupLeader = leader _group;
private _units = units _group;
private _aliveUnits = {alive _x} count _units;
private _ableToCombat = {[_x] call A3A_fnc_canFight} count _units;
private _task = "N/A"; // TODO UI-update: Update when merging: _x getVariable ["taskX","Patrol"]
private _combatMode = behaviour _groupLeader;
private _hasOperativeMedic = {[_x] call A3A_fnc_isMedic} count _units > 0;
private _hasAt = {_x call A3A_fnc_typeOfSoldier == "ATMan"} count _units > 0;
private _hasAa = {_x call A3A_fnc_typeOfSoldier == "AAMan"} count _units > 0;

// Mortars and statics
private _hasMortar = false;
private _mortarDeployed = false;
private _hasStatic = false;
private _staticDeployed = false;

// If the group has variable mortarsX OR if any of the units has a mortar
if (!(isNull(_group getVariable ["mortarsX",objNull])) or ({_x call A3A_fnc_typeOfSoldier == "StaticMortar"} count _units > 0)) then {
  _hasMortar = true;
	if ({vehicle _x isKindOf "StaticWeapon"} count _units > 0) then {
    _mortarDeployed = true;
  };
} else {
  // Check for static weapons
	if ({_x call A3A_fnc_typeOfSoldier == "StaticGunner"} count _units > 0) then {
    _hasStatic = true;
		if ({vehicle _x isKindOf "StaticWeapon"} count _units > 0) then {
			_staticDeployed = true;
		};
	};
};

// Get group vehicle
private _groupVehicle = [_group] call FUNC(getGroupVehicle);

// Get group icon
private _groupIconId = _group getVariable "BIS_MARTA_ICON_TYPE";
private _groupIcon = "n_unknown";
if !(isNil "_groupIconId") then {
  _groupIcon = (_group getGroupIcon _groupIconId) # 0;
};

if (_groupIcon isEqualTo "dummy") then {
  _groupIcon = "n_unknown";
};

// Get group icon color
private _groupIconColor = getGroupIconParams _group # 0;

[_group, _groupID, _groupLeader, _units, _aliveUnits, _ableToCombat, _task, _combatMode, _hasOperativeMedic, _hasAt, _hasAa, _hasMortar, _mortarDeployed, _hasStatic, _staticDeployed, _groupVehicle, _groupIcon, _groupIconColor];
