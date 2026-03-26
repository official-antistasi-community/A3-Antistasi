/*
    Complete HQ move process, put petros back into own group
	Also used for choosing new HQ position after petros death

    Scope: Server
    Environment: Unscheduled
    Public: Yes

    Example:
    [player] remoteExecCall ["A3A_fnc_buildHQ", 2];
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (A3A_petrosMoving) then {
	A3A_petrosMoving = false; publicVariable "A3A_petrosMoving";

	private _groupPetros = createGroup teamPlayer;
	[petros] join _groupPetros;
	_groupPetros selectLeader petros;

	group petros setGroupOwner 2;
	[] spawn {
		waitUntil {sleep 0.01; local petros};
		petros switchAction "PlayerStand";
		petros disableAI "MOVE";
		petros disableAI "AUTOTARGET";
		petros setBehaviour "SAFE";
	};

	[respawnTeamPlayer, 1, teamPlayer] call A3A_fnc_setMarkerAlphaForSide;
	[respawnTeamPlayer, 1, civilian] call A3A_fnc_setMarkerAlphaForSide;
};


// Update cur/old HQ knowledge
private _oldPos = markerPos "Synd_HQ";
private _newPos = getPosATL petros;

_oldPos set [2, A3A_curHQInfoOcc];
A3A_oldHQInfoOcc pushBack +_oldPos;
A3A_curHQInfoOcc = 0;
{
	private _dist = _x distance2d _newPos;
	A3A_curHQInfoOcc = A3A_curHQInfoOcc max linearConversion [0, 1000, _dist, _x#2, 0, true];
} forEach A3A_oldHQInfoOcc;

_oldPos set [2, A3A_curHQInfoInv];
A3A_oldHQInfoInv pushBack +_oldPos;
A3A_curHQInfoInv = 0;
{
	private _dist = _x distance2d _newPos;
	A3A_curHQInfoInv = A3A_curHQInfoInv max linearConversion [0, 1000, _dist, _x#2, 0, true];
} forEach A3A_oldHQInfoInv;


// Do the actual HQ position set
respawnTeamPlayer setMarkerPos _newPos;
posHQ = _newPos; publicVariable "posHQ";
"Synd_HQ" setMarkerPos _newPos;

chopForest = false; publicVariable "chopForest";

[_newPos] call A3A_fnc_relocateHQObjects;


// Move nearby buildings, statics & vehicles into HQ garrison
private _buildingsInArea = A3A_buildingsToSave inAreaArray "Synd_HQ";
{
	["Synd_HQ", _x] call A3A_fnc_garrisonServer_addVehicle;
} forEach _buildingsInArea;
A3A_buildingsToSave = A3A_buildingsToSave - _buildingsInArea;


// Only conditions are unattached for statics and no crew for vehicles?
// Probably need to check what exactly counts as a vehicle here
{
	if (!alive _x) then { continue };
	if (fullCrew [_x, "", true] isEqualTo []) then { continue };			// only want real vehicles & statics here

	if (_x isKindOf "staticWeapon") then {
		if (!isNull attachedTo _x) then { continue };
	} else {
		if (count crew _x != 0) then { continue };
	};

	["Synd_HQ", _x, false] call A3A_fnc_garrisonServer_addVehicle;

} forEach (vehicles inAreaArray "Synd_HQ");
call A3A_fnc_calcBuildingReveal;

["HQPlaced", [_newPos]] call EFUNC(Events,triggerEvent);
