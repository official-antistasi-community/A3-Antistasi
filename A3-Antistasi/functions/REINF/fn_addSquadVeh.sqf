private ["_veh","_esStatic","_groupX","_maxCargo"];

if (count hcSelected player != 1) exitWith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_auto_target_no_select"] call A3A_fnc_customHint;};

_groupX = (hcSelected player select 0);

if ((groupID _groupX == "Watch") or (groupID _groupX == "MineF")) exitwith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_vehSq_already"] call A3A_fnc_customHint;};

_veh = cursortarget;

_typeX = typeOf _veh;

//if (cursortarget == "") exitWith {hint "You are not looking at anything"};
//if ((not(_typeX in vehFIA)) and (not(_typeX in vehAAFland)) and (not(_typeX in arrayCivVeh))) exitWith {hint "You are not looking to a valid vehicle"};

if ((!alive _veh) or (!canMove _veh)) exitWith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_vehSq_destroy"] call A3A_fnc_customHint;};
if ({(alive _x) and (_x in _veh)} count allUnits > 0) exitWith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_vehSq_noEmpty"] call A3A_fnc_customHint;};
if (_veh isKindOf "StaticWeapon") exitWith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_vehSq_static"] call A3A_fnc_customHint;};

_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") then {_esStatic = true}} forEach units _groupX;
if (_esStatic) exitWith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_vehSq_noChange"] call A3A_fnc_customHint;};

//_maxCargo = (_veh emptyPositions "Cargo") + (_veh emptyPositions "Commander") + (_veh emptyPositions "Gunner") + (_veh emptyPositions "Driver");
_maxCargo = (getNumber (configFile >> "CfgVehicles" >> (_typeX) >> "transportSoldier")) + (count allTurrets [_veh, true]) + 1;
if ({alive _x} count units _groupX > _maxCargo) exitWith {[localize "STR_antistasi_customHint_vehSq", localize "STR_antistasi_customHint_vehSq_noRoom"] call A3A_fnc_customHint;};

[localize "STR_antistasi_customHint_vehSq", format [localize "STR_antistasi_customHint_vehSq_assigned", groupID _groupX]] call A3A_fnc_customHint;

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





