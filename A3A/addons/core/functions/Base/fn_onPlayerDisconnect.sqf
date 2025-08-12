#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_id", "_uid"];

Info_3("Player disconnected with id %1 and unit %2 on side %3", _uid, _unit, side _unit);

if (side _unit == sideLogic || {_uid == ""}) exitWith {
    Error("Exiting onPlayerDisconnect due to no UID or sideLogic unit. Possible Headless Client disconnect?");
};


// find original player unit in case of remote control
private _realUnit = _unit getVariable ["owner", _unit];

Debug_3("Player unit %1, original unit %2, boss %3", _unit, _realUnit, theBoss);

if (_realUnit == theBoss) then
{
	if (group petros == group _realUnit) then { [] spawn A3A_fnc_buildHQ };

	// Remove our real unit from boss
	_realUnit setVariable ["eligible", false, true];
	[] call A3A_fnc_assignBossIfNone;
};

//Need to check the group's side, as player may be a civ. Unknown is in case they've been moved out of their group.
if (side group _unit == teamPlayer || side group _unit == sideUnknown) then
{
	if (membershipEnabled and pvpEnabled) then
	{
		if (_uid in membersX) then {playerHasBeenPvP pushBack [_uid,time]};
	};
};

[_uid, _realUnit, false] call A3A_fnc_savePlayer;

// Preventing duping due to weapon loadout saves
if (alive _realUnit && {!(_realUnit getVariable ["incapacitated", false])} ) then { deleteVehicle _realUnit }
else { _realUnit setDamage 1 };			// finish off, if incapped
false;
