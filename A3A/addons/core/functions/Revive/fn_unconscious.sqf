private ["_unit","_groupX","_groups","_isLeader","_dummyGroup","_bleedOut","_suicide","_saveVolume","_isPlayer","_camTarget","_saveVolumeVoice"];

params ["_unit", "_injurer", "_fatalWound"];

_unit setDamage 0.9;
if (!_fatalWound) then { _unit setHitPointDamage ["hitface", 0.5]; };			// fatal wound marker

_bleedOut = time + 300;//300
_isPlayer = false;
_playersX = false;
_inPlayerGroup = false;
_unit setBleedingremaining 300;

if (isPlayer _unit) then
{
	_isPlayer = true;
	_unit spawn { sleep 5; _this allowDamage true };
	closeDialog 0;
	openMap false;

	if (_injurer != Invaders) then {_unit setCaptive true};

	if (A3A_sendDownedNotification) then {
		[_unit, localize "STR_A3A_fn_revive_downed_help"] remoteExec ["groupChat", 0];
	};

	{
		if ((!isPlayer _x) and (vehicle _x != _x) and (_x distance _unit < 50)) then {unassignVehicle _x; [_x] orderGetIn false}
	} forEach units group _unit;
}
else
{
	if ({isPlayer _x} count units  group _unit > 0) then {_inPlayerGroup = true};
	_unit stop true;
	if (_inPlayerGroup) then
		{
		[_unit,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_unit];
		//[_unit,"carry"] remoteExec ["A3A_fnc_flagaction",0,_unit];
		//_unit call A3A_Logistics_fnc_addLoadAction;
		if (_injurer != Invaders) then {_unit setCaptive true};
		}
	else
		{
		if ({if ((isPlayer _x) and (_x distance _unit < distanceSPWN2)) exitWith {1}} count allUnits != 0) then
			{
			_playersX = true;
			[_unit,"heal"] remoteExec ["A3A_fnc_flagaction",0,_unit];
			if (_unit != petros) then {if (_injurer != Invaders) then {_unit setCaptive true}};
			};
		};
	};

_unit setFatigue 1;
sleep 2;
if (_isPlayer) then
{
	addUserActionEventHandler ["A3A_core_respawn", "Activate", {
		if !(player getVariable ["incapacitated",false]) exitWith {};
		[player] spawn A3A_fnc_respawn;
	}];
	addUserActionEventHandler ["A3A_core_selfRevive", "Activate", {
		if !(player getVariable ["incapacitated",false]) exitWith {};
		if (A3A_selfReviveMethods) then { [] spawn A3A_fnc_selfRevive };
	}];

	if (A3A_hasTFAR || A3A_hasTFARBeta) then
	{
		_saveVolumeVoice = player getVariable ["tf_voiceVolume", 1.0];
		player setVariable ["tf_unable_to_use_radio", true, true];
		player setVariable ["tf_voiceVolume", 0];
		_saveVolume = player getVariable ["tf_globalVolume", 1.0];
		player setVariable ["tf_globalVolume", 0.7, true];
	};
	group _unit setCombatMode "YELLOW";
	if (isMultiplayer) then
	{
		[_unit,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_unit];
		//[_unit,"carry"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	};
};


private _nextRequest = 0;
while {(time < _bleedOut) and (_unit getVariable ["incapacitated",false]) and (alive _unit)} do
{
	// Space out help requests increasingly with failures
	private _helper = _unit getVariable ["helped", objNull];
	if (isNull _helper and _nextRequest < time) then {
		_helper = [_unit] call A3A_fnc_askHelp;
		private _requestGap = (2 + (_unit getVariable ["helpFailed", 0]))^2;
		_nextRequest = if (isPlayer _unit) then { time + _requestGap/2 } else { time + _requestGap };
	};

	if (_isPlayer) then	{
		// Slow down self-revive timeout expiry while downed
		private _timeout = _unit getVariable ["A3A_selfReviveTimeout", -1];
		if (_timeout > 0) then { _unit setVariable ["A3A_selfReviveTimeout", _timeout + 0.5] };

		private _helpText = "<t size='0.8'>" + call {
			if (isNull _helper) exitWith {localize "STR_A3A_fn_revive_unconscious_noAI"};
			if (_helper distance _unit < 3) exitWith { format [localize "STR_A3A_fn_revive_unconscious_helping", name _helper] };
			format [localize "STR_A3A_fn_revive_unconscious_onTheWay", name _helper];
		};
		private _respawnText = format ["<t size='0.6'><br/>" + localize "STR_A3A_fn_revive_unconscious_respawn", actionKeysNames "A3A_core_respawn"];
		private _reviveText = call {
			if (A3A_selfReviveMethods) exitWith { format ["<br/>" + localize "STR_A3A_fn_revive_unconscious_selfRevive", actionKeysNames "A3A_core_selfRevive"] };
			//if (A3A_selfReviveMethods == 2) exitWith { "<br/>Hit H to take over nearest AI ally" };
			""
		};
		private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
		[_helpText + _respawnText + _reviveText,0,0,3,0,0,_layer] spawn bis_fnc_dynamicText;
	};

	private _sleepTime = [3, 1] select (isPlayer _unit);
	sleep _sleepTime;
	if !(isNull attachedTo _unit) then {_bleedOut = _bleedOut + _sleepTime};			// delay bleedout if dragged or loaded into vehicle
	if (random 60 < _sleepTime) then {playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50]};
};

if (_isPlayer) then
{
	removeAllUserActionEventHandlers ["A3A_core_respawn", "Activate"];
	removeAllUserActionEventHandlers ["A3A_core_selfRevive", "Activate"];

	if (A3A_hasTFAR || A3A_hasTFARBeta) then
	{
		player setVariable ["tf_unable_to_use_radio", false, true];
		player setVariable ["tf_globalVolume", _saveVolume];
		player setVariable ["tf_voiceVolume", _saveVolumeVoice, true];
	};
	if (isMultiplayer) then {[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",0,_unit]};
}
else
{
	_unit stop false;
	if (_inPlayerGroup or _playersX) then
	{
		[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",0,_unit];
	};
};

if (_isPlayer and (_unit getVariable ["respawn",false])) exitWith {};

if (time > _bleedOut) exitWith
{
	if (isPlayer _unit) exitWith { [player] spawn A3A_fnc_respawn };
	if (captive _unit) then {_unit setCaptive false};
	_unit setDamage 1;
};
if (alive _unit) then
{
	_unit setUnconscious false;
	//_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
	_unit playMoveNow "unconsciousoutprone";
	_unit setBleedingremaining 0;

	// Temp invulnerability on revive
	_unit allowDamage false;
	_unit spawn {
		sleep 5;
		if (captive _this) then {_this setCaptive false};
		_this allowDamage true;
	};
};
