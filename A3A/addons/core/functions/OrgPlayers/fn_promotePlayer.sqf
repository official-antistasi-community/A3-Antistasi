#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Debug("Working on player ranks");
private ["_puntMax","_textX","_multiplier","_newRank","_selectable","_disconnected","_owner","_pointsX","_dataX"];
_puntMax = 0;
_multiplier = 1;

private _textX = localize "STR_A3A_fn_orgp_promotedPlayers" + "<br/><br/>";

_promoted = false;
{
	private _player = _x getVariable ["owner", _x];
	private _pointsX = _player getVariable ["score",0];
	private _dataX = [_player] call A3A_fnc_numericRank;
	private _multiplier = _dataX select 0;
	private _newRank = _dataX select 1;
	private _rank = _x getVariable ["rankX","PRIVATE"];

	if (_rank != "COLONEL") then
	{
		if (_pointsX >= 50*_multiplier) then
		{
			_promoted = true;
			[_player,_newRank] remoteExec ["A3A_fnc_ranksMP"];
			_player setVariable ["rankX",_newRank,true];
			_textX = format ["%1%2: %3.<br/>",_textX, name _player, _newRank];
			[-1*(50*_multiplier),_player] call A3A_fnc_playerScoreAdd;
			_multiplier = _multiplier + 1;
			sleep 5;
		};
	};
} forEach ((call A3A_fnc_playableUnits) select {(side (group _x) == teamPlayer)});

Debug(_textX);

if (_promoted) then
{
	_congrats = "<br/><br/>" + localize "STR_A3A_fn_orgp_promotePlayer_yes";
	_textX = [_textX, _congrats] joinString "";
	[petros,"hint",_textX, localize "STR_A3A_fn_orgp_promotePlayer_promotion"] remoteExec ["A3A_fnc_commsMP"];
};
