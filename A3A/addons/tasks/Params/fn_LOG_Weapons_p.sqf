#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _hqPos = markerPos "Synd_HQ";
private _maxDist = distanceMission;
private _markers = (resourcesX + factories + seaports + outposts - blackListDest);      // no airports as source?
_markers = _markers inAreaArray [_hqPos, _maxDist, _maxDist] select {sidesX getVariable _x != teamPlayer};
private _players = allPlayers - entities "HeadlessClient_F";

private _place = [];
while {_place isEqualTo [] and _markers isNotEqualTo []} do {
    private _source = _markers deleteAt floor random count _markers;
    private _sourceDist = markerPos _source distance2d _hqPos;
    private _side = sidesX getVariable _source;

    private _suppMarkers = [_source, false] call A3A_fnc_findLandSupportMarkers apply {_x#0};
    _suppMarkers = _suppMarkers inAreaArray [_hqPos, _maxDist+500, _maxDist+500] select {sidesX getVariable _x == _side}
        select {spawner getVariable _x == 2};           // only use unspawned destination markers to give better chance of truck despawning on RTB

    while {_place isEqualTo [] and _suppMarkers isNotEqualTo []} do {
        private _dest = _suppMarkers deleteAt floor random count _suppMarkers;
        private _destPos = markerPos _dest;
        if (markerPos _source distance2d _destPos < 1200) then {continue};
        if (_sourceDist + (_destPos distance2d _hqPos) > 1.5*distanceMission) then {continue};      // avoid routes that stay outside mission distance

        // ok, now have a source/dest pair to test the route for
        private _exclude = _players + [_source, _dest];         // mixed obj/pos but that should be ok
        private _baseRoad = [_source, _dest, _exclude, 500] call A3A_fnc_selectRoadBetweenMarkersNav;
        if (isNull _baseRoad) then {continue};

        // Check any suitable roads near this one
        private _roads = _baseRoad nearRoads 100 select { getPosATL _x # 2 < 0.5 }      // not a bridge
            select { count roadsConnectedTo _x == 2 };		    	    // not a junction. Permissive version because some maps suck (Regero).

        while {_roads isNotEqualTo []} do {
            private _road = _roads deleteAt floor random count _roads;
            private _start = getRoadInfo _road # 6;
            private _end = getRoadInfo _road # 7;
            private _roaddir = _start getDir _end;
            private _roadlen = _start distance2d _end;
            if (_road nearEntities _roadlen*0.75 isNotEqualTo []) then {continue};

            private _placePos = false;
            for "_i" from 4 to _roadlen step 5 do {
                private _testPos = _start getPos [_i, _roaddir];
                _placePos = [_testPos, _roaddir] call A3A_fnc_checkRoadPlace;
                if (_placePos isEqualType []) exitWith {};
                _placePos = [_testPos, _roaddir+180] call A3A_fnc_checkRoadPlace;
                if (_placePos isEqualType []) exitWith {};
            };
            if (_start distance2d _destPos < _end distance2d _destPos) then { _roaddir = _end getDir _start };
            if (_placePos isEqualType []) exitWith { _place = [_placePos, _roaddir, _dest] };
        };
    };
};
if (_place isEqualTo []) exitWith {false};

[1, _place];
