_filename = "fn_VEHdespawner";
params ["_veh", ["_checkNonRebel", false]];

if (_veh getVariable ["ownerSide", teamPlayer] == teamPlayer) exitWith {};			// don't use this for rebel vehicles
if (!isNil {_veh getVariable "inDespawner"}) exitWith {};
_veh setVariable ["inDespawner", true, true];
_veh setVariable ["A3A_despawnerHandle", _thisScript];

while {alive _veh} do
{
	sleep 60;
	if !(alive _veh) exitWith {};

	private _despawn = call {
		if ({ alive _x } count crew _veh > 0) exitWith {false};
		if !(isNull attachedTo _veh) exitWith {false};		// don't despawn attached objects
		if ([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) exitWith {false};
		if !(_checkNonRebel) exitWith {true};
		if ([distanceSPWN,1,_veh,Occupants] call A3A_fnc_distanceUnits) exitWith {false};
		if ([distanceSPWN,1,_veh,Invaders] call A3A_fnc_distanceUnits) exitWith {false};
		true;
	};

	if (_despawn) exitWith {
		{ deleteVehicle _x } forEach attachedObjects _veh;
		deleteVehicle _veh;
	};
};
