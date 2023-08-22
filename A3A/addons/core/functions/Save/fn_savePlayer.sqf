#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};

params ["_playerId", "_playerUnit", ["_globalSave", false]];

_playerUnit = _playerUnit getVariable ["owner", _playerUnit];		// save the real player, not remote controlled AIs

if (isNil "_playerId" || {_playerId == ""}) exitWith {
    Error_1("Not saving player of unit %1 due to missing UID", _playerUnit);
};

if (isNil "_playerUnit" || { isNull _playerUnit }) exitWith {
    Error_1("Not saving player %1 due to missing unit", _playerId);
};

//Only save rebel players.
if (side group _playerUnit != teamPlayer && side group _playerUnit != sideUnknown) exitWith {
    Info_1("Not saving player %1 due to them being on the wrong team.", _playerId);
};

//Used to disable saving while the player initialises. Otherwise they might disconnect, and overwrite their own save prematurely.
if !(_playerUnit getVariable ['canSave', false]) exitWith {
    Info_1("Not saving player %1 due to canSave being false.", _playerId);
};

if (isNil { _playerUnit getVariable "moneyX" }) exitWith {
    Error_1("Not saving player %1 due to missing variables. What happened here?", _playerId);
};

Info_2("Saving player %1 on side %2", _playerId, side group _playerUnit);

private _playerHM = A3A_playerSaveData getOrDefault [_playerID, createHashMap, true];			// ugh, switch to getOrDefaultCall after 2.12

private _shouldStripLoadout = false;
if (!(alive _playerUnit) || (_playerUnit getVariable ["incapacitated", false])) then
{
	_shouldStripLoadout = true;
    Info_1("Stripping saved loadout of player %1 due to saving while dead or unconcious", _playerId);
};

private _loadout = getUnitLoadout _playerUnit;
if (_shouldStripLoadout) then { _loadout = _loadout call A3A_fnc_stripGearFromLoadout };
_playerHM set ["loadoutPlayer", _loadout];

private _scorePlayer = _playerUnit getVariable ["score", 0];
private _rankPlayer = _playerUnit getVariable ["rankX", "PRIVATE"];		// rank _unit fails on corpses
_playerHM set ["scorePlayer", _scorePlayer];
_playerHM set ["rankPlayer", _rankPlayer];
_playerHM set ["personalGarage", []];

private _totalMoney = _playerUnit getVariable ["moneyX", 0];
if (_shouldStripLoadout) then { _totalMoney = round (_totalMoney * 0.85) };

if (_globalSave) then
{
	// Add value of live AIs owned by player
	// plus cost of vehicles driven by player-owned units, including self
	// plus cost of unsaved static weapons aimed by player-owned units, including self
	{
		if (alive _x && (_x getVariable ["owner", objNull] == _playerUnit)) then
		{
			if (_x != _playerUnit) then {
				private _unitPrice = server getVariable [_x getVariable "unitType", 0];
				_totalMoney = _totalMoney + _unitPrice;
			};
			private _veh = vehicle _x;
			if (_veh == _x || !isNil {_veh getVariable "markerX"}) exitWith {};
			if (_x == driver _veh || {_x == gunner _veh && _veh isKindOf "StaticWeapon"}) then {
				private _vehPrice = [typeof _veh] call A3A_fnc_vehiclePrice;
				_totalMoney = _totalMoney + _vehPrice;
			};
		};
	} forEach (units group _playerUnit);
};
_playerHM set ["moneyX", _totalMoney];

Info_3("Saved player %1: %2 rank, %3 money", _playerId, _rankPlayer, _totalMoney toFixed 0);

true;
