params ["_marker", "_side"];

private _garrison = createHashMapFromArray [ ["buildings", []], ["vehicles", []] ];

// trivial for now. Could add some props later, maybe a static

private _quality = ["camp", _side, 0.2] call A3A_fnc_getSiteTroopQuality;
_garrison set ["type", "camp"];
_garrison set ["troops", [8, _quality]];
_garrison set ["spawnPlaces", []];      // none atm
A3A_spawnPlacesHM set [_marker, []];
A3A_garrisonSize set [_marker, 8];

// Backwards compat mostly. Delete mines that are within the area
private _nearMines = allMines inAreaArray [markerPos _marker, 300, 300];
{ deleteVehicle _x } forEach _nearMines;

A3A_garrison set [_marker, _garrison];
