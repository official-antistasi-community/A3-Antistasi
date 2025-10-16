#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};

Info("Starting persistent save");
[localize "STR_A3A_fn_save_saveLoop_title2",localize "STR_A3A_fn_save_saveLoop_saving"] remoteExecCall ["A3A_fnc_customHint",0,false];

// Set next autosave time, so that we won't run another shortly after a manual save
autoSaveTime = time + autoSaveInterval;

// Select save namespace
A3A_saveTarget params ["_serverID", "_campaignID", "_map"];
A3A_saveTarget set [3, createHashMap];							// new saves are always JSON

// Save each player with global flag
{
	[getPlayerUID _x, _x, true] call A3A_fnc_savePlayer;
} forEach (call A3A_fnc_playableUnits);
["savedPlayers", A3A_playerSaveData] call A3A_fnc_setStatVariable;			// new format, just store the hashmap

// Collect the persistent global variables defined in params config
private _savedParams = [];
{
    if (getArray (_x/"texts") isEqualTo [""]) then { continue };       // spacer/title
	_savedParams pushBack [configName _x, missionNameSpace getVariable configName _x];
} forEach ("true" configClasses (configFile/"A3A"/"Params"));
Debug_1("Saving params: %1", _savedParams);

// Write the header values, some from loadGame UI
["params", _savedParams] call A3A_fnc_setStatVariable;
["version", QUOTE(VERSION_FULL)] call A3A_fnc_setStatVariable;
["saveTime", systemTimeUTC] call A3A_fnc_setStatVariable;
["map", _map] call A3A_fnc_setStatVariable;						// just here for exporting really
{
	[_x, A3A_saveData get _x] call A3A_fnc_setStatVariable;
} forEach ["name", "factions", "DLC", "addonVics"];

// Simple values
["bombRuns", bombRuns] call A3A_fnc_setStatVariable;
["membersX", membersX] call A3A_fnc_setStatVariable;
["antennas", A3A_antennas select { !alive _x } apply { getPosATL _x }] call A3A_fnc_setStatVariable;
["mrkSDK", markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer}] call A3A_fnc_setStatVariable;
["mrkCSAT", markersX select {sidesX getVariable [_x,sideUnknown] == Invaders}] call A3A_fnc_setStatVariable;
["posHQ", [getMarkerPos respawnTeamPlayer,getPosATL fireX,[getDir boxX,getPosATL boxX],[getDir mapX,getPosATL mapX],getPosATL flagX,[getDir vehicleBox,getPosATL vehicleBox],[getDir petros,getPosATL petros]]] call A3A_fnc_setStatVariable;
["dateX", date] call A3A_fnc_setStatVariable;
["skillFIA", skillFIA] call A3A_fnc_setStatVariable;
["destroyedSites", destroyedSites] call A3A_fnc_setStatVariable;
["chopForest", chopForest] call A3A_fnc_setStatVariable;
["nextTick", nextTick - time] call A3A_fnc_setStatVariable;
["weather",[fogParams,rain]] call A3A_fnc_setStatVariable;
["arsenalLimits", A3A_arsenalLimits] call A3A_fnc_setStatVariable;
["rebelLoadouts", A3A_rebelLoadouts] call A3A_fnc_setStatVariable;
["destroyedBuildings", A3A_destroyedBuildings apply { getPosATL _x }] call A3A_fnc_setStatVariable;
["aggressionOccupants", [aggressionLevelOccupants, aggressionStackOccupants]] call A3A_fnc_setStatVariable;
["aggressionInvaders", [aggressionLevelInvaders, aggressionStackInvaders]] call A3A_fnc_setStatVariable;
["radioKeys", [occRadioKeys,invRadioKeys]] call A3A_fnc_setStatVariable;
["HQKnowledge", [A3A_curHQInfoOcc, A3A_curHQInfoInv, A3A_oldHQInfoOcc, A3A_oldHQInfoInv]] call A3A_fnc_setStatVariable;

