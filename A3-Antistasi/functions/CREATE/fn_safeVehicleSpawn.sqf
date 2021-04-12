/*
 * Spawns a vehicle in a place that is *very likely* to be safe - or at least, free of collisions.
 * However, we have no guarantee that it will find a place, or that the place found will be free of collisions.
 * It is however a damn sight better than base Arma at achieving this.
 */


params ["_vehicleType", "_pos", ["_radius", 0], ["_attempts", 3], ["_force", false]];

private _spawnPosition = [];
private _willCollide = true;

private _vehicle = objNull;
if(_vehicleType isKindOf "Air") then
{
    _vehicle = createVehicle [_vehicleType, [0,0,100], [], 0, "FLY"];
    _pos = _pos vectorAdd [0, 0, 100];
}
else
{
    _vehicle = createVehicle [_vehicleType, [0,0,100], [], 0, "CAN_COLLIDE"];
};
//Disable simulation while we're testing. Save performance AND avoid it blowing up.
_vehicle enableSimulation false;

private _finished = false;

for "_i" from 1 to _attempts do {
	//We keep changing around the start position, to avoid findEmptyPosition repeatedly returning the same thing.
	//Makes the function more likely to succeed.
	private _randomOffset = [random (_radius - _radius / 2), random (_radius - _radius / 2), 0];
	_spawnPosition = (_pos vectorAdd _randomOffset) findEmptyPosition [0, (_radius / 2), _vehicleType];

	if !(_spawnPosition isEqualTo []) then {
		_willCollide = [_vehicle, _spawnPosition] call A3A_fnc_vehicleWillCollideAtPosition;
		_finished = !_willCollide;
	};

	if (_finished) exitWith {};
};

if (_willCollide && _force) then {
	_spawnPosition = [_spawnPosition, _pos] select (_spawnPosition isEqualTo []);
	_willCollide = false;
};


if !(_willCollide) exitWith {
	_vehicle setPos _spawnPosition;
	_vehicle enableSimulation true;
	_vehicle;
};

deleteVehicle _vehicle;
objNull;
