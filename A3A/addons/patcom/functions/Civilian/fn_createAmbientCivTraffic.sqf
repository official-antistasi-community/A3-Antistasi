/*
    Author: [Unknown] [Hazey]
    Description:
        Create Ambient Civ Vehicles within city

    Arguments:
        <String> City Marker where you would like the Ambient Civilians traffic created.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [[_marker], "A3A_fnc_createAmbientCivTraffic"] call A3A_fnc_scheduler;

    License: MIT License

    Note:
        The marker must be provided from citiesX
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

if (_markerX in destroyedSites) exitWith {};

// civ part of cities has a separate spawn state from the garrison
private _spawnKey = _markerX + "_civ";

private _groupsPatrol = [];
private _vehPatrol = [];
private _numCiv = A3A_cityData getVariable _markerX select 0;
private _area = [_markerX] call A3A_fnc_sizeMarker;
private _positionX = getMarkerPos (_markerX);
private _typeCiv = "";
private _typeVehX = "";
private _dirVeh = 0;

private _roads = nearestTerrainObjects [getMarkerPos _markerX, ["MAIN ROAD", "ROAD", "TRACK"], 250, false, true];

_numCiv = 15 * sqrt _numCiv * (1 - tierWar / 20);
private _numTraffic = _numCiv * (1/300) * civTraffic;
if ((daytime < 8) or (daytime > 21)) then { _numTraffic = _numTraffic / 4 };
_numTraffic = 1 max (round _numTraffic) min count _roads;


if ([_markerX,false] call A3A_fnc_fogCheck > 0.2) then {
    private _countTraffic = 0;
    private _patrolCities = [_markerX] call A3A_fnc_citiesToCivPatrol;

    if (count _patrolCities > 0) then {
        while {(spawner getVariable _spawnKey != 2) and (_countTraffic < _numTraffic)} do {
            private _p1 = selectRandom _roads;
            private _road = roadAt _p1;
            
            if (!isNull _road) then {
                if (count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) then {

                    // Create group and add them to patrol array for deletion later
                    private _groupP = createGroup civilian;
                    _groupsPatrol = _groupsPatrol + [_groupP];

                    // Get connected road and direction for use with facing the vehicle.
                    private _roadcon = roadsConnectedto _road;
                    private _p2 = getPosATL (_roadcon select 0);

                    // Face Vehicle to road direction.
                    _dirveh = [_p1, _p2] call BIS_fnc_DirTo;

                    // Get vehicle type based on weighted value.
                    _typeVehX = selectRandomWeighted civVehiclesWeighted;

                    // Create Civilian Vehicle
                    private _veh = _typeVehX createVehicle (getPosATL _p1);

                    // Set Vehicle direction to that of the road.
                    _veh setDir _dirveh;

                    // Magazine, Weapon, Item, Backpack, True = Clear
                    [_veh, true, true, true, true] call A3A_fnc_clearVehicleCargo;

                    // Add vehicle to currently spawned vehicles patrolling array. Used for deletion later.
                    _vehPatrol = _vehPatrol + [_veh];

                    // Creat AI Unit to add into Civilian Vehicle
                    private _civ = [_groupP, FactionGet(civ, "unitMan"), (getPosATL _p1), [],0, "NONE"] call A3A_fnc_createUnit;

                    // Add Event Handlers to Civilian inside vehicle
                    [_civ] spawn A3A_fnc_civilianInitEH;

                    // Move drive into the vehicle
                    _civ moveInDriver _veh;

                    // Add event handlers to vehicle
                    [_veh, civilian] call A3A_fnc_AIVEHInit;

                    // Add Civilian to vehicle
                    _groupP addVehicle _veh;

                    // Setup Vehicle Bahaviour
                    _groupP setBehaviour "CARELESS";
                    _veh limitSpeed 50;


                    // Create Vehicle waypoints
                    _posDestination = getPosATL (selectRandom (nearestTerrainObjects [getMarkerPos (selectRandom _patrolCities), ["ROAD", "TRACK"], 250, false, true]));
                    private _wp = _groupP addWaypoint [_posDestination,0];
                    _wp setWaypointType "MOVE";
                    _wp setWaypointSpeed "LIMITED";
                    _wp setWaypointTimeout [30, 45, 60];
                    _wp = _groupP addWaypoint [_positionX,1];
                    _wp setWaypointType "MOVE";
                    _wp setWaypointTimeout [30, 45, 60];
                    private _wp1 = _groupP addWaypoint [_positionX,2];
                    _wp1 setWaypointType "CYCLE";
                    _wp1 synchronizeWaypoint [_wp];
                };
            };
            _countTraffic = _countTraffic + 1;
            sleep 5;
        };
    };
};

waitUntil {sleep 1; (spawner getVariable _spawnKey == 2)};

// Chuck all the civ vehicle patrols into the despawners
{ [_x] spawn A3A_fnc_groupDespawner } forEach _groupsPatrol;
{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehPatrol;
