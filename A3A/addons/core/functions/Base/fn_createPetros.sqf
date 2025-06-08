// Server, unscheduled
// location will exist if it's a boss-chosen position, otherwise respawn or initial spawn

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_location"];

private _groupPetros = if (!A3A_petrosMoving) then {createGroup teamPlayer} else {group theBoss};

if (isNil "_location") then {
	if (A3A_petrosMoving) then {
		_location = getPosATL petros
	} else {
		_location = getMarkerPos respawnTeamPlayer
	};
};

private _oldPetros = petros;
private _identity = createHashMapFromArray [
    ["firstName", "Petros"],
    ["face", "GreekHead_A3_01"], 
    ["speaker", "Male06GRE"],
    ["pitch", 1.1]
];
petros = [_groupPetros, FactionGet(reb,"unitPetros"), _location, [], 10, "NONE", _identity] call A3A_fnc_createUnit;
publicVariable "petros";
deleteVehicle _oldPetros;		// Petros should now be leader unless there's a player in the group
deleteGroup group _oldPetros;	// won't delete unless empty, should be safe

call A3A_fnc_initPetros;
