#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_location"];

private _groupPetros = if (isNull petros or {side group petros != teamPlayer}) then {createGroup teamPlayer} else {group petros};

// Don't re-use group if petros was killed by enemy while being moved
if (!isNil "_location" && count units _groupPetros > 1) then { _groupPetros = createGroup teamPlayer };

if (isNil "_location") then {
	if (count units _groupPetros > 1) then {
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

call A3A_fnc_initPetros;
