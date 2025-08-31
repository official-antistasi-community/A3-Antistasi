#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

// Find building with places that's not too close to enemies or players
private _markerPos = markerPos _marker;
private _blockers = (units Occupants + units teamPlayer) inAreaArray [_markerPos, 250, 250];
private _house = objNull;
for "_i" from 1 to 10 do {
    private _rpos = _markerPos getPos [200 * sqrt random 1, random 360];
    private _testHouse = nearestBuilding _rpos;         // should guarantee places?
    if (_blockers inAreaArray [getPosATL _testHouse, 20, 20] isNotEqualTo []) then { continue };
    if (count (_testHouse buildingPos -1) >= 4) exitWith { _house = _testHouse };
};
if (isNull _house) exitWith {
    Debug_1("Failed to find suitable place in %1", _marker);
    false;
};

[_marker, _house];
