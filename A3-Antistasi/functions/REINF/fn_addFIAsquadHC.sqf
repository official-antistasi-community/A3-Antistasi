private ["_typeGroup","_esinf","_typeVehX","_costs","_costHR","_exit","_formatX","_pos","_hr","_resourcesFIA","_groupX","_roads","_road","_truckX","_vehicle","_mortarX","_morty"];

if (player != theBoss) exitWith {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_only_comander"] call A3A_fnc_customHint;};

if (markerAlpha respawnTeamPlayer == 0) exitWith {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_moveHQ"] call A3A_fnc_customHint;};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_minefields_noradio"] call A3A_fnc_customHint;} else {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_minefields_no_radioman"] call A3A_fnc_customHint;}};

private _enemyNear = false;

{
	if (((side _x == Invaders) or (side _x == Occupants)) and (_x distance petros < 500) and ([_x] call A3A_fnc_canFight) and !(isPlayer _x)) exitWith {_enemyNear = true};
} forEach allUnits;

if (_enemyNear) exitWith {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_enemy"] call A3A_fnc_customHint;};

_typeGroup = _this select 0;
_exit = false;

if (_typeGroup isEqualType "") then {
	if (_typeGroup == "not_supported") then {_exit = true; [localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_modset"] call A3A_fnc_customHint;};
	if (A3A_hasIFA and ((_typeGroup == SDKMortar) or (_typeGroup == SDKMGStatic)) and !debug) then {_exit = true; [localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_modset"] call A3A_fnc_customHint;};
};

if (A3A_hasRHS) then {
	if (_typeGroup isEqualType objNull) then {
		if (_typeGroup == staticATteamPlayer) then {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_gref"] call A3A_fnc_customHint; _exit = true};
	};
};

if (_exit) exitWith {};
_esinf = false;
_typeVehX = "";
_costs = 0;
_costHR = 0;
_formatX = [];
_format = "Squd-";

_hr = server getVariable "hr";
_resourcesFIA = server getVariable "resourcesFIA";

private _withBackpck = "";
if (_typeGroup isEqualType []) then {
	{
		private _typeUnit = if (random 20 <= skillFIA) then {_x select 1} else {_x select 0};
		_formatX pushBack _typeUnit;
		_costs = _costs + (server getVariable _typeUnit); _costHR = _costHR +1
	} forEach _typeGroup;

	if (count _this > 1) then {
		_withBackpck = _this select 1;
		if (_withBackpck == "MG") then {_costs = _costs + ([SDKMGStatic] call A3A_fnc_vehiclePrice)};
		if (_withBackpck == "Mortar") then {_costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice)};
	};
	_esinf = true;

} else {
	_costs = _costs + (2*(server getVariable staticCrewTeamPlayer)) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	_costHR = 2;

	if ((_typeGroup == SDKMortar) or (_typeGroup == SDKMGStatic)) then {
		_esInf = true;
		_formatX = [staticCrewTeamPlayer,staticCrewTeamPlayer];
	} else {
		_costs = _costs + ([vehSDKTruck] call A3A_fnc_vehiclePrice)
	};
};

if ((_withBackpck != "") and A3A_hasIFA) exitWith {[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_modset_static"] call A3A_fnc_customHint;};

if (_hr < _costHR) then {_exit = true; [localize "STR_antistasi_journal_entry_header_commander_9", format [localize "STR_antistasi_customHint_recruit_noHR",_costHR]] call A3A_fnc_customHint;};

if (_resourcesFIA < _costs) then {_exit = true; [localize "STR_antistasi_journal_entry_header_commander_9", format [localize "STR_antistasi_customHint_recruit_noMoney",_costs]] call A3A_fnc_customHint;};

if (_exit) exitWith {};

[- _costHR, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];

_pos = getMarkerPos respawnTeamPlayer;

_road = [_pos] call A3A_fnc_findNearestGoodRoad;
_roadDirection = _road call A3A_fnc_getRoadDirection;

_bypassAI = false;
if (_esinf) then {
	_pos = [(getMarkerPos respawnTeamPlayer), 30, random 360] call BIS_Fnc_relPos;
	if (_typeGroup isEqualType []) then {
		_groupX = [_pos, teamPlayer, _formatX,true] call A3A_fnc_spawnGroup;
		if (_typeGroup isEqualTo groupsSDKmid) then {_format = "Tm-"};
		if (_typeGroup isEqualTo groupsSDKAT) then {_format = "AT-"};
		if (_typeGroup isEqualTo groupsSDKSniper) then {_format = "Snpr-"};
		if (_typeGroup isEqualTo groupsSDKSentry) then {_format = "Stry-"};
		if (_withBackpck == "MG") then {
			((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal supportStaticsSDKB2;
			((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal MGStaticSDKB;
			_format = "SqMG-";
		} else {
			if (_withBackpck == "Mortar") then {
				((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal supportStaticsSDKB3;
				((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal MortStaticSDKB;
				_format = "SqMort-";
			};
  	    };
	} else {
		_groupX = [_pos, teamPlayer, _formatX,true] call A3A_fnc_spawnGroup;
		_groupX setVariable ["staticAutoT",false,true];
		if (_typeGroup == SDKMortar) then {_format = "Mort-"};
		if (_typeGroup == SDKMGStatic) then {_format = "MG-"};
		[_groupX,_typeGroup] spawn A3A_fnc_MortyAI;
		_bypassAI = true;
	};
	_format = format ["%1%2",_format,{side (leader _x) == teamPlayer} count allGroups];
	_groupX setGroupIdGlobal [_format];
} else {
	_truckX = objNull;
	_groupX = grpNull;

	// workaround for weird bug where AI vehicles with attachments refuse to drive when placed close to road objects
	_pos = position _road vectorAdd [4 * (sin _roadDirection), 4 * (cos _roadDirection), 0];
	_pos = _pos findEmptyPosition [0, 40, vehSDKTruck];

	if (_typeGroup == staticAAteamPlayer) then
	{
		private _vehType = if (vehSDKAA != "not_supported") then {vehSDKAA} else {vehSDKTruck};
		_truckX = createVehicle [_vehType, _pos, [], 0, "NONE"];
		_truckX setDir _roadDirection;

		_groupX = createGroup teamPlayer;
		private _driver = [_groupX, staticCrewTeamPlayer, _pos, [], 5, "NONE"] call A3A_fnc_createUnit;
		private _gunner = [_groupX, staticCrewTeamPlayer, _pos, [], 5, "NONE"] call A3A_fnc_createUnit;
		_driver moveInDriver _truckX;
		_driver assignAsDriver _truckX;

		if (vehSDKAA == "not_supported") then
		{
			private _lpos = _pos vectorAdd [0,0,1000];
			private _launcher = createVehicle [staticAAteamPlayer, _lpos, [], 0, "CAN_COLLIDE"];
			_launcher attachTo [_truckX, [0,-2.2,0.3]];
			_launcher setVectorDirAndUp [[0,-1,0], [0,0,1]];
			_gunner moveInGunner _launcher;
			_gunner assignAsGunner _launcher;
//			[_launcher] call A3A_fnc_AIVEHinit;			// don't need separate despawn/killed handlers
		} else {
			_gunner moveInGunner _truckX;
			_gunner assignAsGunner _truckX;
		};
	} else {
		private _veh = [_pos, _roadDirection,_typeGroup, teamPlayer] call A3A_fnc_spawnVehicle;
		_truckX = _veh select 0;
		_groupX = _veh select 2;
	};

	if (_typeGroup == vehSDKAT) then {_groupX setGroupIdGlobal [format ["M.AT-%1",{side (leader _x) == teamPlayer} count allGroups]]};
	if (_typeGroup == staticAAteamPlayer) then {_groupX setGroupIdGlobal [format ["M.AA-%1",{side (leader _x) == teamPlayer} count allGroups]]};

	driver _truckX action ["engineOn", _truckX];
	[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
	[_truckX] spawn A3A_fnc_vehDespawner;
	_bypassAI = true;
};

{[_x] call A3A_fnc_FIAinit} forEach units _groupX;
theBoss hcSetGroup [_groupX];
petros directSay "SentGenReinforcementsArrived";
[localize "STR_antistasi_journal_entry_header_commander_9", format [localize "STR_antistasi_customHint_recruit_info", groupID _groupX]] call A3A_fnc_customHint;
if (!_esinf) exitWith {};
if !(_bypassAI) then {_groupX spawn A3A_fnc_attackDrillAI};

if (count _formatX == 2) then {
	_typeVehX = vehSDKBike;
} else {
	if (count _formatX > 4) then {
		_typeVehX = vehSDKTruck;
	} else {
		_typeVehX = vehSDKLightUnarmed;
	};
};

_costs = [_typeVehX] call A3A_fnc_vehiclePrice;
if (_costs > server getVariable "resourcesFIA") exitWith {};

createDialog "veh_query";

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) != "no display") then {
	private _ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_veh",_costs];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip localize "STR_antistasi_tooltip_cost_noVeh";
};

waitUntil {(!dialog) or (!isNil "vehQuery")};
if ((!dialog) and (isNil "vehQuery")) exitWith {};

vehQuery = nil;

_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
private _purchasedVehicle = _typeVehX createVehicle _pos;
_purchasedVehicle setDir _roadDirection;
[_purchasedVehicle, teamPlayer] call A3A_fnc_AIVEHinit;
[_purchasedVehicle] spawn A3A_fnc_vehDespawner;
_groupX addVehicle _purchasedVehicle;
_purchasedVehicle setVariable ["owner",_groupX,true];
[0, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];
leader _groupX assignAsDriver _purchasedVehicle;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
[localize "STR_antistasi_journal_entry_header_commander_9", localize "STR_antistasi_customHint_recruit_veh"] call A3A_fnc_customHint;
petros directSay "SentGenBaseUnlockVehicle";
