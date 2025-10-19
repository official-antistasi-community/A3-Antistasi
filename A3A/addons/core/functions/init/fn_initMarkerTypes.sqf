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
