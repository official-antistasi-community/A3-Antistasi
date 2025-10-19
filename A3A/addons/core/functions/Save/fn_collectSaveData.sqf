/*


    Warning: Destroys A3A_saveTarget so shouldn't be used after a game is started
*/

// Search for all potential saves
private _saveTargets = [];
private _campaignIDs = [];
private _serverID = profileNameSpace getVariable ["ss_ServerID",""];

// profileNamespace saves
private _saveList = [profileNamespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
{
    _x params ["_cid", "_map", "_gameType", ["_jsonHeader", false]];
    _campaignIDs pushBack _cid;
    if (_gameType == "Blufor") then { continue };		   // maybe compatible, but complicates things
    _saveTargets pushBack [_serverID, _cid, _map, _jsonHeader];
} forEach _saveList;

private _oldCampaignID = profileNameSpace getVariable ["ss_CampaignID", ""];
if !(_oldCampaignID in _campaignIDs) then {
    _saveTargets pushBack [_serverID, _oldCampaignID, worldName, false];            // Pre 2.3 saves
    _saveTargets pushBack [_serverID, "", worldName, false];                       // Original saves (no campaign ID)
};

// missionProfileNamespace saves
private _saveList2 = [missionProfileNamespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
{
    _x params ["_cid", "_map", "_gameType", ["_jsonHeader", false]];
    _saveTargets pushBack [false, _cid, _map, _jsonHeader];
} forEach _saveList2;


// Optional (new) save vars used by the selector
private _headerVars = ["name", "version", "saveTime", "ended", "params", "factions", "DLC", "addonVics"];
private _fnc_gameMissing = { isNil {"membersX" call A3A_fnc_returnSavedStat} && isNil {"json" call A3A_fnc_returnSavedStat} }; 

// Convert save targets to header data
private _saveData = [];
{
    _x params ["_serverID", "_cid", "_map", "_jsonHeader"];
    A3A_saveTarget = [_serverID, _cid, _map, false];
    if (call _fnc_gameMissing) then { continue };	   // check there's actually data
    if (_jsonHeader isEqualType "") then { A3A_saveTarget set [3, fromJSON _jsonHeader] };

    private _game = createHashMapFromArray [["serverID", _serverID], ["gameID", _cid], ["map", _map], ["json", _jsonHeader isEqualType ""]];
    { _game set [_x, _x call A3A_fnc_returnSavedStat] } forEach _headerVars;
    _saveData pushBack _game;
} forEach _saveTargets;


// Return newest games at the top. Old saves kept in original order at the bottom
private _saveTimes = [];
private _oldSaves = [];
{ 
    private _savetime = _x get "saveTime";
    if (isNil "_savetime") then { _oldSaves pushBack _x; continue };
    _saveTimes pushBack (_savetime + [_x]);
} forEach _saveData;

_saveTimes sort false;
(_saveTimes apply { _x#7}) + _oldSaves;
