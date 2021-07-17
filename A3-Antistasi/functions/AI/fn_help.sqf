private ["_unit","_medicX","_timeOut","_cured","_isPlayer","_smoked","_enemy","_coverX","_dummyGrp","_dummy"];
_unit = _this select 0;///no usar canfight porque algunas tienen setcaptive true y te va a liar todo
if !(isNull (_unit getVariable ["helped",objNull])) exitWith {};
_medicX = _this select 1;
if (isPlayer _medicX) exitWith {};
if (_medicX getVariable ["helping",false]) exitWith {};
_unit setVariable ["helped",_medicX];
_medicX setVariable ["helping",true];
_medicX setVariable ["maneuvering",true];
_cured = false;
_isPlayer = if ({isPlayer _x} count units group _unit >0) then {true} else {false};
_smoked = false;

if (_medicX != _unit) then
	{
	if !(_unit getVariable ["incapacitated",false]) then
		{
		if (_isPlayer) then {_unit groupChat format [localize "STR_antistasi_chat_helpMe",name _unit]};
		playSound3D [(selectRandom injuredSounds),_unit,false, getPosASL _unit, 1, 1, 50];
		};
	if (_isPlayer) then
		{
		[_medicX,_unit] spawn
			{
			sleep 2;
			private ["_medicX","_unit"];
			_medicX = _this select 0;
			_unit = _this select 1;
			_medicX groupChat format [localize "STR_antistasi_chat_helpMe_wait",name _unit]
			};
		};
	if (hasInterface) then {if (player == _unit) then {[localize "STR_antistasi_customHint_medical", format [localize "STR_antistasi_customHint_medical_help_you",name _medicX]] call A3A_fnc_customHint;}};
	_enemy = _medicX findNearestEnemy _unit;
	_smoked = [_medicX,_unit,_enemy] call A3A_fnc_chargeWithSmoke;
	_medicX stop false;
	_medicX forceSpeed -1;
	_timeOut = time + 60;
	sleep 5;
	_medicX doMove getPosATL _unit;
	while {true} do
		{
		sleep 1;
		if (!([_medicX] call A3A_fnc_canFight) or (!alive _unit) or (unitReady _medicX) or (_medicX distance _unit <= 3) or (_timeOut < time) or (_unit != vehicle _unit) or (_medicX != vehicle _medicX) or (_medicX != _unit getVariable ["helped",objNull]) or !(isNull attachedTo _unit) or (_medicX getVariable ["cancelRevive",false])) exitWith {};
		};
	if ((isPlayer _unit) and !(isMultiplayer))  then
		{
		if (([_medicX] call A3A_fnc_canFight) and (_medicX distance _unit > 3) and (_medicX == _unit getVariable ["helped",objNull]) and !(_unit getVariable ["carryX",false]) and (allUnits findIf {((side _x == Occupants) or (side _x == Invaders)) and (_x distance2D _unit < 50)} == -1)) then {_medicX setPos position _unit};
		};
	if ((_unit distance _medicX <= 3) and (alive _unit) and ([_medicX] call A3A_fnc_canFight) and (_medicX == vehicle _medicX) and (_medicX == _unit getVariable ["helped",objNull]) and (isNull attachedTo _unit) and !(_medicX getVariable ["cancelRevive",false])) then
		{
		if ((_unit getVariable ["incapacitated",false]) and (!isNull _enemy) and (_timeOut >= time) and (_medicX != _unit)) then
			{
			_coverX = [_unit,_enemy] call A3A_fnc_coverage;
			{if (([_x] call A3A_fnc_canFight) and (_x distance _medicX < 50) and !(_x getVariable ["helping",false]) and (!isPlayer _x)) then {[_x,_enemy] call A3A_fnc_suppressingFire}} forEach units (group _medicX);
			if (count _coverX == 3) then
				{
				//if (_isPlayer) then {_unit setVariable ["carryX",true,true]};
				_medicX setUnitPos "MIDDLE";
				_medicX playAction "grabDrag";
				sleep 0.1;
				_timeOut = time + 5;
				waitUntil {sleep 0.3; ((animationState _medicX) == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") or ((animationState _medicX) == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2") or !([_medicX] call A3A_fnc_canFight) or (_timeOut < time)};
				if ([_medicX] call A3A_fnc_canFight) then
					{
					[_unit,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
					_medicX disableAI "ANIM";
					//_medicX playMoveNow "AcinPknlMstpSrasWrflDnon";
					_medicX stop false;
					_dummyGrp = createGroup civilian;
					_dummy = [_dummyGrp, "C_man_polo_1_F", [0,0,20], [], 0, "FORM"] call A3A_fnc_createUnit;
					_dummy setUnitPos "MIDDLE";
					_dummy forceWalk true;
					_dummy setSkill 0;
					if (isMultiplayer) then {[_dummy,true] remoteExec ["hideObjectGlobal",2]} else {_dummy hideObject true};
					_dummy allowdammage false;
					_dummy setBehaviour "CARELESS";
					_dummy disableAI "FSM";
					_dummy disableAI "SUPPRESSION";
				    _dummy forceSpeed 0.2;
				    _dummy setPosATL (getPosATL _medicX);
					_medicX attachTo [_dummy, [0, -0.2, 0]];
					_medicX setDir 180;
					//_unit attachTo [_dummy, [0, 1.1, 0.092]];
					_unit attachTo [_dummy, [0,-1.1, 0.092]];
					_unit setDir 0;
					_dummy doMove _coverX;
					[_medicX] spawn {sleep 4.5; (_this select 0) playMove "AcinPknlMwlkSrasWrflDb"};
					_timeOut = time + 30;
					while {true} do
						{
						sleep 0.2;
						if (!([_medicX] call A3A_fnc_canFight) or (!alive _unit) or (_medicX distance _coverX <= 2) or (_timeOut < time) or (_medicX != vehicle _medicX) or (_medicX getVariable ["cancelRevive",false])) exitWith {};
						if (_unit distance _dummy > 3) then
							{
							detach _unit;
							_unit setPos (position _dummy);
							_unit attachTo [_dummy, [0,-1.1, 0.092]];
							_unit setDir 0;
							};
						if (_medicX distance _dummy > 3) then
							{
							detach _medicX;
							_medicX setPos (position _dummy);
							_medicX attachTo [_dummy, [0, -0.2, 0]];
							_medicX setDir 180;
							};
						};
					detach _unit;
					detach _medicX;
					detach _dummy;
					deleteVehicle _dummy;
					deleteGroup _dummyGrp;
					_medicX enableAI "ANIM";
					};
				if ((alive _unit) and ([_medicX] call A3A_fnc_canFight) and (_medicX == vehicle _medicX) and !(_medicX getVariable ["cancelRevive",false])) then
					{
					_medicX playMove "amovpknlmstpsraswrfldnon";
					_medicX stop true;
					_unit stop true;
					sleep 3;
					_cured = [_unit,_medicX] call A3A_fnc_actionRevive;
					_unit playMoveNow "";
					if (_cured) then
						{
						if (_medicX != _unit) then {if (_isPlayer) then {_medicX groupChat format [localize "STR_antistasi_chat_helpMe_ready",name _unit]}};
						};
					sleep 5;
					_medicX stop false;
					_unit stop false;
					_unit dofollow leader group _unit;
					_medicX doFollow leader group _unit;
					}
				else
					{
					//if ([_medicX] call A3A_fnc_canFight) then {_medicX switchMove ""};
					[_medicX,""] remoteExec ["switchMove"];
					if ((alive _unit) and (_unit getVariable ["incapacitated",false])) then
						{
						_unit playMoveNow "";
						_unit setUnconscious false;
						_timeOut = time + 3;
						waitUntil {sleep 0.3; (lifeState _unit != "incapacitated") or (_timeOut < time)};
						_unit setUnconscious true;
						};
					};
				//if (_isPlayer) then {_unit setVariable ["carryX",false,true]};
				}
			else
				{
				_medicX stop true;
				//if (!_smoked) then {[_medicX,_unit] call A3A_fnc_chargeWithSmoke};
				_unit stop true;
				_cured = [_unit,_medicX] call A3A_fnc_actionRevive;
				if (_cured) then
					{
					if (_medicX != _unit) then {if (_isPlayer) then {_medicX groupChat format [localize "STR_antistasi_chat_helpMe_ready",name _unit]}};
					sleep 10;
					};
				_medicX stop false;
				_unit stop false;
				_unit dofollow leader group _unit;
				_medicX doFollow leader group _unit;
				};
			if ((animationState _medicX == "amovpknlmstpsraswrfldnon") or (animationState _medicX == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") or (animationState _medicX == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2")) then {_medicX switchMove ""};
			}
		else
			{
			_medicX stop true;
			//if (!_smoked) then {[_medicX,_unit] call A3A_fnc_chargeWithSmoke};
			_unit stop true;
			if (_unit getVariable ["incapacitated",false]) then {_cured = [_unit,_medicX] call A3A_fnc_actionRevive} else {_medicX action ["HealSoldier",_unit]; _cured = true};
			if (_cured) then
				{
				if (_medicX != _unit) then {if (_isPlayer) then {_medicX groupChat format [localize "STR_antistasi_chat_helpMe_ready",name _unit]}};
				sleep 10;
				};
			_medicX stop false;
			_unit stop false;
			_unit dofollow leader group _unit;
			_medicX doFollow leader group _unit;
			};
		};
	if (_medicX == _unit getVariable ["helped",objNull]) then {_unit setVariable ["helped",objNull]};
	_medicX setUnitPos "AUTO";
	if (_medicX getVariable ["cancelRevive",false]) then
		{
		_medicX stop false;
		_medicX doFollow leader group _unit;
		sleep 15;
		};
	}
else
	{
	[_medicX,_medicX] call A3A_fnc_chargeWithSmoke;
	if ([_medicX] call A3A_fnc_canFight) then
		{
		_medicX action ["HealSoldierSelf",_medicX];
		sleep 10;
		};
	_unit setVariable ["helped",objNull];
	_cured = true;
	};
if (_medicX getVariable ["cancelRevive",false]) then
	{
	_medicX setVariable ["cancelRevive",false];
	sleep 15;
	};
_medicX setVariable ["helping",false];
_medicX setVariable ["maneuvering",false];
_cured