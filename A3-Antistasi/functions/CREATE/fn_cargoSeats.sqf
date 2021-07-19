#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _filename = "fn_cargoSeats";
params ["_veh", "_sideX"];

private _faction = Faction(_sideX);
private _groupData = FactionGetGroups(_sideX);
private _isMilitia = _veh in ((_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaTrucks") + (_faction get "vehiclesMilitiaCars"));

private _totalSeats = [_veh, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
private _crewSeats = [_veh, false] call BIS_fnc_crewCount; // Number of crew seats only
private _cargoSeats = _totalSeats - _crewSeats;
if (_veh in (_faction get "vehiclesPolice")) then { _cargoSeats = 4 min _cargoSeats };

if (_cargoSeats < 2) exitwith { [] };

if (_cargoSeats < 4) exitWith
{
	if (_isMilitia) exitWith { selectRandom (_groupData get "militia_Small") };
	if (_veh in (_faction get "vehiclesPolice")) exitWith { _groupData get "police" };
	_groupData get "sentry";
};

if (_cargoSeats < 7) exitWith			// fudge for Warrior
{
	if (_isMilitia) exitWith { selectRandom (_groupData get "militia_Medium") };
	if (_veh in (_faction get "vehiclesPolice")) exitWith { (_groupData get "police") + [_groupData get "police_Grunt", _groupData get "police_Grunt"] };
	selectRandom (_groupData get "medium");
};

private _squad = call {
	if (_isMilitia) exitWith { selectRandom (_groupData get "militia_Squads") };
    selectRandom (_groupData get "squads")
};
if (_cargoSeats == 7) then { _squad deleteAt 7 };
_squad;
