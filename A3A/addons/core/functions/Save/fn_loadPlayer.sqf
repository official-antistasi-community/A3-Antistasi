#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};

params ["_playerId", "_unit"];

if !(_playerId in A3A_playerSaveData) then {
    Info_1("No save found for player ID %1", _playerId);
	[_playerId, _unit] call A3A_fnc_resetPlayer;
};

Info_2("Loading player data for ID %1 into unit %2", _playerId, _unit);

private _playerHM = A3A_playerSaveData get _playerID;
private _loadout = _playerHM get "loadoutPlayer";
if (!isNil "_loadout") then { _unit setUnitLoadout _loadout };

private _score = 0;
private _rank = "PRIVATE";

private _saveScore = _playerHM get "scorePlayer";
if (!isNil "_saveScore" && { _saveScore isEqualType 0 }) then {_score = _saveScore};

private _saveRank = _playerHM get "rankPlayer";
if (!isNil "_saveRank" && { _saveRank isEqualType "" }) then {_rank = _saveRank};

private _money = _playerHM get "moneyX";
if (isNil "_money" || {!(_money isEqualType 0)}) then {_money = initialPlayerMoney};

private _garage = _playerHM get "personalGarage";
if (isNil "_garage" || {!(_garage isEqualType [])}) then {_garage = []};
[_garage, _playerId] call HR_GRG_fnc_addVehiclesByClass;

private _saveMissions = _playerHM get "missionsCompleted";
if (!isNil "_saveMissions" && { _saveMissions isEqualType 0 }) then {_missions = _saveMissions};

_unit setVariable ["score", _score, true];
_unit setUnitRank _rank;
_unit setVariable ["rankX", _rank, true];
_unit setVariable ["moneyX", _money, true];
_unit setVariable ["missionsCompleted",_missions,true];

[] remoteExec ["A3A_fnc_statistics", _unit];
_unit setVariable ["canSave", true, true];

Info_5("Player %1: Score %2, rank %3, money %4, garage count %5", _playerId, _score, _rank, _money, count _garage);
