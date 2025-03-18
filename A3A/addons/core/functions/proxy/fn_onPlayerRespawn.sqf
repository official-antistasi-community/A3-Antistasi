#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (isDedicated) exitWith {};
private ["_newUnit","_oldUnit"];
_newUnit = _this select 0;
_oldUnit = _this select 1;

if (isNull _oldUnit) exitWith {};

waitUntil {alive player};

//When LAN hosting, Bohemia's Zeus module code will cause the player lose Zeus access if the body is deleted after respawning.
//This is a workaround that re-assigns curator to the player if their body is deleted.
//It will only run on LAN hosted MP, where the hoster is *always* admin, so we shouldn't run into any issues.
if (isServer) then {
	_oldUnit addEventHandler ["Deleted", {
		[] spawn {
			sleep 1;		// should ensure that the bug unassigns first
			{ player assignCurator _x } forEach allCurators;
		}
	} ];
};

removeAllActions _oldUnit;
_nul = [_oldUnit] spawn A3A_fnc_postmortem;

_oldUnit setVariable ["incapacitated",false,true];
_newUnit setVariable ["incapacitated",false,true];

[true] call A3A_fnc_selfReviveReset;

if (side group player == teamPlayer) then
	{
	_owner = _oldUnit getVariable ["owner",_oldUnit];

	if (_owner != _oldUnit) exitWith {[localize "STR_A3A_fn_proxy_remAI_titel", localize "STR_A3A_fn_proxy_remAI_text"] call A3A_fnc_customHint; selectPlayer _owner; disableUserInput false; deleteVehicle _newUnit};

	_nul = [0,-1,getPos _oldUnit] remoteExec ["A3A_fnc_citySupportChange",2];

	_score = _oldUnit getVariable ["score",0];
	_punish = _oldUnit getVariable ["punish",0];
	_moneyX = _oldUnit getVariable ["moneyX",0];
	_moneyX = round (_moneyX - (_moneyX * 0.15));
	_eligible = _oldUnit getVariable ["eligible",true];
	_rankX = _oldUnit getVariable ["rankX","PRIVATE"];

	if (_moneyX < 0) then {_moneyX = 0};

	_newUnit setVariable ["score",_score -1,true];
	_newUnit setVariable ["owner",_newUnit,true];
	_newUnit setVariable ["punish",_punish,true];
	_newUnit setVariable ["respawning",false];
	_newUnit setVariable ["moneyX",_moneyX,true];
	//_newUnit setUnitRank (rank _oldUnit);
	_newUnit setVariable ["compromised",0];
	_newUnit setVariable ["eligible",_eligible,true];
	_oldUnit setVariable ["eligible",false,true];
	_newUnit setVariable ["spawner",true,true];
	_oldUnit setVariable ["spawner",nil,true];
	[_newUnit,false] remoteExec ["setCaptive",0,_newUnit];
	_newUnit setCaptive false;
	_newUnit setRank (_rankX);
	_newUnit setVariable ["rankX",_rankX,true];
	{
    _newUnit addOwnedMine _x;
    } count (getAllOwnedMines (_oldUnit));
	{
		if (_x getVariable ["owner", ObjNull] == _oldUnit) then {
			_x setVariable ["owner", _newUnit, true];
		};
	} forEach (units group player);


	// don't reinit revive because damage handlers are respawn-persistent
	//if (!A3A_hasACEMedical) then {[_newUnit] call A3A_fnc_initRevive};
	disableUserInput false;
	//_newUnit enableSimulation true;
	if (_oldUnit == theBoss) then
		{
		[_newUnit, true] remoteExec ["A3A_fnc_theBossTransfer", 2];
		};
	//Give them a map, in case they're commander and need to replace petros.
	_newUnit setUnitLoadout [[],[],[],[selectRandom ((A3A_faction_civ get "uniforms") + (A3A_faction_reb get "uniforms")), []],[],[],[],"",[],
	[(selectRandom unlockedmaps),"","",(selectRandom unlockedCompasses),(selectRandom unlockedwatches),""]];

	if (!isPlayer (leader group player)) then {(group player) selectLeader player};
	player addEventHandler ["FIRED",
		{
		_player = _this select 0;
		if (captive _player) then
			{
			if ({if (((side _x == Occupants) or (side _x == Invaders)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then
				{
				[_player,false] remoteExec ["setCaptive",0,_player];
				_player setCaptive false;
				}
			else
				{
				_city = [citiesX,_player] call BIS_fnc_nearestPosition;
				_size = [_city] call A3A_fnc_sizeMarker;
				_dataX = server getVariable _city;
				if (random 100 < _dataX select 2) then
					{
					if (_player distance getMarkerPos _city < _size * 1.5) then
						{
						[_player,false] remoteExec ["setCaptive",0,_player];
						_player setCaptive false;
						if (vehicle _player != _player) then
							{
							{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [_player]);
							};
						};
					};
				};
			}
		}
		];

	player addEventHandler ["InventoryOpened",
		{
		private ["_playerX","_containerX","_typeX"];
		_control = false;
		_playerX = _this select 0;
		if (captive _playerX) then
			{
			_containerX = _this select 1;
			_typeX = typeOf _containerX;
			if (((_containerX isKindOf "CAManBase") and (!alive _containerX)) or (_typeX in [A3A_faction_occ get "ammobox", A3A_faction_inv get "ammobox"])) then
				{
				if ({if (((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout _playerX > 1.4)) exitWith {1}} count allUnits > 0) then
					{
					[_playerX,false] remoteExec ["setCaptive",0,_playerX];
					_playerX setCaptive false;
					}
				else
					{
					_city = [citiesX,_playerX] call BIS_fnc_nearestPosition;
					_size = [_city] call A3A_fnc_sizeMarker;
					_dataX = server getVariable _city;
					if (random 100 < _dataX select 2) then
						{
						if (_playerX distance getMarkerPos _city < _size * 1.5) then
							{
							[_playerX,false] remoteExec ["setCaptive",0,_playerX];
							_playerX setCaptive false;
							};
						};
					};
				};
			};
		_control
		}];
	/*
	player addEventHandler ["InventoryClosed",
		{
		_control = false;
		_uniform = uniform player;
		_typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
		_sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
		if ((_sideType == 1) or (_sideType == 0) and (_uniform != "")) then
			{
			if !(player getVariable ["disguised",false]) then
				{
				hint "You are wearing an enemy uniform, this will make the AI attack you. Beware!";
				player setVariable ["disguised",true];
				player addRating (-1*(2001 + rating player));
				};
			}
		else
			{
			if (player getVariable ["disguised",false]) then
				{
				hint "You removed your enemy uniform";
				player addRating (rating player * -1);
				};
			};
		_control
		}];
		*/
	if (hasInterface) then {
		[player] call A3A_fnc_punishment_FF_addEH;
		[] spawn A3A_fnc_outOfBounds;
	};
	player addEventHandler ["HandleHeal",
		{
		_player = _this select 0;
		if (captive _player) then
			{
			if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
				{
				[_player,false] remoteExec ["setCaptive",0,_player];
				_player setCaptive false;
				}
			else
				{
				_city = [citiesX,_player] call BIS_fnc_nearestPosition;
				_size = [_city] call A3A_fnc_sizeMarker;
				_dataX = server getVariable _city;
				if (random 100 < _dataX select 2) then
					{
					if (_player distance getMarkerPos _city < _size * 1.5) then
						{
						[_player,false] remoteExec ["setCaptive",0,_player];
						_player setCaptive false;
						};
					};
				};
			}
		}
		];
	player addEventHandler ["WeaponAssembled",
		{
			private _veh = _this select 1;
			[_veh, teamPlayer] call A3A_fnc_AIVEHinit;		// will flip/capture if already initialized
			if (_veh isKindOf "StaticWeapon") then {
				if (not(_veh in staticsToSave)) then {
					staticsToSave pushBack _veh;
					publicVariable "staticsToSave";
				};
				_markersX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
				_pos = position _veh;
				if (_markersX findIf {_pos inArea _x} != -1) then {[localize "STR_A3A_fn_proxy_statDepl_titel", localize "STR_A3A_fn_proxy_statDepl_text"] call A3A_fnc_customHint;};
			};
		}];
	player addEventHandler ["WeaponDisassembled",
			{
			_bag1 = _this select 1;
			_bag2 = _this select 2;
			//_bag1 = objectParent (_this select 1);
			//_bag2 = objectParent (_this select 2);
			[_bag1] remoteExec ["A3A_fnc_postmortem", 2];
			[_bag2] remoteExec ["A3A_fnc_postmortem", 2];
			}
		];
	[] spawn A3A_fnc_unitTraits;
	[] spawn A3A_fnc_statistics;
	}
else
	{
	_oldUnit setVariable ["spawner",nil,true];
	_newUnit setVariable ["spawner",true,true];
	[player] call A3A_fnc_dress;
	if (A3A_hasACE) then {[] call A3A_fnc_ACEpvpReDress};
	};
