/*
    Worker function to spawn police station objects and static units.

    Environment: Scheduled, used by garrison spawn functions.

    Arguments:
    <HASHMAP> Active garrison data.
    <STRING> Marker name.
    <HASHMAP> Garrison data from server.
    <ARRAY> Remaining troops to use, either loadout names for rebel or [count, quality] for enemy.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_activeGarrison", "_marker", "_garrisonData", "_storedTroops"];

if (_activeGarrison get "side" != Occupants) exitWith {};

private _buildingPos = _garrisonData get "policeStation";       // should be guaranteed position on call
private _station = nearestBuilding _buildingPos;
if (!alive _station) exitWith {
    Error("Police station already destroyed?");
};
_activeGarrison set ["policeStation", _station];            // in case we need it for something later


// Spawn the building objects
private _objData = getArray (configOf _station >> "A3A_policeStationObjects");
if (_objData isEqualTo []) exitWith {
    Error_1("No police station data for building type %1 found", typeof _station);
};

private _furniture = [];
private _intelPos = [];
{
	_x params ["_class", "_pos", "_dir"];

    // Loot crate special case
    if (_class == "Box_NATO_Wps_F") then {
        if (_garrisonData getOrDefault ["lootCD", 0] > 0) then { continue };     // still on cooldown, don't spawn the loot
        private _rpos = _station modelToWorld _pos;
	    private _obj = createVehicle [A3A_faction_reb get "surrenderCrate", _rpos, [], 0, "CAN_COLLIDE"];
        _obj setDir (_dir + getDir _station);
        [_obj, false, _activeGarrison, _marker] call A3A_fnc_setupLootCrate;
        continue;
    };
    // Direct intel position special case
    if (_class == "Land_Document_01_F") then { _intelPosDir = _pos; continue };

	private _obj = objNull;
    isNil {
        private _rpos = _station modelToWorld _pos;
        _obj = createVehicle [_class, _rpos, [], 0, "CAN_COLLIDE"];
    	_obj setDir (_dir + getDir _station);
        _obj enableSimulationGlobal false;
    };
    _furniture pushBack _obj;

    if (_class == "OfficeTable_01_old_F") then {
        // Put intel papers on table (actually works for any table)
        private _bb = boundingBoxReal [_obj, "Geometry"];
        _intelPos = getPosATL _obj vectorAdd [0, 0, _bb#1#2 - _bb#0#2];
    };
    if (_class == "Banner_01_F") then {
        _obj setObjectTextureGlobal [0, A3A_faction_occ get "flagTexture"];
    };

} forEach _objData;

if (_intelPos isNotEqualTo [] and _garrisonData getOrDefault ["intelCD", 0] <= 0) then {
    private _intelType = A3A_faction_occ get "placeIntel_itemMedium" select 0;          // assume this isn't a computer...
    private _intel = createVehicle [_intelType, _intelPos, [], 0, "CAN_COLLIDE"];
    _intel setVectorUp [0,0,1];
    _intel setVariable ["side", Occupants, true];
    _intel setVariable ["marker", _marker, true];              // so we know what to cool down
    [_intel, "Intel_Medium"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_intel];
    _furniture pushBack _intel;
};

_station setVariable ["A3A_furniture", _furniture, 2];          // broadcast to server so it can be deleted on destruction
_activeGarrison get "buildings" append _furniture;


// Spawn the static troops in the police station
_storedTroops params ["_count", "_quality"];
private _buildingPositions = _station buildingPos -1;

private _numUnits = (4 + round random 1) min (count _buildingPositions) min (_count);
if ((_count - _numUnits) % 2 == 1) then { _numUnits = _numUnits - 1 };        // so that we have even number of patrols

private _lowTypes = flatten (A3A_faction_occ get "groupsPoliceSmall");
private _highTypes = flatten (A3A_faction_occ get "groupsMilitiaSmall");
private _highUnits = round (_numUnits * (_quality%1));

private _curGroup = createGroup _side;
_curGroup deleteGroupWhenEmpty true;

for "_i" from 1 to _numUnits do
{
    private _placePos = _buildingPositions deleteAt floor random count _buildingPositions;
    private _type = if (_i <= _highUnits) then { selectRandom _highTypes } else { selectRandom _lowTypes };

    private _unit = [_curGroup, _type, _placePos, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit setDir (_station getRelDir _placePos);
    [_unit, _marker] call A3A_fnc_NATOinit;
    _unit setUnitPos "UP";
    dostop _unit;

    sleep 0.1;
};

_garrison set ["buildingGroup", _curGroup];
_garrison get "groups" pushBack _curGroup;
_garrison get "troops" append units _curGroup;

_storedTroops set [0, _count - _numUnits];
