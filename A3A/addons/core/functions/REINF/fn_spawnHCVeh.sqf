/*
    Spawn vehicle near HQ for a high command squad
    Attempts to place facing into a road, otherwise fallbacks to random

Environment: Scheduled (because it's slow)

Arguments:
    1. <string> classname of vehicle to spawn
    2. unused (post-placement callback for confirmPlacement)
    3. unused (position check callback for confirmPlacement)
    4. <array> Parameters for spawning group with spawnHCGroup
    5. <array> Non-empty to create AA truck
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Same params as HR_GRG_fnc_confirmPlacement but doesn't use the callbacks
params ["_vehType", "", "", "_groupParams", "_mounts"];

private _vehicle = createVehicle [_vehType, [0,0,-1000], [], 0, "CAN_COLLIDE"];
_vehicle enableSimulation false;

private _bb = boundingBoxReal _vehicle;
private _bbSize = _bb#1 vectorDiff _bb#0;
_bbSize params ["_vehWidth", "_vehLength", "_vehHeight"];
private _slotSize = _bbSize vectorAdd [1.5, 0.3, 0.2];
_slotSize params ["_slotWidth", "_slotLength", "_slotHeight"];
private _slotRad = sqrt (_slotWidth^2 + _slotLength^2);

private _roads = nearestTerrainObjects [markerPos respawnTeamPlayer, ["MAIN ROAD", "ROAD", "TRACK"], 100, false, true];
_roads = _roads select { count roadsConnectedTo [_x, true] <= 2 };

private _spawnPos = false;
private _spawnDir = false;

for "_i" from 1 to 10 do {
    if (_roads isEqualTo []) exitWith {};
    private _road = selectRandom _roads;
    (getRoadInfo _road) params ["", "_roadWidth", "", "", "", "", "_begPos", "_endPos"];

    if !(_roadWidth isEqualType 0 and _begPos isEqualType []) then { continue };

    private _begPos2d = [_begPos#0, _begPos#1, 0];
    private _roadDir = _begPos2d vectorFromTo [_endPos#0, _endPos#1];
    private _slotDir = [_roadDir#1, -(_roadDir#0), 0] vectorMultiply selectRandom [1, -1];
    private _sideOffset = (_slotLength + _roadWidth) / 2;

    private _slotPos = _begPos vectorAdd ((_endPos vectorDiff _begPos) vectorMultiply random 1);
    _slotPos = _slotPos vectorAdd (_slotDir vectorMultiply _sideOffset);
    //if (count (_slotPos nearEntities (_slotLength max _slotWidth)/2) > 0) then { continue };

    // check Z diff isn't too high
    private _slotEndZ = ASLtoATL (_slotPos vectorAdd (_slotDir vectorMultiply _slotLength/2)) # 2;
    //systemChat format ["Z diff %1", _slotEndZ];
    if (_slotEndZ > 1.5 or _slotEndZ < -1.2) then { continue };

    // Check for (small) objects within slot area
    private _nearObj = ASLtoATL _slotPos nearEntities _slotRad;
    _nearObj append nearestObjects [_slotPos, ["Building"], _slotRad, true];          // Pretty much all editor-placeable objects are Building
    _nearObj append nearestTerrainObjects [_slotPos, ["FENCE","WALL","TREE","HOUSE","HIDE","POWER LINES"], _slotRad, false, true];
    if (_nearObj inAreaArray [_slotPos, _slotWidth/2, _slotLength/2, _slotDir#0 atan2 _slotDir#1, true] isNotEqualTo []) then { continue };

    // Actual vehicle collision
    if ([_slotPos, _slotDir, _vehLength, _vehWidth, _vehHeight] call A3A_fnc_boxCollisionCheck) then { continue };

    // Check that path is clear-ish for exit too
    private _checkPos = _slotPos vectorAdd (_slotDir vectorMultiply -0.35*_roadwidth);
    private _checkLength = _slotLength + _roadWidth*0.7;
    if ([_checkPos, _slotDir vectorMultiply -1, _checkLength, _slotWidth, _slotHeight] call A3A_fnc_boxCollisionCheck) then { continue };
    _spawnPos = ASLtoATL _slotPos;
    _spawnDir = _slotDir vectorMultiply -1;
    break;
};

if (_spawnPos isEqualType false) then {
    // Random search fallback
    private _searchCenter = markerPos respawnTeamPlayer getPos [50 + random 50, random 360];
    _spawnPos = _searchCenter findEmptyPosition [0, 50, _vehType];
    if (_spawnPos isEqualTo []) then {_spawnPos = _searchCenter};
    _vehicle setVehiclePosition [_spawnPos, [], 0, "NONE"];
    _vehicle setDir random 360;
} else {
    isNil {
        _vehicle setVehiclePosition [_spawnPos, [], 0, "CAN_COLLIDE"];
        _vehicle setVectorDir _spawnDir;
    };
};
_vehicle enableSimulation true;

if (_mounts isNotEqualTo []) then {
    private _static = (FactionGet(reb,"staticAA")) # 0 createVehicle _spawnPos;
    private _nodes = [_vehicle, _static] call A3A_Logistics_fnc_canLoad;
    if (_nodes isEqualType 0) exitWith {};
    (_nodes + [true]) call A3A_Logistics_fnc_load;
    _static call HR_GRG_fnc_vehInit;
};

_groupParams + [_vehicle] spawn A3A_fnc_spawnHCGroup;
