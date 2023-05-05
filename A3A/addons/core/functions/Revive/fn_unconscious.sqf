private ["_unit","_groupX","_groups","_isLeader","_dummyGroup","_bleedOut","_suicide","_saveVolume","_isPlayer","_camTarget","_saveVolumeVoice"];
_unit = _this select 0;
//if (_unit getVariable "inconsciente") exitWith {};
//if (damage _unit < 0.9) exitWith {};
//if (!local _unit) exitWith {};
//_unit setVariable ["inconsciente",true,true];
_bleedOut = time + 300;//300
_isPlayer = false;
_playersX = false;
_inPlayerGroup = false;
_unit setBleedingremaining 300;
_injurer = _this select 1;

if (isPlayer _unit) then
	{
	_isPlayer = true;
	if (!isMultiplayer) then {_bleedOut = time + 600};//50
	_unit spawn
		{
		sleep 5;
		_this allowDamage true;
		};
	closeDialog 0;
	if (!isNil "respawnMenu") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu]};
	respawnMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
		_handled = false;
		if (_this select 1 == 19) then
			{
			if (player getVariable ["incapacitated",false]) then
				{
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
				[player] spawn A3A_fnc_respawn;
				};
			};
		_handled;
		}];
	if (_injurer != Invaders) then {_unit setCaptive true};
	openMap false;
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
		private _textX = "<t size='0.6'>There is no AI near to help you.<t size='0.5'><br/>Hit R to Respawn";
		if !(isNull _helper) then {
			if (_helper distance _unit < 3) then {
				_textX = format ["<t size='0.6'>%1 is on the way to help you.<t size='0.5'><br/>Hit R to Respawn", name _helper];
			} else {
				_textX = format ["<t size='0.6'>%1 is helping you.<t size='0.5'><br/>Hit R to Respawn", name _helper];
			};
		};
		private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
		[_textX,0,0,3,0,0,_layer] spawn bis_fnc_dynamicText;
	};

	sleep 3;
	if !(isNull attachedTo _unit) then {_bleedOut = _bleedOut + 3};			// delay bleedout if dragged or loaded into vehicle
	if (random 20 < 1) then {playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50]};
};

if (_isPlayer) then
	{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
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

if (captive _unit) then {_unit setCaptive false};
_unit setVariable ["overallDamage",damage _unit];
if (_isPlayer and (_unit getVariable ["respawn",false])) exitWith {};

if (time > _bleedOut) exitWith
	{
	if (_isPlayer) then
		{
		[_unit] call A3A_fnc_respawn
		}
	else
		{
		_unit setDamage 1;
		};
	};
if (alive _unit) then
	{
	_unit setUnconscious false;
	//_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
	_unit playMoveNow "unconsciousoutprone";
	_unit setBleedingremaining 0;
	};
