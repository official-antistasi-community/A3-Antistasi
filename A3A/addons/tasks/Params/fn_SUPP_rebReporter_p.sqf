_nearHostileCities = (call FUNC(nearHostileMarkers)) arrayIntersect citiesX;
_nearHostileCities = _nearHostileCities select {spawner getVariable _x != 0};
if (_nearHostileCities isEqualTo []) exitWith { false };
selectRandom _nearHostileCities;