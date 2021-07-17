private ["_staticX","_nearX","_playerX"];

_staticX = _this select 0;
_playerX = _this select 1;

if (!alive _staticX) exitWith {[localize "STR_antistasi_customHint_steal", localize "STR_antistasi_customHint_steal_destroy"] call A3A_fnc_customHint;};

if (alive gunner _staticX) exitWith {[localize "STR_antistasi_customHint_steal", localize "STR_antistasi_customHint_steal_use"] call A3A_fnc_customHint;};

if ((alive assignedGunner _staticX) and (!isPlayer (assignedGunner _staticX))) exitWith {[localize "STR_antistasi_customHint_steal", localize "STR_antistasi_customHint_steal_alive"] call A3A_fnc_customHint;};

if (A3A_hasRHS and ((typeOf _staticX == staticATteamPlayer) or (typeOf _staticX == staticAAteamPlayer))) exitWith {[localize "STR_antistasi_customHint_steal", localize "STR_antistasi_customHint_steal_noDissassembled"] call A3A_fnc_customHint;};

_nearX = [markersX,_staticX] call BIS_fnc_nearestPosition;

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {[localize "STR_antistasi_customHint_steal", localize "STR_antistasi_customHint_steal_conquer"] call A3A_fnc_customHint;};

_staticX setOwner (owner _playerX);

private _staticClass =	typeOf _staticX;
private _staticComponents = getArray (configFile >> "CfgVehicles" >> _staticClass >> "assembleInfo" >> "dissasembleTo");

deleteVehicle _staticX;

//We need to create the ground weapon holder first, otherwise it won't spawn exactly where we tell it to.
private _groundWeaponHolder = createVehicle ["GroundWeaponHolder", (getPosATL _playerX), [], 0, "CAN_COLLIDE"];

for "_i" from 0 to ((count _staticComponents) - 1) do
	{
		_groundWeaponHolder addBackpackCargoGlobal [(_staticComponents select _i), 1];
	};

[_groundWeaponHolder] call A3A_fnc_postmortem;

[localize "STR_antistasi_customHint_steal", localize "STR_antistasi_customHint_steal_despawn"] call A3A_fnc_customHint;
