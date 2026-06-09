params ["_group", ["_checkNonRebel", false]];

if (!isNil { _group getVariable "A3A_despawnerHandle" }) exitWith {};
_group setVariable ["A3A_despawnerHandle", _thisScript];			// only meaningful locally

if (count units _group == 0) exitWith { deleteGroup _group };

// Strip spawner status. If the group is waiting to despawn then it's no longer active
{
	if (_x getVariable ["spawner", false]) then { _x setVariable ["spawner", nil, true] };
} forEach units _group;

private _eny1 = Occupants;
private _eny2 = Invaders;
private _side = side _group;
if (_side == Occupants) then {_eny1 = teamPlayer} else {if (_side == Invaders) then {_eny2 = teamPlayer}};

private _fnc_distCheckEnemy = {
	params ["_unit"];
	if !([distanceSPWN,1,_unit,_eny1] call A3A_fnc_distanceUnits) exitWith { true };
	if !([distanceSPWN,1,_unit,_eny2] call A3A_fnc_distanceUnits) exitWith { true };
	false;
};

private _fnc_distCheckRebel = {
	params ["_unit"];
	if !([distanceSPWN,1,_unit,teamPlayer] call A3A_fnc_distanceUnits) exitWith { true };
	false;
};

_fnc_distCheck = if (_checkNonRebel) then {_fnc_distCheckEnemy} else {_fnc_distCheckRebel};

while {count units _group > 0} do
{
	private _leader = objNull;
	waitUntil {
		sleep 10;
		_leader = leader _group;
		isNull _leader || {[_leader] call _fnc_distCheck};
	};
	if !(isNull _leader) then
	{
		private _pos = position _leader;
		{
			if (_x distance2d _pos < 100) then {
				if (vehicle _x != _x) then {
					{ deleteVehicle _x } forEach attachedObjects vehicle _x;
					deleteVehicle (vehicle _x);
				};
				deleteVehicle _x;
			};
		} forEach units _group;
	};
};

deleteGroup _group;
