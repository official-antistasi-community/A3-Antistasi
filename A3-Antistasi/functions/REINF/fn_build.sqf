if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {[localize "STR_antistasi_customHint_build", localize "STR_antistasi_customHint_build_placing"] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",objNull]) exitWith {[localize "STR_antistasi_customHint_build", localize "STR_antistasi_customHint_build_ctrlAI"] call A3A_fnc_customHint;};

build_engineerSelected = objNull;

private _engineers = (units group player) select {_x getUnitTrait "engineer"};
private _playerIsEngineer = false;
private _otherPlayerEngineers = [];
private _aiEngineers = [];

private _abortMessage = "";

{
	if (_x getUnitTrait "engineer") then {
		if (isPlayer _x) then {
			if (player == _x) then {
				_playerIsEngineer = true;
			} else {
				_otherPlayerEngineers pushBack _x;
			};
		} else {
			//AI Engineer
			_aiEngineers pushBack _x;
		};
	};
} forEach units group player;

private _engineerIsBusy = {
	private _engineer = param [0, objNull];
	((_engineer getVariable ["helping",false])
	or (_engineer getVariable ["rearming",false])
	or (_engineer getVariable ["constructing",false]));
};

//Check if the player can build
if (_playerIsEngineer) then {
	if ([player] call A3A_fnc_canFight && !([player] call _engineerIsBusy)) then {
		build_engineerSelected = player;
	} else {
		_abortMessage = _abortMessage + localize "STR_antistasi_customHint_build_undercover";
	};
} else {
	_abortMessage =	_abortMessage + localize "STR_antistasi_customHint_build_noEng";
};

//Check if an engineer can build.
if (isNull build_engineerSelected && count _otherPlayerEngineers > 0) then {
	build_engineerSelected = _otherPlayerEngineers select 0;
	_abortMessage = _abortMessage + localize "STR_antistasi_customHint_build_noPlayer";
};

if (isNull build_engineerSelected) then {
	if (count _aiEngineers > 0 && player != leader player) exitWith {
		_abortMessage =	_abortMessage + localize "STR_antistasi_customHint_build_noLeader";
	};

	{
		if ([_x] call A3A_fnc_canFight && !([_x] call _engineerIsBusy)) exitWith {
			build_engineerSelected = _x;
			_abortMessage = _abortMessage + format [localize "STR_antistasi_customHint_build_order", _x];
		};
	} forEach _aiEngineers;

	if (isNull build_engineerSelected) exitWith {
		_abortMessage =	_abortMessage + localize "STR_antistasi_customHint_build_noEng_SQ";
	};
};

if (isNull build_engineerSelected ||
   ((player != build_engineerSelected) and (isPlayer build_engineerSelected))) exitWith
{
	[localize "STR_antistasi_customHint_build", _abortMessage] call A3A_fnc_customHint;
};

build_type = _this select 0;
build_time = 60;
build_cost = 0;
private _playerDir = getDir player;
private _playerPosition = position player;
private _classX = "";
switch build_type do
	{
	case "ST":
		{
		if (count (nearestTerrainObjects [player, ["House"], 70]) > 3) then
			{
			_classX = selectRandom ["Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_Barricade_01_4m_F"];
			}
		else
			{
			if (count (nearestTerrainObjects [player,["tree"],70]) > 8) then
				{
				_classX = "Land_WoodPile_F";
				}
			else
				{
				_classX = "CraterLong_small";
				};
			};
		};
	case "MT":
		{
		build_time = 60;
		if (count (nearestTerrainObjects [player, ["House"], 70]) > 3) then
			{
			_classX = "Land_Barricade_01_10m_F";
			}
		else
			{
			if (count (nearestTerrainObjects [player,["tree"],70]) > 8) then
				{
				_classX = "Land_WoodPile_large_F";
				}
			else
				{
				_classX = selectRandom ["Land_BagFence_01_long_green_F","Land_SandbagBarricade_01_half_F"];
				};
			};
		};
	case "RB":
		{
		build_time = 100;
		if (count (nearestTerrainObjects [player, ["House"], 70]) > 3) then
			{
			_classX = "Land_Tyres_F";
			}
		else
			{
			_classX = "Land_TimberPile_01_F";
			};
		};
	case "SB":
		{
		build_time = 60;
		_classX = "Land_BagBunker_01_small_green_F";
		build_cost = 100;
		};
	case "CB":
		{
		build_time = 120;
		_classX = "Land_PillboxBunker_01_big_F";
		build_cost = 300;
		};
	};

private _leave = false;
private _textX = "";
if ((build_type == "SB") or (build_type == "CB")) then
	{
	if (build_type == "SB") then {_playerDir = _playerDir + 180};
	_resourcesFIA = if (!isMultiPlayer) then {server getVariable "resourcesFIA"} else {player getVariable "moneyX"};
	if (build_cost > _resourcesFIA) then
		{
		_leave = true;
		_textX = format [localize "STR_antistasi_customHint_build_noMoney",build_cost]
		}
	else
		{
		_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
		build_nearestFriendlyMarker = [_sites,_playerPosition] call BIS_fnc_nearestPosition;
		if (!(_playerPosition inArea build_nearestFriendlyMarker)) then
			{
			_leave = true;
			_textX = localize "STR_antistasi_customHint_build_outside";
			build_nearestFriendlyMarker = nil;
			};
		};
	};

if (_leave) exitWith {[localize "STR_antistasi_customHint_build", format ["%1",_textX]] call A3A_fnc_customHint;};

//START PLACEMENT HERE
[_classX, [], [], nil, false, "BUILDSTRUCTURE"] call HR_GRG_fnc_confirmPlacement;
