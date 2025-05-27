params ["_marker", "_side"];

private _garrison = createHashMapFromArray [ ["statics", []], ["buildings", []], ["vehicles", []] ];

// trivial for now. Could add some props later, maybe a static

_garrison set ["troops", [6, 3]];

A3A_spawnPlacesHM set [_marker, []];
A3A_garrison set [_marker, _garrison];
