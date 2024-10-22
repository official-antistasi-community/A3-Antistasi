
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_serverID", "_campaignID", "_worldname", ["_gametype", "Greenfor"]];

Info_1("Deleting saved game with parameters %1", _this);

private _namespace = [profileNamespace, missionProfileNamespace] select (_serverID isEqualType false);

private _postfix = if (_serverID isEqualTo false) then { _campaignID } else
{
	if (_worldName == "Tanoa") then {
		format["%1%2WoTP",_serverID,_campaignID];
	} else {
		if (_gametype == "Blufor") then {
			format["%1%2AntistasiB%3",_serverID,_campaignID,_worldName];
		} else {
			format["%1%2Antistasi%3",_serverID,_campaignID,_worldName]; 
		};
	};
};

// Delete all known player data for specified campaign
private _savedPlayers = _namespace getVariable ["savedPlayers" + _postfix, []];
{
	private _playerID = _x;
	{
		private _varName = format ["player_%1_%2", _playerID, _x];
		_namespace setVariable [_varname + _postfix, nil];

	} forEach ["loadoutPlayer", "scorePlayer", "rankPlayer", "personalGarage", "moneyX"];

} forEach _savedPlayers;


// Delete all server data for specified campaign
{
	_namespace setVariable [_x + _postfix, nil];

} forEach ["countCA", "gameMode", "difficultyX", "bombRuns", "smallCAmrk", "membersX", "antennas",
	"mrkSDK", "mrkCSAT", "posHQ", "dateX", "skillFIA", "destroyedSites", "distanceSPWN", "civPerc",
	"chopForest", "maxUnits", "nextTick", "weather", "destroyedBuildings", "aggressionOccupants",
	"aggressionInvaders", "resourcesFIA", "hr", "vehInGarage", "staticsX", "jna_datalist",
	"prestigeOPFOR", "prestigeBLUFOR", "garrison", "wurzelGarrison", "usesWurzelGarrison", "minesX",
	"outpostsFIA", "tasks", "idlebases", "idleassets", "killZones", "controlsSDK", "params",
	"attackCountdownOccupants", "attackCountdownInvaders", "prestigeNATO", "prestigeCSAT",
	"savedPlayers", "testingTimerIsActive", "HR_Garage", "A3A_fuelAmountleftArray", "HQKnowledge", "enemyResources",
	"version", "name", "saveTime", "ended", "factions", "addonVics", "DLC", "arsenalLimits", "rebelLoadouts"];


// Remove this campaign from the save list, if present
private _saveList = [_namespace getVariable "antistasiSavedGames"] param [0, [], [[]]];
_saveIndex = _saveList findIf { _x#0 == _campaignID };
_saveList deleteAt _saveIndex;
_namespace setVariable ["antistasiSavedGames", _saveList];

if (_serverID isEqualType false) then { saveMissionProfileNamespace } else { saveProfileNamespace };
