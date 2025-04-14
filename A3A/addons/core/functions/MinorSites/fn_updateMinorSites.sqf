// Clears out roadblocks and camps that are now in invalid positions
// pretty dumb solution for now
// could probably be done smarter, but whatever

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _mainMarkers = citiesX + outposts + seaports + factories + resourcesX;
private _sitesChanged = false;
private _toDelete = [];
{
    private _side = _x;
    private _bases = outposts + airportsX select { sidesX getVariable _x == _side };
    private _enemyMarkers = _mainMarkers select { sidesX getVariable _x != _side };
    private _enemyAirports = airportsX select { sidesX getvariable _x != _side };
    {
        _y params ["_pos", "_type", "_siteSide", "_pairRef"];
        if (_side != _siteSide) then { continue };
        if (spawner getVariable _x != 2) then { continue };         // only delete unspawned sites, because createAIcontrols can't handle it

        if (_enemyMarkers inAreaArrayIndexes [_pos, 700, 700] isNotEqualTo []) then { _toDelete pushBack _x; continue };
        if (_enemyAirports inAreaArrayIndexes [_pos, 1000, 1000] isNotEqualTo []) then { _toDelete pushBack _x; continue };

        if (_type == "roadblock") then {
            // roadblocks should be removed if both sides are enemy
            (A3A_roadblockPairsHM get _pairRef) params ["_mrkA", "_mrkB"];
            if (sidesX getVariable _mrkA != _side and sidesX getVariable _mrkB != _side) then { _toDelete pushBack _x; continue };
        } else {
            // camps should be removed if no friendly base has a path
            // but we'll keep it simple and remove if out of range
            if (_bases inAreaArray [_pos, distanceForLandAttack, distanceForLandAttack] isEqualTo []) then {
                _toDelete pushBack _x; continue;
            };
        };
    } forEach A3A_minorSitesHM;
} forEach [Occupants, Invaders];

if (_toDelete isNotEqualTo []) then {
    Info_1("Deleting minor markers %1", _toDelete);
    { [_x] call A3A_fnc_deleteMinorSite } forEach _toDelete;
};

// Some placeholder stuff to add new roadblocks & camps
_mainMarkers append airportsX;
{
	private _side = _x;
	private _curRB = 0;
	private _curCamp = 0;
	{
		if (_y#2 != _side) then { continue };
		if (_y#1 == "roadblock") then {_curRB = _curRB + 1};
		if (_y#1 == "camp") then {_curCamp = _curCamp + 1};
	} forEach A3A_minorSitesHM;

	private _wantedCount = { sidesX getVariable _x == _side } count _mainMarkers;
	if (A3A_balancePlayerScale > random 3 and _wantedCount > _curRB) then {
		private _added = [_side, 1] call A3A_fnc_generateRoadblocks;
		if (_added > 0) then { _sitesChanged = true };
	};

	_wantedCount = _wantedCount / 2;
	if (A3A_balancePlayerScale > random 6 and _wantedCount > _curCamp) then {
		private _added = [_side, 1] call A3A_fnc_generateCamps;
		if (_added > 0) then { _sitesChanged = true };
	};
} forEach [Invaders, Occupants];

if (_sitesChanged) then {
	publicVariable "controlsX";
	publicVariable "markersX";
};
