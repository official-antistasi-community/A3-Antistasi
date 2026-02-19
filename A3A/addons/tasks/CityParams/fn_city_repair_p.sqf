#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

// Looking for a place to put a parked car
// Use a civ car spawn place that's currently unused and isn't too visible to players
private _carPlaces = A3A_spawnPlacesHM get (_marker + "_civ") select { _x#0 == "civCar" };

private _place = false;
for "_i" from 1 to 10 do {
    private _testPlace = _carPlaces deleteAt (floor random count _carPlaces);
    if (isNil "_testPlace") exitWith {};
    private _pos = _testPlace#1;
    if (_pos nearEntities 3 isNotEqualTo []) then { continue };             // place has car in it, probably

    // conditions... player within 100m, or player within 500m has LOS?
    private _nearPlayers = allPlayers inAreaArray [_pos, 500, 500] - entities "HeadlessClient_F";
    if (_nearPlayers inAreaArray [_pos, 100, 100] isNotEqualTo []) then { continue };

    private _checkPos = ATLtoASL _pos vectorAdd [0,0,1];
    if (-1 == _nearPlayers findIf { [_x, "VIEW"] checkVisibility [eyePos _x, _checkPos] > 0.2 }) exitWith { _place = _testPlace };
};
if (_place isEqualType false) exitWith {
    Debug_1("Found no suitable positions in %1", _marker);
    false;
};

// Assume we can find a house somewhere for the mechanic
[_marker, _place#1, _place#2];
