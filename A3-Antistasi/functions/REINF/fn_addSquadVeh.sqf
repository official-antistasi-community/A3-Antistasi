private ["_veh","_esStatic","_groupX","_maxCargo"];

if (count hcSelected player != 1) exitWith {["Add Squad Vehicle", "You must select one group on the HC bar"] call A3A_fnc_customHint;};

_groupX = (hcSelected player select 0);

if ((groupID _groupX == "Watch") or (groupID _groupX == "MineF")) exitwith {["Add Squad Vehicle", "This group has a vehicle already and their mission depends on it"] call A3A_fnc_customHint;};

_veh = cursortarget;

_typeX = typeOf _veh;

if ((!alive _veh) or (!canMove _veh)) exitWith {["Add Squad Vehicle", "The selected vehicle is destroyed or cannot move"] call A3A_fnc_customHint;};
if ({(alive _x) and (_x in _veh)} count allUnits > 0) exitWith {["Add Squad Vehicle", "Selected vehicle is not empty"] call A3A_fnc_customHint;};
if (_veh isKindOf "StaticWeapon") exitWith {["Add Squad Vehicle", "You cannot assign a Static Weapon to a Squad"] call A3A_fnc_customHint;};

_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") then {_esStatic = true}} forEach units _groupX;
if (_esStatic) exitWith {["Add Squad Vehicle", "Static Weapon Squads cannot change of vehicle"] call A3A_fnc_customHint;};

//_maxCargo = (_veh emptyPositions "Cargo") + (_veh emptyPositions "Commander") + (_veh emptyPositions "Gunner") + (_veh emptyPositions "Driver");
_maxCargo = (getNumber (configFile >> "CfgVehicles" >> (_typeX) >> "transportSoldier")) + (count allTurrets [_veh, true]) + 1;
if ({alive _x} count units _groupX > _maxCargo) exitWith {["Add Squad Vehicle", "The vehicle selected has no room for this squad"] call A3A_fnc_customHint;};

["Add Squad Vehicle", format ["Vehicle Assigned to %1 Squad", groupID _groupX]] call A3A_fnc_customHint;

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
