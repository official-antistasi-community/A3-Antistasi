/*
    Add vehicle/static of specific type to enemy garrison
    Slot type/number selected at higher level

    Used by? Just init and reinf, so enemy garrisons?
    Vehicles never added in any other way? Not yet...
*/

// Not used by init, because it just dumps classnames & places straight into the array?
// Should reinf use random slot or not?
// 

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_vehClass", "_slotType", "_slotNum"];

Trace_1("Called with params %1", _this);

if (sidesX getVariable _marker == teamPlayer) exitWith {
    Error("Attempted to add vehicle type to rebel garrison");
};

private _garrison = A3A_garrison get _marker;
(_garrison get _slotType) pushBack [_vehClass, _slotNum];

// Add to active garrison if spawned
if (!isNil {A3A_garrisonMachine get _marker}) then {
    ["addVehicleType", [_marker, _vehClass, _slotType, _slotNum]] call A3A_fnc_garrisonOp;
};

Trace("Completed");

// ah, can convert slotNum to slot type trivially?
// just lookup in A3A_spawnPlacesHM
// so don't need to pass in slot type?

/*
Initgarrisons:

Ok, so we have a basic choice about how many entries to add to garrison
Wait, third choice?
- Expand garrison vehicles to position + type
- Could maybe save the array...

Ah fuck, was there an alternative?
- Completely general spawn place index, positions
- spawnPlaceStats just needs to store the valid indices

Only problem is that it breaks down if map markers are changed?
- store total place count as part of garrison data?
- or do sanity check at some point? Can compare object type to spawn place type

Ok so this isn't bad...
1. Spawn places all dumped into single array, add extra placeType entry
2. spawnPlaceStats now includes an array of place indexes
3. Need sanity-check on load, just refund vehicles that are in the wrong category?

Advantages?
1. No extra place type entry in garrison
2. Can check counts purely by place index
3. Only code that needs the lookup is reinf?
*/

/*
reinf?

Needs to iterate over both markers (of side) and then over place types

// need current counts...

private _weights = createHashMapFromArray [["mortar", 1], ["staticAA", 1], ["staticMG", 1], ["vehicle", 0.6], ["heli", 0.3], ["plane", 0.3], ["boat", 0.6]];

{
    private _typeWeights = [];

    // Guaranteed only to use places?
    private _usedPlaces = (_garrison get "vehicles") apply {_x#1};
    _usedPlaces append ((_garrison get "statics") apply {_x#1});

    {
        if (_x == "troops") then { continue };          // handled elsewhere?
        _y params ["_places", "_max", "_par"];
        if (_par == 0) then { continue };               // probably shouldn't happen?

        private _countUsed = count (_usedPlaces arrayIntersect _places);
        if (_countUsed >= _par) then { continue };
        private _finalWeight = (_weights get _x) * (1 - _countUsed / _par);
        _typeWeights pushBack [_x, _finalWeight];

    } forEach (A3A_spawnPlaceStats get _marker);        // hashmap, place type to [placeindexes, max, par]

} forEach _markers;     // of correct side...

// ok, so that would actually work...

