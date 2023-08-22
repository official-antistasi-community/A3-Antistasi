/* 
Maintainer: John Jordan
    Generates possible attack targets and weights given target and attacking sides

Arguments:
    <SIDE> Target side
    <SIDE> Attacking side

Return Value:
    <ARRAY,ARRAY> [targets, weights]
        Where each element of targets is an array of:
        [targetMarker, sourceMarker, value, localThreat, flyoverThreat, countLandAttackBases]
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_targetSide", "_side"];


private _possibleStartBases = airportsX select {sidesX getVariable [_x, sideUnknown] == _side && [_x] call A3A_fnc_airportCanAttack};
_possibleStartBases pushBack (["NATO_carrier", "CSAT_carrier"] select (_side == Invaders));
private _airportPositions = _possibleStartBases apply { markerPos _x };

private _possibleTargets = airportsX + outposts + seaports + factories + resourcesX;
if (_targetSide == teamPlayer) then {_possibleTargets = _possibleTargets + citiesX};
_possibleTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] == _targetSide};

// Add rebel HQ as attack target if the enemy side knows about it
private _hqInfo = [A3A_curHQInfoOcc, A3A_curHQInfoInv] select (_side == Invaders);
if (_targetSide == teamPlayer and _hqInfo >= 1) then { _possibleTargets pushBack "Synd_HQ" };

if (count _possibleTargets == 0 || count _possibleStartBases == 0) exitWith {
    Info("Attack found no suitable targets or no suitable start bases, aborting!"); [[], []];
};
Debug_2("%1 possible targets for attack found, possible start points are %2", count _possibleTargets, _possibleStartBases);


//**************** Data preparation *************************************************************

// Build X/Y/threat array for all enemy locations
private _markersXYT = [];
private _maxThreatDist = distanceForAirAttack + 1000;
{
    private _markerSide = sidesX getVariable [_x, sideUnknown];
    if (_markerSide == _side) then { continue };
    if (gameMode != 1 && _markerSide != _targetSide) then { continue };
    if (_airportPositions inAreaArray [markerPos _x, _maxThreatDist, _maxThreatDist] isEqualTo []) then { continue };

    private _garrison = A3A_garrison get _x;
    private _threat = 10 * count (_garrison get "troops");
    if (_markerSide == teamPlayer) then {
        _threat = _threat + 50 * (count (_garrison get "statics") + count (_garrison get "vehicles"));
    } else {
        // based on typical static count
        _threat = _threat + call {
            if (_x in controlsX or _x in seaports) exitWith { 50 };
            if (_x in outposts) exitWith { 150 };
            if (_x in airportsX) exitWith { 600 };
            0;
        };
    };
    //Debug_2("Marker %1, threat %2", _x, _threat);
    if (_threat == 0) then { continue };
    _markersXYT pushBack [markerPos _x # 0, markerPos _x # 1, _threat];
} forEach markersX;


// use these for target value determination
private _radioTowers = antennas + antennasDead;

private _lowAir = Faction(_side) getOrDefault ["attributeLowAir", false];

// Build list of friendly bases with ground attack capability
// airportCanAttack state might change during the actual attack, so this is only approximate
private _landBases = [];
{
    if (sidesX getVariable [_x, sideUnknown] != _side) then { continue };
    if ([_x] call A3A_fnc_airportCanAttack) then { _landBases pushBack _x };
} forEach (airportsX + outposts);


private _rebelPlayers = allPlayers - (entities "HeadlessClient_F");
private _rebelAISpawners = (units teamPlayer - _rebelPlayers) select { _x getVariable ["spawner", false] };

//**************** Actual target search *************************************************************

private _finalTargets = [];
private _finalWeights = [];
{
    // Early-out if there are no airbases within range
    if (_airportPositions inAreaArray [markerPos _x, distanceForAirAttack, distanceForAirAttack] isEqualTo []) then { continue };

    // Target value calc
    private _value = if (_x in citiesX) then {
        // just base this on population?
        private _baseValue = sqrt ((server getVariable _x) # 0);                   // Low-value but threat is probably low too due to lack of garrison
        if (_side == Occupants) exitWith { _baseValue * (1.5 - tierWar / 10) };    // Occupants more likely to care about towns at low tiers
        _baseValue * (tierWar / 5);                                                // Invaders more likely to care at high tiers
    } else {
        private _baseValue = call {
            if (_x in outposts) exitWith { [20, 25] select (count (_radioTowers inAreaArray _x) > 0) };
            if (_x == "Synd_HQ") exitWith { 60 };
            if (_x in seaports) exitWith { 20 };
            if (_x in airportsX) exitWith { [60, 90] select (count _possibleStartBases == 1) };        // If down to carrier, more important to take an airfield
            if (_x in factories) exitWith { 15 };
            10;     // resources
        };
        _baseValue + ([_x, true] call A3A_fnc_garrisonSize) / 2;         // Bit of preference for large/defensible targets. Don't use frontline adjustment here
    };

    // calculate local target difficulty
    private _target = _x;
    private _targpos = markerPos _x;
    private _localMarkers = _markersXYT inAreaArray [_targpos, 1500, 1500];
    private _nonLocalMarkers = _markersXYT - _localMarkers;
    private _localThreat = 0;
    {
        private _dist = _x distance2d _targpos;
        private _threat = (_x#2) * linearConversion [500, 1500, _dist, 1, 0, true];
        _localThreat = _localThreat + _threat;
        if (_dist > 500) then { _nonLocalMarkers pushBack [_x#0, _x#1, (_x#2) - _threat] };
    } forEach _localMarkers;

    // If it's rebel, assume active defence. Avoid attacking enemy targets that are already under attack by rebels
    if (_targetSide == teamPlayer) then {
        _localThreat = _localThreat + 150;
    } else {
        _localThreat = _localThreat + 30 * count (_rebelPlayers inAreaArray [_targpos, 500, 500]);
    };
    // Rebel AIs count either way, as they're relatively static
    _localThreat = _localThreat + 10 * count (_rebelAISpawners inAreaArray [_targpos, 500, 500]);

    // Supply convoys shortcut
    if (_x in citiesX and _side == Occupants) then {
        private _landBase = [_x] call A3A_fnc_findBasesForConvoy;
        if (_landBase == "") then { continue };             // no suitable base found 
        _finalTargets pushBack [_target, _landBase, _value, _localThreat, 0, 1];
        _finalWeights pushBack (_value / _localThreat^0.8) ^ 2;
        continue;
    };

    // Count ground attack bases that are usable against the target
    private _countLand = call {
        private _targNavIndex = _target call A3A_fnc_getMarkerNavPoint;
        private _suppMarkers = [_targNavIndex, _lowAir] call A3A_fnc_findLandSupportMarkers apply { _x#0 };
        count (_suppMarkers arrayIntersect _landBases);
    };

    // Check distance and add flyover threat for each airport source
    private _weights = [];
    private _totalWeight = 0;
    private _maxWeight = 0;
    {
        private _basePos = markerPos _x;
        private _dist = _basePos distance2d _targPos;
        if (_dist > distanceForAirAttack) then { continue };
        private _midpoint = (_basePos vectorAdd _targPos) vectorMultiply 0.5;
        private _targDir = _basePos getDir _targPos;
        private _flyoverMarkers = _nonLocalMarkers inAreaArray [_midpoint, 1200, _dist/2, _targDir, true];
        private _sideVec = [cos _targDir, -sin _targDir, 0];
        private _flyoverThreat = 0;
        {
            private _dist = abs ((_x vectorDiff _basePos) vectorDotProduct _sideVec);
            private _threat = (_x#2) * linearConversion [200, 1200, _dist, 1, 0, true];
            _flyoverThreat = _flyoverThreat + _threat;
            if (_flyoverThreat > 300) exitWith {};      // early out

            //private _flyoverPos = _x;            
            //private _mrkIndex = markersX findIf { markerPos _x distance2d _flyoverPos < 10 };
            //Debug_3("From %1, dist %2 threat %3", markersX select _mrkIndex, _dist, _threat);

        } forEach _flyoverMarkers;

        //Debug_3("%1 flyover threat from %2 to %3", _flyoverThreat, _x, _target);

        if (_flyoverThreat > 300) then { continue };
        _finalTargets pushBack [_target, _x, _value, _localThreat, _flyoverThreat, _countLand];

        private _difficulty = if (_lowAir) then {
            private _distFactor = linearConversion [0, distanceForAirAttack, _dist, 0.5, 1.5, true];
            (_localThreat + 2*_flyoverThreat) * (_distFactor + 3^(-_countLand));
        } else {
            private _distFactor = linearConversion [0, distanceForAirAttack, _dist, 0.65, 1, true];
            (_localThreat + 2*_flyoverThreat) * (_distFactor + 2^(-_countLand));
        };
        private _weight = (_value / _difficulty^0.8) ^ 2;           // prefer high value over low difficulty a bit
        //Debug_5("%1 to %2: Diff: %3, value: %4, weight: %5", _x, _target, _difficulty, _value, _weight);

        _maxWeight = _weight max _maxWeight;
        _totalWeight = _totalWeight + _weight;
        _weights pushBack _weight;

    } forEach _possibleStartBases;

    // Normalize so that more sources doesn't lead to higher target chance
    { _finalWeights pushBack (_x * _maxWeight / _totalWeight) } forEach _weights;

} forEach _possibleTargets;

// Multiply up for readability
_finalWeights = _finalWeights apply { _x * 10 };
{
    Debug_2("Target: weight %1, %2", (_finalWeights#_forEachIndex) toFixed 3, _x);
} forEach _finalTargets;

[_finalTargets, _finalWeights];