// Convert side values because JSON doesn't support them
private _modifiedSites = createHashMap;
private _sideToStr = createHashMapFromArray [[teamPlayer,0], [Occupants,1],	[Invaders,2]];
{
	private _newSide = _sideToStr getOrDefault [_y#2, _y#2];
	_modifiedSites set [_x, [_y#0, _y#1, _newSide, _y#3]];
} forEach A3A_minorSitesHM;
["minorSites", _modifiedSites] call A3A_fnc_setStatVariable;

private ["_hrBackground","_resourcesBackground","_veh","_typeVehX","_weaponsX","_ammunition","_items","_backpcks","_containers","_arrayEst","_posVeh","_dierVeh","_prestigeOPFOR","_prestigeBLUFOR","_city","_dataX","_markersX","_garrison","_arrayMrkMF","_arrayOutpostsFIA","_positionOutpost","_typeMine","_posMine","_detected","_typesX","_exists","_friendX"];

_hrBackground = (server getVariable "hr") + ({(alive _x) and (not isPlayer _x) and (_x getVariable ["spawner",false]) and ((group _x in (hcAllGroups theBoss) or (isPlayer (leader _x))) and (side group _x == teamPlayer))} count allUnits);
_resourcesBackground = server getVariable "resourcesFIA";

// TODO: Sort this garbage out
{
	_friendX = _x;
	if ((_friendX getVariable ["spawner",false]) and (side group _friendX == teamPlayer))then {
		if ((alive _friendX) and (!isPlayer _friendX)) then {
			if (((isPlayer leader _friendX) and (!isMultiplayer)) or (group _friendX in (hcAllGroups theBoss)) and (not((group _friendX) getVariable ["esNATO",false]))) then {
				_resourcesBackground = _resourcesBackground + (server getVariable [(_friendX getVariable "unitType"),0]) / 2;
				_backpck = backpack _friendX;
				if (_backpck != "") then {
                    private _assemblesTo = getText (configFile/"CfgVehicles"/_backpck/"assembleInfo"/"assembleTo");
                    if (_backpck isNotEqualTo "") then {_resourcesBackground = _resourcesBackground + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
				};
				if (vehicle _friendX != _friendX) then {
					_veh = vehicle _friendX;
					_typeVehX = typeOf _veh;
					if (isNil {_veh getVariable "markerX"}) then {
						if ((_veh isKindOf "StaticWeapon") or (driver _veh == _friendX)) then {
							if ((group _friendX in (hcAllGroups theBoss)) or (!isMultiplayer)) then {
								_resourcesBackground = _resourcesBackground + ([_typeVehX] call A3A_fnc_vehiclePrice);
								if (count attachedObjects _veh != 0) then {{_resourcesBackground = _resourcesBackground + ([typeOf _x] call A3A_fnc_vehiclePrice)} forEach attachedObjects _veh};
							};
						};
					};
				};
			};
		};
	};
} forEach allUnits;

["resourcesFIA", _resourcesBackground] call A3A_fnc_setStatVariable;
["hr", _hrBackground] call A3A_fnc_setStatVariable;

private _grgData = [] call HR_GRG_fnc_getSaveData;
private _cats = _grgData#0;
private _newGrgCats = [];
{
	// json requires string keys, so garage numbers are saved as stringified numbers (e.g. "1") and parsed in-game as the actual numbers
	private _keys = (keys _x) apply {str _x};
	private _hm = _keys createHashMapFromArray (values _x);
	_newGrgCats pushback _hm;
} forEach _cats;
_grgData set [0, _newGrgCats];
["HR_Garage", _grgData] call A3A_fnc_setStatVariable;

[] call A3A_fnc_arsenalManage;

_jna_dataList = [];
_jna_dataList = _jna_dataList + jna_dataList;
["jna_datalist", _jna_dataList] call A3A_fnc_setStatVariable;

private _cityDataHM = createHashMap;
{
	_dataX = +(A3A_cityData getVariable _x);			// copy so that we don't accidentally modify
	_dataX set [3, A3A_cityTaskTimer get _x];			// might want this later
	_cityDataHM set [_x, _dataX];
} forEach citiesX;

["cityData", _cityDataHM] call A3A_fnc_setStatVariable;

// Update rebel garrison vehicle states. Can do this on active data because it doesn't change anything
private _rebMarkers = (markersX select { sidesX getVariable _x == teamPlayer }) + outpostsFIA;
{ _x call A3A_fnc_garrisonServer_updateVehData } forEach _rebMarker;

// Cull garrison data to what we want to save
private _saveGarrison = +A3A_garrison;
{ _saveGarrison deleteAt _x } forEach A3A_markersToDelete;			// don't save garrisons that we're deleting
{
	// Add other stuff we're not saving in here
	_y deleteAt "spawnedBuildings";
	_y deleteAt "type";
} forEach _saveGarrison;

["newGarrison", _saveGarrison] call A3A_fnc_setStatVariable;

_arrayOutpostsFIA = [];
{
	_arrayOutpostsFIA pushBack [markerPos _x,[]];		// used to have garrison data here
} forEach outpostsFIA;

["outpostsFIA", _arrayOutpostsFIA] call A3A_fnc_setStatVariable;


_arrayMines = [];
private _mineChance = 200 / (200 max count allMines);
{
	// randomly discard mines down to ~200 to avoid ballooning saves and terrible perf
	if (random 1 > _mineChance) then { continue };
	_typeMine = typeOf _x;
	_posMine = getPosATL _x;
	_dirMine = getDir _x;
	_detected = [];
	if (_x mineDetectedBy teamPlayer) then { _detected pushBack 0 };
	if (_x mineDetectedBy Occupants) then { _detected pushBack 1 };
	if (_x mineDetectedBy Invaders) then { _detected pushBack 2 };
	_arrayMines pushBack [_typeMine,_posMine,_detected,_dirMine];
} forEach allMines;

["minesX", _arrayMines] call A3A_fnc_setStatVariable;

if (!isDedicated) then {
	// Not currently used by loadServer due to timing bugs
	_typesX = [];
	{
		private _type = _x;
		private _index = A3A_tasksData findIf { (_x#1) isEqualTo _type and (_x#2) isEqualTo "CREATED" };
		if (_index != -1) then { _typesX pushBackUnique _type };

	} forEach ["AS","CON","DES","LOG","RES","CONVOY","DEF_HQ","rebelAttack","invaderPunish"];

	["tasks",_typesX] call A3A_fnc_setStatVariable;
};


// Add resources spent on active enemy units & vehicles before saving
private _resAttOcc = A3A_resourcesAttackOcc;
private _resDefOcc = A3A_resourcesDefenceOcc;
private _resAttInv = A3A_resourcesAttackInv;
private _resDefInv = A3A_resourcesDefenceInv;

// Heavily based on deleted handler in AIVehInit
{
	private _veh = _x;
	private _side = _veh getVariable ["ownerSide", teamPlayer];
	private _vehCost = A3A_vehicleResourceCosts getOrDefault [typeof _veh, 0];
	if (!alive _veh || (_side != Occupants && _side != Invaders) || _vehCost == 0) exitWith {};

	private _vehDamage = damage _veh;
	if (getAllHitPointsDamage _veh isNotEqualTo []) then {
		private _allHP = getAllHitPointsDamage _veh select 2;
		private _total = 0; { _total = _total + _x } forEach _allHP;
		_vehDamage = _vehDamage max (_total / count _allHP);
	};

	private _pool = _veh getVariable ["A3A_resPool", "legacy"];
//	Debug_5("Vehicle type %1 deleted with side %2, pool %3, cost %4, damage %5", typeof _veh, _side, _pool, _vehCost, _vehDamage);

	if (_pool == "legacy") then {
		// If vehicle isn't prepaid, remove partial cost now if damaged
		if (_side == Occupants) then {
			_resAttOcc = _resAttOcc - _vehDamage*_vehCost/2;
			_resDefOcc = _resDefOcc - _vehDamage*_vehCost/2;
		} else {
			_resAttInv = _resAttInv - _vehDamage*_vehCost/2;
			_resDefInv = _resDefInv - _vehDamage*_vehCost/2;
		};
	} else {
		// If vehicle is prepaid, refund if not crippled
		// Note full refund, to reduce exploiting save-on-attack
		if (_side == Occupants) then {
			if (_pool == "attack") then { _resAttOcc = _resAttOcc + (1-_vehDamage)*_vehCost };
			if (_pool == "defence") then { _resDefOcc = _resDefOcc + (1-_vehDamage)*_vehCost };
		} else {
			if (_pool == "attack") then { _resAttInv = _resAttInv + (1-_vehDamage)*_vehCost };
			if (_pool == "defence") then { _resDefInv = _resDefInv + (1-_vehDamage)*_vehCost };
		};
	};
} forEach vehicles;

{
	if !(_x call A3A_fnc_canFight) then { continue };
	private _resPool = _x getVariable ["A3A_resPool", ""];
	// TODO: potentially different values for different unit types?
	if (_resPool == "defence") then { _resDefOcc = _resDefOcc + 10; continue };
	if (_resPool == "attack") then { _resAttOcc = _resAttOcc + 10 };
} forEach units Occupants;

{
	if !(_x call A3A_fnc_canFight) then { continue };
	private _resPool = _x getVariable ["A3A_resPool", ""];
	// TODO: potentially different values for different unit types?
	if (_resPool == "defence") then { _resDefInv = _resDefInv + 10; continue };
	if (_resPool == "attack") then { _resAttInv = _resAttInv + 10 };
} forEach units Invaders;

// Adjust defence resources to playerScale 1 so that it doesn't get mangled on save/load
_resDefOcc = _resDefOcc / A3A_balancePlayerScale;
_resDefInv = _resDefInv / A3A_balancePlayerScale;

// Enemy resources. Could hashmap this instead...
["enemyResources", [_resDefOcc, _resDefInv, _resAttOcc, _resAttInv, A3A_punishmentDefBuff]] call A3A_fnc_setStatVariable;

// these are obsolete? idlebases is only used short-term now
/*
_dataX = [];
{
	_dataX pushBack [_x,server getVariable _x];
} forEach airportsX + outposts;

["idlebases",_dataX] call A3A_fnc_setStatVariable;
*/

_dataX = [];
{
	_dataX pushBack [_x,killZones getVariable [_x,[]]];
} forEach airportsX + outposts;

["killZones",_dataX] call A3A_fnc_setStatVariable;


// fuel rework
_fuelAmountleftArray = [];
{
	if (A3A_hasACE) then {
		private _keyPairsFuel = [position _x, [_x] call ace_refuel_fnc_getFuel];
		_fuelAmountleftArray pushback _keyPairsFuel;
	} else {
		private _keyPairsFuel = [position _x, getFuelCargo _x];
		_fuelAmountleftArray pushback _keyPairsFuel;
	};

} forEach A3A_fuelStations;
["A3A_fuelAmountleftArray",_fuelAmountleftArray] call A3A_fnc_setStatVariable;

//Saving the state of the testing timer
["testingTimerIsActive", testingTimerIsActive] call A3A_fnc_setStatVariable;

// Write the JSON blob to the save header & complete
call A3A_fnc_finalizeSave;

_saveHintText = ["<t size='1.5'>",FactionGet(reb,"name")," ",localize "STR_A3A_fn_save_saveLoop_text_asset"," ",_hrBackground toFixed 0,localize "STR_A3A_fn_save_saveLoop_text_money"," ",_resourcesBackground toFixed 0," ",localize "STR_A3A_fn_save_saveLoop_text_options"] joinString "";
[localize "STR_A3A_fn_save_saveLoop_title2",_saveHintText] remoteExecCall ["A3A_fnc_customHint",0,false];
Info("Persistent Save Completed");
