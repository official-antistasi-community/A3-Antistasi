/*
Author: Håkon
Description:
    Adds the contents of an addon pack to the specified faction

Arguments:
0. <side> Side of the faction to recive the addon pack
1. <String> Path to the addon pack

Return Value: <Hashmap> Faction hashmap

Scope: Server
Environment: unscheduled
Public: Yes
Dependencies:

Example: [civilian, "Templates\AddonVics\rds_Civ.sqf"] call A3A_fnc_loadAddon;

License: MIT License
*/
params ["_side", "_path"];
private _factionPrefix = ["occ", "inv", "reb", "civ"] # ([west,east,resistance,civilian] find _side);

//get the addon data
private _addon = createHashMap;
call preprocessFileLineNumbers _path;

//add the addon data to the faction data
private _faction = missionNamespace getVariable ["A3A_faction"+_factionPrefix, createHashMap];
{
    _faction set [_x, (_faction get _x) + _y];
} forEach _addon;

//update the faction data globaly
_faction
