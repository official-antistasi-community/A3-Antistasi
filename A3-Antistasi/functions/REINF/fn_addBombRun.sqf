_veh = cursortarget;

if (isNull _veh) exitWith {[localize "STR_antistasi_customHint_airstrike", localize "STR_antistasi_customHint_sell_veh_no_look"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {[localize "STR_antistasi_customHint_airstrike", localize "STR_antistasi_customHint_airstrike_destroyed"] call A3A_fnc_customHint;};

_units = (player nearEntities ["Man",300]) select {([_x] call A3A_fnc_CanFight) && (side _x isEqualTo Occupants || side _x isEqualTo Invaders)};
if (_units findIf {_unit = _x; _players = allPlayers select {(side _x isEqualTo teamPlayer) && (player distance _x < 300)}; _players findIf {_x in (_unit targets [true, 300])} != -1} != -1) exitWith {["Airstrike", "You can't convert Airstrikes while enemies are near you"] call A3A_fnc_customHint};
if (_units findIf{player distance _x < 100} != -1) exitWith {[localize "STR_antistasi_customHint_airstrike", "You can't convert Airstrikes while enemies are near you."] call A3A_fnc_customHint};

_near = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
_near = _near select {(player inArea _x) && (_veh inArea _x)};

if (_near isEqualTo []) exitWith {[localize "STR_antistasi_customHint_airstrike", format [localize "STR_antistasi_customHint_airstrike_airport",nameTeamPlayer]] call A3A_fnc_customHint;};

if ({isPlayer _x} count crew _veh > 0) exitWith {[localize "STR_antistasi_customHint_airstrike", localize "STR_antistasi_customHint_sell_veh_no_empty"] call A3A_fnc_customHint;};

_owner = _veh getVariable "ownerX";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {[localize "STR_antistasi_customHint_airstrike", localize "STR_antistasi_customHint_airstrike_owner"] call A3A_fnc_customHint;};

if (not(_veh isKindOf "Air")) exitWith {[localize "STR_antistasi_customHint_airstrike", localize "STR_antistasi_customHint_airstrike_onlyAir"] call A3A_fnc_customHint;};

_typeX = typeOf _veh;

if (isClass (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo")) then {
	if (count getArray (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo" >> "dissasembleTo") > 0) then {
		_exit = true;
	};
};
if (_exit) exitWith {[localize "STR_antistasi_customHint_airstrike", localize "STR_antistasi_customHint_airstrike_drone"] call A3A_fnc_customHint;};



_pointsX = 2;

if (_typeX in vehAttackHelis) then {_pointsX = 5};
if ((_typeX == vehCSATPlane) or (_typeX == vehNATOPlane)) then {_pointsX = 10};
deleteVehicle _veh;
[localize "STR_antistasi_customHint_airstrike", format [localize "STR_antistasi_customHint_airstrike_add",_pointsX]] call A3A_fnc_customHint;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];
