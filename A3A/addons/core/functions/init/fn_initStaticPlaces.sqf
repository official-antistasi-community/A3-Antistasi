/*
    Find places for statics in major sites and add them to A3A_spawnPlacesHM

    Environment: Init only
    Arguments: None

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

/*
// example spawning code:
private _building = cursorObject;
private _pos = _building modelToWorld [-2.34473,-0.65332,-0.560341];
private _veh = createVehicle ["I_HMG_02_high_F", _pos, [], 0, "CAN_COLLIDE"];
_veh setDir (180 + getDir _building);

// Data collection. Place statics on building, then run this while looking at building:
_building = cursorObject;
_statics = [[typeof _building]];
{
	_pos = _building worldToModel (getPosATL _x);
	_dir = getDir _x - getDir _building;
	_statics pushBack ["MG", _pos, _dir];
} forEach vehicles;
_statics;
*/

// Compile building classes from config to hashmap for faster lookup
private _buildingHM = createHashMap;
{
    private _class = configName _x;
    if !(isClass (configFile >> "CfgVehicles" >> _class)) then { continue };        // may as well strip buildings that aren't in the modset
    private _places = getArray (_x >> "places");
    _buildingHM set [_class, _places];
} forEach ("true" configClasses (configFile >> "A3A" >> "StaticPlaces"));


params ["_markers"];

private _usedBuildings = [];
{
    private _radius = vectorMagnitude markerSize _x;
    private _buildings = nearestObjects [markerPos _x, keys _buildingHM, _radius, true];
    _buildings = _buildings inAreaArray _x;

    private _places = A3A_spawnPlacesHM get _x;        // should be generated already for other place types
    {
        if (_x in _usedBuildings) then {continue};       // don't re-use same building for different markers
        _usedBuildings pushBack _x;

        private _building = _x;
        private _buildingPlaces = (_buildingHM get typeof _x);
        if (isNil "_buildingPlaces") then { continue };             // currently possible due to isKindOf matching
        {
            private _pos = _building modelToWorld _x#1;
            private _dir = (_x#2 + getDir _building + 360) % 360;
            _places pushBack ["static"+(_x#0), _pos, _dir, _building];

        } forEach _buildingPlaces;
    } forEach _buildings;
} forEach _markers;
