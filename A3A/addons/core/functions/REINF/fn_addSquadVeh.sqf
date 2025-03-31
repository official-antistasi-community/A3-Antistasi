private ["_veh","_esStatic","_groupX","_maxCargo"];
private _titleStr = localize "STR_A3A_fn_reinf_addSqdVeh_title";
params [["_group",[]]];
if (_group isEqualTo []) then { // this logic is weird but theres not a great way to do it
	if (count hcSelected player != 1) exitWith {
		_group = [];
	};
	_group = hcSelected player;
};
if (_group isEqualTo []) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_select_group"] call A3A_fnc_customHint;};

_groupX = (_group select 0);

if ((groupID _groupX == "Watch") or (groupID _groupX == "MineF")) exitwith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_has_vehicle"] call A3A_fnc_customHint;};

_veh = cursortarget;

_typeX = typeOf _veh;

if ((!alive _veh) or (!canMove _veh)) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_veh_destr"] call A3A_fnc_customHint;};
if ({(alive _x) and (_x in _veh)} count allUnits > 0) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_empty"] call A3A_fnc_customHint;};
if (_veh isKindOf "StaticWeapon") exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_static"] call A3A_fnc_customHint;};

_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") then {_esStatic = true}} forEach units _groupX;
if (_esStatic) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_change"] call A3A_fnc_customHint;};

//_maxCargo = (_veh emptyPositions "Cargo") + (_veh emptyPositions "Commander") + (_veh emptyPositions "Gunner") + (_veh emptyPositions "Driver");
_maxCargo = (getNumber (configFile >> "CfgVehicles" >> (_typeX) >> "transportSoldier")) + (count allTurrets [_veh, true]) + 1;
if ({alive _x} count units _groupX > _maxCargo) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_room"] call A3A_fnc_customHint;};

[_titleStr, format [localize "STR_A3A_fn_reinf_addSqdVeh_assigned", groupID _groupX]] call A3A_fnc_customHint;

_owner = _veh getVariable "owner";
if (!isNil "_owner") then
	{
	{unassignVehicle _x; _x leaveVehicle _veh} forEach units _owner;
	};

if (count allTurrets [_veh, false] > 0) then
			{
			_veh allowCrewInImmobile true;
			};

_groupX addVehicle _veh;
_veh setVariable ["owner",_groupX,true];

leader _groupX assignAsDriver _veh;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
