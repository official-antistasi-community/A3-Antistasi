// Returns a randomly-selected road object on the fast path between two markers
// Excludes bridges (probably), most junctions and short/overlapped roads
// loadNavGrid and addNodesNearMarkers must be executed first

// _exclude is an array of positions that the returned position shouldn't be within _excludeRad of

// TODO: throws away too many long segments? could do two-level check instead

params ["_mrk1", "_mrk2", ["_exclude", []], ["_excludeRad", 700]];

private _route = [_mrk1, _mrk2] call A3A_fnc_findPathSimple;
if (_route isEqualType false) exitWith { objNull };
_route = _route apply { NavGrid#_x#0 };			// convert to positions

private _segmentWeights = [];
private _startNav = _route deleteAt 0;
{
    // If there's no road at either end then we skip
    if !(isNull roadAt _startNav or isNull roadAt _x) then {
        private _dist = _startNav distance _x;
        _segmentWeights pushBack [_startNav, _x];
        _segmentWeights pushBack _dist;
    };
    _startNav = _x;
} forEach _route;

private _road = objNull;
while { _segmentWeights isNotEqualTo [] } do
{
    private _segment = selectRandomWeighted _segmentWeights;
    if (_exclude isNotEqualTo []) then {
        private _pos1 = _segment#0;
        private _pos2 = _segment#1;
        private _segMid = _segment#0 vectorAdd _segment#1 vectorMultiply 0.5;
        if (_exclude inAreaArray [_segMid, _excludeRad, _excludeRad + (_pos1 distance _pos2), _pos1 getDir _pos2] isEqualTo []) exitWith {};

        private _segmentIndex = _segmentWeights find _segment;
        _segmentWeights deleteRange [_segmentIndex, 2];
        continue;
    };

    // TODO: Add mapinfo flag for maps that actually have good roads
    private _roads = [roadAt (_segment#0), roadAt (_segment#1)] call A3A_fnc_roadAStar;		// empty if no route found
    _roads = _roads select { !(getRoadInfo _x # 8) }		    	// not marked as bridge. Should check getPosATL as well?
        select { count roadsConnectedTo _x == 2 };		    	    // not a junction. Permissive version because some maps suck (Regero).
        //select { count (_x nearRoads 10) <= 1 };					// no short/overlapped roads
    if (_roads isNotEqualTo []) exitWith { _road = selectRandom _roads };

    private _segmentIndex = _segmentWeights find _segment;
    _segmentWeights deleteRange [_segmentIndex, 2];
};


// Now we have our target road! (or objNull, if none found)
_road;
