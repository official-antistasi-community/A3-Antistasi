_markerX = [markersX,player] call BIS_fnc_nearestPosition;

_sideX = side player;
_nameX = if (_sideX == Occupants) then {nameOccupants} else {nameInvaders};

if (sidesX getVariable [_markerX,sideUnknown] != _sideX) exitWith {[localize "STR_a3_cfgeditorsubcategories_edsubcat_transportation0", format [localize "STR_antistasi_customHint_transport_noZone",_nameX]] call A3A_fnc_customHint;};
if ((!(_markerX in airportsX)) and (!(_markerX in seaports)) and (!(_markerX in outposts))) exitWith {[localize "STR_a3_cfgeditorsubcategories_edsubcat_transportation0", localize "STR_antistasi_customHint_transport_noZoneSide"] call A3A_fnc_customHint;};
if (not(player inArea _markerX)) exitWith {[localize "STR_a3_cfgeditorsubcategories_edsubcat_transportation0", localize "STR_antistasi_customHint_transport_noZoneOrder"] call A3A_fnc_customHint;};

_typeBike = if (_sideX == Occupants) then {selectRandom vehNATOPVP} else {selectRandom vehCSATPVP};

if (!isNull lastVehicleSpawned) then
	{
	if (lastVehicleSpawned distance player < 100) then {deleteVehicle lastVehicleSpawned};
	};

[localize "STR_a3_cfgeditorsubcategories_edsubcat_transportation0", localize "STR_antistasi_customHint_transport_available"] call A3A_fnc_customHint;
_pos = [];
_radius = 10;
while {_pos isEqualTo []} do
	{
	_pos = (position player) findEmptyPosition [5,_radius,"I_Truck_02_covered_F"];
	_radius = _radius + 10;
	};
lastVehicleSpawned = createVehicle [_typeBike,_pos, [], 10, "NONE"];

[lastVehicleSpawned, _sideX] call A3A_fnc_AIVEHinit;
