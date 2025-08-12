private _titleStr = localize "STR_A3A_fn_reinf_buildinfo_title";

if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_build_no_placing"] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",objNull]) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_build_no_controlling"] call A3A_fnc_customHint;};

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
		_abortMessage = _abortMessage + localize "STR_A3A_fn_reinf_build_no_uncon";
	};
} else {
	_abortMessage =	_abortMessage + localize "STR_A3A_fn_reinf_build_no_engi";
};

//Check if an engineer can build.
if (isNull build_engineerSelected && count _otherPlayerEngineers > 0) then {
	build_engineerSelected = _otherPlayerEngineers select 0;
	_abortMessage = _abortMessage + localize "STR_A3A_fn_reinf_build_humanEngi";
};

if (isNull build_engineerSelected) then {
	if (count _aiEngineers > 0 && player != leader player) exitWith {
		_abortMessage =	_abortMessage + localize "STR_A3A_fn_reinf_build_no_sl";
	};

	{
		if ([_x] call A3A_fnc_canFight && !([_x] call _engineerIsBusy)) exitWith {
			build_engineerSelected = _x;
			_abortMessage = _abortMessage + format [localize "STR_A3A_fn_reinf_build_ordering", _x];
		};
	} forEach _aiEngineers;

	if (isNull build_engineerSelected) exitWith {
		_abortMessage =	_abortMessage + localize "STR_A3A_fn_reinf_build_no_engi2";
	};
};

if (isNull build_engineerSelected ||
   ((player != build_engineerSelected) and (isPlayer build_engineerSelected))) exitWith
{
	[_titleStr, _abortMessage] call A3A_fnc_customHint;
};

build_type = _this select 0;
A3A_build_time = 60;
build_cost = 0;
private _playerDir = getDir player;
private _playerPosition = position player;
private _classX = "";
switch build_type do
	{
	case "ST":
		{
		_classX = "Land_Barricade_01_4m_F";
		A3A_build_time = 45;
		};
	case "MT":
		{
		A3A_build_time = 60;
		_classX = "Land_SandbagBarricade_01_half_F";
		};
	case "RB":
		{
		A3A_build_time = 100;	
		_classX = "Land_Tyres_F";
		};
	case "SB":
		{
		A3A_build_time = 60;
		_classX = "Land_BagBunker_01_small_green_F";
		build_cost = 100;
		};
	case "CB":
		{
		A3A_build_time = 120;
		_classX = "Land_Bunker_01_tall_F";
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
		_textX = format [localize "STR_A3A_fn_reinf_build_no_money",build_cost]
		}
	else
		{
		_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
		build_nearestFriendlyMarker = [_sites,_playerPosition] call BIS_fnc_nearestPosition;
		if (!(_playerPosition inArea build_nearestFriendlyMarker)) then
			{
			_leave = true;
			_textX = localize "STR_A3A_fn_reinf_build_no_outside";
			build_nearestFriendlyMarker = nil;
			};
		};
	};

if (_leave) exitWith {[_titleStr, format ["%1",_textX]] call A3A_fnc_customHint;};

// Not really converted to callback system. Whatever.
private _fnc_placeCheck = {
	params ["_vehicle"];
	switch (build_type) do { //return inverted here so true = cant place
		case "RB": {
			[!(isOnRoad _vehicle), localize "STR_A3A_fn_reinf_build_no_road"];
		};
		case "SB": {
			[(isOnRoad _vehicle) || {!(_vehicle inArea build_nearestFriendlyMarker)}, localize "STR_A3A_fn_reinf_build_offroad_friendly"];
		};
		case "CB": {
			[(isOnRoad _vehicle) || {!(_vehicle inArea build_nearestFriendlyMarker)}, localize "STR_A3A_fn_reinf_build_offroad_friendly"];
		};
		default { false };
	};
};

private _fnc_placed = {
	params ["_vehicle"];
	if (isNull _vehicle) exitWith {};
	private _type = typeOf _vehicle;
	private _pos = getPosASL _vehicle;
	private _dir = getDir _vehicle;
	deleteVehicle _vehicle;
	[_type, _pos, _dir] spawn A3A_fnc_buildCreateVehicleCallback;
};

//START PLACEMENT HERE
[_classX, _fnc_placed, _fnc_placeCheck, []] call HR_GRG_fnc_confirmPlacement;
