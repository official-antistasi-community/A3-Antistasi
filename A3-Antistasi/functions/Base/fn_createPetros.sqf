#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params [["_location", []]];

private _groupData = FactionGet(reb, "groups");
private _oldPetros = if (isNil "petros") then {objNull} else {petros};
private _groupPetros = if (!isNull _oldPetros && {side group _oldPetros == teamPlayer}) then {group _oldPetros} else {createGroup teamPlayer};

// Hack-fix for bugged case where petros is killed by enemy while being moved
if (count _location > 0 && count units _groupPetros > 1) then { _groupPetros = createGroup teamPlayer };

private _position = if (count _location > 0) then {
	_location
} else {
	if (getPos _oldPetros isEqualTo [0,0,0]) then {
		getMarkerPos respawnTeamPlayer
	} else {
		getPos _oldPetros
	};
};

petros = [_groupPetros, _groupData get "Petros", _position, [], 10, "NONE"] call A3A_fnc_createUnit;
publicVariable "petros";

deleteVehicle _oldPetros;		// Petros should now be leader unless there's a player in the group

private _name = if (worldName == "Tanoa") then {"Maru"} else {"Petros"};
[petros, "friendlyX"] remoteExec ["setIdentity", 0];
[petros, _name] remoteExec ["setName", 0];

if (petros == leader _groupPetros) then {
	_groupPetros setGroupIdGlobal ["Petros","GroupColor4"];
	petros disableAI "MOVE";
	petros disableAI "AUTOTARGET";
	petros setBehaviour "SAFE";
	[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian]]
} else {
	[Petros,"buildHQ"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian]]
};

call A3A_fnc_initPetros;
