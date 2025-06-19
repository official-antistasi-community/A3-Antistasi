params ["_marker", "_side"];

private _garrison = createHashMapFromArray [ ["buildings", []], ["vehicles", []] ];

// trivial for now. Could add some props later, maybe a static

_garrison set ["troops", [8, 3]];
_garrison set ["spawnPlaces", []];      // none atm
A3A_spawnPlacesHM set [_marker, []];

A3A_garrison set [_marker, _garrison];
