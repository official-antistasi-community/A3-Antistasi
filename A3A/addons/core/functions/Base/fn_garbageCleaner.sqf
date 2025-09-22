#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
// Do not localise timeSpan, it is broadcast to all connected clients.
private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
[localize "STR_A3A_fn_base_gc_title", format [localize "STR_A3A_fn_base_gc_wait", _timeSinceLastGC]] remoteExec ["A3A_fnc_customHint", 0];
Info("Cleaning garbage...");

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
_rebelSpawners pushBack petros;

private _fnc_distCheck = {
	params["_object", "_dist"];
	if (_rebelSpawners inAreaArray [getPosATL _object, _dist, _dist] isEqualTo []) then { deleteVehicle _object };
};

Debug("Moving dead solders out of vehicles...")
{
	if !(isNull objectParent _x) then { moveOut _x };
} forEach allDeadMen;
Debug("Finished moving soldiers out of vehicles; executing garbage clean.")
sleep 0.5;

{ deleteVehicle _x } forEach allDead;
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolder");
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolderSimulated");
{ if (isNull attachedTo _x) then { [_x, 500] call _fnc_distCheck } } forEach (allMissionObjects FactionGet(reb,"surrenderCrate"));// Surrender boxes
{ deleteVehicle _x } forEach (allMissionObjects "Leaflet_05_F");				// Drone drop leaflets
{ deleteVehicle _x } forEach (allMissionObjects "Ejection_Seat_Base_F");		// All vanilla ejection seats

// Cleanup non-garrison vehicles
{
	if (!isNil {_x getVariable "markerX"}) then { continue };
	if !(_x isKindOf "StaticWeapon" or unitIsUAV _x) then { [_x, 500] call _fnc_distCheck };
} forEach (vehicles select {_x getVariable ["ownerSide", sideUnknown] == teamPlayer});


if (A3A_hasACE) then {
	{ deleteVehicle _x } forEach (allMissionObjects "ACE_bodyBagObject");
	{ deleteVehicle _x } forEach (allMissionObjects "UserTexture1m_F");						// ACE spraycan tags
	{ deleteVehicle _x } forEach (allMissionObjects "ace_cookoff_Turret_MBT_01");			//MBT turret wrecks
	{ deleteVehicle _x } forEach (allMissionObjects "ace_cookoff_Turret_MBT_02");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "ACE_Grave");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "ACE_envelope_big");		// ACE trench objects
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "ACE_envelope_small");
};

// Base type for trenches is Base_Bag_F, so we can't use that
if (isClass (configFile >> "CfgVehicles" >> "GRAD_envelope_short")) then {
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_short");	// GRAD trench objects
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_giant");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_vehicle");
	{ [_x, 200] call _fnc_distCheck } forEach (allMissionObjects "GRAD_envelope_long");
};

if (isClass (configFile/"CfgPatches"/"rhsgref_main")) then {//ToDo: these should be moved to owner mod detection and not the broad one as we may allow some rhs factions without all of rhs modset loaded
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_a10_acesII_seat");         // Ejection seat for A-10 and F-22
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_a10_canopy");              // other canopies delete on ground contact
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_k36d5_seat");              // AFRF ejection seat
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_vs1_seat");                // another dumb ejection seat
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_door_pilot");         // another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_door_gunner");        // another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_wing_left");          // another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_wing_right");         // another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_ka52_rps_rocket");         // ejection rocket? 
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_ka52_blade");              // blade for ka52
};


// Do not localise timeSpan, it is broadcast to all connected clients.
[localize "STR_A3A_fn_base_gc_title", format [localize "STR_A3A_fn_base_gc_deleted", _timeSinceLastGC]] remoteExec ["A3A_fnc_customHint", 0];
missionNamespace setVariable ["A3A_lastGarbageCleanTime",serverTime,true];
Info("Garbage clean completed");
