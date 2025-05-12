#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//if (!isServer) exitWith{};
private ["_groups","_hr","_resourcesFIA","_wp","_groupX","_veh","_leave"];
private _titleStr = localize "STR_A3A_fn_reinf_dissSquad_title";

_groups = _this select 0;
_hr = 0;
_resourcesFIA = 0;
_leave = false;

{
	if ((groupID _x) in ["MineF", "Watch"]
		|| { isPlayer (leader _x)
		|| { (units _x) findIf { _x == petros } != -1 }})
	exitWith { _leave = true; };
} forEach _groups;

if (_leave) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_dissSquad_no_player"] call A3A_fnc_customHint;};

{
if (_x getVariable ["esNATO",false]) then {_leave = true};
} forEach _groups;

if (_leave) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_dissSquad_no_nato"] call A3A_fnc_customHint;};

_pos = getMarkerPos respawnTeamPlayer;

{
	theBoss sideChat format [localize "STR_A3A_fn_reinf_dismissSquad_RTB", _x];
	theBoss hcRemoveGroup _x;
	_wp = _x addWaypoint [_pos, 0];
	_wp setWaypointType "MOVE";
	sleep 3
} forEach _groups;

sleep 100;

private _assignedVehicles =	[];

{
	_groupX = _x;
	{
		if (alive _x) then
		{
			_hr = _hr + 1;
			_resourcesFIA = _resourcesFIA + (server getVariable [_x getVariable "unitType",0]) / 2;
			if (!isNull (assignedVehicle _x) and {isNull attachedTo (assignedVehicle _x)}) then
			{
				_assignedVehicles pushBackUnique (assignedVehicle _x);
			};
			_backpck = backpack _x;
			if (_backpck != "") then
			{
                private _assemblesTo = getText (configFile/"CfgVehicles"/_backpck/"assembleInfo"/"assembleTo");
				switch (true) do
				{
					case (_assemblesTo in (FactionGet(reb,"staticMortars"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
					case (_assemblesTo in (FactionGet(reb,"staticAA"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
					case (_assemblesTo in (FactionGet(reb,"staticMGs"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
					case (_assemblesTo in (FactionGet(reb,"staticAT"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
				};
			};
		};
		deleteVehicle _x;
	} forEach units _groupX;
	deleteGroup _groupX;
} forEach _groups;

{
	private _veh = _x;
	if !(typeOf _veh in FactionGet(all,"vehiclesReb")) then { continue };
	_resourcesFIA = _resourcesFIA + ([typeOf _veh] call A3A_fnc_vehiclePrice);
	{
		if !(typeOf _x in FactionGet(all,"vehiclesReb")) then { continue };
		_resourcesFIA = _resourcesFIA + ([typeOf _x] call A3A_fnc_vehiclePrice);
		deleteVehicle _x;
	} forEach attachedObjects _veh;
	deleteVehicle _veh;
} forEach _assignedVehicles;

_nul = [_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
