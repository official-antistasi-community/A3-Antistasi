
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("InitGarrisons started");

// This function is now only called for a new game

private _emptyGarrison = createHashMapFromArray [ ["troops", []], ["statics", []], ["vehicles", []], ["buildings", []] ];
A3A_garrison set ["Synd_HQ", +_emptyGarrison];

_fnc_initGarrison =
{
    params ["_marker", "_occGroups", "_invGroups"];
    private _garrNum = [_marker] call A3A_fnc_garrisonSize;
    private _side = sidesX getVariable _marker;
    private _groupsRandom = [_occGroups, _invGroups] select (_side == Invaders);

    private _garrison = [];
    while {count _garrison < _garrNum} do {
        _garrison append (selectRandom _groupsRandom);
    };
    _garrison resize _garrNum;
    garrison setVariable [_marker, _garrison, true];
    A3A_garrison set [_marker, +_emptyGarrison];            // probably don't need this yet...
};

private _updateMarkers = outposts + airportsX;			// To sort out the faction names & flags
if (gameMode >= 3) then
{
    // Set everything to government control if we have no invaders
    {
        if (sidesX getVariable _x == Occupants) then { continue };
        sidesX setVariable [_x, Occupants, true];
        _updateMarkers pushBackUnique _x;
    } forEach (markersX - ["Synd_HQ"]);
};
{ _x call A3A_fnc_mrkUpdate } forEach _updateMarkers;


private _occGroups = (A3A_faction_occ get "groupsSquads") + (A3A_faction_occ get "groupsMedium");
private _invGroups = (A3A_faction_inv get "groupsSquads") + (A3A_faction_inv get "groupsMedium");
{ [_x, _occGroups, _invGroups] call _fnc_initGarrison } forEach airportsX + outposts;

private _milGroups = (A3A_faction_occ get "groupsMilitiaSquads") + (A3A_faction_occ get "groupsMilitiaMedium");
{ [_x, _milGroups, _invGroups] call _fnc_initGarrison } forEach resourcesX + factories + seaports;

Info("InitGarrisons completed");
