/*


    Warning: Destroys A3A_saveTarget so shouldn't be used after a game is started
*/

// Optional (new) save vars used by the selector
private _optionalVars = ["name", "version", "saveTime", "ended", "params", "factions", "DLC", "addonVics"];

private _fnc_gameMissing = { (isNil {"membersX" call A3A_fnc_returnSavedStat}) && {isNil {"json" call A3A_fnc_returnSavedStat}} }; 
private _saveData = [];
private _campaignIDs = [];
private _serverID = profileNameSpace getVariable ["ss_ServerID",""];

// Old community saves
private _saveList = [profileNamespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
{
    _x params ["_cid", "_map", "_gameType", ["_selectorVars", createHashMap]];
    _campaignIDs pushBack _cid;
    if (_gameType == "Blufor") then { continue };		   // maybe compatible, but complicates things
    private _useListVars = (count _selectorVars > 0);
    private _isJSON = (_useListVars && {_selectorVars getOrDefault ["json",false]});
    A3A_saveTarget = [_serverID, _cid, _map, _isJSON];
    private _game = createHashMapFromArray [["serverID", _serverID], ["gameID", _cid], ["map", _map], ["json", _isJSON]];
    if (call _fnc_gameMissing) then { continue };	   // check there's actually data
    { _game set [_x, _x call 
    {
        if (_useListVars && {_x in _selectorVars}) then {
            _selectorVars get _this;
        } else {
            _this call A3A_fnc_returnSavedStat;

        };
    }
    ] } forEach _optionalVars;
    _saveData pushBack _game;

} forEach _saveList;

private _oldCampaignID = profileNameSpace getVariable ["ss_CampaignID", ""];
if !(_oldCampaignID in _campaignIDs) then {
    A3A_saveTarget = [_serverID, _oldCampaignID, worldName, false];                          // Pre 2.3 saves
    if (call _fnc_gameMissing) then { A3A_saveTarget set [1, ""] };                   // Original saves (no campaign ID)
    if (call _fnc_gameMissing) exitWith {};
    _saveData pushBack createHashMapFromArray [["serverID", _serverID], ["gameID", A3A_saveTarget#1], ["map", worldName], ["json",false]];
};

// missionProfileNamespace saves
private _saveList2 = [missionProfileNamespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
{
    diag_log _x;
    _x params ["_cid", "_map", "_gameType", ["_selectorVars", createHashMap]];
    private _useListVars = (count _selectorVars > 0);
    private _isJSON = (_useListVars && {_selectorVars getOrDefault ["json",false]});
    diag_log format ["_json = %1",_isJSON];
    A3A_saveTarget = [false, _cid, _map, _isJSON];
    private _game = createHashMapFromArray [["serverID", false], ["gameID", _cid], ["map", _map], ["json", _isJSON]];
    if (call _fnc_gameMissing) then { continue };	   // check there's actually data
    { _game set [_x, _x call 
    {
        if (_useListVars && {_x in _selectorVars}) then {
            _selectorVars get _this;
        } else {
            _this call A3A_fnc_returnSavedStat;

        };
    }
    ] } forEach _optionalVars;
    diag_log _game;
    _saveData pushBack _game;

} forEach _saveList2;

reverse _saveData;          // return newest games at the top
_saveData;
