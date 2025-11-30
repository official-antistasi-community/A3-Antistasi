
// Initialize new garrison data from old garrison data, filling where missing
// outpostsFIA should be built first, sidesX should be valid

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("Converting saved garrisons to new format");

private _translateMarker = {
    params ["_mrk"];
    if (_mrk find "puesto" == 0) exitWith { "outpost" + (_mrk select [6]) };
    if (_mrk find "puerto" == 0) exitWith { "seaport" + (_mrk select [6]) };
    _mrk;
};

A3A_garrison = createHashMap;

// Rebels simply get replaced if they're not a recognised loadout
// "loadouts" hashmap only contains the "militia_Rifleman" part
private _rebLoadouts = keys (A3A_faction_reb get "loadouts") apply { "loadouts_reb_" + _x } createHashMapFromArray [];
private _rebReplacements = A3A_faction_reb get "groupSquad";

private _validMarkers = (markersX + outpostsFIA) createHashMapFromArray [];

{
	private _marker = [_x select 0] call _translateMarker;
	if !(_marker in _validMarkers) then {
		Error_1("Marker %1 does not exist in current garrisons!", _marker);
		continue;
	};
	private _side = sidesX getVariable _marker;
	private _troops = _x select 1;

	if (_side == teamPlayer) then {
		private _garrison = createHashMapFromArray [ ["vehicles", []], ["buildings", []] ];
		private _troops = _troops apply {
			if (!isNil "_x" and {_x in _rebLoadouts}) then { _x } else { selectRandom _rebReplacements };
		};
		_garrison set ["troops", _troops];
		A3A_garrison set [_marker, _garrison];
		// Could fix roadblock vehicle & garrison mortars here, probably not worth it though
	} else {
		// Use the init function for enemy garrisons, except with troop count
		private _garrison = [_marker] call A3A_fnc_buildEnemyGarrison;
		if !(_marker in citiesX) then { _garrison get "troops" set [0, count _troops] };			// cities stored blank array 
		if (count _x > 2) then { _garrison set ["lootCD", _x select 2] };
	};

} forEach ((["garrison"] call A3A_fnc_returnSavedStat) + A3A_rebPostGarrison);

A3A_rebPostGarrison = nil;
