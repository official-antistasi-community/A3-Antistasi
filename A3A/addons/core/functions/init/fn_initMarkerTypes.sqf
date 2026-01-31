// Initialize O(1) marker types in garrison data
// Also sets up other missing global elements:
//  - garrison size for loaded roadblock/camp/city
//  - spawnPlaces copy from garrison for roadblock/camp/city


{ A3A_garrison get _x set ["type", "airport"] } forEach airportsX;
{ A3A_garrison get _x set ["type", "resource"] } forEach resourcesX;
{ A3A_garrison get _x set ["type", "factory"] } forEach factories;
{ A3A_garrison get _x set ["type", "outpost"] } forEach outposts;
{ A3A_garrison get _x set ["type", "seaport"] } forEach seaports;

A3A_garrison get "Synd_HQ" set ["type", "hq"];
{ A3A_garrison get _x set ["type", "rebpost"] } forEach outpostsFIA;

{
    A3A_garrison get _x set ["type", "city"];
    A3A_spawnPlacesHM set [_x, A3A_garrison get _x getOrDefault ["spawnPlaces", []] ];
} forEach citiesX;

{
    if (isOnRoad markerPos _x) then {
        A3A_garrison get _x set ["type", "roadblock"];
        A3A_garrisonSize set [_x, 6];
    } else {
        A3A_garrison get _x set ["type", "camp"];
        A3A_garrisonSize set [_x, 8];
    };
    A3A_spawnPlacesHM set [_x, A3A_garrison get _x get "spawnPlaces"];
} forEach controlsX;

{
    // Add numerical ID to each garrison vehicle & building for tracking
    private _garrison = _y;
    private _nextID = 1;
    { _x set [3, _nextID]; _nextID = _nextID + 1 } forEach (_garrison get "vehicles");
    //{ _x set [4, _nextID]; _nextID = _nextID + 1 } forEach (_garrison getOrDefault ["buildings", []]);     // cities don't have buildings

    // Register support vehicles in garrison (arty, SAM etc)
    // Uses hashmap of vehicle class -> support type
    // May as well run this for rebels too? Makes airfield swaps simpler
    private _supportVehicles = createHashMap;
    {
        private _supportType = A3A_supportVehTypes get _x#0;
        _supportVehicles set [_x#3, ["ready", _supportType, _x]];
    } forEach (_garrison get "vehicles" select {_x#0 in A3A_supportVehTypes});

    _garrison set ["supportVehicles", _supportVehicles];
    _garrison set ["nextVehID", _nextID];

} forEach A3A_garrison;
