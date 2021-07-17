//===========================================================================
//ADD VARIABLES TO THIS ARRAY THAT NEED SPECIAL SCRIPTING TO LOAD
/*specialVarLoads =
[
	"weaponsPlayer",
	"magazinesPlayer",
	"backpackPlayer",
	"mrkNATO",
	"mrkSDK",
	"prestigeNATO","prestigeCSAT", "hr","planesAAFcurrent","helisAAFcurrent","APCAAFcurrent","tanksAAFcurrent","armas","items","backpcks","ammunition","dateX", "WitemsPlayer","prestigeOPFOR","prestigeBLUFOR","resourcesAAF","resourcesFIA","skillFIA"];
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _translateMarker = {
	params ["_mrk"];
	if (_mrk find "puesto" == 0) exitWith { "outpost" + (_mrk select [6]) };
	if (_mrk find "puerto" == 0) exitWith { "seaport" + (_mrk select [6]) };
	_mrk;
};

private _specialVarLoads = [
	"outpostsFIA","minesX","staticsX","attackCountdownOccupants","antennas","mrkNATO","mrkSDK","prestigeNATO",
	"prestigeCSAT","posHQ","hr","armas","items","backpcks","ammunition","dateX","prestigeOPFOR",
	"prestigeBLUFOR","resourcesFIA","skillFIA","destroyedSites",
	"garrison","tasks","smallCAmrk","membersX","vehInGarage","destroyedBuildings","idlebases",
	"idleassets","chopForest","weather","killZones","jna_dataList","controlsSDK","mrkCSAT","nextTick",
	"bombRuns","wurzelGarrison","aggressionOccupants", "aggressionInvaders",
	"countCA", "attackCountdownInvaders", "testingTimerIsActive", "version", "HR_Garage"
];

private _varName = _this select 0;
private _varValue = _this select 1;
if (isNil '_varValue') exitWith {};

if (_varName in _specialVarLoads) then {
	if (_varName == 'version') then {
		_s = _varValue splitString ".";
		if (count _s < 2) exitWith {
			Error_1("Bad version string: %1", _varValue);
		};
		A3A_saveVersion = 10000*parsenumber(_s#0) + 100*parseNumber(_s#1) + parseNumber(_s#2);
	};
	if (_varName == 'attackCountdownOccupants') then {attackCountdownOccupants = _varValue; publicVariable "attackCountdownOccupants"};
	if (_varName == 'attackCountdownInvaders') then {attackCountdownInvaders = _varValue; publicVariable "attackCountdownInvaders"};
	//Keep this for backwards compatiblity
	if (_varName == 'countCA') then {attackCountdownOccupants = _varValue; publicVariable "attackCountdownOccupants"};
	if (_varName == 'bombRuns') then {bombRuns = _varValue; publicVariable "bombRuns"};
	if (_varName == 'nextTick') then {nextTick = time + _varValue};
	if (_varName == 'membersX') then {membersX = +_varValue; publicVariable "membersX"};
	if (_varName == 'smallCAmrk') then {};		// Ignore. These are not persistent.
	if (_varName == 'mrkNATO') then {{sidesX setVariable [[_x] call _translateMarker,Occupants,true]} forEach _varValue;};
	if (_varName == 'mrkCSAT') then {{sidesX setVariable [[_x] call _translateMarker,Invaders,true]} forEach _varValue;};
	if (_varName == 'mrkSDK') then {{sidesX setVariable [[_x] call _translateMarker,teamPlayer,true]} forEach _varValue;};
	if (_varName == 'controlsSDK') then {
		{
			sidesX setVariable [_x,teamPlayer,true]
		} forEach _varValue;
	};
	if (_varName == 'chopForest') then {chopForest = _varValue; publicVariable "chopForest"};
	if (_varName == 'jna_dataList') then {jna_dataList = +_varValue};
	//Keeping these for older saves
	if (_varName == 'prestigeNATO') then {[Occupants, _varValue, 120] call A3A_fnc_addAggression};
	if (_varName == 'prestigeCSAT') then {[Invaders, _varValue, 120] call A3A_fnc_addAggression};
	if (_varName == 'aggressionOccupants') then
	{
		aggressionLevelOccupants = _varValue select 0;
		aggressionStackOccupants = +(_varValue select 1);
		[true] spawn A3A_fnc_calculateAggression;
	};
	if (_varName == 'aggressionInvaders') then
	{
		aggressionLevelInvaders = _varValue select 0;
		aggressionStackInvaders = +(_varValue select 1);
		[true] spawn A3A_fnc_calculateAggression;
	};
	if (_varName == 'hr') then {server setVariable ["HR",_varValue,true]};
	if (_varName == 'dateX') then {setDate _varValue};
	if (_varName == 'weather') then {
		0 setFog (_varValue select 0);
		0 setRain (_varValue select 1);
		forceWeatherChange
	};
	if (_varName == 'resourcesFIA') then {server setVariable ["resourcesFIA",_varValue,true]};
	if (_varName == 'destroyedSites') then {destroyedSites = +_varValue; publicVariable "destroyedSites"};
	if (_varName == 'skillFIA') then {
		skillFIA = _varValue; publicVariable "skillFIA";
		{
			_costs = server getVariable _x;
			for "_i" from 1 to _varValue do {
				_costs = round (_costs + (_costs * (_i/280)));
			};
			server setVariable [_x,_costs,true];
		} forEach soldiersSDK;
	};
    if (_varname == "HR_Garage") then {
        [_varValue] call HR_GRG_fnc_loadSaveData;
    };
	if (_varName == 'vehInGarage') then { //convert old garage to new garage
        vehInGarage= [];
        publicVariable "vehInGarage";
        [_varValue, ""] call HR_GRG_fnc_addVehiclesByClass;
    };
	if (_varName == 'destroyedBuildings') then {
		{
			// nearestObject sometimes picks the wrong building and is several times slower
			// Example: Livonia Land_Cargo_Tower_V2_F at [6366.63,3880.88,0] ATL

			private _building = nearestObjects [_x, ["House"], 1, true] select 0;
			call {
				if (isNil "_building") exitWith { Error("No building found at %1", _x)};
				if (_building in antennas) exitWith { Info("Antenna in destroyed building list, ignoring")};

				private _ruin = [_building] call BIS_fnc_createRuin;
				if (isNull _ruin) exitWith {
					Error_1("Loading Destroyed Buildings: Unable to create ruin for %1", typeOf _building);
				};

				destroyedBuildings pushBack _building;
			};
		} forEach _varValue;
	};
	if (_varName == 'minesX') then {
		for "_i" from 0 to (count _varvalue) - 1 do {
			_typeMine = _varvalue select _i select 0;
			switch _typeMine do {
				case "APERSMine_Range_Ammo": {_typeMine = "APERSMine"};
				case "ATMine_Range_Ammo": {_typeMine = "ATMine"};
				case "APERSBoundingMine_Range_Ammo": {_typeMine = "APERSBoundingMine"};
				case "SLAMDirectionalMine_Wire_Ammo": {_typeMine = "SLAMDirectionalMine"};
				case "APERSTripMine_Wire_Ammo": {_typeMine = "APERSTripMine"};
				case "ClaymoreDirectionalMine_Remote_Ammo": {_typeMine = "Claymore_F"};
			};
			_posMine = _varvalue select _i select 1;
			_mineX = createMine [_typeMine, _posMine, [], 0];
			_detected = _varvalue select _i select 2;
			{_x revealMine _mineX} forEach _detected;
			if (count (_varvalue select _i) > 3) then {
				_dirMine = _varvalue select _i select 3;
				_mineX setDir _dirMine;
			};
		};
	};
	if (_varName == 'garrison') then {
		{
			garrison setVariable [[_x select 0] call _translateMarker, _x select 1, true];
			if (count _x > 2) then { garrison setVariable [(_x select 0) + "_lootCD", _x select 2, true] };
		} forEach _varvalue;
	};
	if (_varName == 'wurzelGarrison') then {
		{
			garrison setVariable [format ["%1_garrison", (_x select 0)], _x select 1, true];
			garrison setVariable [format ["%1_requested", (_x select 0)], _x select 2, true];
			garrison setVariable [format ["%1_over", (_x select 0)], _x select 3, true];
			[(_x select 0)] call A3A_fnc_updateReinfState;
		} forEach _varvalue;
	};
	if (_varName == 'outpostsFIA') then {
		if (count (_varValue select 0) == 2) then {
			{
				_positionX = _x select 0;
				_garrison = _x select 1;
				_mrk = createMarker [format ["FIApost%1", random 1000], _positionX];
				_mrk setMarkerShape "ICON";
				_mrk setMarkerType "loc_bunker";
				_mrk setMarkerColor colorTeamPlayer;
				if (isOnRoad _positionX) then {_mrk setMarkerText format ["%1 " + localize "STR_a3_cfggroups_empty_military_roadblocks_roadblock2",nameTeamPlayer]} else {_mrk setMarkerText format ["%1 " + localize "STR_antistasi_markers_watchpost",nameTeamPlayer]};
				spawner setVariable [_mrk,2,true];
				if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
				outpostsFIA pushBack _mrk;
				sidesX setVariable [_mrk,teamPlayer,true];
			} forEach _varvalue;
		};
	};
	if (_varName == 'antennas') then {
		antennasDead = [];
		for "_i" from 0 to (count _varvalue - 1) do {
			_posAnt = _varvalue select _i;
			_mrk = [mrkAntennas, _posAnt] call BIS_fnc_nearestPosition;
			_antenna = [antennas,_mrk] call BIS_fnc_nearestPosition;
			{if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
			antennas = antennas - [_antenna];
			antennasDead pushBack _antenna;
			_antenna removeAllEventHandlers "Killed";

			private _ruin = [_antenna] call BIS_fnc_createRuin;

			if !(isNull _ruin) then {
				//JIP on the _ruin, as repairRuinedBuilding will delete the ruin.
				[_antenna, true] remoteExec ["hideObject", 0, _ruin];
			} else {
				Error("Loading Antennas: Unable to create ruin for %1", typeOf _antenna);
			};

			deleteMarker _mrk;
		};
		publicVariable "antennas";
		publicVariable "antennasDead";
	};
	if (_varname == 'prestigeOPFOR') then {
		for "_i" from 0 to (count citiesX) - 1 do {
			_city = citiesX select _i;
			_dataX = server getVariable _city;
			_numCiv = _dataX select 0;
			_numVeh = _dataX select 1;
			_prestigeOPFOR = _varvalue select _i;
			_prestigeBLUFOR = _dataX select 3;
			_dataX = [_numCiv,_numVeh,_prestigeOPFOR,_prestigeBLUFOR];
			server setVariable [_city,_dataX,true];
		};
	};
	if (_varname == 'prestigeBLUFOR') then {
		for "_i" from 0 to (count citiesX) - 1 do {
			_city = citiesX select _i;
			_dataX = server getVariable _city;
			_numCiv = _dataX select 0;
			_numVeh = _dataX select 1;
			_prestigeOPFOR = _dataX select 2;
			_prestigeBLUFOR = _varvalue select _i;
			_dataX = [_numCiv,_numVeh,_prestigeOPFOR,_prestigeBLUFOR];
			server setVariable [_city,_dataX,true];
		};
	};
	if (_varname == 'idlebases') then {
		{
			server setVariable [(_x select 0),(_x select 1),true];
		} forEach _varValue;
	};
	if (_varname == 'idleassets') then {
		{
			timer setVariable [(_x select 0),(_x select 1),true];
		} forEach _varValue;
	};
	if (_varname == 'killZones') then {
		{
			killZones setVariable [(_x select 0),(_x select 1),true];
		} forEach _varValue;
	};
	if (_varName == 'posHQ') then {
		_posHQ = if (count _varValue >3) then {_varValue select 0} else {_varValue};
		{
			if (getMarkerPos _x distance _posHQ < 1000) then {
				sidesX setVariable [_x,teamPlayer,true];
			};
		} forEach controlsX;
		respawnTeamPlayer setMarkerPos _posHQ;
		posHQ = getMarkerPos respawnTeamPlayer;
		petros setPos _posHQ;
		"Synd_HQ" setMarkerPos _posHQ;
		if (chopForest) then {
			if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [position petros,["tree","bush"],70])} else {{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [position petros,["tree","bush"],70])};
		};
		if (count _varValue == 3) then {
			[] spawn A3A_fnc_buildHQ;
		} else {
			fireX setPos (_varValue select 1);
			boxX setDir ((_varValue select 2) select 0);
			boxX setPos ((_varValue select 2) select 1);
			mapX setDir ((_varValue select 3) select 0);
			mapX setPos ((_varValue select 3) select 1);
			flagX setPos (_varValue select 4);
			vehicleBox setDir ((_varValue select 5) select 0);
			vehicleBox setPos ((_varValue select 5) select 1);
		};
		{_x setPos _posHQ} forEach ((call A3A_fnc_playableUnits) select {side _x == teamPlayer});
	};
	if (_varname == 'staticsX') then {
		for "_i" from 0 to (count _varvalue) - 1 do {
			_typeVehX = _varvalue select _i select 0;
			_posVeh = _varvalue select _i select 1;
			_xVectorUp = _varvalue select _i select 2;
			_xVectorDir = _varvalue select _i select 3;
			private _veh = createVehicle [_typeVehX,[0,0,1000],[],0,"CAN_COLLIDE"];
			// This is only here to handle old save states. Could be removed after a few version itterations. -Hazey
			if ((_varvalue select _i select 2) isEqualType 0) then { // We have to check number because old save state might still be using getDir. -Hazey
				_dirVeh = _varvalue select _i select 2;
				_veh setDir _dirVeh;
				_veh setVectorUp surfaceNormal (_posVeh);
				_veh setPosATL _posVeh;
			} else {
				if (A3A_saveVersion >= 20401) then { _veh setPosWorld _posVeh } else { _veh setPosATL _posVeh };
				_veh setVectorDirAndUp [_xVectorDir,_xVectorUp];
			};
			[_veh, teamPlayer] call A3A_fnc_AIVEHinit;
			if ((_veh isKindOf "StaticWeapon") or (_veh isKindOf "Building")) then {
				staticsToSave pushBack _veh;
			}
			else {
				[_veh] spawn A3A_fnc_vehDespawner;
			};
		};
		publicVariable "staticsToSave";
	};
	if (_varname == 'tasks') then {
		{
			if (_x == "rebelAttack") then {
                if(attackCountdownInvaders > attackCountdownOccupants) then
                {
                    [Invaders] spawn A3A_fnc_rebelAttack;
                }
                else
                {
                    [Occupants] spawn A3A_fnc_rebelAttack;
                };
			} else {
				if (_x == "DEF_HQ") then {
					[] spawn A3A_fnc_attackHQ;
				} else {
					[_x,clientOwner,true] call A3A_fnc_missionRequest;
				};
			};
		} forEach _varvalue;
	};
	if(_varname == 'testingTimerIsActive') then
	{
		if(_varValue) then
		{
			[] spawn A3A_fnc_startTestingTimer;
		};
		testingTimerIsActive = _varValue;
	};
} else {
	call compile format ["%1 = %2",_varName,_varValue];
};
