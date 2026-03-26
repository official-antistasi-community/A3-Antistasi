// Generate path of ASL positions from coast to deep sea
// returns [] if no sufficient path found

params ["_marker", ["_radius", 300], ["_travelDist", 2000]];

//_marker = "seaport_2";// "factory_4";//"Katalaki";//"seaport";//"outpost_25";//"seaport_3";//"Kalithea";

// waterDepth returns actual depth in metres. factor [a,b] caps range to 0 at <=a, 1 at >=b
private _places = selectBestPlaces [markerPos _marker, _radius, "2*(waterDepth factor [0,0.01]) - waterDepth", 30, 10] select { _x#1 > 0 };
_places = _places select { _x#0 nearObjects ["Piers_base_F", 30] isEqualTo [] };
if (isClass (configFile >> "CfgPatches" >> "CUP_Terrains_Winter_Objects")) then {_places = _places select { _x#0 nearObjects ["Land_nav_pier_m_2", 30] isEqualTo []}};
_places = _places select { nearestTerrainObjects [_x#0, ["ROCK"], 30, false, true] isEqualTo [] };
if (_places isEqualTo []) exitWith { [] };

// improve accuracy. Needed or not? Cheap anyway
private _approxPos = selectRandom _places select 0;
private _place = selectBestPlaces [_approxPos, 15, "2*(waterDepth factor [0,0.01]) - waterDepth", 3, 1] select 0;
private _sea = selectBestPlaces [_approxPos, 15, "waterdepth", 3, 1] select 0;

// Now for the path search, general idea is to iteratively search a fan of positions for the highest sea depth
private _lastDir = _place#0 getDir _sea#0;
private _lastPos = ATLtoASL [_place#0#0, _place#0#1, 0];
private _testDist = 10;

private _path = [_lastPos];
private _pathlen = 0;

while { _pathlen < _travelDist } do
{
    // Find deepest point in 100-degree arc
    private _bestPos = [0,0,1e6];
    private _bestDepth = 1e6;
    for "_offset" from -50 to 50 step 10 do {
        private _testPos = ATLtoASL (_lastPos getPos [_testDist, _lastDir+_offset]);

        // second point contribution, in case of local minima
        private _testPos2 = ATLtoASL (_lastPos getPos [_testDist*2, _lastDir+_offset]);

        // bias towards forward, if depths are close
        private _depth = (_testPos#2 + 0.5*_testPos2#2) / (1 + 0.001 * abs _offset);
        if (_depth < _bestDepth) then { _bestPos = _testPos; _bestDepth = _depth };
    };

    // If we're too shallow, bail out
    private _minDepth = -(5 min (_pathLen/50));
    if (_bestPos#2 > _minDepth) exitWith {};

    _path pushBack _bestPos;
    _pathlen = _pathlen + _testDist;
    _lastDir = _lastPos getDir _bestPos;
    _lastPos = _bestPos;
    _testDist = (_testDist * 1.5) min 200;
};

if (_pathlen < _travelDist) then { _path = [] };

_path;
