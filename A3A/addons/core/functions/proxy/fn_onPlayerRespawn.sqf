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
[_oldUnit] remoteExec ["A3A_fnc_postmortem", 2];

_oldUnit setVariable ["incapacitated",false,true];
_newUnit setVariable ["incapacitated",false,true];

[true] call A3A_fnc_selfReviveReset;

if (side group player == teamPlayer) then
	{
	_owner = _oldUnit getVariable ["owner",_oldUnit];

	if (_owner != _oldUnit) exitWith {[localize "STR_A3A_fn_proxy_remAI_titel", localize "STR_A3A_fn_proxy_remAI_text"] call A3A_fnc_customHint; selectPlayer _owner; disableUserInput false; deleteVehicle _newUnit};

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

	call A3A_fnc_installClientEH;

	if (hasInterface) then {
		[player] call A3A_fnc_punishment_FF_addEH;
		[] spawn A3A_fnc_outOfBounds;
	};

	[] spawn A3A_fnc_unitTraits;
	[] spawn A3A_fnc_statistics;
	A3A_aliveTime = time;
	}
else
	{
	_oldUnit setVariable ["spawner",nil,true];
	_newUnit setVariable ["spawner",true,true];
	[player] call A3A_fnc_dress;
	if (A3A_hasACE) then {[] call A3A_fnc_ACEpvpReDress};
	};
