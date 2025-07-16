private ["_veh","_esStatic","_group","_maxCargo"];
private _titleStr = localize "STR_A3A_fn_reinf_addSqdVeh_title";
params [["_group", grpNull]];
if (isNull _group and count hcSelected player == 1) then {
    _group = hcSelected player # 0;
};

if (isNull _group) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_select_group"] call A3A_fnc_customHint;};

if ((groupID _group == "Watch") or (groupID _group == "MineF")) exitwith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_has_vehicle"] call A3A_fnc_customHint;};

_veh = cursortarget;

_typeX = typeOf _veh;

if ((!alive _veh) or (!canMove _veh)) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_veh_destr"] call A3A_fnc_customHint;};
if ({(alive _x) and (_x in _veh)} count allUnits > 0) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_empty"] call A3A_fnc_customHint;};
if (_veh isKindOf "StaticWeapon") exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_static"] call A3A_fnc_customHint;};

_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") then {_esStatic = true}} forEach units _group;
if (_esStatic) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_change"] call A3A_fnc_customHint;};

//_maxCargo = (_veh emptyPositions "Cargo") + (_veh emptyPositions "Commander") + (_veh emptyPositions "Gunner") + (_veh emptyPositions "Driver");
_maxCargo = (getNumber (configFile >> "CfgVehicles" >> (_typeX) >> "transportSoldier")) + (count allTurrets [_veh, true]) + 1;
if ({alive _x} count units _group > _maxCargo) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdVeh_no_room"] call A3A_fnc_customHint;};

[_titleStr, format [localize "STR_A3A_fn_reinf_addSqdVeh_assigned", groupID _group]] call A3A_fnc_customHint;

_owner = _veh getVariable "owner";
if (!isNil "_owner") then
	{
	{unassignVehicle _x; _x leaveVehicle _veh} forEach units _owner;
	};

if (count allTurrets [_veh, false] > 0) then
			{
			_veh allowCrewInImmobile true;
			};

_group addVehicle _veh;
_veh setVariable ["owner",_group,true];

leader _group assignAsDriver _veh;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _group;
