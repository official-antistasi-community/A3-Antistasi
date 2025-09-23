/*
Arguments:
	0.  <String>    variable name or identifier for subroutine to run
    1.  <any>       data that will be set
Return Value:
    nil

Scope: Server
Environment: unscheduled
Public: yes
Dependencies:

Example:
    [_varName,_varValue] call A3A_fnc_loadStat;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _translateMarker = {
    params ["_mrk"];
    if (_mrk find "puesto" == 0) exitWith { "outpost" + (_mrk select [6]) };
    if (_mrk find "puerto" == 0) exitWith { "seaport" + (_mrk select [6]) };
    _mrk;
};

private _numToSide = createHashMapFromArray [ [0,teamPlayer], [1,Occupants], [2,Invaders] ];

//===========================================================================
//ADD VARIABLES TO THIS ARRAY THAT NEED SPECIAL SCRIPTING TO LOAD
private _specialVarLoads = [
    "outpostsFIA","minesX","staticsX","antennas","mrkNATO","mrkSDK","prestigeNATO",
    "prestigeCSAT","posHQ","hr","armas","items","backpcks","ammunition","dateX",
    "prestigeBLUFOR","resourcesFIA","skillFIA","destroyedSites",
    "garrison","tasks","membersX","vehInGarage","destroyedBuildings","idlebases",
    "chopForest","weather","killZones","jna_datalist","mrkCSAT","nextTick",
    "bombRuns","wurzelGarrison","aggressionOccupants", "aggressionInvaders", "enemyResources", "HQKnowledge",
    "testingTimerIsActive", "version", "HR_Garage", "A3A_fuelAmountleftArray", "arsenalLimits", "rebelLoadouts",
    "minorSites", "newGarrison", "radioKeys", "cityData"
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
    if (_varName == 'bombRuns') then {bombRuns = _varValue; publicVariable "bombRuns"};
    if (_varName == 'nextTick') then {nextTick = time + _varValue};
    if (_varName == 'membersX') then {membersX = +_varValue; publicVariable "membersX"};
    if (_varName == 'mrkNATO') then {{sidesX setVariable [[_x] call _translateMarker,Occupants,true]} forEach _varValue;};
    if (_varName == 'mrkCSAT') then {{sidesX setVariable [[_x] call _translateMarker,Invaders,true]} forEach _varValue;};
    if (_varName == 'mrkSDK') then {{sidesX setVariable [[_x] call _translateMarker,teamPlayer,true]} forEach _varValue;};
    if (_varName == 'chopForest') then {chopForest = _varValue; publicVariable "chopForest"};
    if (_varName == 'jna_dataList') then {jna_dataList = +_varValue};
    //Keeping these for older saves
    if (_varName == 'prestigeNATO') then {[Occupants, _varValue, 120] call A3A_fnc_addAggression};
    if (_varName == 'prestigeCSAT') then {[Invaders, _varValue, 120] call A3A_fnc_addAggression};
    if (_varName == 'radioKeys') then 
    {
        occRadioKeys = _varValue#0;
        invRadioKeys = _varValue#1;
    };
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
        // Avoid persisting potentially-broken fog values
        private _fogParams = _varValue select 0;
        0 setFog [_fogParams#0, (_fogParams#1) max 0, (_fogParams#2) max 0];
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
        } forEach FactionGet(reb,"unitsSoldiers");
    };
    if (_varname == "HR_Garage") then {
        private _grgData = _varValue;
        private _cats = _grgData#0;
        private _newGrgCats = [];
        {
            // json requires string keys, so garage numbers are saved as stringified numbers (e.g. "1") and parsed in-game as the actual numbers
            private _keys = (keys _x) apply {if (_x isEqualType 0) then {_x} else {call compile _x}};
            private _hm = _keys createHashMapFromArray (values _x);
            _newGrgCats pushback _hm;
        } forEach _cats;
        _grgData set [0, _newGrgCats];
        [_grgData] call HR_GRG_fnc_loadSaveData;
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
                if (isNil "_building") exitWith { Error_1("No building found at %1", _x)};
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
            (_varvalue select _i) params ["_typeMine", "_posMine", "_detected", "_dirMine"];
            private _mineX = createVehicle [_typeMine, _posMine, [], 0, "CAN_COLLIDE"];
            if !(isNil "_dirMine") then { _mineX setDir _dirMine };
            {(_numToSide getorDefault [_x, _x]) revealMine _mineX} forEach _detected;       // backwards compat: works with both number & side
        };
    };
    if (_varName == 'newGarrison') then {
        A3A_garrison = _varValue;
    };
    if (_varName == 'outpostsFIA') then {
        A3A_rebPostGarrison = [];                   // garrison backwards compat
        if (count (_varValue select 0) != 2) exitWith {};
        {
            _x params ["_position", "_garrison"];
            [_position, []] call A3A_fnc_createRebelControl;
            A3A_rebPostGarrison pushBack [_mrk, _garrison];
        } forEach _varvalue;
        publicVariable "outpostsFIA";
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
                Error_1("Loading Antennas: Unable to create ruin for %1", typeOf _antenna);
            };

            deleteMarker _mrk;
        };
        publicVariable "antennas";
        publicVariable "antennasDead";
    };
    if (_varname == 'prestigeBLUFOR') then {                        // this one is actually rebel support. Backwards compat.
        if (count citiesX != count _varValue) exitWith {
            Error("City count changed, setting approx support");
            {
                if (sidesX getVariable _x != teamPlayer) then { continue };                // sides should be loaded first
                private _dataX = (A3A_cityData getVariable _x);
                _dataX set [1, 80];                                                      // 75% rebel support, no accumHR
                A3A_cityData setVariable [_x, _dataX, true];
            } forEach citiesX;
        };
        // City count matches, assume map didn't change and copy in support
        for "_i" from 0 to (count citiesX) - 1 do {
            private _city = citiesX select _i;
            private _dataX = A3A_cityData getVariable _city;
            _dataX set [1, _varvalue select _i];
            A3A_cityData setVariable [_city, _dataX, true];
        };
    };
    if (_varname == 'cityData') then {                          // New replacement for above
        {
            A3A_cityData setVariable [_x, _y, true];
        } forEach _varValue;
    };
    if (_varname == 'enemyResources') then {
        A3A_resourcesDefenceOcc = _varValue#0;
        A3A_resourcesDefenceInv = _varValue#1;
        A3A_resourcesAttackOcc = _varValue#2;
        A3A_resourcesAttackInv = _varValue#3;
        if (count _varValue > 4) then { A3A_punishmentDefBuff = _varValue#4 };
    };
    if (_varname == 'HQKnowledge') then {
        A3A_curHQInfoOcc = _varValue#0;
        A3A_curHQInfoInv = _varValue#1;
        A3A_oldHQInfoOcc = _varValue#2;
        A3A_oldHQInfoInv = _varValue#3;
    };
    if (_varname == 'idlebases') then {
        {
            server setVariable [(_x select 0),(_x select 1),true];
        } forEach _varValue;
    };
    if (_varname == 'killZones') then {
        {
            killZones setVariable [(_x select 0),(_x select 1),true];
        } forEach _varValue;
    };
    if (_varName == 'posHQ') then {
        _posHQ = if (count _varValue > 3) then {_varValue select 0} else {_varValue};
        respawnTeamPlayer setMarkerPos _posHQ;
        posHQ = _posHQ; publicVariable "posHQ";
        "Synd_HQ" setMarkerPos _posHQ;
        petros setPosATL _posHQ;
        if (chopForest) then {
            { _x hideObjectGlobal true } foreach (nearestTerrainObjects [_posHQ, ["tree","bush"], 70]);
        };
        if (count _varValue == 3) then {
            [_posHQ] call A3A_fnc_relocateHQObjects;
        } else {
            fireX setPosATL (_varValue select 1);
            boxX setDir ((_varValue select 2) select 0);
            boxX setPosATL ((_varValue select 2) select 1);
            mapX setDir ((_varValue select 3) select 0);
            mapX setPosATL ((_varValue select 3) select 1);
            flagX setPosATL (_varValue select 4);
            vehicleBox setDir ((_varValue select 5) select 0);
            vehicleBox setPosATL ((_varValue select 5) select 1);
            if (count _varValue >= 7) then {
                petros setDir ((_varValue select 6) select 0);
                petros setPosATL ((_varValue select 6) select 1);
            };
        };
    };
    if (_varname == 'tasks') then {
/*
    // These are really dangerous. Disable for now.
    // Should be done after all the other init is completed if we really want it
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
*/
    };

    if(_varname == 'A3A_fuelAmountleftArray') then {
        //[position _x, [_x] call ace_refuel_fnc_getFuel]
        A3A_fuelAmountleftArray = _varValue;
        for "_i" from 0 to (count A3A_fuelAmountleftArray - 1) do {
            private _nearFuelStations = nearestObjects [A3A_fuelAmountleftArray # _i # 0, A3A_fuelStationTypes, 1];
            if (count _nearFuelStations == 0) then { continue };
            private _fuelStation = _nearFuelStations#0;
            if(A3A_hasACE) then {
		        [_fuelStation, A3A_fuelAmountleftArray # _i # 1] call ace_refuel_fnc_setFuel;
	        } else {
	            _fuelStation setFuelCargo (A3A_fuelAmountleftArray # _i # 1);
	        };
        };
    };
    if (_varname == "arsenalLimits") then {
        A3A_arsenalLimits = _varValue; publicVariable "A3A_arsenalLimits";
    };
    if (_varname == "rebelLoadouts") then {
        _varValue call A3A_fnc_setRebelLoadouts;        // updates version numbers
    };
    if (_varname == "minorSites") then {
        if (A3A_saveVersion < 31000) exitWith {};         // pre-garrison pre-JSON version, just remake with init
        A3A_minorSitesHM = createHashMap;
        { [_y#0, _y#1, _numToSide get _y#2, _y#3] call A3A_fnc_addMinorSite } forEach _varValue;
        // pair refs get sanity checked in initMinorSites later
    };
} else {
    call compile format ["%1 = %2",_varName,_varValue];
};
