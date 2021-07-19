_veh = cursortarget;
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
#define OccAndInv(VEH) (FactionGet(occ, VEH) + FactionGet(inv, VEH))
if (isNull _veh) exitWith {["Airstrike", "You are not looking at a vehicle."] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {["Airstrike", "You can't convert destroyed Air vehicle to Airstrikes."] call A3A_fnc_customHint;};

_units = (player nearEntities ["Man",300]) select {([_x] call A3A_fnc_CanFight) && (side _x isEqualTo Occupants || side _x isEqualTo Invaders)};
if (_units findIf {_unit = _x; _players = allPlayers select {(side _x isEqualTo teamPlayer) && (player distance _x < 300)}; _players findIf {_x in (_unit targets [true, 300])} != -1} != -1) exitWith {["Airstrike", "You can't convert Airstrikes while enemies are near you"] call A3A_fnc_customHint};
if (_units findIf{player distance _x < 100} != -1) exitWith {["Airstrike", "You can't convert Airstrikes while enemies are near you."] call A3A_fnc_customHint};

_near = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
_near = _near select {(player inArea _x) && (_veh inArea _x)};

if (_near isEqualTo []) exitWith {["Airstrike", format ["You and the Air vehicle need to be in the Area of an %1 Airport or HQ in order to convert it to Airstrikes",FactionGet(reb,"name")]] call A3A_fnc_customHint;};

if ({isPlayer _x} count crew _veh > 0) exitWith {["Airstrike", "In order to convert, Vehicle must be empty."] call A3A_fnc_customHint;};

_owner = _veh getVariable "ownerX";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {["Airstrike", "You are not the owner of this vehicle. Therefore, you can't convert it."] call A3A_fnc_customHint;};

if (not(_veh isKindOf "Air")) exitWith {["Airstrike", "Only Air Vehicles can be used to increase Airstrike points"] call A3A_fnc_customHint;};

_typeX = typeOf _veh;

if (isClass (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo")) then {
	if (count getArray (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo" >> "dissasembleTo") > 0) then {
		_exit = true;
	};
};
if (_exit) exitWith {["Airstrike", "Backpack drones can't be used to increase Airstrike points"] call A3A_fnc_customHint;};



_pointsX = 2;

if (_typeX in FactionGet(all,"vehiclesAttackHelis")) then {_pointsX = 5};
if (_typeX in (OccAndInv("vehiclesPlanesCAS") + OccAndInv("vehiclesPlanesAA"))) then {_pointsX = 10};
deleteVehicle _veh;
["Airstrike", format ["Air Support increased in %1 points",_pointsX]] call A3A_fnc_customHint;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];
