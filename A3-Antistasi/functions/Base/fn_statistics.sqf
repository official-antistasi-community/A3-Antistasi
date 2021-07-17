if (!hasInterface) exitWith {};
private ["_textX","_display","_setText"];
//sleep 3;
disableSerialization;
//waitUntil {!isNull (uiNameSpace getVariable "H8erHUD")};
if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};
_display = uiNameSpace getVariable "H8erHUD";
if (isNil "_display") exitWith {};
waitUntil {sleep 0.5;!(isNil "theBoss")};
_setText = _display displayCtrl 1001;
_setText ctrlSetBackgroundColor [0,0,0,0];

private _player = player getVariable ["owner",player];		// different, if remote-controlling
private _ucovertxt = [localize "STR_ACTION_LASER_off", "<t color='#1DA81D'>"+localize"STR_ACTION_LASER_ON"+"</t>"] select ((captive _player) and !(_player getVariable ["incapacitated",false]));

if (!isMultiplayer) then
	{
	_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_SinglePlayer", server getVariable "hr", server getVariable "resourcesFIA",[aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,floor bombRuns,tierWar,nameOccupants,nameInvaders,nameTeamPlayer,_ucovertxt];
	}
else
	{
	if (_player != theBoss) then
		{
			if (gameMode != 3) then
			{
				private _nameC = if !(isNull theBoss) then {name theBoss} else {"None"};
				_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_noBoss", server getVariable "hr", rank _player, _nameC, _player getVariable "moneyX",[aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,nameOccupants,nameInvaders,_ucovertxt];
			}
			else
			{
				private _nameC = if !(isNull theBoss) then {name theBoss} else {"None"};
				_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_noBoss_gameMode3", server getVariable "hr", rank _player, _nameC, _player getVariable "moneyX",[aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,nameOccupants,nameInvaders,_ucovertxt];
			};
		}
	else
		{
		if ([_player] call A3A_fnc_isMember) then
			{
				if (gameMode != 3) then
				{
					_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_Member", server getVariable "hr", server getVariable "resourcesFIA", [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,rank _player, _player getVariable "moneyX",floor bombRuns,tierWar,nameOccupants,nameInvaders,nameTeamPlayer,_ucovertxt];
				}
				else
				{
					_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_Member_gameMode3", server getVariable "hr", server getVariable "resourcesFIA", [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,rank _player, _player getVariable "moneyX",floor bombRuns,tierWar,nameOccupants,nameInvaders,nameTeamPlayer,_ucovertxt];
				};
			}
		else
			{
				if (gameMode != 3) then
				{
					_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_noMember",rank _player,_player getVariable "moneyX",nameTeamPlayer,server getVariable "resourcesFIA", nameOccupants, [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString, nameInvaders,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,_ucovertxt];
				}
				else
				{
					_textX = format ["<t size='0.67' shadow='2'>" + localize"STR_antistasi_statistics_noMember_gameMode3",rank _player,_player getVariable "moneyX",nameTeamPlayer,server getVariable "resourcesFIA", nameOccupants, [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString, nameInvaders,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,_ucovertxt];
				};
			};
		};
	};

//if (captive player) then {_textX = format ["%1 ON",_textX]} else {_textX = format ["%1 OFF",_textX]};
_setText ctrlSetStructuredText (parseText format ["%1", _textX]);
_setText ctrlCommit 0;
